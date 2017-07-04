CREATE OR REPLACE PACKAGE BODY pkch_90 AS 
  --
  /* Created By       : Femi Akintoye
  ** Date Created     : 21-MAR-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: Cash Management Interface to Workflow
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
  ** Copyright:  Neulogic Solutions Ltd, 2012
  **
  */
  /* Package Variables */
  --
  --
  /* Private Routines */
  FUNCTION fn_trc_k(pi_trc_id IN VARCHAR2) RETURN NUMBER IS
    v_k  ch_00_00_dtd.n38%TYPE;
  BEGIN
    BEGIN
      SELECT row_key
        INTO v_k
        FROM ch_30_op_trc
       WHERE trc_id = pi_trc_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkch_00_xcp.pr_not_valid (pi_dsc => 'CH Operation ID ['||pi_trc_id||']');
      WHEN TOO_MANY_ROWS THEN 
        pkch_00_xcp.pr_dupl_found (pi_dsc => 'CH Operation ID ['||pi_trc_id||']');
    END;
    --
    RETURN v_k;
    --
  END fn_trc_k; 
  --
  --
  FUNCTION fn_act_rec(pi_gl_act_id IN VARCHAR2) RETURN r_00_act IS
    v_r  r_00_act;
  BEGIN
    --
    BEGIN
      SELECT row_key, cur_k, boa_k
        INTO v_r.act_k, v_r.cur_k, v_r.boa_k
        FROM ch_30_act
       WHERE gl_ldg_id = pi_gl_act_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkch_00_xcp.pr_not_valid (pi_dsc => 'CH Cash/Bank Account With Ledger ID ['||pi_gl_act_id||']');
      WHEN TOO_MANY_ROWS THEN 
        pkch_00_xcp.pr_dupl_found (pi_dsc => 'CH Cash/Bank Account With Ledger ID ['||pi_gl_act_id||']');
    END;
    --
    RETURN v_r;
    --
  END fn_act_rec; 
  --
  --
  /* Public Routines */
  --  
  FUNCTION fn_bus_dt RETURN DATE IS
  BEGIN
    RETURN pkch_00.fn_bus_dt;
  END fn_bus_dt;
  --
  FUNCTION fn_dft_bnk_id RETURN VARCHAR2 IS
  BEGIN
    RETURN pkch_00_pmr.fn_gl_bnk_ldg_id;
  END fn_dft_bnk_id;
  --
  FUNCTION fn_dft_sus_id RETURN VARCHAR2 IS
  BEGIN
    RETURN pkch_00_pmr.fn_gl_sus_ldg_id;
  END fn_dft_sus_id;
  --
  --
  FUNCTION fn_val_cus_act (pi_act       IN VARCHAR2,
                           pi_ex_rm_cus IN VARCHAR2 DEFAULT NULL) RETURN r_00_cus_act IS
    v_act   ch_v_90_al_act_dd%ROWTYPE;
    v_r     r_00_cus_act;
    v_act_k ch_00_00_dtd.n38%TYPE;
  BEGIN
    --
    v_r.err_yn := '0';
    --
    IF pi_act IS NOT NULL THEN
      IF LENGTH(pi_act) <= 10 THEN --ST
        BEGIN
          SELECT B.cst_id, A.mkt_act_id, A.ptf_mkt_dsc, A.fnd_act_k
            INTO v_r.cus_id, v_r.mkt_act_id, v_r.mkt_act_dsc, v_act_k
            FROM st_20_ptf_mkt A, st_20_ptf b
           WHERE A.mkt_act_id = pi_act
             AND A.ptf_k = B.row_key
             AND A.appr_stat_dm IN ('1','3');
          --
          v_r.act_tp_dm  := 'ST';
          BEGIN
            SELECT act_id, act_dsc
              INTO v_r.act_id, v_r.act_dsc
              FROM ch_v_90_al_act_dd
             WHERE act_k = v_act_k;
          END;
          --
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            v_r.err_yn   := '1';
            v_r.err_cd   := SQLCODE;
            v_r.err_msg  := 'Account Not Found';
            v_r.err_sta  := dbms_utility.format_error_backtrace;
          WHEN TOO_MANY_ROWS THEN
            v_r.err_yn   := '1';
            v_r.err_cd   := SQLCODE;
            v_r.err_msg  := 'Account Duplicated';
            v_r.err_sta  := dbms_utility.format_error_backtrace;
        END;
      ELSE --DD
        BEGIN
          SELECT *
            INTO v_act
            FROM ch_v_90_al_act_dd
           WHERE act_id = pi_act;
          --
          v_r.act_tp_dm  := 'DD';
          v_r.cus_id     := v_act.cus_id;
          v_r.act_id     := v_act.act_id;
          v_r.act_dsc    := v_act.act_dsc;
          --
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            v_r.err_yn   := '1';
            v_r.err_cd   := SQLCODE;
            v_r.err_msg  := 'Account Not Found';
            v_r.err_sta  := dbms_utility.format_error_backtrace;
          WHEN TOO_MANY_ROWS THEN
            v_r.err_yn   := '1';
            v_r.err_cd   := SQLCODE;
            v_r.err_msg  := 'Account Duplicated';
            v_r.err_sta  := dbms_utility.format_error_backtrace;
        END;
      END IF;
    END IF;
    --
    RETURN v_r;
    --
  EXCEPTION
    WHEN OTHERS THEN
      v_r.err_yn   := '1';
      v_r.err_cd   := SQLCODE;
      v_r.err_msg  := dbms_utility.format_error_stack;
      v_r.err_sta  := dbms_utility.format_error_backtrace;
      RETURN v_r;
  END fn_val_cus_act;
  --
  -- Debit Customer, Credit Suspense - TRANSFER
  -- Debit Customer, Credit Another Customer - TRANSFER
  PROCEDURE pr_cre_xfr (pi_rec IN OUT r_00_xfr) IS
    --
    v_x   ch_vt_34_xfr_e%ROWTYPE;
    v_xd  ch_vt_34_xfr_dtl_e%ROWTYPE;
    --
    v_boa_k  ch_00_00_dtd.n38%TYPE;
    --
  BEGIN
    --
    pkch_00_apx.pr_set_uss;
    pkch_00_00_trg.pr_set_xpgm;
    --pkch_00_apx.pr_set_app_ssv (pi_ssn => 'APP_PAGE_ID', pi_ssv => 'WF');
    --APEX_UTIL.SET_SESSION_STATE('APP_PAGE_ID','WF');
    --
    -- Validate account
