CREATE OR REPLACE PACKAGE BODY pkwb_00_ch AS
  --
  /* Created By       : Aderemi Alabi 
  ** Date Created     : 18-APR-2016
  **
  ** PURPOSE: WB Cash Management
  **
  ** MODIFICATION HISTORY:
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **  
  ** Copyright:  Neulogic Solutions Ltd, 2016
  **
  */
  --
  /* Pacakge Variable */
  --
  v_xfr pkch_90.r_00_xfr@pg_owner_link; 
  v_pms pkch_90.r_00_pms@pg_owner_link; 
  v_act pkch_90.r_00_cus_act@pg_owner_link; 
  --
  /* Private Routines */
  --
  --
  FUNCTION fn_gen_trn_ref RETURN VARCHAR2 IS
  BEGIN
    RETURN TO_CHAR(SYSDATE, 'J-SSSSS')||'-'||wb_seq_00_xfr.NEXTVAL;
  END fn_gen_trn_ref;
  --
  -- get account name
  FUNCTION fn_get_act_dsc(pi_tp     IN VARCHAR2,
                          pi_act_no IN VARCHAR2) RETURN VARCHAR2 IS
    --
    v_act_nm VARCHAR2(250);
    --
    CURSOR c_act IS
      SELECT act_nm
      FROM   t_wb_10_acc
      WHERE  act_no = pi_act_no;
    --  
  BEGIN
    
    OPEN  c_act;
    FETCH c_act INTO v_act_nm;
    CLOSE c_act;
    --
    IF LENGTH(v_act_nm) >= 100 THEN
      v_act_nm := SUBSTR(v_act_nm, 1, 97) || '...';
    END IF;
    --
    RETURN v_act_nm;
    --
  END fn_get_act_dsc;
  --
  -- Log local copy of request
  FUNCTION fn_ins_rec(pi_tp   IN VARCHAR2, 
                       pi_from IN VARCHAR2, 
                       pi_to   IN VARCHAR2, 
                       pi_amt  IN NUMBER) RETURN VARCHAR2 IS
    --
    v_rec t_wb_10_acc_xfr%ROWTYPE;
    --
  BEGIN
    --
    v_rec.row_key := s_wb_01_k.NEXTVAL;
    v_rec.sys_dtt := SYSDATE;
    v_rec.bus_dt  := pkch_90.fn_bus_dt@pg_owner_link;
    v_rec.trn_tp  := pi_tp;
    v_rec.trn_sta := '0';
    v_rec.trn_ref := fn_gen_trn_ref;
    v_rec.trn_amt := pi_amt;
    v_rec.trn_frm_act := pi_from;
    v_rec.trn_to_act  := pi_to;
    v_rec.sup_act := pkch_90.fn_dft_sus_id@pg_owner_link;
    v_rec.bnk_act := pkch_90.fn_dft_bnk_id@pg_owner_link;
    --
    INSERT INTO t_wb_10_acc_xfr VALUES v_rec;
    COMMIT;
    --
    RETURN v_rec.trn_ref;
    --
  END fn_ins_rec;
  --
  -- Update request
  PROCEDURE pr_upd_rec(pi_ref IN VARCHAR2, 
                       pi_sta IN VARCHAR2,
                       pi_rmk IN CLOB DEFAULT NULL) IS
  BEGIN
    --
    UPDATE t_wb_10_acc_xfr
    SET    trn_sta = pi_sta,
           trn_rmk = trn_rmk
    WHERE  trn_ref = pi_ref;
    --
  END pr_upd_rec;
  --
  --
  /* Public Routines */
  --
  -- Do transfer
  FUNCTION fn_xfr_yn(pi_ref IN VARCHAR2) RETURN BOOLEAN IS
    --
    v_return BOOLEAN := FALSE;
    v_xfr    VARCHAR2(100) := NULL;
    --
    CURSOR c_xfr IS
      SELECT trn_ref
      FROM   t_wb_10_acc_xfr
      WHERE  trn_ref = pi_ref
      AND    trn_sta = '0';
    --  
  BEGIN
    --
    OPEN  c_xfr;
    FETCH c_xfr INTO v_xfr;
    CLOSE c_xfr;
    --
    IF v_xfr IS NOT NULL THEN
      v_return := TRUE;
    END IF;
    --
    RETURN v_return;
    --
  END fn_xfr_yn;  
  --
  -- Update Status
  PROCEDURE pr_upd_sta(pi_ref IN VARCHAR2, pi_sta IN VARCHAR2 DEFAULT '6') IS
  BEGIN
    UPDATE t_wb_10_acc_xfr
    SET    trn_sta = pi_sta
    WHERE  trn_ref = pi_ref;
    COMMIT;
  END pr_upd_sta;
  --
  FUNCTION fn_xfr(pi_tp   IN VARCHAR2,
                  pi_frm IN VARCHAR2, 
                  pi_to   IN VARCHAR2, 
                  pi_amt  IN NUMBER) RETURN VARCHAR2 IS
    v_return NUMBER;
    v_tp     VARCHAR2(50);
    v_ref    VARCHAR2(50);
  BEGIN
    --
    v_ref := fn_ins_rec(pi_tp, pi_frm, pi_to, pi_amt);
    --
    IF pi_tp = 'SX' THEN -- self account transfers
      v_tp := 'Web Transfer[SELF] ';
    ELSIF pi_tp = 'OX' THEN -- others account transfers
      v_tp := 'Web Transfer[OTHERS] ';
    ELSIF pi_tp = 'XX' THEN -- transfer to bank
      v_tp := 'Web Transfer[BANK] ';
    END IF;
    --
    IF pi_tp = 'XX' THEN
      v_xfr.d_xfr_dsc:= v_tp || 'from - ' || pi_frm|| ' to - ' || pi_to;
    ELSE
      v_xfr.d_act_id := pi_to;
      v_xfr.d_xfr_dsc:= v_tp || 'from - ' || pi_frm|| '(' ||fn_get_act_dsc(pi_tp, pi_frm) || ')';
    END IF;
    v_xfr.xfr_amt    := pi_amt;
    v_xfr.xfr_ref    := v_ref;
    v_xfr.xfr_act_id := pi_frm;
    v_xfr.xfr_dsc    := v_tp || 'to - ' || pi_to || '(' ||fn_get_act_dsc(pi_tp, pi_to) || ')';
    --
    BEGIN
      --
      pkch_90.pr_cre_xfr@pg_owner_link(v_xfr);
      --
      UPDATE t_wb_10_acc_xfr
      SET    sup_act = v_xfr.d_act_id,
             trn_sta = '5'
      WHERE  trn_ref = v_ref;
      COMMIT;
      --
    EXCEPTION
      WHEN OTHERS THEN
        pr_upd_rec(v_ref, '1', dbms_utility.format_error_stack||'|'||
                               dbms_utility.format_error_backtrace);
        RAISE;
    END;    
    --
    RETURN v_ref;
    --
  END fn_xfr;  
  --
  --
  PROCEDURE pr_pms(pi_ref IN VARCHAR2) IS
    --
    v_rec t_wb_10_acc_xfr%ROWTYPE;
    --
    CURSOR c_rec IS
      SELECT *
      FROM   t_wb_10_acc_xfr
      WHERE  trn_ref = pi_ref
      AND    trn_sta = '5';
    --  
  BEGIN
    --
    OPEN  c_rec;
    FETCH c_rec INTO v_rec;
    CLOSE c_rec;
    --
    IF v_rec.trn_ref IS NOT NULL THEN
      v_pms.pm_act_id := v_rec.sup_act;
      v_pms.pm_amt    := v_rec.trn_amt; 
      v_pms.pm_dsc    := 'Web Transfer[BANK] from - ' || v_rec.trn_frm_act|| 
                         '(' ||fn_get_act_dsc(v_rec.trn_tp, v_rec.trn_frm_act) || ')'; 
      v_pms.pm_ref    := v_rec.trn_ref;
      v_pms.d_pm_dsc  := 'Web Transfer[BANK][OUT] from - ' || v_rec.trn_frm_act||
                         '(' ||fn_get_act_dsc(v_rec.trn_tp, v_rec.trn_frm_act) || ')'; 
      BEGIN
        --
        pkch_90.pr_cre_pms@pg_owner_link(v_pms);
        --
        UPDATE t_wb_10_acc_xfr
        SET    bnk_act = v_pms.d_act_id,
               trn_sta = '7'
        WHERE  trn_ref = v_rec.trn_ref;
        COMMIT;
        --
      EXCEPTION
        WHEN OTHERS THEN
          pr_upd_rec(v_rec.trn_ref, '1', dbms_utility.format_error_stack||'|'||
                                 dbms_utility.format_error_backtrace);
          RAISE;
      END;
      --
    END IF;
  END pr_pms;
  --
  --
  PROCEDURE pr_rxfr(pi_ref IN VARCHAR2) IS
    --
    v_rec t_wb_10_acc_xfr%ROWTYPE;
    v_ref    VARCHAR2(50);
    --
    CURSOR c_rec IS
      SELECT *
      FROM   t_wb_10_acc_xfr
      WHERE  trn_ref = pi_ref
      AND    trn_sta = '5';
    -- 
  BEGIN
    --
    OPEN  c_rec;
    FETCH c_rec INTO v_rec;
    CLOSE c_rec;
    --
    v_ref := fn_ins_rec(v_rec.trn_tp, v_rec.trn_to_act, v_rec.trn_frm_act, v_rec.trn_amt);
    --
    IF v_rec.trn_tp = 'XX' THEN -- transfer to bank
      v_xfr.xfr_amt    := v_rec.trn_amt;
      v_xfr.xfr_ref    := v_ref;
      v_xfr.xfr_act_id := v_rec.trn_to_act;
      v_xfr.d_act_id   := v_rec.trn_frm_act;
      v_xfr.xfr_dsc    := 'Reversal of transaction reference - ' || v_rec.trn_ref;
      v_xfr.d_xfr_dsc  := 'Reversal of transaction reference - ' || v_rec.trn_ref;      
    END IF;
    --
    BEGIN
      --
      pkch_90.pr_cre_xfr@pg_owner_link(v_xfr);
      --
      UPDATE t_wb_10_acc_xfr
      SET    sup_act = v_xfr.d_act_id,
             trn_sta = '5'
      WHERE  trn_ref = v_ref;
      COMMIT;
      --
    EXCEPTION
      WHEN OTHERS THEN
        pr_upd_rec(v_ref, '1', dbms_utility.format_error_stack||'|'||
                               dbms_utility.format_error_backtrace);
        RAISE;
    END;    
    
  END pr_rxfr;
  --
  FUNCTION fn_val_to_act(pi_act IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    v_act := pkch_90.fn_val_cus_act@pg_owner_link(pi_act);
    IF v_act.err_yn = '0' THEN 
      RETURN v_act.act_id;
    ELSE
      RETURN NULL;
    END IF;
  END fn_val_to_act;
  --
END pkwb_00_ch; 
/
