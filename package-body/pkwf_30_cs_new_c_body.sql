CREATE OR REPLACE PACKAGE BODY pkwf_30_cs_new_c AS
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
  FUNCTION fn_ins(pi_rec IN wf_vi_30_cs_new_c%ROWTYPE) RETURN pkwf_90_gen.r_ret IS
    v_r     wf_vi_30_cs_new_c%ROWTYPE := pi_rec;
    v_k     wf_00_00_dtd.n38%TYPE;
    v_ret   pkwf_90_gen.r_ret;
  BEGIN
    --
    v_ret.ret_cd := 0;
    --
    BEGIN
      --
      v_r.d_id := 'WFVI30CSNEWC';
      --pkwf_00_vld.pr_reqd (pi_d => v_r.dc_tp_k, pi_dsc => 'Document Type');
      v_r.dc_tp_k := 0;
      v_r.dc_st_dm := '0';
      v_r.dc_jsn   := NULL;
      v_r.dc_lnk_yn := '1';
      v_r.dc_lnk_k := NULL;
      --
      v_r.org_nm    := pkwf_30_gen.fn_set_fld(v_r.org_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r.org_nm, pi_dsc => 'Organisation Name');
      v_r.reg_nbr  := pkwf_30_gen.fn_set_fld(v_r.reg_nbr);
      pkwf_00_vld.pr_reqd (pi_d => v_r.reg_nbr, pi_dsc => 'Registration Number');
      v_r.tax_id   := pkwf_30_gen.fn_set_fld(v_r.tax_id);
      pkwf_00_vld.pr_reqd (pi_d => v_r.reg_dt, pi_dsc => 'Registration Date');
      pkwf_00_vld.pr_not_aft_sys_dt(pi_d => v_r.reg_dt, pi_dsc => 'Registration Date');
      v_r.reg_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r.reg_ctr_cd);
      pkwf_00_vld.pr_reqd (pi_d => v_r.reg_ctr_cd, pi_dsc => 'Country of Registration');
      IF v_r.reg_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.reg_ctr_cd);
      END IF;
      --
      v_r.org_ad1      := pkwf_30_gen.fn_set_fld(v_r.org_ad1);
      pkwf_00_vld.pr_reqd (pi_d => v_r.org_ad1, pi_dsc => 'Organisation Address Line 1');
      v_r.org_ad2      := pkwf_30_gen.fn_set_fld(v_r.org_ad2);
      v_r.org_cty      := pkwf_30_gen.fn_set_fld(v_r.org_cty);
      pkwf_00_vld.pr_reqd (pi_d => v_r.org_cty, pi_dsc => 'Organisation Address City');
      v_r.org_sta_cd   := pkwf_30_gen.fn_set_fld(v_r.org_sta_cd);
      v_r.org_zip      := pkwf_30_gen.fn_set_fld(v_r.org_zip);
      v_r.org_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r.org_ctr_cd);
      pkwf_00_vld.pr_reqd (pi_d => v_r.org_ctr_cd, pi_dsc => 'Organisation Address Country');
      IF v_r.org_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.org_ctr_cd);
      END IF;
      IF v_r.org_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.org_ctr_cd,
                                          pi_id     => v_r.org_sta_cd);
      END IF;
      --
      pkwf_00_vld.pr_reqd (pi_d => v_r.bk_nm, pi_dsc => 'Bank Name');
      pkwf_00_vld.pr_reqd (pi_d => v_r.bk_ac_no, pi_dsc => 'Bank Account No.');
      v_r.bk_ac_nm      := pkwf_30_gen.fn_set_fld(v_r.bk_ac_nm);
      v_r.bk_br_nm      := pkwf_30_gen.fn_set_fld(v_r.bk_br_nm);
      v_r.bk_st_cd      := pkwf_30_gen.fn_set_fld(v_r.bk_st_cd);
      v_r.bk_a_ad1      := pkwf_30_gen.fn_set_fld(v_r.bk_a_ad1);
      v_r.bk_a_ad2      := pkwf_30_gen.fn_set_fld(v_r.bk_a_ad2);
      v_r.bk_a_cty      := pkwf_30_gen.fn_set_fld(v_r.bk_a_cty);
      v_r.bk_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r.bk_a_sta_cd);
      v_r.bk_a_zip      := pkwf_30_gen.fn_set_fld(v_r.bk_a_zip);
      v_r.bk_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r.bk_a_ctr_cd);
      IF v_r.bk_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.bk_a_ctr_cd);
      END IF;
      --IF v_r.bk_a_sta_cd IS NOT NULL THEN
        --v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.bk_a_ctr_cd,
          --                                pi_id     => v_r.bk_a_sta_cd);
      --END IF;
      --
      v_r.row_key := pkwf_00_00.fn_rk; 
      v_r.dc_id := pkwf_30_gen.fn_g_doc_id;
      v_r.dc_dtt   := SYSDATE;
      --
      -- Create record in object
      INSERT
        INTO wf_vi_30_cs_new_c
      VALUES v_r;
      --
      v_ret.po_dc_k := v_r.row_key;
      --
      pkwf_30_gen.pr_set_dc_dtl(pi_d_id   => v_r.d_id,
                                pi_dc_id  => v_r.dc_id,
                                pi_dc_dsc => UPPER(TRIM(v_r.org_nm)));
      --     
    EXCEPTION
      WHEN OTHERS THEN
      v_ret.ret_cd  := SQLCODE;
      --v_ret.rt_id  := 'ON20';
      v_ret.err_dsc := dbms_utility.format_error_stack;
      v_ret.err_sta := dbms_utility.format_error_backtrace;
    END;
    -- 
    RETURN v_ret;
    --
  END fn_ins;
  --
  --
  FUNCTION fn_ins_sig(pi_rec IN wf_vi_30_cs_new_c_sig%ROWTYPE) RETURN pkwf_90_gen.r_ret IS
    v_r     wf_vi_30_cs_new_c_sig%ROWTYPE := pi_rec;
    v_k     wf_00_00_dtd.n38%TYPE;
    v_ret   pkwf_90_gen.r_ret;
  BEGIN
    --
    v_ret.ret_cd := 0;
    --
    BEGIN
      --
      v_r.d_id := 'WFVI30CSNEWCSIG';
      --pkwf_00_vld.pr_reqd (pi_d => v_r.dc_tp_k, pi_dsc => 'Document Type');
      v_r.dc_tp_k := 0;
      v_r.dc_st_dm := '0';
      v_r.dc_jsn   := NULL;
      v_r.dc_lnk_yn := '0';
      --v_r.dc_lnk_k := NULL;
      pkwf_00_vld.pr_reqd (pi_d => v_r.dc_lnk_k, pi_dsc => 'Signatory Link Key');
      --
      v_r.tt_dm    := pkwf_30_gen.fn_set_fld(v_r.tt_dm);
      IF v_r.tt_dm IS NOT NULL THEN
        v_k := pkwf_00_00.fn_get_ttl_k(pi_id => v_r.tt_dm);
      END IF;
      v_r.ls_nm    := pkwf_30_gen.fn_set_fld(v_r.ls_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r.ls_nm, pi_dsc => 'Last Name');
      v_r.md_nm    := pkwf_30_gen.fn_set_fld(v_r.md_nm);
      v_r.fi_nm    := pkwf_30_gen.fn_set_fld(v_r.fi_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r.fi_nm, pi_dsc => 'First Name');
      v_r.gdr_dm   := pkwf_30_gen.fn_set_fld(v_r.gdr_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r.gdr_dm, pi_dsc => 'Gender');
      pkwf_00_00_dmv.pr_val_cs_gdr(pi_dm => v_r.gdr_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r.dob_dt, pi_dsc => 'Date of Birth');
      pkwf_00_vld.pr_not_aft_sys_dt(pi_d => v_r.dob_dt, pi_dsc => 'Date of Birth');
      pkwf_00_vld.pr_reqd (pi_d => v_r.nty_cd, pi_dsc => 'Nationality');
      IF v_r.nty_cd IS NOT NULL THEN
        v_k := pkwf_00_00.fn_get_nty_k(pi_id => v_r.nty_cd);
      END IF;
      --
      v_r.pry_a_ad1      := pkwf_30_gen.fn_set_fld(v_r.pry_a_ad1);
      pkwf_00_vld.pr_reqd (pi_d => v_r.pry_a_ad1, pi_dsc => 'Primary Address Line 1');
      v_r.pry_a_ad2      := pkwf_30_gen.fn_set_fld(v_r.pry_a_ad2);
      v_r.pry_a_cty      := pkwf_30_gen.fn_set_fld(v_r.pry_a_cty);
      pkwf_00_vld.pr_reqd (pi_d => v_r.pry_a_cty, pi_dsc => 'Primary Address City');
      v_r.pry_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r.pry_a_sta_cd);
      v_r.pry_a_zip      := pkwf_30_gen.fn_set_fld(v_r.pry_a_zip);
      v_r.pry_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r.pry_a_ctr_cd);
      pkwf_00_vld.pr_reqd (pi_d => v_r.pry_a_ctr_cd, pi_dsc => 'Primary Address Country');
      IF v_r.pry_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.pry_a_ctr_cd);
      END IF;
      IF v_r.pry_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.pry_a_ctr_cd,
                                          pi_id     => v_r.pry_a_sta_cd);
      END IF;
      --
      v_r.pry_em_ad      := pkwf_30_gen.fn_set_fld(v_r.pry_em_ad);
      pkwf_00_vld.pr_reqd (pi_d => v_r.pry_em_ad, pi_dsc => 'Primary Email Address');
      pkwf_00_vld.pr_valid_eml (pi_d => v_r.pry_em_ad, pi_dsc => 'Primary Email Address');
      v_r.sec_em_ad      := pkwf_30_gen.fn_set_fld(v_r.sec_em_ad);
      IF v_r.sec_em_ad IS NOT NULL THEN
        pkwf_00_vld.pr_valid_eml (pi_d => v_r.sec_em_ad, pi_dsc => 'Secondary Email Address');
      END IF;
      v_r.mbl_phn        := pkwf_30_gen.fn_set_fld(v_r.mbl_phn);
      pkwf_00_vld.pr_reqd (pi_d => v_r.mbl_phn, pi_dsc => 'Mobile Phone No.');
      pkwf_00_vld.pr_valid_phn (pi_d => v_r.mbl_phn, pi_dsc => 'Mobile Phone No.');
      v_r.oth_phn        := pkwf_30_gen.fn_set_fld(v_r.oth_phn);
      IF v_r.oth_phn IS NOT NULL THEN
        pkwf_00_vld.pr_valid_phn (pi_d => v_r.oth_phn, pi_dsc => 'Other Phone No.');
      END IF;
      --
      v_r.c_pic_yn := '0';
      v_r.c_sig_yn := '0';
      v_r.c_ubl_yn := '0';
      v_r.c_idc_yn := '0'; 
      --
      v_r.row_key := pkwf_00_00.fn_rk; 
      v_r.dc_id := pkwf_30_gen.fn_g_doc_id;
      v_r.dc_dtt   := SYSDATE;
      --
      -- Create record in object
      INSERT
        INTO wf_vi_30_cs_new_c_sig
      VALUES v_r;
      --
      v_ret.po_dc_k := v_r.row_key;
      --
      pkwf_30_gen.pr_set_dc_dtl(pi_d_id   => v_r.d_id,
                                pi_dc_id  => v_r.dc_id,
                                pi_dc_dsc => UPPER(TRIM(v_r.ls_nm))||', '||INITCAP(v_r.fi_nm)||' '||INITCAP(v_r.md_nm));
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
  END fn_ins_sig;
  --
  -- Set images as appropriate
  FUNCTION fn_set_sig_img(pi_dc_k IN NUMBER) RETURN pkwf_90_gen.r_ret IS
    v_ret   pkwf_90_gen.r_ret;
  BEGIN
    --
    BEGIN
      --
      FOR c1 IN (SELECT *
                   FROM wf_30_dc_im
                  WHERE dc_k = pi_dc_k)
      LOOP
        IF c1.im_tp_dm = 'PC' THEN
          UPDATE wf_vi_30_cs_new
             SET pic_img = c1.im_blb,
                 c_pic_yn = '1'
           WHERE row_key = pi_dc_k;
        ELSIF c1.im_tp_dm = 'SG' THEN
          UPDATE wf_vi_30_cs_new
             SET sig_img = c1.im_blb,
                 c_sig_yn = '1'
           WHERE row_key = pi_dc_k;
        ELSIF c1.im_tp_dm = 'UB' THEN
          UPDATE wf_vi_30_cs_new
             SET ubl_img = c1.im_blb,
                 c_ubl_yn = '1'
           WHERE row_key = pi_dc_k;
        ELSIF c1.im_tp_dm = 'ID' THEN
          UPDATE wf_vi_30_cs_new
             SET idc_img = c1.im_blb,
                 c_idc_yn = '1'
           WHERE row_key = pi_dc_k;
        ELSE
          v_ret.ret_cd  := 99;
          v_ret.err_dsc := 'Unknown Image Type ['||c1.im_tp_dm||']';
          v_ret.err_sta := 'Unknown Image Type ['||c1.im_tp_dm||']';
        END IF;
        --
      END LOOP;
      --
    EXCEPTION
      WHEN OTHERS THEN
      v_ret.ret_cd  := SQLCODE;
      v_ret.err_dsc := dbms_utility.format_error_stack;
      v_ret.err_sta := dbms_utility.format_error_backtrace;
    END;
    --