logger.log('ACCT'||pi_rec.xfr_act_id);    
    v_boa_k := pkch_90_act.fn_g_al_act_boa_k (pi_act_id => pi_rec.xfr_act_id);
    --
    v_x.c_n  := -99;
    v_x.boa_k      := v_boa_k;
    v_x.xfr_act_id := pi_rec.xfr_act_id;
    v_x.xfr_dt     := pkch_00.fn_bus_dt;
    v_x.xfr_amt    := pi_rec.xfr_amt;
    v_x.xfr_dsc    := pi_rec.xfr_dsc;
    v_x.trc_k      := fn_trc_k(pi_trc_id => pkch_00_pmr.fn_xfr_trc_id);
    v_x.xfr_ref    := pi_rec.xfr_ref;
    --
    pkch_34_xfr.pr_prc(pi_rec => v_x);
    --
    pi_rec.row_key := v_x.row_key;
    --
    --
    v_xd.c_n := -99;
    v_xd.xfr_k     := v_x.row_key;
    v_xd.d_act_id  := NVL(pi_rec.d_act_id, pkch_00_pmr.fn_gl_sus_ldg_id); 
    v_xd.d_xfr_amt := pi_rec.xfr_amt;
    v_xd.d_xfr_dsc := pi_rec.d_xfr_dsc;
    v_xd.trc_k     := fn_trc_k(pi_trc_id => pkch_00_pmr.fn_xfr_dtl_trc_id);
    -- 
    pkch_34_xfr_dtl.pr_prc(pi_rec => v_xd);
    --
    pkch_34_xfr.pr_apr(pi_key => v_x.row_key, pi_cn => -99);
    --
    pkch_00_00_trg.pr_rset_xpgm;
    --
  END pr_cre_xfr;
  --
  FUNCTION fn_cre_xfr (pi_rec IN OUT r_00_xfr) RETURN r_ret IS
    v_r   r_ret;
    v_msg VARCHAR2(4000);
  BEGIN
    --
    v_r.ret_cd := 0;
    --
    BEGIN
      pr_cre_xfr (pi_rec => pi_rec);
    EXCEPTION
      WHEN OTHERS THEN
        v_r.ret_cd   := SQLCODE;
        v_msg        := dbms_utility.format_error_stack;
        v_r.err_msg  := SUBSTR(v_msg, INSTR(v_msg,'}')+1);
        v_r.err_dsc  := v_msg;
        v_r.err_sta  := dbms_utility.format_error_backtrace;
    END;
    --
    RETURN v_r;
    --
  END;
  --
  --
  PROCEDURE pr_cre_pms (pi_rec IN OUT r_00_pms) IS
    --
    v_p   ch_vt_32_pms%ROWTYPE;
    v_pd  ch_vt_32_pms_dtl%ROWTYPE;
    --
    v_act_id ch_00_00_dtd.c50%TYPE;
    --v_boa_k  ch_00_00_dtd.n38%TYPE;
    v_act    r_00_act;
    --
  BEGIN
    --
    pkch_00_apx.pr_set_uss;
    pkch_00_00_trg.pr_set_xpgm;
    --
    -- Validate account
    v_act_id := NVL(pi_rec.pm_act_id, pkch_00_pmr.fn_gl_bnk_ldg_id); 
    --v_boa_k := pkch_90_act.fn_g_al_act_boa_k (pi_act_id => v_act_id);
    v_act   := fn_act_rec(pi_gl_act_id => v_act_id);
    --
    v_p.c_n := -99;
    v_p.boa_k  := v_act.boa_k;
    v_p.act_k  := v_act.act_k;
    v_p.cur_k  := v_act.cur_k;
    v_p.pm_dt  := pkch_00.fn_bus_dt;
    v_p.pm_amt := pi_rec.pm_amt;
    v_p.pm_dsc := pi_rec.pm_dsc;
    v_p.trc_k  := fn_trc_k(pi_trc_id => pkch_00_pmr.fn_pms_trc_id);
    v_p.pm_ref := pi_rec.pm_ref;
    --
    pi_rec.row_key := pkch_32_pms.fn_prc(pi_rec => v_p);
    --
