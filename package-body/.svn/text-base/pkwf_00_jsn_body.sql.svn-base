CREATE OR REPLACE PACKAGE BODY pkwf_00_jsn AS
  --
  /* Created By       : Aderemi Alabi 
  ** Date Created     : 09-APR-2016
  **
  ** PURPOSE: WF Routines for JSON
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
   /* Package Variables */
  -- 
  pv_ls logger_logs.scope%type := $$plsql_unit;
  --pv_lp logger.tab_param;
  --
  /* Private Routines */
  --  
  --
  /* Public Routines */
  -- 
  -- 
  FUNCTION fn_new_customer(pi_doc IN CLOB) RETURN CLOB IS
    v_json   CLOB;
    v_rec    wf_vi_30_cs_new%ROWTYPE;
    v_return CLOB;
    v_resp   pkwf_90_gen.r_ret;
  BEGIN
    pv_ls := pv_ls || '.fn_new_customer';
    logger.log('JSON received', pv_ls, 'JSON Object => '||pi_doc);
    apex_json.initialize_clob_output;    
    v_json := pi_doc;
    IF v_json IS NOT NULL THEN
      BEGIN        
        apex_json.parse(v_json);
        logger.log('JSON parsed', pv_ls, NULL);
      EXCEPTION
        WHEN OTHERS THEN
           logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace);
          apex_json.open_object();
          apex_json.write('Response', '000');      
          apex_json.write('Error', 'Poorly formatted document'); 
          apex_json.write('Status', '.'); 
          apex_json.close_object;
          v_return := apex_json.get_clob_output;
          RETURN v_return;
      END;
    END IF;
    --
    v_rec.row_key      := 0;
    v_rec.pdt_id       := apex_json.get_varchar2(p_path => 'pdt_id');
    v_rec.tt_dm        := apex_json.get_varchar2(p_path => 'title');
    v_rec.ls_nm        := apex_json.get_varchar2(p_path => 'lastname');
    v_rec.md_nm        := apex_json.get_varchar2(p_path => 'othernames');
    v_rec.fi_nm        := apex_json.get_varchar2(p_path => 'firstname');
    v_rec.gdr_dm       := apex_json.get_varchar2(p_path => 'gender');
    v_rec.dob_dt       := apex_json.get_date(p_path => 'birthdate');
    v_rec.mar_st_dm    := apex_json.get_varchar2(p_path => 'maritalstatus');
    v_rec.nty_cd       := apex_json.get_varchar2(p_path => 'nationality');
    v_rec.pry_a_ad1    := apex_json.get_varchar2(p_path => 'raddress1');
    v_rec.pry_a_ad2    := apex_json.get_varchar2(p_path => 'raddress2');
    v_rec.pry_a_cty    := apex_json.get_varchar2(p_path => 'rcity');
    v_rec.pry_a_sta_cd := apex_json.get_varchar2(p_path => 'rstate');
    v_rec.pry_a_zip    := apex_json.get_varchar2(p_path => 'rzip');
    v_rec.pry_a_ctr_cd := apex_json.get_varchar2(p_path => 'rcountry');
    v_rec.pst_a_ad1    := apex_json.get_varchar2(p_path => 'paddress1');
    v_rec.pst_a_ad2    := apex_json.get_varchar2(p_path => 'paddress2');
    v_rec.pst_a_cty    := apex_json.get_varchar2(p_path => 'pcity');
    v_rec.pst_a_sta_cd := apex_json.get_varchar2(p_path => 'pstate');
    v_rec.pst_a_zip    := apex_json.get_varchar2(p_path => 'pzip');
    v_rec.pst_a_ctr_cd := apex_json.get_varchar2(p_path => 'pcountry');
    v_rec.pry_em_ad    := apex_json.get_varchar2(p_path => 'email1');
    v_rec.sec_em_ad    := apex_json.get_varchar2(p_path => 'email2');
    v_rec.mbl_phn      := apex_json.get_varchar2(p_path => 'phone1');
    v_rec.oth_phn      := apex_json.get_varchar2(p_path => 'phone2');
    v_rec.mmd_nm       := apex_json.get_varchar2(p_path => 'mmaidenname');
    v_rec.nok_nm       := apex_json.get_varchar2(p_path => 'nokname');
    v_rec.nok_phn      := apex_json.get_varchar2(p_path => 'nokphone');
    v_rec.nok_a_ad1    := apex_json.get_varchar2(p_path => 'naddress1');
    v_rec.nok_a_ad2    := apex_json.get_varchar2(p_path => 'naddress2');
    v_rec.nok_a_cty    := apex_json.get_varchar2(p_path => 'ncity');
    v_rec.nok_a_sta_cd := apex_json.get_varchar2(p_path => 'nstate');
    v_rec.nok_a_zip    := apex_json.get_varchar2(p_path => 'nzip');
    v_rec.nok_a_ctr_cd := apex_json.get_varchar2(p_path => 'ncountry');
    v_rec.bk_nm        := apex_json.get_varchar2(p_path => 'bankname');
    v_rec.bk_ac_no     := apex_json.get_varchar2(p_path => 'account');
    v_rec.bk_bv_no     := apex_json.get_varchar2(p_path => 'bvn');
    v_rec.bk_ac_nm     := apex_json.get_varchar2(p_path => 'accountname');
    v_rec.bk_br_nm     := apex_json.get_varchar2(p_path => 'bankbranch');
    v_rec.bk_st_cd     := apex_json.get_varchar2(p_path => 'sortcode');
    v_rec.bk_a_ad1     := apex_json.get_varchar2(p_path => 'baddress1');
    v_rec.bk_a_ad2     := apex_json.get_varchar2(p_path => 'baddress2');
    v_rec.bk_a_cty     := apex_json.get_varchar2(p_path => 'bcity');
    v_rec.bk_a_sta_cd  := apex_json.get_varchar2(p_path => 'bstate');
    v_rec.bk_a_zip     := apex_json.get_varchar2(p_path => 'bzip');
    v_rec.bk_a_ctr_cd  := apex_json.get_varchar2(p_path => 'bcountry');
    v_rec.ocp_nm       := apex_json.get_varchar2(p_path => 'occupation');
    v_rec.emp_nm       := apex_json.get_varchar2(p_path => 'employer');
    v_rec.emp_a_ad1    := apex_json.get_varchar2(p_path => 'eaddress1');
    v_rec.emp_a_ad2    := apex_json.get_varchar2(p_path => 'eaddress2');
    v_rec.emp_a_cty    := apex_json.get_varchar2(p_path => 'ecity');
    v_rec.emp_a_sta_cd := apex_json.get_varchar2(p_path => 'estate');
    v_rec.emp_a_zip    := apex_json.get_varchar2(p_path => 'ezip');
    v_rec.emp_a_ctr_cd := apex_json.get_varchar2(p_path => 'ecountry');
    v_rec.emp_phn      := apex_json.get_varchar2(p_path => 'ephone');
    v_rec.ann_inc_amt  := NVL(apex_json.get_number(p_path => 'income'),0);
    v_rec.c_pic_yn     := apex_json.get_varchar2(p_path => 'haspix');
    v_rec.c_sig_yn     := apex_json.get_varchar2(p_path => 'hassig');
    v_rec.c_ubl_yn     := apex_json.get_varchar2(p_path => 'hasbill');
    v_rec.c_idc_yn     := apex_json.get_varchar2(p_path => 'hasid');
    --
    BEGIN
      v_resp := pkwf_90_gen.fn_01_cus_ins(v_rec);
      logger.log('WF-90-GEN', pv_ls, 'Response => '||v_resp.ret_cd);
      logger.log('WF-90-GEN', pv_ls, 'Key => '||v_resp.po_dc_k);
      logger.log('WF-90-GEN', pv_ls, 'Error => '||v_resp.err_dsc);
      logger.log('WF-90-GEN', pv_ls, 'Status => '||v_resp.err_sta);
    EXCEPTION  
      WHEN OTHERS THEN
        logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace);
        v_resp.ret_cd  := '000';
        v_resp.err_dsc := 'Application Error';
        v_resp.err_sta := dbms_utility.format_error_stack ||chr(13)||chr(10) ||
                          dbms_utility.format_error_backtrace;
    END;                      
    --
    apex_json.initialize_clob_output;
    apex_json.open_object();
    apex_json.write('Response', v_resp.ret_cd);      
    apex_json.write('Key',      v_resp.po_dc_k); 
    apex_json.write('Error',    v_resp.err_dsc); 
    apex_json.write('Status',   v_resp.err_sta); 
    apex_json.close_object;
    --
    v_return := apex_json.get_clob_output;
    RETURN v_return;
    --
  END fn_new_customer;  
  --
  --
  FUNCTION fn_web_access(pi_doc IN CLOB) RETURN CLOB IS
    v_json   CLOB;
    v_rec    wf_vi_30_cs_reg%ROWTYPE;
    v_return CLOB;
    v_resp   pkwf_90_gen.r_ret;
  BEGIN
    pv_ls := pv_ls || '.fn_web_access';
    logger.log('JSON received', pv_ls, 'JSON Object => '||pi_doc);
    apex_json.initialize_clob_output;
    v_json := pi_doc;
    IF v_json IS NOT NULL THEN
      BEGIN
        apex_json.parse(v_json);
        logger.log('JSON parsed', pv_ls, NULL);
      EXCEPTION
        WHEN OTHERS THEN
          logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace);
          apex_json.open_object();
          apex_json.write('Response', '000');      
          apex_json.write('Key', 0);      
          apex_json.write('Error', 'Poorly formatted document'); 
          apex_json.write('Status', '.'); 
          apex_json.close_object;
          v_return := apex_json.get_clob_output;
          RETURN v_return;
      END;
    END IF;
    --
    v_rec.row_key      := 0;
    v_rec.mk_ac_id    := apex_json.get_varchar2(p_path => 'cscsaccount');
    v_rec.ac_nm       := apex_json.get_varchar2(p_path => 'accountname');
    v_rec.dob_dt      := apex_json.get_date(p_path => 'birthdate');
    v_rec.pry_em_ad   := apex_json.get_varchar2(p_path => 'email');
    v_rec.mbl_phn     := apex_json.get_varchar2(p_path => 'mobilephone');
    --
    BEGIN
      v_resp := pkwf_90_gen.fn_02_reg_ins(v_rec);
      logger.log('WF-90-GEN', pv_ls, 'Response => '||v_resp.ret_cd);
      logger.log('WF-90-GEN', pv_ls, 'Key => '||v_resp.po_dc_k);
      logger.log('WF-90-GEN', pv_ls, 'Error => '||v_resp.err_dsc);
      logger.log('WF-90-GEN', pv_ls, 'Status => '||v_resp.err_sta);
    EXCEPTION  
      WHEN OTHERS THEN
        logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace);
        v_resp.ret_cd  := '000';
        v_resp.err_dsc := 'Application Error';
        v_resp.err_sta := dbms_utility.format_error_stack ||chr(13)||chr(10) ||
                          dbms_utility.format_error_backtrace;
    END;                      
    --
    apex_json.initialize_clob_output;
    apex_json.open_object();
    apex_json.write('Response', v_resp.ret_cd);      
    apex_json.write('Key',      v_resp.po_dc_k);     
    apex_json.write('Error',    v_resp.err_dsc); 
    apex_json.write('Status',   v_resp.err_sta); 
    apex_json.close_object;
    v_return := apex_json.get_clob_output;
    RETURN v_return;
    --
  END fn_web_access; 
  --
  --
  FUNCTION fn_cash_withdraw(pi_doc IN CLOB) RETURN CLOB IS
    v_json   CLOB;
    v_rec    wf_vi_30_ch_wdr%ROWTYPE;
    v_return CLOB;
    v_resp   pkwf_90_gen.r_ret;
  BEGIN
    apex_json.initialize_clob_output;
    v_json := pi_doc;
    IF v_json IS NOT NULL THEN
      BEGIN
        apex_json.parse(v_json);
      EXCEPTION
        WHEN OTHERS THEN
          apex_json.open_object();
          apex_json.write('Response', '000');      
          apex_json.write('Key', 0);      
          apex_json.write('Error', 'Poorly formatted document'); 
          apex_json.write('Status', '.'); 
          apex_json.close_object;
          v_return := apex_json.get_clob_output;
          RETURN v_return;
      END;
    END IF;
    --
    v_rec.row_key      := 0;
    v_rec.ac_id       := apex_json.get_varchar2(p_path => 'accountnumber');
    v_rec.pm_bk_id    := 'FCMB';
    v_rec.pm_bk_ac_no := '00';
    v_rec.wdr_amt     := apex_json.get_number(p_path => 'amount');
    --
    --
    BEGIN
      v_resp := pkwf_90_gen.fn_03_wdr_ins(v_rec);
    EXCEPTION  
      WHEN OTHERS THEN
        v_resp.ret_cd  := '000';
        v_resp.err_dsc := 'Application Error';
        v_resp.err_sta := dbms_utility.format_error_stack ||chr(13)||chr(10) ||
                          dbms_utility.format_error_backtrace;
    END;                      
    --
    apex_json.initialize_clob_output;
    apex_json.open_object();
    apex_json.write('Response', v_resp.ret_cd);      
    apex_json.write('Key',      v_resp.po_dc_k);     
    apex_json.write('Error',    v_resp.err_dsc); 
    apex_json.write('Status',   v_resp.err_sta); 
    apex_json.close_object;
    --
    v_return := apex_json.get_clob_output;
    RETURN v_return;
    --
  END fn_cash_withdraw;  
  --
END pkwf_00_jsn; 
/
