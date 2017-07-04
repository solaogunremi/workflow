create or replace PACKAGE BODY pkwb_00_ch AS
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
  pv_ls logger_logs.scope%type := $$plsql_unit;
  pv_lp logger.tab_param;
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
    v_rec    t_wb_10_acc_xfr%ROWTYPE;
    v_acc_no VARCHAR2(30);
    --
  BEGIN
    --
    BEGIN
      SELECT fl_01
      INTO   v_acc_no
      FROM   t_99_10_ssu
      WHERE  lgn_id = v('APP_USER');
    EXCEPTION
      WHEN OTHERS THEN
        v_acc_no := 'XX00XX';
    END;    
    v_rec.acc_no  := v_acc_no;
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
  FUNCTION fn_get_pmv(pi_id IN VARCHAR2) RETURN NUMBER IS
    v_no NUMBER;
    --
    CURSOR c_pmv IS
      SELECT no_vl
      FROM   vt_wb_01_pmv
      WHERE  pm_id = pi_id;
    --
  BEGIN
    OPEN  c_pmv;
    FETCH c_pmv INTO v_no;
    CLOSE c_pmv;
    --
    RETURN v_no;
    --
  END fn_get_pmv;
  --
  -- Update request
  PROCEDURE pr_upd_rec(pi_ref IN VARCHAR2,
                       pi_sta IN VARCHAR2,
                       pi_rmk IN CLOB DEFAULT NULL) IS
  BEGIN
    --
    UPDATE t_wb_10_acc_xfr
    SET    trn_sta = pi_sta,
           trn_rmk = pi_rmk
    WHERE  trn_ref = pi_ref;
    COMMIT;
    --
  END pr_upd_rec;
  --
  --
  /* Public Routines */
  --
  -- Do transfer
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
      logger.log('SEND XFR 1-'||v_xfr.xfr_act_id);      --#####
      pkch_90.pr_cre_xfr@pg_owner_link(v_xfr);
      --
      IF pi_tp ='XX' THEN
        UPDATE t_wb_10_acc_xfr
        SET    trn_sta = '5'
        WHERE  trn_ref = v_ref;
        COMMIT;
      ELSE
        UPDATE t_wb_10_acc_xfr
        SET    trn_sta = '7'
        WHERE  trn_ref = v_ref;
        COMMIT;
      END IF;  
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
  -- Update Status
  PROCEDURE pr_upd_sta(pi_ref IN VARCHAR2, pi_sta IN VARCHAR2) IS
    v_sta VARCHAR2(10) := pi_sta;
  BEGIN
    UPDATE t_wb_10_acc_xfr
    SET    trn_sta = v_sta
    WHERE  trn_ref = pi_ref;
    COMMIT;
  END pr_upd_sta;
  --
  FUNCTION fn_xfr2(pi_tp   IN VARCHAR2,
                  pi_frm IN VARCHAR2,
                  pi_to   IN VARCHAR2,
                  pi_amt  IN NUMBER) RETURN r_ret IS  
    v_return NUMBER;
    v_tp     VARCHAR2(50);
    v_ret    r_ret; --VARCHAR2(50);
    v_err    pkch_90.r_ret@pg_owner_link;
  BEGIN
    --
    v_ret.ret_cd := 0;
    v_ret.ret_ref := fn_ins_rec(pi_tp, pi_frm, pi_to, pi_amt);
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
    v_xfr.xfr_ref    := v_ret.ret_ref;
    v_xfr.xfr_act_id := pi_frm;
    v_xfr.xfr_dsc    := v_tp || 'to - ' || pi_to || '(' ||fn_get_act_dsc(pi_tp, pi_to) || ')';
    --
    BEGIN
      --
      logger.log('SEND XFR 1-'||v_xfr.xfr_act_id);      --#####
      v_err := pkch_90.fn_cre_xfr@pg_owner_link(v_xfr);
      --
      v_ret.ret_cd := v_err.ret_cd;
      v_ret.err_msg := v_err.err_msg;
      v_ret.err_dsc := v_err.err_dsc;
      v_ret.err_sta := v_err.err_sta;
      IF NVL(v_err.ret_cd,0) = 0 then
          UPDATE t_wb_10_acc_xfr
          SET    trn_sta = '5'
          WHERE  trn_ref = v_ret.ret_ref;
          COMMIT;
      END IF;
      --
    EXCEPTION
      WHEN OTHERS THEN
        pr_upd_rec(v_ret.ret_ref, '1', dbms_utility.format_error_stack||'|'||
                               dbms_utility.format_error_backtrace);
        RAISE;
    END;    
    --
    RETURN v_ret;
    --
  END fn_xfr2;  --2
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
      AND    trn_sta = '6';
    --  
  BEGIN
    --
    OPEN  c_rec;
    FETCH c_rec INTO v_rec;
    CLOSE c_rec;
    --
    IF v_rec.trn_ref IS NOT NULL THEN
     -- v_pms.pm_act_id := v_rec.sup_act;
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
        SET    trn_sta = '7'
        WHERE  trn_ref = pi_ref;
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
      AND    trn_sta = '6';
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
      v_xfr.xfr_act_id := v_rec.sup_act; ---trn_to_act;   #####
      v_xfr.d_act_id   := v_rec.trn_frm_act;
      v_xfr.xfr_dsc    := 'Reversal of transaction reference - ' || v_rec.trn_ref;
      v_xfr.d_xfr_dsc  := 'Reversal of transaction reference - ' || v_rec.trn_ref;      
    END IF;
    --
    BEGIN
      --
      logger.log('SEND XFR Ref='||pi_ref||' act-'||v_xfr.xfr_act_id);      --#####
      pkch_90.pr_cre_xfr@pg_owner_link(v_xfr);
      --
      UPDATE t_wb_10_acc_xfr
      SET    trn_sta = '9'
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
      RETURN NVL(v_act.mkt_act_dsc,v_act.act_dsc);
    ELSE
      RETURN NULL;
    END IF;
  END fn_val_to_act;
  --
  FUNCTION fn_xfr_max_val RETURN NUMBER IS
  BEGIN
    RETURN fn_get_pmv('XFR_MAX_VAL');
  END fn_xfr_max_val;
  --
  --
  FUNCTION fn_xfr_max_amt RETURN NUMBER IS
  BEGIN
    RETURN fn_get_pmv('XFR_MAX_AMT');
  END fn_xfr_max_amt;
  --
  --
  FUNCTION fn_xfr_max_cnt RETURN NUMBER IS
  BEGIN
    RETURN fn_get_pmv('XFR_MAX_CNT');
  END fn_xfr_max_cnt;
  --  
  FUNCTION fn_xfr_bal(pi_act IN VARCHAR2) RETURN NUMBER IS
  BEGIN
    RETURN pkch_90.fn_get_coll_bal@pg_owner_link(pi_act);
  END fn_xfr_bal;  
  --
  PROCEDURE pr_do_xfr(pi_frm_act IN VARCHAR2,
                      pi_bnf_act IN VARCHAR2,
                      pi_amt     IN NUMBER) IS
    --
    v_appid     VARCHAR2(500) := '38632143027';
    v_appkey    VARCHAR2(500) := 'D78D3510-ED82-4E33-B844-F06C04BA680E';
    v_ctt_tp    VARCHAR2(500) := 'application/json';
    v_uri       VARCHAR2(500) := 'http://api.fcmb.com/fcmb2b2/api/BettingSolution/V2/WithdrawalV2/';
    --
    v_ret       pkwb_00_ch.r_ret;
    v_json_obj  json := json();
    v_jobj      JSON;
    v_jval      JSON_VALUE;
    --
    v_msg       VARCHAR2(10);
    v_resp      VARCHAR2(10);
    v_json      CLOB;
    v_clob      CLOB;
    v_trn_dsc   VARCHAR2(250);
    v_frm_act   VARCHAR2(30);
    v_bnf_act   VARCHAR2(30);
    v_amt       NUMBER := 5.50;
    --
  BEGIN
    logger.log('Initializing a FCMB Direct deposit');
    --
    v_frm_act := pi_frm_act; 
    v_bnf_act := pi_bnf_act;
    v_amt     := pi_amt;
    --
    logger.log('Transfering ' || TO_CHAR(v_amt) || ' from '||v_frm_act||' to '||v_bnf_act);
    --
    -- Raise suspense entries in Symbols [DR-Customer | CR-Suspense]
    v_ret := fn_xfr2('XX', v_frm_act, v_bnf_act, v_amt);
    IF v_ret.err_msg IS NOT NULL THEN -- Symbols couldn't process request
      logger.log('Transfer failed due to the following reason ' || v_ret.err_msg);
      raise_application_error(-20050, v_ret.err_msg);
    END IF;  
    --
    --Generate JSON Document
    v_trn_dsc := 'CSLS Online deposit '|| v_ret.ret_ref || ' at ' || TO_CHAR(SYSDATE,'DD-MON-YYYY HH:MI:SS PM');
    v_json_obj.put('AppId', v_appid);
    v_json_obj.put('AppKey', v_appkey);
    v_json_obj.put('AccountNumber', v_bnf_act);
    v_json_obj.put('Amount', v_amt);
    v_json_obj.put('Narration', v_trn_dsc);
    dbms_lob.createtemporary(v_json, TRUE);
    v_json_obj.to_clob(v_json);
    v_json := replace(v_json, chr(10));
    v_json := replace(v_json, chr(13));
    logger.log('FCMB JSON Object => ' || v_json); 
    --
    -- Posting transfer @ FCMB
    BEGIN 
      pr_upd_sta(v_ret.ret_ref,'6'); 
      apex_web_service.g_request_headers(1).name := 'Content-Type';
      apex_web_service.g_request_headers(1).value := v_ctt_tp;
      v_clob := apex_web_service.make_rest_request
                       (p_url         => v_uri,
                        p_http_method => 'POST',
                        p_body        => v_json);
      logger.log('Transfer['||v_ret.ret_ref||'] response from FCMB ' || v_clob); 
    EXCEPTION
      WHEN OTHERS THEN
        logger.log('Transfer failed due to the following ' || SQLERRM);
        raise_application_error(-20051, 'FCMB couldn''t be reached');
    END; 
    --
    -- Processing Response from FCMB
    IF v_clob IS NOT NULL THEN
      IF pkwb_01_vld.fn_is_json(v_clob) THEN
        v_jobj := json(v_clob);
        v_jval := v_jobj.get('ResponseCode');
        v_resp := v_jval.get_string;
        v_jval := v_jobj.get('Message');
        v_msg := v_jval.get_string;
        --
        IF v_resp = '00' THEN
          -- Completing transfer [DR - Suspense | CR - Bank]
          pr_pms(v_ret.ret_ref);
          logger.log('Completing transfer['||v_ret.ret_ref||'] in Symbols');
        ELSE
          -- Reversing transfer [DR - Suspense | CR - Customer]
          pr_rxfr(v_ret.ret_ref);  
          logger.log('Reversing transfer['||v_ret.ret_ref||'] in Symbols due to the follwoing reason ' || v_msg);  
          raise_application_error(-20052, v_msg );       
        END IF;
        --
      ELSE
        pr_upd_sta(v_ret.ret_ref,'4'); 
        logger.log('Transfer['||v_ret.ret_ref||'] failed due to invalid response');  
        raise_application_error(-20052, 'Invalid response from FCMB. Please contact Customer Service');      
      END IF;
    ELSE 
      pr_upd_sta(v_ret.ret_ref,'4'); 
      logger.log('Transfer['||v_ret.ret_ref||'] failed due to no response');  
      raise_application_error(-20052, 'No response from FCMB. Please contact Customer Service');
    END IF;
    --  
  EXCEPTION
    WHEN OTHERS THEN
      pr_upd_sta(v_ret.ret_ref,'8'); 
      logger.log('Transfer['||v_ret.ret_ref||'] failed due to ' || SQLERRM);  
      raise_application_error(-20052, 'An unexpected error Occured. Kindly contact Customer Service'); 
  END pr_do_xfr;
  --
  PROCEDURE pr_get_bnk_bal(pi_act IN VARCHAR2,
                           po_bal     OUT NUMBER,
                           po_act_nm  OUT VARCHAR2,
                           po_act_msg OUT VARCHAR2) IS
    --
    v_appid     VARCHAR2(500) := '38632143027';
    v_appkey    VARCHAR2(500) := 'D78D3510-ED82-4E33-B844-F06C04BA680E';
    v_ctt_tp    VARCHAR2(500) := 'application/json';
    v_uri       VARCHAR2(500) := 'http://api.fcmb.com/FCMB2B2/api/Csl/Security/AuthenticateCslUser/';
    --
    v_json_obj  json := json();
    v_jobj      JSON;
    v_jval      JSON_VALUE;
    v_json      CLOB;
    v_clob      CLOB;
    --
  BEGIN
    --
    logger.log('Initializing a FCMB Bank Balance Check');
    --
    IF pi_act IS NOT NULL THEN
      --
      logger.log('Account Number => ' || pi_act);
      v_json_obj.put('AppId', v_appid);
      v_json_obj.put('AppKey', v_appkey);
      v_json_obj.put('CSCSNo', pi_act);
      v_json_obj.put('AccountNumber', pi_act);
      dbms_lob.createtemporary(v_json, TRUE);
      v_json_obj.to_clob(v_json);
      v_json := replace(v_json, chr(10));
      v_json := replace(v_json, chr(13));
      logger.log('FCMB JSON Object => ' || v_json); 
      --
      BEGIN
        apex_web_service.g_request_headers(1).name := 'Content-Type';
        apex_web_service.g_request_headers(1).value := v_ctt_tp;
        v_clob := apex_web_service.make_rest_request
                        (p_url         => v_uri,
                         p_http_method => 'POST',
                         p_body        => v_json);
      EXCEPTION
        WHEN OTHERS THEN
          logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                           dbms_utility.format_error_backtrace, pv_lp); 
      END;        
      --
      IF pkwb_01_vld.fn_is_json(v_clob) THEN
        v_jobj := json(v_clob);
        v_jval := v_jobj.get('Balance');
        po_bal := v_jval.get_number;
        v_jval := v_jobj.get('AccountName');
        po_act_nm := v_jval.get_string;
        v_jval := v_jobj.get('CSCSNoMapStatus');
        po_act_msg := v_jval.get_string;
      END IF;  
    ELSE
      logger.log('Bank Account not provided');
    END IF;
    --    
  END pr_get_bnk_bal;
  --  
END pkwb_00_ch; 