logger.log(pi_dc_k||' IMG RETURNED '||v_ret.ret_cd||' '||v_ret.err_dsc);    
    RETURN v_ret;
    --
  END fn_set_sig_img;
  --
  -- General processing routine, new customer registration, 
  -- Verify customer record, if ok
  -- -- Create customer
  -- -- Create cash account
  -- -- Create portfolio
  PROCEDURE pr_cre_rec(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
logger.log('CS NEW TASK - CONFIRM DATA VERIFIED AND CREATE CUSTOMER, ');    
    -- Create customer
    DECLARE
      v_cus  pkwf_90_gen.r_cs_new_c;
      v_ret  pkwf_90_gen.r_ret;
      v_dc_id wf_00_00_dtd.c50%TYPE;
    BEGIN
      --
      SELECT dc_id
        INTO v_dc_id
        FROM wf_20_dc
       WHERE row_key = pi_dc_k;
      --
      SELECT *
        INTO v_cus
        FROM wf_vi_30_cs_new_c
       WHERE dc_id = v_dc_id;
      --
      pkwf_89_cs.pr_prc_ctc_c(pi_rec => v_cus);
      --
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'The source document record not found ['||pi_dc_k||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'The source document record is duplicated');
    END;
    --
    -- Create portfolio/cash account/market account
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log(dbms_utility.format_error_backtrace, 'wfcsnew', dbms_utility.format_error_stack);
      RAISE;
  END pr_cre_rec;
  --
  -- General processing routine, new customer registration
  -- -- Parameter - CSCS number
  -- -- Update / Create market account
  -- -- Register for WEB access
  -- -- Activate account
  PROCEDURE pr_set_act(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL) IS
    --
    v_dc wf_20_dc%ROWTYPE;
    --
  BEGIN
    --
    pkwf_00_vld.pr_reqd(pi_d => pi_p1, pi_dsc => 'Market Account Number (CSCS)');
    pkwf_00_vld.pr_reqd(pi_d => pi_p2, pi_dsc => 'Market CHN Number');
    --
    v_dc := pkwf_20_gen.fn_get_dc(pi_dc_k => pi_dc_k);
    --
    UPDATE wf_vi_30_cs_new
       SET mkt_act_id = pi_p1,
           mkt_chn_no = pi_p2
     WHERE dc_id = v_dc.dc_id; 
    --
  END pr_set_act;
  -- 
  --
  --
END pkwf_30_cs_new_c; 
/
