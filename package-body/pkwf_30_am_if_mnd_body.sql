CREATE OR REPLACE PACKAGE BODY pkwf_30_am_if_mnd AS
  --
  /* Created By       : Femi Akintoye 
  ** Date Created     : 11-MAR-2016
  **
  ** PURPOSE: WF Routines for Preship Objects
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
  /* Private Routines */
  --
  /* Public Routines */
  --
  -- Insert/Validation of document
  FUNCTION fn_ins(pi_rec IN wf_vi_30_am_if_mnd%ROWTYPE) RETURN pkwf_90_gen.r_ret IS
    v_r     wf_vi_30_am_if_mnd%ROWTYPE := pi_rec;
    v_k     wf_00_00_dtd.n38%TYPE;
    v_ret   pkwf_90_gen.r_ret;
  BEGIN
    --
    v_ret.ret_cd := 0;
    --
    BEGIN
      --
      v_r.d_id := 'WFVI30AMIFMND';
      --pkwf_00_vld.pr_reqd (pi_d => v_r.dc_tp_k, pi_dsc => 'Document Type');
      v_r.dc_tp_k := 0;
      v_r.dc_st_dm := '0';
      v_r.dc_jsn   := NULL;
      v_r.dc_lnk_yn := '0';
      --
--      v_r.cus_id,
      v_r.fnd_id    := pkwf_30_gen.fn_set_fld(v_r.fnd_id);
      pkwf_00_vld.pr_reqd (pi_d => v_r.fnd_id, pi_dsc => 'Redemption Fund');
--      v_r.fnd_dsc,
--      v_r.ast_tp_dm,
--      v_r.ast_tp_dsc,
--      v_r.ast_cl_dsc,
--      v_r.ast_scl_dsc,
--      v_r.ast_dsc,
--      v_r.ast_curr_id,
--      v_r.ast_curr_ds,
      v_r.if_acct_id    := pkwf_30_gen.fn_set_fld(v_r.if_acct_id);
      pkwf_00_vld.pr_reqd (pi_d => v_r.if_acct_id, pi_dsc => 'Redemption Account');
--      v_r.mf_acct_dsc,
--      v_r.eff_dt,
--      v_r.tenor_dsc,
--      v_r.mat_dt,
--      v_r.unt_qty,
--      v_r.cur_prc,
--      v_r.hld_val,
--      v_r.cur_val,
--      v_r.rdp_unt
      --
      v_r.row_key := pkwf_00_00.fn_rk; 
      v_r.dc_id := pkwf_30_gen.fn_g_doc_id;
      v_r.dc_dtt   := SYSDATE;
      --
      -- Create record in object
      INSERT
        INTO wf_vi_30_am_if_mnd
      VALUES v_r;
      --
      v_ret.po_dc_k := v_r.row_key;
      --
      pkwf_30_gen.pr_set_dc_dtl(pi_d_id   => v_r.d_id,
                                pi_dc_id  => v_r.dc_id,
                                pi_dc_dsc => 'EXCEPTIONAL MANDATE FROM '||v_r.if_acct_dsc);
      --     
    EXCEPTION
      WHEN OTHERS THEN
      v_ret.ret_cd  := SQLCODE;
      --v_ret.rt_id  := 'ON20';
      v_ret.err_dsc := dbms_utility.format_error_stack;
      v_ret.err_sta := dbms_utility.format_error_backtrace;
    END;
    --
logger.log(v_r.d_id||' RETURNED '||v_ret.ret_cd||' '||v_ret.err_dsc, 'ins', v_ret.err_sta);    
    RETURN v_ret;
    --
  END fn_ins;
  -- 
  --
  --
END pkwf_30_am_if_mnd; 
/
