create or replace PACKAGE BODY pkwf_30_ws AS
  --
  /* Created By       : Aderemi Alabi 
  ** Date Created     : 25-JUN-2016
  **
  ** PURPOSE: WF Routines for WS Requests
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
  --
  pv_ls logger_logs.scope%type := $$plsql_unit;
  pv_lp logger.tab_param;
  --
  --
  /* Private Routines */
  --
  FUNCTION fn_json_dt(pi_val IN VARCHAR2) RETURN DATE IS
    v_fmt VARCHAR2(50) := 'YYYY-MM-DD';-- THH24:MI:SSZ';
    v_ret DATE;
  BEGIN
    v_ret := TO_DATE(SUBSTR(pi_val,1,10), v_fmt);
    RETURN v_ret;
  EXCEPTION
    WHEN OTHERS THEN
      RAISE;
  END fn_json_dt;
  --
  FUNCTION  fn_parse_json(pi_json IN CLOB) RETURN apex_json.t_values IS
    v_jlst     apex_json.t_values;
    e_invalid_json EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_invalid_json, -20987);
  BEGIN
    --
    pv_ls := pv_ls || '.fn_parse_json';
    --
    IF pi_json IS NULL THEN
      logger.append_param(pv_lp,' JSON','Empty');
      raise_application_error(-20055, 'Empty JSON Object. No further processing');
    ELSE  
      apex_json.parse(v_jlst, pi_json);
      RETURN v_jlst;
    END IF; 
    --   
    logger.log('Parsing JSON', pv_ls, NULL, pv_lp);
    --    
  EXCEPTION
    WHEN e_invalid_json THEN
      logger.append_param(pv_lp,' JSON','Invalid');
      logger.log('Parsing JSON', pv_ls, NULL, pv_lp);
      raise_application_error(-20055, 'Invalid JSON Object. No further processing');
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      raise_application_error(-20055, 'Invalid JSON Object. No further processing');    
  END fn_parse_json;
  --
  FUNCTION fn_gen_json(pi_cd IN VARCHAR2, pi_msg IN VARCHAR2) RETURN CLOB IS
    v_cd  VARCHAR2(20);
    v_msg VARCHAR2(2000);
  BEGIN
    --
    IF pi_cd = '0' THEN
      v_cd  := '000';
      v_msg := NVL(pi_msg,'Web Access request received successfully');
    ELSE
      v_cd  := pi_cd;
      v_msg := pi_msg;
    END IF;    
    apex_json.initialize_clob_output;
    apex_json.open_object();
    apex_json.open_array('response');
    apex_json.open_object();
    apex_json.write('code', v_cd);
    apex_json.write('message', v_msg);
    apex_json.close_object;
    apex_json.close_array;
    apex_json.close_object;
    --
    RETURN apex_json.get_clob_output;
    --
  END fn_gen_json;
  --
  --
  /* Public Routines */
  --
  -- Online Access for ST
  FUNCTION fn_web_access(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_cs_reg%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_web_access';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.mk_ac_id  := apex_json.get_varchar2(p_path => 'webaccess[%d].mk_ac_id', p0 => 1, p_values => v_jlst);
    v_rec.ac_nm     := apex_json.get_varchar2(p_path => 'webaccess[%d].ac_nm', p0 => 1, p_values => v_jlst);
    v_rec.dob_dt    := fn_json_dt(apex_json.get_varchar2(p_path => 'webaccess[%d].dob_dt', p0 => 1, p_values => v_jlst));
    v_rec.pry_em_ad := apex_json.get_varchar2(p_path => 'webaccess[%d].pry_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.mbl_phn   := apex_json.get_varchar2(p_path => 'webaccess[%d].mbl_phn', p0 => 1, p_values => v_jlst);
    --
    v_ret := pkwf_30_cs_reg.fn_ins(v_rec);
    --
    IF v_ret.ret_cd = '0' THEN
      v_return := fn_gen_json(v_ret.ret_cd, NULL);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('WB-Online Access', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('WB-Online Access', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_web_access;  
  --
  -- Online Access for AM
  FUNCTION fn_web_access2(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_cs_reg_2%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_web_access2';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.cus_id    := apex_json.get_varchar2(p_path => 'webaccess[%d].cus_id', p0 => 1, p_values => v_jlst);
    v_rec.cus_nm    := apex_json.get_varchar2(p_path => 'webaccess[%d].cus_nm', p0 => 1, p_values => v_jlst);
    v_rec.dob_dt    := fn_json_dt(apex_json.get_varchar2(p_path => 'webaccess2%d].dob_dt', p0 => 1, p_values => v_jlst));
    v_rec.pry_em_ad := apex_json.get_varchar2(p_path => 'webaccess[%d].pry_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.mbl_phn   := apex_json.get_varchar2(p_path => 'webaccess[%d].mbl_phn', p0 => 1, p_values => v_jlst);
    --
    v_ret := pkwf_30_cs_reg_2.fn_ins(v_rec);
    --
    IF v_ret.ret_cd = '0' THEN
      v_return := fn_gen_json(v_ret.ret_cd, NULL);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('WB-Online Access2', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('WB-Online Access2', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_web_access2;  
  --
  -- Cash Withdarawal
  FUNCTION fn_cash_withdraw(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_ch_wdr%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_cash_withdraw';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.ac_id       := apex_json.get_varchar2(p_path => 'withdrawal[%d].ac_id', p0 => 1, p_values => v_jlst);
    v_rec.pm_bk_id    := apex_json.get_varchar2(p_path => 'withdrawal[%d].pm_bk_id', p0 => 1, p_values => v_jlst);
    v_rec.pm_bk_ac_no := apex_json.get_varchar2(p_path => 'withdrawal[%d].pm_bk_ac_no', p0 => 1, p_values => v_jlst);
    v_rec.wdr_amt     := apex_json.get_number(p_path => 'withdrawal[%d].wdr_amt', p0 => 1, p_values => v_jlst);
    --
    v_ret := pkwf_30_ch_wdr.fn_ins(v_rec);
    --
    IF v_ret.ret_cd = '0' THEN
      v_return := fn_gen_json(v_ret.ret_cd, NULL);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('CH-Cash Withdrawal', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('CH-Cash Withdrawal', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_cash_withdraw;  
  --
  -- IF Mandate
  FUNCTION fn_if_mandate(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_am_if_mnd%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_if_mandate';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.cus_id      := apex_json.get_varchar2(p_path => 'withdrawal[%d].cus_id', p0 => 1, p_values => v_jlst);
    v_rec.fnd_id      := apex_json.get_varchar2(p_path => 'withdrawal[%d].fnd_id', p0 => 1, p_values => v_jlst);
    v_rec.fnd_dsc     := apex_json.get_varchar2(p_path => 'withdrawal[%d].fnd_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_tp_dm   := apex_json.get_varchar2(p_path => 'withdrawal[%d].ast_tp_dm', p0 => 1, p_values => v_jlst);
    v_rec.ast_tp_dsc  := apex_json.get_varchar2(p_path => 'withdrawal[%d].ast_tp_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_cl_dsc  := apex_json.get_varchar2(p_path => 'withdrawal[%d].ast_cl_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_scl_dsc := apex_json.get_varchar2(p_path => 'withdrawal[%d].ast_scl_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_dsc     := apex_json.get_varchar2(p_path => 'withdrawal[%d].ast_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_curr_id := apex_json.get_varchar2(p_path => 'withdrawal[%d].ast_curr_id', p0 => 1, p_values => v_jlst);
    v_rec.ast_curr_ds := apex_json.get_varchar2(p_path => 'withdrawal[%d].ast_curr_ds', p0 => 1, p_values => v_jlst);
    v_rec.if_acct_id  := apex_json.get_varchar2(p_path => 'withdrawal[%d].if_acct_id', p0 => 1, p_values => v_jlst);
    v_rec.if_acct_dsc := apex_json.get_varchar2(p_path => 'withdrawal[%d].if_acct_dsc', p0 => 1, p_values => v_jlst);    
    v_rec.hld_val     := apex_json.get_number(p_path => 'withdrawal[%d].hld_val', p0 => 1, p_values => v_jlst);
    v_rec.mnd_dsc     := apex_json.get_varchar2(p_path => 'withdrawal[%d].mnd_dsc', p0 => 1, p_values => v_jlst);
    --
    v_ret := pkwf_30_am_if_mnd.fn_ins(v_rec);
    --
    IF v_ret.ret_cd = '0' THEN
      v_return := fn_gen_json(v_ret.ret_cd, NULL);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('IF-Mandate', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('IF-Mandate', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_if_mandate;  
  --
  -- MF Redeem
  FUNCTION fn_mf_redeem(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_am_mf_rdm%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_mf_redeem';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.cus_id      := apex_json.get_varchar2(p_path => 'redemption[%d].cus_id', p0 => 1, p_values => v_jlst);
    v_rec.fnd_id      := apex_json.get_varchar2(p_path => 'redemption[%d].fnd_id', p0 => 1, p_values => v_jlst);
    v_rec.fnd_dsc     := apex_json.get_varchar2(p_path => 'redemption[%d].fnd_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_tp_dm   := apex_json.get_varchar2(p_path => 'redemption[%d].ast_tp_dm', p0 => 1, p_values => v_jlst);
    v_rec.ast_tp_dsc  := apex_json.get_varchar2(p_path => 'redemption[%d].ast_tp_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_cl_dsc  := apex_json.get_varchar2(p_path => 'redemption[%d].ast_cl_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_scl_dsc := apex_json.get_varchar2(p_path => 'redemption[%d].ast_scl_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_dsc     := apex_json.get_varchar2(p_path => 'redemption[%d].ast_dsc', p0 => 1, p_values => v_jlst);
    v_rec.ast_curr_id := apex_json.get_varchar2(p_path => 'redemption[%d].ast_curr_id', p0 => 1, p_values => v_jlst);
    v_rec.ast_curr_ds := apex_json.get_varchar2(p_path => 'redemption[%d].ast_curr_ds', p0 => 1, p_values => v_jlst);
    v_rec.mf_acct_id  := apex_json.get_varchar2(p_path => 'redemption[%d].mf_acct_id', p0 => 1, p_values => v_jlst);
    v_rec.mf_acct_dsc := apex_json.get_varchar2(p_path => 'redemption[%d].mf_acct_dsc', p0 => 1, p_values => v_jlst);    
    v_rec.eff_dt      := fn_json_dt(apex_json.get_varchar2(p_path => 'redemption[%d].eff_dt', p0 => 1, p_values => v_jlst));    
    v_rec.tenor_dsc   := apex_json.get_varchar2(p_path => 'redemption[%d].tenor_dsc', p0 => 1, p_values => v_jlst);    
    v_rec.unt_qty     := apex_json.get_number(p_path => 'redemption[%d].unt_qty', p0 => 1, p_values => v_jlst);
    v_rec.cur_prc     := apex_json.get_number(p_path => 'redemption[%d].cur_prc', p0 => 1, p_values => v_jlst);
    v_rec.hld_val     := apex_json.get_number(p_path => 'redemption[%d].hld_val', p0 => 1, p_values => v_jlst);
    v_rec.cur_val     := apex_json.get_number(p_path => 'redemption[%d].cur_val', p0 => 1, p_values => v_jlst);
    v_rec.rdp_unt     := apex_json.get_number(p_path => 'redemption[%d].rdp_unt', p0 => 1, p_values => v_jlst);
    --
    v_ret := pkwf_30_am_mf_rdm.fn_ins(v_rec);
    --
    IF v_ret.ret_cd = '0' THEN
      v_return := fn_gen_json(v_ret.ret_cd, NULL);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('MF-Redemption', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('MF-Redemption', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_mf_redeem;  
  --
  -- CS New Individual
  FUNCTION fn_cs_new_i(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_cs_new%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_cs_new_i';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.mdl_id    := apex_json.get_varchar2(p_path => 'customer[%d].mdl_id', p0 => 1, p_values => v_jlst);
    v_rec.pdt_id    := apex_json.get_varchar2(p_path => 'customer[%d].pdt_id', p0 => 1, p_values => v_jlst);
    v_rec.pdt_dsc   := apex_json.get_varchar2(p_path => 'customer[%d].pdt_dsc', p0 => 1, p_values => v_jlst);
    v_rec.tt_dm     := apex_json.get_varchar2(p_path => 'customer[%d].tt_dm', p0 => 1, p_values => v_jlst);
    v_rec.ls_nm     := apex_json.get_varchar2(p_path => 'customer[%d].ls_nm', p0 => 1, p_values => v_jlst);
    v_rec.md_nm     := apex_json.get_varchar2(p_path => 'customer[%d].md_nm', p0 => 1, p_values => v_jlst);
    v_rec.fi_nm     := apex_json.get_varchar2(p_path => 'customer[%d].fi_nm', p0 => 1, p_values => v_jlst);
    v_rec.gdr_dm    := apex_json.get_varchar2(p_path => 'customer[%d].gdr_dm', p0 => 1, p_values => v_jlst);
    v_rec.dob_dt    := fn_json_dt(apex_json.get_varchar2(p_path => 'customer[%d].dob_dt', p0 => 1, p_values => v_jlst));
    v_rec.mar_st_dm := apex_json.get_varchar2(p_path => 'customer[%d].mar_st_dm', p0 => 1, p_values => v_jlst);
    v_rec.nty_cd    := apex_json.get_varchar2(p_path => 'customer[%d].nty_cd', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_ad1 := apex_json.get_varchar2(p_path => 'customer[%d].pry_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_ad2 := apex_json.get_varchar2(p_path => 'customer[%d].pry_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_cty := apex_json.get_varchar2(p_path => 'customer[%d].pry_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_sta_cd := apex_json.get_varchar2(p_path => 'customer[%d].pry_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_zip := apex_json.get_varchar2(p_path => 'customer[%d].pry_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].pry_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_ad1 := apex_json.get_varchar2(p_path => 'customer[%d].pst_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_ad2 := apex_json.get_varchar2(p_path => 'customer[%d].pst_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_cty := apex_json.get_varchar2(p_path => 'customer[%d].pst_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_sta_cd := apex_json.get_varchar2(p_path => 'customer[%d].pst_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_zip := apex_json.get_varchar2(p_path => 'customer[%d].pst_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].pst_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.pry_em_ad := apex_json.get_varchar2(p_path => 'customer[%d].pry_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.sec_em_ad := apex_json.get_varchar2(p_path => 'customer[%d].sec_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.mbl_phn   := apex_json.get_varchar2(p_path => 'customer[%d].mbl_phn', p0 => 1, p_values => v_jlst);
    v_rec.oth_phn   := apex_json.get_varchar2(p_path => 'customer[%d].oth_phn', p0 => 1, p_values => v_jlst);
    v_rec.mmd_nm    := apex_json.get_varchar2(p_path => 'customer[%d].mmd_nm', p0 => 1, p_values => v_jlst);
    v_rec.nok_nm    := apex_json.get_varchar2(p_path => 'customer[%d].nok_nm', p0 => 1, p_values => v_jlst);
    v_rec.nok_rln_cd := apex_json.get_varchar2(p_path => 'customer[%d].nok_rln_cd', p0 => 1, p_values => v_jlst);
    v_rec.nok_phn := apex_json.get_varchar2(p_path => 'customer[%d].nok_phn', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_ad1 := apex_json.get_varchar2(p_path => 'customer[%d].nok_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_ad2 := apex_json.get_varchar2(p_path => 'customer[%d].nok_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_cty := apex_json.get_varchar2(p_path => 'customer[%d].nok_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_sta_cd := apex_json.get_varchar2(p_path => 'customer[%d].nok_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_zip := apex_json.get_varchar2(p_path => 'customer[%d].nok_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].nok_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_nm     := apex_json.get_varchar2(p_path => 'customer[%d].bk_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_ac_no  := apex_json.get_varchar2(p_path => 'customer[%d].bk_ac_no', p0 => 1, p_values => v_jlst);
    v_rec.bk_bv_no  := apex_json.get_varchar2(p_path => 'customer[%d].bk_bv_no', p0 => 1, p_values => v_jlst);
    v_rec.bk_ac_nm  := apex_json.get_varchar2(p_path => 'customer[%d].bk_ac_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_br_nm  := apex_json.get_varchar2(p_path => 'customer[%d].bk_br_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_st_cd  := apex_json.get_varchar2(p_path => 'customer[%d].bk_st_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ad1  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ad2  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_cty  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_sta_cd := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_zip  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.ocp_nm := apex_json.get_varchar2(p_path => 'customer[%d].ocp_nm', p0 => 1, p_values => v_jlst);
    v_rec.emp_nm := apex_json.get_varchar2(p_path => 'customer[%d].emp_nm', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_ad1 := apex_json.get_varchar2(p_path => 'customer[%d].emp_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_ad2 := apex_json.get_varchar2(p_path => 'customer[%d].emp_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_cty := apex_json.get_varchar2(p_path => 'customer[%d].emp_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_sta_cd := apex_json.get_varchar2(p_path => 'customer[%d].emp_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_zip := apex_json.get_varchar2(p_path => 'customer[%d].emp_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].emp_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.emp_phn   := apex_json.get_varchar2(p_path => 'customer[%d].emp_phn', p0 => 1, p_values => v_jlst);
    v_rec.ann_inc_amt := apex_json.get_varchar2(p_path => 'customer[%d].ann_inc_amt', p0 => 1, p_values => v_jlst);
    v_rec.c_pic_yn := apex_json.get_varchar2(p_path => 'customer[%d].c_pic_yn', p0 => 1, p_values => v_jlst);
    v_rec.c_sig_yn := apex_json.get_varchar2(p_path => 'customer[%d].c_sig_yn', p0 => 1, p_values => v_jlst);
    v_rec.c_ubl_yn := apex_json.get_varchar2(p_path => 'customer[%d].c_ubl_yn', p0 => 1, p_values => v_jlst);
    v_rec.c_idc_yn := apex_json.get_varchar2(p_path => 'customer[%d].c_idc_yn', p0 => 1, p_values => v_jlst);--
    v_ret := pkwf_30_cs_new.fn_ins(v_rec);
    --
    IF v_ret.ret_cd = '0' THEN
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.po_dc_k);
      pkwf_01_eml.pr_onb_rcpt(UPPER(v_rec.ls_nm) ||' '||INITCAP(v_rec.fi_nm),
                              'Individual Application',
                              v_rec.pdt_dsc,
                              v_rec.pry_em_ad);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('CS-Customer I', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('CS-Customer I', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_cs_new_i;  
  --
  -- CS New Joint
  FUNCTION fn_cs_new_j(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_cs_new_j%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_cs_new_j';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    --Customer 1
    v_rec.mdl_id    := apex_json.get_varchar2(p_path => 'customer1[%d].mdl_id', p0 => 1, p_values => v_jlst);
    v_rec.pdt_id    := apex_json.get_varchar2(p_path => 'customer1[%d].pdt_id', p0 => 1, p_values => v_jlst);
    v_rec.pdt_dsc   := apex_json.get_varchar2(p_path => 'customer1[%d].pdt_dsc', p0 => 1, p_values => v_jlst);
    v_rec.tt_dm     := apex_json.get_varchar2(p_path => 'customer1[%d].tt_dm', p0 => 1, p_values => v_jlst);
    v_rec.ls_nm     := apex_json.get_varchar2(p_path => 'customer1[%d].ls_nm', p0 => 1, p_values => v_jlst);
    v_rec.md_nm     := apex_json.get_varchar2(p_path => 'customer1[%d].md_nm', p0 => 1, p_values => v_jlst);
    v_rec.fi_nm     := apex_json.get_varchar2(p_path => 'customer1[%d].fi_nm', p0 => 1, p_values => v_jlst);
    v_rec.gdr_dm    := apex_json.get_varchar2(p_path => 'customer1[%d].gdr_dm', p0 => 1, p_values => v_jlst);
    v_rec.dob_dt    := fn_json_dt(apex_json.get_varchar2(p_path => 'customer1[%d].dob_dt', p0 => 1, p_values => v_jlst));
    v_rec.mar_st_dm := apex_json.get_varchar2(p_path => 'customer1[%d].mar_st_dm', p0 => 1, p_values => v_jlst);
    v_rec.nty_cd    := apex_json.get_varchar2(p_path => 'customer1[%d].nty_cd', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_ad1 := apex_json.get_varchar2(p_path => 'customer1[%d].pry_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_ad2 := apex_json.get_varchar2(p_path => 'customer1[%d].pry_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_cty := apex_json.get_varchar2(p_path => 'customer1[%d].pry_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_sta_cd := apex_json.get_varchar2(p_path => 'customer1[%d].pry_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_zip := apex_json.get_varchar2(p_path => 'customer1[%d].pry_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.pry_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer1[%d].pry_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_ad1 := apex_json.get_varchar2(p_path => 'customer1[%d].pst_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_ad2 := apex_json.get_varchar2(p_path => 'customer1[%d].pst_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_cty := apex_json.get_varchar2(p_path => 'customer1[%d].pst_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_sta_cd := apex_json.get_varchar2(p_path => 'customer1[%d].pst_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_zip := apex_json.get_varchar2(p_path => 'customer1[%d].pst_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.pst_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer1[%d].pst_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.pry_em_ad := apex_json.get_varchar2(p_path => 'customer1[%d].pry_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.sec_em_ad := apex_json.get_varchar2(p_path => 'customer1[%d].sec_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.mbl_phn   := apex_json.get_varchar2(p_path => 'customer1[%d].mbl_phn', p0 => 1, p_values => v_jlst);
    v_rec.oth_phn   := apex_json.get_varchar2(p_path => 'customer1[%d].oth_phn', p0 => 1, p_values => v_jlst);
    v_rec.mmd_nm    := apex_json.get_varchar2(p_path => 'customer1[%d].mmd_nm', p0 => 1, p_values => v_jlst);
    v_rec.nok_nm    := apex_json.get_varchar2(p_path => 'customer1[%d].nok_nm', p0 => 1, p_values => v_jlst);
    v_rec.nok_rln_cd := apex_json.get_varchar2(p_path => 'customer1[%d].nok_rln_cd', p0 => 1, p_values => v_jlst);
    v_rec.nok_phn := apex_json.get_varchar2(p_path => 'customer1[%d].nok_phn', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_ad1 := apex_json.get_varchar2(p_path => 'customer1[%d].nok_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_ad2 := apex_json.get_varchar2(p_path => 'customer1[%d].nok_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_cty := apex_json.get_varchar2(p_path => 'customer1[%d].nok_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_sta_cd := apex_json.get_varchar2(p_path => 'customer1[%d].nok_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_zip := apex_json.get_varchar2(p_path => 'customer1[%d].nok_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.nok_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer1[%d].nok_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_nm     := apex_json.get_varchar2(p_path => 'customer1[%d].bk_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_ac_no  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_ac_no', p0 => 1, p_values => v_jlst);
    v_rec.bk_bv_no  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_bv_no', p0 => 1, p_values => v_jlst);
    v_rec.bk_ac_nm  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_ac_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_br_nm  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_br_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_st_cd  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_st_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ad1  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ad2  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_cty  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_sta_cd := apex_json.get_varchar2(p_path => 'customer1[%d].bk_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_zip  := apex_json.get_varchar2(p_path => 'customer1[%d].bk_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer1[%d].bk_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.ocp_nm := apex_json.get_varchar2(p_path => 'customer1[%d].ocp_nm', p0 => 1, p_values => v_jlst);
    v_rec.emp_nm := apex_json.get_varchar2(p_path => 'customer1[%d].emp_nm', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_ad1 := apex_json.get_varchar2(p_path => 'customer1[%d].emp_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_ad2 := apex_json.get_varchar2(p_path => 'customer1[%d].emp_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_cty := apex_json.get_varchar2(p_path => 'customer1[%d].emp_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_sta_cd := apex_json.get_varchar2(p_path => 'customer1[%d].emp_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_zip := apex_json.get_varchar2(p_path => 'customer1[%d].emp_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.emp_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer1[%d].emp_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.emp_phn   := apex_json.get_varchar2(p_path => 'customer1[%d].emp_phn', p0 => 1, p_values => v_jlst);
    v_rec.ann_inc_amt := apex_json.get_number(p_path => 'customer1[%d].ann_inc_amt', p0 => 1, p_values => v_jlst);
    v_rec.c_pic_yn := apex_json.get_varchar2(p_path => 'customer1[%d].c_pic_yn', p0 => 1, p_values => v_jlst);
    v_rec.c_sig_yn := apex_json.get_varchar2(p_path => 'customer1[%d].c_sig_yn', p0 => 1, p_values => v_jlst);
    v_rec.c_ubl_yn := apex_json.get_varchar2(p_path => 'customer1[%d].c_ubl_yn', p0 => 1, p_values => v_jlst);
    v_rec.c_idc_yn := apex_json.get_varchar2(p_path => 'customer1[%d].c_idc_yn', p0 => 1, p_values => v_jlst);--
    -- Customer2
    v_rec.j_tt_dm     := apex_json.get_varchar2(p_path => 'customer2[%d].tt_dm', p0 => 1, p_values => v_jlst);
    v_rec.j_ls_nm     := apex_json.get_varchar2(p_path => 'customer2[%d].ls_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_md_nm     := apex_json.get_varchar2(p_path => 'customer2[%d].md_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_fi_nm     := apex_json.get_varchar2(p_path => 'customer2[%d].fi_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_gdr_dm    := apex_json.get_varchar2(p_path => 'customer2[%d].gdr_dm', p0 => 1, p_values => v_jlst);
    v_rec.j_dob_dt    := fn_json_dt(apex_json.get_varchar2(p_path => 'customer2[%d].dob_dt', p0 => 1, p_values => v_jlst));
    v_rec.j_mar_st_dm := apex_json.get_varchar2(p_path => 'customer2[%d].mar_st_dm', p0 => 1, p_values => v_jlst);
    v_rec.j_nty_cd    := apex_json.get_varchar2(p_path => 'customer2[%d].nty_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_pry_a_ad1 := apex_json.get_varchar2(p_path => 'customer2[%d].pry_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.j_pry_a_ad2 := apex_json.get_varchar2(p_path => 'customer2[%d].pry_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.j_pry_a_cty := apex_json.get_varchar2(p_path => 'customer2[%d].pry_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.j_pry_a_sta_cd := apex_json.get_varchar2(p_path => 'customer2[%d].pry_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_pry_a_zip := apex_json.get_varchar2(p_path => 'customer2[%d].pry_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.j_pry_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer2[%d].pry_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_pst_a_ad1 := apex_json.get_varchar2(p_path => 'customer2[%d].pst_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.j_pst_a_ad2 := apex_json.get_varchar2(p_path => 'customer2[%d].pst_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.j_pst_a_cty := apex_json.get_varchar2(p_path => 'customer2[%d].pst_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.j_pst_a_sta_cd := apex_json.get_varchar2(p_path => 'customer2[%d].pst_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_pst_a_zip := apex_json.get_varchar2(p_path => 'customer2[%d].pst_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.j_pst_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer2[%d].pst_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_pry_em_ad := apex_json.get_varchar2(p_path => 'customer2[%d].pry_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.j_sec_em_ad := apex_json.get_varchar2(p_path => 'customer2[%d].sec_em_ad', p0 => 1, p_values => v_jlst);
    v_rec.j_mbl_phn   := apex_json.get_varchar2(p_path => 'customer2[%d].mbl_phn', p0 => 1, p_values => v_jlst);
    v_rec.j_oth_phn   := apex_json.get_varchar2(p_path => 'customer2[%d].oth_phn', p0 => 1, p_values => v_jlst);
    v_rec.j_mmd_nm    := apex_json.get_varchar2(p_path => 'customer2[%d].mmd_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_nm    := apex_json.get_varchar2(p_path => 'customer2[%d].nok_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_rln_cd := apex_json.get_varchar2(p_path => 'customer2[%d].nok_rln_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_phn := apex_json.get_varchar2(p_path => 'customer2[%d].nok_phn', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_a_ad1 := apex_json.get_varchar2(p_path => 'customer2[%d].nok_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_a_ad2 := apex_json.get_varchar2(p_path => 'customer2[%d].nok_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_a_cty := apex_json.get_varchar2(p_path => 'customer2[%d].nok_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_a_sta_cd := apex_json.get_varchar2(p_path => 'customer2[%d].nok_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_a_zip := apex_json.get_varchar2(p_path => 'customer2[%d].nok_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.j_nok_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer2[%d].nok_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_nm     := apex_json.get_varchar2(p_path => 'customer2[%d].bk_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_ac_no  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_ac_no', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_bv_no  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_bv_no', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_ac_nm  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_ac_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_br_nm  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_br_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_st_cd  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_st_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_a_ad1  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_a_ad2  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_a_cty  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_a_sta_cd := apex_json.get_varchar2(p_path => 'customer2[%d].bk_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_a_zip  := apex_json.get_varchar2(p_path => 'customer2[%d].bk_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.j_bk_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer2[%d].bk_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_ocp_nm := apex_json.get_varchar2(p_path => 'customer2[%d].ocp_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_nm := apex_json.get_varchar2(p_path => 'customer2[%d].emp_nm', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_a_ad1 := apex_json.get_varchar2(p_path => 'customer2[%d].emp_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_a_ad2 := apex_json.get_varchar2(p_path => 'customer2[%d].emp_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_a_cty := apex_json.get_varchar2(p_path => 'customer2[%d].emp_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_a_sta_cd := apex_json.get_varchar2(p_path => 'customer2[%d].emp_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_a_zip := apex_json.get_varchar2(p_path => 'customer2[%d].emp_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer2[%d].emp_a_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.j_emp_phn   := apex_json.get_varchar2(p_path => 'customer2[%d].emp_phn', p0 => 1, p_values => v_jlst);
    v_rec.j_ann_inc_amt := apex_json.get_number(p_path => 'customer2[%d].ann_inc_amt', p0 => 1, p_values => v_jlst);
    v_rec.j_c_pic_yn := apex_json.get_varchar2(p_path => 'customer2[%d].c_pic_yn', p0 => 1, p_values => v_jlst);
    v_rec.j_c_sig_yn := apex_json.get_varchar2(p_path => 'customer2[%d].c_sig_yn', p0 => 1, p_values => v_jlst);
    v_rec.j_c_ubl_yn := apex_json.get_varchar2(p_path => 'customer2[%d].c_ubl_yn', p0 => 1, p_values => v_jlst);
    v_rec.j_c_idc_yn := apex_json.get_varchar2(p_path => 'customer2[%d].c_idc_yn', p0 => 1, p_values => v_jlst);--
    --
    v_ret := pkwf_30_cs_new_j.fn_ins(v_rec);
    --
    logger.log('Return Code => ' || v_ret.ret_cd || ', Corporate Customer Key => ' || v_ret.po_dc_k);
    IF v_ret.ret_cd = '0' THEN
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.po_dc_k);
      pkwf_01_eml.pr_onb_rcpt(UPPER(v_rec.ls_nm) ||' '||INITCAP(v_rec.fi_nm),
                              'Joint Application',
                              v_rec.pdt_dsc,
                              v_rec.pry_em_ad);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('CS-Customer J', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('CS-Customer J', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_cs_new_j;  
  --
  -- CS New Corporate
  FUNCTION fn_cs_new_c(pi_obj IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_cs_new_c%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_return CLOB;
    --
  BEGIN
    --
    pv_ls := pv_ls || '.fn_cs_new_c';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.mdl_id    := apex_json.get_varchar2(p_path => 'customer[%d].mdl_id', p0 => 1, p_values => v_jlst);
    v_rec.pdt_id    := apex_json.get_varchar2(p_path => 'customer[%d].pdt_id', p0 => 1, p_values => v_jlst);
    v_rec.pdt_dsc   := apex_json.get_varchar2(p_path => 'customer[%d].pdt_dsc', p0 => 1, p_values => v_jlst);
    v_rec.org_nm    := apex_json.get_varchar2(p_path => 'customer[%d].org_nm', p0 => 1, p_values => v_jlst);
    v_rec.pry_eml_ad:= apex_json.get_varchar2(p_path => 'customer[%d].pry_eml_ad', p0 => 1, p_values => v_jlst);
    v_rec.reg_nbr   := apex_json.get_varchar2(p_path => 'customer[%d].reg_nbr', p0 => 1, p_values => v_jlst);
    v_rec.tax_id    := apex_json.get_varchar2(p_path => 'customer[%d].tax_id', p0 => 1, p_values => v_jlst);
    v_rec.reg_dt    := fn_json_dt(apex_json.get_varchar2(p_path => 'customer[%d].reg_dt', p0 => 1, p_values => v_jlst));
    v_rec.reg_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].reg_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.org_ad1   := apex_json.get_varchar2(p_path => 'customer[%d].org_ad1', p0 => 1, p_values => v_jlst);
    v_rec.org_ad2   := apex_json.get_varchar2(p_path => 'customer[%d].org_ad2', p0 => 1, p_values => v_jlst);
    v_rec.org_cty   := apex_json.get_varchar2(p_path => 'customer[%d].org_cty', p0 => 1, p_values => v_jlst);
    v_rec.org_sta_cd := apex_json.get_varchar2(p_path => 'customer[%d].org_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.org_zip   := apex_json.get_varchar2(p_path => 'customer[%d].org_zip', p0 => 1, p_values => v_jlst);
    v_rec.org_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].org_ctr_cd', p0 => 1, p_values => v_jlst);
    v_rec.est_trn_val := apex_json.get_varchar2(p_path => 'customer[%d].est_trn_val', p0 => 1, p_values => v_jlst);
    v_rec.bk_nm     := apex_json.get_varchar2(p_path => 'customer[%d].bk_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_ac_no  := apex_json.get_varchar2(p_path => 'customer[%d].bk_ac_no', p0 => 1, p_values => v_jlst);
    v_rec.bk_ac_nm  := apex_json.get_varchar2(p_path => 'customer[%d].bk_ac_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_br_nm  := apex_json.get_varchar2(p_path => 'customer[%d].bk_br_nm', p0 => 1, p_values => v_jlst);
    v_rec.bk_st_cd  := apex_json.get_varchar2(p_path => 'customer[%d].bk_st_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ad1  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_ad1', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ad2  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_ad2', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_cty  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_cty', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_sta_cd := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_sta_cd', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_zip  := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_zip', p0 => 1, p_values => v_jlst);
    v_rec.bk_a_ctr_cd := apex_json.get_varchar2(p_path => 'customer[%d].bk_a_ctr_cd', p0 => 1, p_values => v_jlst);
    --
    v_ret := pkwf_30_cs_new_c.fn_ins(v_rec);
    --
    IF v_ret.ret_cd = '0' THEN
       v_return := fn_gen_json(v_ret.ret_cd, v_ret.po_dc_k);
       pkwf_01_eml.pr_onb_rcpt(UPPER(v_rec.org_nm),
                              'Corporate Application',
                              v_rec.pdt_dsc,
                              v_rec.pry_eml_ad);
    ELSE 
      v_return := fn_gen_json(v_ret.ret_cd, v_ret.err_dsc);
    END IF;     
    --
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('CS-Customer C', pv_ls, NULL, pv_lp);
    RETURN v_return;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log_error('exception', pv_ls, dbms_utility.format_error_stack ||'|'||
                                          dbms_utility.format_error_backtrace, pv_lp);
      logger.log('CS-Customer C', pv_ls, NULL, pv_lp);
      v_return := fn_gen_json(sqlcode, sqlerrm);
      RETURN v_return;      
  END fn_cs_new_c;  
  --
  FUNCTION fn_cs_new_sig(pi_obj  IN CLOB) RETURN CLOB IS
    --
    v_rec    wf_vi_30_cs_new_sig%ROWTYPE;
    v_ret    pkwf_90_gen.r_ret;
    v_jlst   apex_json.t_values;
    v_doc_id VARCHAR2(100);
    v_return CLOB;
    --    
    CURSOR c_doc_id(pii_key IN NUMBER) IS
      SELECT dc_id
      FROM   wf_30_dc
      WHERE  row_key = pii_key;
  BEGIN
    --
    pv_ls := pv_ls || '.pr_cs_new_sig';
    logger.append_param(pv_lp,' REQ-JSON',pi_obj);
    --
    v_jlst := fn_parse_json(pi_obj);
    v_rec.doc_key := apex_json.get_number(p_path => 'signatory[%d].doc_key', p0 => 1, p_values => v_jlst);
    v_rec.fir_nm  := apex_json.get_varchar2(p_path => 'signatory[%d].fir_nm', p0 => 1, p_values => v_jlst);
    v_rec.lst_nm  := apex_json.get_varchar2(p_path => 'signatory[%d].lst_nm', p0 => 1, p_values => v_jlst);
    v_rec.oth_nm  := apex_json.get_varchar2(p_path => 'signatory[%d].oth_nm', p0 => 1, p_values => v_jlst);
    v_rec.gdr_dm  := apex_json.get_varchar2(p_path => 'signatory[%d].gdr_dm', p0 => 1, p_values => v_jlst);
    v_rec.bth_dt  := fn_json_dt(apex_json.get_varchar2(p_path => 'signatory[%d].bth_dt', p0 => 1, p_values => v_jlst));
    v_rec.eml_adr := apex_json.get_varchar2(p_path => 'signatory[%d].eml_adr', p0 => 1, p_values => v_jlst);
    v_rec.adr_l1  := apex_json.get_varchar2(p_path => 'signatory[%d].adr_l1', p0 => 1, p_values => v_jlst);
    v_rec.adr_cty := apex_json.get_varchar2(p_path => 'signatory[%d].adr_cty', p0 => 1, p_values => v_jlst);
    v_rec.adr_ctr := apex_json.get_varchar2(p_path => 'signatory[%d].adr_ctr', p0 => 1, p_values => v_jlst);
    v_rec.adr_sta := apex_json.get_varchar2(p_path => 'signatory[%d].adr_sta', p0 => 1, p_values => v_jlst);
    v_rec.adr_zip := apex_json.get_varchar2(p_path => 'signatory[%d].adr_zip', p0 => 1, p_values => v_jlst);
    v_rec.pic_fil := apex_json.get_varchar2(p_path => 'signatory[%d].pic_fil', p0 => 1, p_values => v_jlst);
    v_rec.sig_fil := apex_json.get_varchar2(p_path => 'signatory[%d].sig_fil', p0 => 1, p_values => v_jlst);
    --
    OPEN  c_doc_id(v_rec.doc_key);
    FETCH c_doc_id INTO v_doc_id;
    CLOSE c_doc_id;
    logger.append_param(pv_lp,' DC_ID',v_doc_id);
    --
    v_rec.row_key   := pkwf_00_00.fn_rk; 
    v_rec.doc_id    := v_doc_id;
    v_rec.dc_id     := v_rec.row_key;
    v_rec.dc_dtt    := SYSDATE;
    v_rec.d_id      := 'WFVI30CSNEWSIG';
    v_rec.dc_tp_k   := 0;
    v_rec.dc_st_dm  := '0';
    v_rec.dc_jsn    := NULL;
    v_rec.dc_lnk_yn := '1';
    v_rec.dc_lnk_k  := NULL;
    --    
    logger.log('Signatory Insert ');
    INSERT INTO wf_vi_30_cs_new_sig VALUES v_rec;
    v_return := fn_gen_json('0', v_rec.row_key);
    logger.append_param(pv_lp,' RSP-JSON',v_return);
    logger.log('CS-Signatory', pv_ls, NULL, pv_lp);
    --
    
    RETURN v_return;
    --
  END fn_cs_new_sig;
  --
END pkwf_30_ws;