logger.log('PMNT MSTR KEY='||v_p.row_key);    
    --
    v_pd.c_n := -99;
    v_pd.trc_k    := fn_trc_k(pi_trc_id => pkch_00_pmr.fn_pms_dtl_trc_id);
    v_pd.pms_k    := pi_rec.row_key; --v_p.row_key;
    v_pd.d_act_id := NVL(pi_rec.d_act_id, pkch_00_pmr.fn_gl_sus_ldg_id); 
    v_pd.d_pm_dsc := pi_rec.d_pm_dsc;
    v_pd.d_pm_amt := pi_rec.pm_amt;
    --
    v_pd.row_key := pkch_32_pms_dtl.fn_prc(pi_rec => v_pd);
    --
    pkch_32_pms.pr_apr(pi_key => pi_rec.row_key, pi_cn => -99);
    --
    pkch_00_00_trg.pr_rset_xpgm;
    --
  END pr_cre_pms;
  --
  FUNCTION fn_cre_pms (pi_rec IN OUT r_00_pms) RETURN r_ret IS
    v_r   r_ret;
    v_msg VARCHAR2(4000);
  BEGIN
    --
    v_r.ret_cd := 0;
    --
    BEGIN
      pr_cre_pms (pi_rec => pi_rec);
    EXCEPTION
      WHEN OTHERS THEN
        v_r.ret_cd   := SQLCODE;
        v_msg        := dbms_utility.format_error_stack;
        v_r.err_msg  := SUBSTR(v_msg, INSTR(v_msg,'}')+1);
        v_r.err_dsc  := v_msg;
        v_r.err_sta  := dbms_utility.format_error_backtrace;
    END;
    --
    RETURN v_r;
    --
  END;
  --
  --
  PROCEDURE pr_cre_rcs (pi_rec IN OUT r_00_rcs) IS
    --
    v_r   ch_vt_31_rcs%ROWTYPE;
    v_rd  ch_vt_31_rcs_dtl%ROWTYPE;
    --
    v_act_id ch_00_00_dtd.c50%TYPE;
    --v_boa_k  ch_00_00_dtd.n38%TYPE;
    v_act    r_00_act;
    --
  BEGIN
    --
    pkch_00_apx.pr_set_uss;
    pkch_00_00_trg.pr_set_xpgm;
    pkch_00_00_trg.pr_set_nupd;
    --
    -- Validate account
    v_act_id := NVL(pi_rec.rc_act_id, pkch_00_pmr.fn_gl_bnk_ldg_id); 
    --v_boa_k := pkch_90_act.fn_g_al_act_boa_k (pi_act_id => v_act_id);
    v_act   := fn_act_rec(pi_gl_act_id => v_act_id);
    --
    v_r.c_n := -99;
    v_r.boa_k  := v_act.boa_k;
    v_r.act_k  := v_act.act_k;
    v_r.cur_k  := v_act.cur_k;
    v_r.rc_dt  := pkch_00.fn_bus_dt;
    v_r.rc_amt := pi_rec.rc_amt;
    v_r.rc_dsc := pi_rec.rc_dsc;
    v_r.trc_k  := fn_trc_k(pi_trc_id => pkch_00_pmr.fn_rcs_trc_id);
    v_r.rc_ref := pi_rec.rc_ref;
    --
    pi_rec.row_key := pkch_31_rcs.fn_prc(pi_rec => v_r);
    --
logger.log('RCPT MSTR KEY='||v_r.row_key);    
    --
    v_rd.c_n := -99;
    v_rd.trc_k    := fn_trc_k(pi_trc_id => pkch_00_pmr.fn_rcs_dtl_trc_id);
    v_rd.rcs_k    := pi_rec.row_key; --v_p.row_key;
    v_rd.d_act_id := NVL(pi_rec.d_act_id, pkch_00_pmr.fn_gl_sus_ldg_id); 
    v_rd.d_rc_dsc := pi_rec.d_rc_dsc;
    v_rd.d_rc_amt := pi_rec.rc_amt;
    --
    v_rd.row_key := pkch_31_rcs_dtl.fn_prc(pi_rec => v_rd);
    --
    pkch_31_rcs.pr_apr(pi_key => pi_rec.row_key, pi_cn => -99);
    --
    pkch_00_00_trg.pr_rset_xpgm;
    pkch_00_00_trg.pr_rset_nupd;
    --
  END pr_cre_rcs;
  --
  FUNCTION fn_cre_rcs (pi_rec IN OUT r_00_rcs) RETURN r_ret IS
    v_r   r_ret;
    v_msg VARCHAR2(4000);
  BEGIN
    --
    v_r.ret_cd := 0;
    --
    BEGIN
      pr_cre_rcs (pi_rec => pi_rec);
    EXCEPTION
      WHEN OTHERS THEN
        v_r.ret_cd   := SQLCODE;
        v_msg        := dbms_utility.format_error_stack;
        v_r.err_msg  := SUBSTR(v_msg, INSTR(v_msg,'}')+1);
        v_r.err_dsc  := v_msg;
        v_r.err_sta  := dbms_utility.format_error_backtrace;
    END;
    --
    RETURN v_r;
    --
  END;
  --
  FUNCTION  fn_get_coll_bal(pi_act IN VARCHAR2) RETURN NUMBER IS
    --
    v_bal  ch_00_00_dtd.n224%TYPE := 0;
    r_cus  r_00_cus_act;
    --
  BEGIN
    --
    r_cus := fn_val_cus_act(pi_act => pi_act);
    --
    IF r_cus.err_yn = '0' THEN
      BEGIN
        SELECT coll_bal
          INTO v_bal
          FROM dd_vp_20_bal
         WHERE acct_id = pi_act;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_bal := 0;
        WHEN TOO_MANY_ROWS THEN
          v_bal := 0;
      END;
    END IF;
    --
    RETURN v_bal;
    --
  END fn_get_coll_bal;
  --
  --
  FUNCTION  fn_get_acct_dtl(pi_act IN VARCHAR2) RETURN r_00_dd_act IS
    --
    v_bal  ch_00_00_dtd.n224%TYPE := 0;
    r_cus  r_00_cus_act;
    r_dtl  r_00_dd_act;
    --
  BEGIN
    --
    r_cus := fn_val_cus_act(pi_act => pi_act);
    --
    IF r_cus.err_yn = '0' THEN
      BEGIN
        SELECT cust_id, acct_id, acct_desc, opn_clr_bal, crnt_bal,
               coll_bal, clr_bal, coll_bal,
               '0', NULL, NULL, NULL
          INTO r_dtl
          FROM dd_vp_20_bal
         WHERE acct_id = pi_act;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          r_dtl.err_yn := '1';
          r_dtl.err_cd := SQLCODE;
          r_dtl.err_msg := 'Account '||pi_act||' Is Invalid';
          r_dtl.err_sta := dbms_utility.format_error_backtrace;
        WHEN TOO_MANY_ROWS THEN
          r_dtl.err_yn := '1';
          r_dtl.err_cd := SQLCODE;
          r_dtl.err_msg := 'Account '||pi_act||' Is Invalid';
          r_dtl.err_sta := dbms_utility.format_error_backtrace;
      END;
    ELSE
      r_dtl.err_yn := r_cus.err_yn;
      r_dtl.err_cd := r_cus.err_cd;
      r_dtl.err_msg := r_cus.err_msg;
      r_dtl.err_sta := r_cus.err_sta;
    END IF;
    --
    RETURN r_dtl;
    --
  END fn_get_acct_dtl;
  --
  --
END pkch_90;
/
