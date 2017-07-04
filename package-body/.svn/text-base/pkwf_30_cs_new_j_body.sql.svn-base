CREATE OR REPLACE PACKAGE BODY pkwf_30_cs_new_j AS
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
  PROCEDURE pr_split (pi_rec IN wf_vi_30_cs_new_j%ROWTYPE,
                      po_r1  OUT wf_vi_30_cs_new%ROWTYPE,
                      po_r2  OUT wf_vi_30_cs_new%ROWTYPE) IS
  BEGIN
    --
    po_r1.row_key       := pi_rec.row_key ;
    po_r1.d_id          := pi_rec.d_id ;
    po_r1.dc_tp_k       := pi_rec.dc_tp_k ;
    po_r1.dc_id         := pi_rec.dc_id ;
    po_r1.dc_dtt        := pi_rec.dc_dtt ;
    po_r1.dc_st_dm      := pi_rec.dc_st_dm ;
    po_r1.dc_jsn        := pi_rec.dc_jsn ;
    po_r1.tt_dm         := pi_rec.tt_dm ;
    po_r1.ls_nm         := pi_rec.ls_nm ;
    po_r1.md_nm         := pi_rec.md_nm ;
    po_r1.fi_nm         := pi_rec.fi_nm ;
    po_r1.gdr_dm        := pi_rec.gdr_dm ;
    po_r1.dob_dt        := pi_rec.dob_dt ;
    po_r1.mar_st_dm     := pi_rec.mar_st_dm ;
    po_r1.nty_cd        := pi_rec.nty_cd ;
    po_r1.pry_a_ad1     := pi_rec.pry_a_ad1 ;
    po_r1.pry_a_ad2     := pi_rec.pry_a_ad2 ;
    po_r1.pry_a_cty     := pi_rec.pry_a_cty ;
    po_r1.pry_a_sta_cd  := pi_rec.pry_a_sta_cd ;
    po_r1.pry_a_zip     := pi_rec.pry_a_zip ;
    po_r1.pry_a_ctr_cd  := pi_rec.pry_a_ctr_cd ;
    po_r1.pst_a_ad1     := pi_rec.pst_a_ad1 ;
    po_r1.pst_a_ad2     := pi_rec.pst_a_ad2 ;
    po_r1.pst_a_cty     := pi_rec.pst_a_cty ;
    po_r1.pst_a_sta_cd  := pi_rec.pst_a_sta_cd ;
    po_r1.pst_a_zip     := pi_rec.pst_a_zip ;
    po_r1.pst_a_ctr_cd  := pi_rec.pst_a_ctr_cd ;
    po_r1.pry_em_ad     := pi_rec.pry_em_ad ;
    po_r1.sec_em_ad     := pi_rec.sec_em_ad ;
    po_r1.mbl_phn       := pi_rec.mbl_phn ;
    po_r1.oth_phn       := pi_rec.oth_phn ;
    po_r1.mmd_nm        := pi_rec.mmd_nm ;
    po_r1.nok_nm        := pi_rec.nok_nm ;
    po_r1.nok_rln_cd    := pi_rec.nok_rln_cd ;
    po_r1.nok_phn       := pi_rec.nok_phn ;
    po_r1.nok_a_ad1     := pi_rec.nok_a_ad1 ;
    po_r1.nok_a_ad2     := pi_rec.nok_a_ad2 ;
    po_r1.nok_a_cty     := pi_rec.nok_a_cty ;
    po_r1.nok_a_sta_cd  := pi_rec.nok_a_sta_cd ;
    po_r1.nok_a_zip     := pi_rec.nok_a_zip ;
    po_r1.nok_a_ctr_cd  := pi_rec.nok_a_ctr_cd ;
    po_r1.bk_nm         := pi_rec.bk_nm ;
    po_r1.bk_ac_no      := pi_rec.bk_ac_no ;
    po_r1.bk_bv_no      := pi_rec.bk_bv_no ;
    po_r1.bk_ac_nm      := pi_rec.bk_ac_nm ;
    po_r1.bk_br_nm      := pi_rec.bk_br_nm ;
    po_r1.bk_st_cd      := pi_rec.bk_st_cd ;
    po_r1.bk_a_ad1      := pi_rec.bk_a_ad1 ;
    po_r1.bk_a_ad2      := pi_rec.bk_a_ad2 ;
    po_r1.bk_a_cty      := pi_rec.bk_a_cty ;
    po_r1.bk_a_sta_cd   := pi_rec.bk_a_sta_cd ;
    po_r1.bk_a_zip      := pi_rec.bk_a_zip ;
    po_r1.bk_a_ctr_cd   := pi_rec.bk_a_ctr_cd ;
    po_r1.ocp_nm        := pi_rec.ocp_nm ;
    po_r1.emp_nm        := pi_rec.emp_nm ;
    po_r1.emp_a_ad1     := pi_rec.emp_a_ad1 ;
    po_r1.emp_a_ad2     := pi_rec.emp_a_ad2 ;
    po_r1.emp_a_cty     := pi_rec.emp_a_cty ;
    po_r1.emp_a_sta_cd  := pi_rec.emp_a_sta_cd ;
    po_r1.emp_a_zip     := pi_rec.emp_a_zip ;
    po_r1.emp_a_ctr_cd  := pi_rec.emp_a_ctr_cd ;
    po_r1.emp_phn       := pi_rec.emp_phn ;
    po_r1.ann_inc_amt   := pi_rec.ann_inc_amt ;
    po_r1.c_pic_yn      := pi_rec.c_pic_yn ;
    po_r1.pic_img       := pi_rec.pic_img ;
    po_r1.c_sig_yn      := pi_rec.c_sig_yn ;
    po_r1.sig_img       := pi_rec.sig_img ;
    po_r1.c_ubl_yn      := pi_rec.c_ubl_yn ;
    po_r1.ubl_img       := pi_rec.ubl_img ;
    po_r1.c_idc_yn      := pi_rec.c_idc_yn ;
    po_r1.idc_img       := pi_rec.idc_img ;
    po_r1.mkt_act_id    := pi_rec.mkt_act_id ;
    po_r1.mkt_chn_no    := pi_rec.mkt_chn_no;
    po_r1.pdt_id        := pi_rec.pdt_id;
    po_r1.pdt_dsc       := pi_rec.pdt_dsc;
    --
    po_r2.row_key       := pi_rec.row_key ;
    po_r2.d_id          := pi_rec.d_id ;
    po_r2.dc_tp_k       := pi_rec.dc_tp_k ;
    po_r2.dc_id         := pi_rec.dc_id ;
    po_r2.dc_dtt        := pi_rec.dc_dtt ;
    po_r2.dc_st_dm      := pi_rec.dc_st_dm ;
    po_r2.dc_jsn        := pi_rec.dc_jsn ;
    po_r2.tt_dm         := pi_rec.j_tt_dm ;
    po_r2.ls_nm         := pi_rec.j_ls_nm ;
    po_r2.md_nm         := pi_rec.j_md_nm ;
    po_r2.fi_nm         := pi_rec.j_fi_nm ;
    po_r2.gdr_dm        := pi_rec.j_gdr_dm ;
    po_r2.dob_dt        := pi_rec.j_dob_dt ;
    po_r2.mar_st_dm     := pi_rec.j_mar_st_dm ;
    po_r2.nty_cd        := pi_rec.j_nty_cd ;
    po_r2.pry_a_ad1     := pi_rec.j_pry_a_ad1 ;
    po_r2.pry_a_ad2     := pi_rec.j_pry_a_ad2 ;
    po_r2.pry_a_cty     := pi_rec.j_pry_a_cty ;
    po_r2.pry_a_sta_cd  := pi_rec.j_pry_a_sta_cd ;
    po_r2.pry_a_zip     := pi_rec.j_pry_a_zip ;
    po_r2.pry_a_ctr_cd  := pi_rec.j_pry_a_ctr_cd ;
    po_r2.pst_a_ad1     := pi_rec.j_pst_a_ad1 ;
    po_r2.pst_a_ad2     := pi_rec.j_pst_a_ad2 ;
    po_r2.pst_a_cty     := pi_rec.j_pst_a_cty ;
    po_r2.pst_a_sta_cd  := pi_rec.j_pst_a_sta_cd ;
    po_r2.pst_a_zip     := pi_rec.j_pst_a_zip ;
    po_r2.pst_a_ctr_cd  := pi_rec.j_pst_a_ctr_cd ;
    po_r2.pry_em_ad     := pi_rec.j_pry_em_ad ;
    po_r2.sec_em_ad     := pi_rec.j_sec_em_ad ;
    po_r2.mbl_phn       := pi_rec.j_mbl_phn ;
    po_r2.oth_phn       := pi_rec.j_oth_phn ;
    po_r2.mmd_nm        := pi_rec.j_mmd_nm ;
    po_r2.nok_nm        := pi_rec.j_nok_nm ;
    po_r2.nok_rln_cd    := pi_rec.j_nok_rln_cd ;
    po_r2.nok_phn       := pi_rec.j_nok_phn ;
    po_r2.nok_a_ad1     := pi_rec.j_nok_a_ad1 ;
    po_r2.nok_a_ad2     := pi_rec.j_nok_a_ad2 ;
    po_r2.nok_a_cty     := pi_rec.j_nok_a_cty ;
    po_r2.nok_a_sta_cd  := pi_rec.j_nok_a_sta_cd ;
    po_r2.nok_a_zip     := pi_rec.j_nok_a_zip ;
    po_r2.nok_a_ctr_cd  := pi_rec.j_nok_a_ctr_cd ;
    po_r2.bk_nm         := pi_rec.j_bk_nm ;
    po_r2.bk_ac_no      := pi_rec.j_bk_ac_no ;
    po_r2.bk_bv_no      := pi_rec.j_bk_bv_no ;
    po_r2.bk_ac_nm      := pi_rec.j_bk_ac_nm ;
    po_r2.bk_br_nm      := pi_rec.j_bk_br_nm ;
    po_r2.bk_st_cd      := pi_rec.j_bk_st_cd ;
    po_r2.bk_a_ad1      := pi_rec.j_bk_a_ad1 ;
    po_r2.bk_a_ad2      := pi_rec.j_bk_a_ad2 ;
    po_r2.bk_a_cty      := pi_rec.j_bk_a_cty ;
    po_r2.bk_a_sta_cd   := pi_rec.j_bk_a_sta_cd ;
    po_r2.bk_a_zip      := pi_rec.j_bk_a_zip ;
    po_r2.bk_a_ctr_cd   := pi_rec.j_bk_a_ctr_cd ;
    po_r2.ocp_nm        := pi_rec.j_ocp_nm ;
    po_r2.emp_nm        := pi_rec.j_emp_nm ;
    po_r2.emp_a_ad1     := pi_rec.j_emp_a_ad1 ;
    po_r2.emp_a_ad2     := pi_rec.j_emp_a_ad2 ;
    po_r2.emp_a_cty     := pi_rec.j_emp_a_cty ;
    po_r2.emp_a_sta_cd  := pi_rec.j_emp_a_sta_cd ;
    po_r2.emp_a_zip     := pi_rec.j_emp_a_zip ;
    po_r2.emp_a_ctr_cd  := pi_rec.j_emp_a_ctr_cd ;
    po_r2.emp_phn       := pi_rec.j_emp_phn ;
    po_r2.ann_inc_amt   := pi_rec.j_ann_inc_amt ;
    po_r2.c_pic_yn      := pi_rec.j_c_pic_yn ;
    po_r2.pic_img       := pi_rec.j_pic_img ;
    po_r2.c_sig_yn      := pi_rec.j_c_sig_yn ;
    po_r2.sig_img       := pi_rec.j_sig_img ;
    po_r2.c_ubl_yn      := pi_rec.j_c_ubl_yn ;
    po_r2.ubl_img       := pi_rec.j_ubl_img ;
    po_r2.c_idc_yn      := pi_rec.j_c_idc_yn ;
    po_r2.idc_img       := pi_rec.j_idc_img ;
    po_r2.mkt_act_id    := pi_rec.mkt_act_id ;
    po_r2.mkt_chn_no    := pi_rec.mkt_chn_no;
    --
  END pr_split;
  --
  /* Public Routines */
  --
  -- Insert/Validation of document
  FUNCTION fn_ins(pi_rec IN wf_vi_30_cs_new_j%ROWTYPE) RETURN pkwf_90_gen.r_ret IS
    v_p     wf_vi_30_cs_new_j%ROWTYPE := pi_rec;
    v_r1    wf_vi_30_cs_new%ROWTYPE;
    v_r2    wf_vi_30_cs_new%ROWTYPE;
    v_k     wf_00_00_dtd.n38%TYPE;
    v_ret   pkwf_90_gen.r_ret;
  BEGIN
    --
    v_ret.ret_cd := 0;
    --
    BEGIN
      --
      pr_split(pi_rec, v_r1, v_r2);
      --
      v_r1.d_id := 'WFVI30CSNEWJ';
      --pkwf_00_vld.pr_reqd (pi_d => v_r.dc_tp_k, pi_dsc => 'Document Type');
      v_r1.dc_tp_k := 0;
      v_r1.dc_st_dm := '0';
      v_r1.dc_jsn   := NULL;
      v_r1.dc_lnk_yn := '1';
      v_r1.dc_lnk_k := NULL;
      --
      v_r1.tt_dm    := pkwf_30_gen.fn_set_fld(v_r1.tt_dm);
      IF v_r1.tt_dm IS NOT NULL THEN
        v_k := pkwf_00_00.fn_get_ttl_k(pi_id => v_r1.tt_dm);
      END IF;
      v_r1.ls_nm    := pkwf_30_gen.fn_set_fld(v_r1.ls_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.ls_nm, pi_dsc => 'Last Name');
      v_r1.md_nm    := pkwf_30_gen.fn_set_fld(v_r1.md_nm);
      v_r1.fi_nm    := pkwf_30_gen.fn_set_fld(v_r1.fi_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.fi_nm, pi_dsc => 'First Name');
      v_r1.gdr_dm   := pkwf_30_gen.fn_set_fld(v_r1.gdr_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.gdr_dm, pi_dsc => 'Gender');
      pkwf_00_00_dmv.pr_val_cs_gdr(pi_dm => v_r1.gdr_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.dob_dt, pi_dsc => 'Date of Birth');
      pkwf_00_vld.pr_not_aft_sys_dt(pi_d => v_r1.dob_dt, pi_dsc => 'Date of Birth');
      v_r1.mar_st_dm   := pkwf_30_gen.fn_set_fld(v_r1.mar_st_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.mar_st_dm, pi_dsc => 'Marital Status');
      pkwf_00_00_dmv.pr_val_cs_mar(pi_dm => v_r1.mar_st_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.nty_cd, pi_dsc => 'Nationality');
      IF v_r1.nty_cd IS NOT NULL THEN
        v_k := pkwf_00_00.fn_get_nty_k(pi_id => v_r1.nty_cd);
      END IF;
      --
      v_r1.pry_a_ad1      := pkwf_30_gen.fn_set_fld(v_r1.pry_a_ad1);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.pry_a_ad1, pi_dsc => 'Primary Address Line 1');
      v_r1.pry_a_ad2      := pkwf_30_gen.fn_set_fld(v_r1.pry_a_ad2);
      v_r1.pry_a_cty      := pkwf_30_gen.fn_set_fld(v_r1.pry_a_cty);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.pry_a_cty, pi_dsc => 'Primary Address City');
      v_r1.pry_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r1.pry_a_sta_cd);
      v_r1.pry_a_zip      := pkwf_30_gen.fn_set_fld(v_r1.pry_a_zip);
      v_r1.pry_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r1.pry_a_ctr_cd);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.pry_a_ctr_cd, pi_dsc => 'Primary Address Country');
      IF v_r1.pry_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r1.pry_a_ctr_cd);
      END IF;
      IF v_r1.pry_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r1.pry_a_ctr_cd,
                                          pi_id     => v_r1.pry_a_sta_cd);
      END IF;
      --
      v_r1.pst_a_ad1      := pkwf_30_gen.fn_set_fld(v_r1.pst_a_ad1);
      v_r1.pst_a_ad2      := pkwf_30_gen.fn_set_fld(v_r1.pst_a_ad2);
      v_r1.pst_a_cty      := pkwf_30_gen.fn_set_fld(v_r1.pst_a_cty);
      v_r1.pst_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r1.pst_a_sta_cd);
      v_r1.pst_a_zip      := pkwf_30_gen.fn_set_fld(v_r1.pst_a_zip);
      v_r1.pst_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r1.pst_a_ctr_cd);
      IF v_r1.pst_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r1.pst_a_ctr_cd);
      END IF;
      IF v_r1.pst_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r1.pst_a_ctr_cd,
                                          pi_id     => v_r1.pst_a_sta_cd);
      END IF;
      --
      v_r1.pry_em_ad      := pkwf_30_gen.fn_set_fld(v_r1.pry_em_ad);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.pry_em_ad, pi_dsc => 'Primary Email Address');
      pkwf_00_vld.pr_valid_eml (pi_d => v_r1.pry_em_ad, pi_dsc => 'Primary Email Address');
      v_r1.sec_em_ad      := pkwf_30_gen.fn_set_fld(v_r1.sec_em_ad);
      IF v_r1.sec_em_ad IS NOT NULL THEN
        pkwf_00_vld.pr_valid_eml (pi_d => v_r1.sec_em_ad, pi_dsc => 'Secondary Email Address');
      END IF;
      v_r1.mbl_phn        := pkwf_30_gen.fn_set_fld(v_r1.mbl_phn);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.mbl_phn, pi_dsc => 'Mobile Phone No.');
      pkwf_00_vld.pr_valid_phn (pi_d => v_r1.mbl_phn, pi_dsc => 'Mobile Phone No.');
      v_r1.oth_phn        := pkwf_30_gen.fn_set_fld(v_r1.oth_phn);
      IF v_r1.oth_phn IS NOT NULL THEN
        pkwf_00_vld.pr_valid_phn (pi_d => v_r1.oth_phn, pi_dsc => 'Other Phone No.');
      END IF;
      v_r1.mmd_nm         := pkwf_30_gen.fn_set_fld(v_r1.mmd_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.mmd_nm, pi_dsc => 'Mothers Maiden Name');
      --
      /*
      pkwf_00_vld.pr_reqd (pi_d => v_r1.nok_nm, pi_dsc => 'Next of Kin Name');
      IF v_r1.nok_rln_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_rln_k(pi_id => v_r1.nok_rln_cd);
      END IF;
     
      pkwf_00_vld.pr_reqd (pi_d => v_r1.nok_phn, pi_dsc => 'Next of Kin Phone No');
      IF v_r1.nok_phn IS NOT NULL THEN
        pkwf_00_vld.pr_valid_phn (pi_d => v_r1.nok_phn, pi_dsc => 'Next of Kin Phone No.');
      END IF;
      
      pkwf_00_vld.pr_reqd (pi_d => v_r1.nok_a_ad1, pi_dsc => 'Next of Kin Address Line 1');
      v_r1.nok_a_ad2      := pkwf_30_gen.fn_set_fld(v_r1.nok_a_ad2);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.nok_a_cty, pi_dsc => 'Next of Kin Address City');
      v_r1.nok_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r1.nok_a_sta_cd);
      v_r1.nok_a_zip      := pkwf_30_gen.fn_set_fld(v_r1.nok_a_zip);
      pkwf_00_vld.pr_reqd (pi_d => v_r1.nok_a_ctr_cd, pi_dsc => 'Next of Kin Address Country');
      IF v_r1.nok_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r1.nok_a_ctr_cd);
      END IF;
      IF v_r1.nok_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r1.nok_a_ctr_cd,
                                          pi_id     => v_r1.nok_a_sta_cd);
      END IF;
      */--
      pkwf_00_vld.pr_reqd (pi_d => v_r1.bk_nm, pi_dsc => 'Bank Name');
      pkwf_00_vld.pr_reqd (pi_d => v_r1.bk_ac_no, pi_dsc => 'Bank Account No.');
      pkwf_00_vld.pr_reqd (pi_d => v_r1.bk_bv_no, pi_dsc => 'BVN No.');
      v_r1.bk_ac_nm      := pkwf_30_gen.fn_set_fld(v_r1.bk_ac_nm);
      v_r1.bk_br_nm      := pkwf_30_gen.fn_set_fld(v_r1.bk_br_nm);
      v_r1.bk_st_cd      := pkwf_30_gen.fn_set_fld(v_r1.bk_st_cd);
      v_r1.bk_a_ad1      := pkwf_30_gen.fn_set_fld(v_r1.bk_a_ad1);
      v_r1.bk_a_ad2      := pkwf_30_gen.fn_set_fld(v_r1.bk_a_ad2);
      v_r1.bk_a_cty      := pkwf_30_gen.fn_set_fld(v_r1.bk_a_cty);
      v_r1.bk_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r1.bk_a_sta_cd);
      v_r1.bk_a_zip      := pkwf_30_gen.fn_set_fld(v_r1.bk_a_zip);
      v_r1.bk_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r1.bk_a_ctr_cd);
      IF v_r1.bk_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r1.bk_a_ctr_cd);
      END IF;
      IF v_r1.bk_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r1.bk_a_ctr_cd,
                                          pi_id     => v_r1.bk_a_sta_cd);
      END IF;
      --
      v_r1.ocp_nm        := pkwf_30_gen.fn_set_fld(v_r1.ocp_nm);
      v_r1.emp_nm        := pkwf_30_gen.fn_set_fld(v_r1.emp_nm);
      v_r1.emp_a_ad1      := pkwf_30_gen.fn_set_fld(v_r1.emp_a_ad1);
      v_r1.emp_a_ad2      := pkwf_30_gen.fn_set_fld(v_r1.emp_a_ad2);
      v_r1.emp_a_cty      := pkwf_30_gen.fn_set_fld(v_r1.emp_a_cty);
      v_r1.emp_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r1.emp_a_sta_cd);
      v_r1.emp_a_zip      := pkwf_30_gen.fn_set_fld(v_r1.emp_a_zip);
      v_r1.emp_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r1.emp_a_ctr_cd);
      IF v_r1.emp_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r1.emp_a_ctr_cd);
      END IF;
      IF v_r1.emp_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r1.emp_a_ctr_cd,
                                          pi_id     => v_r1.emp_a_sta_cd);
      END IF;
      v_r1.emp_phn       := pkwf_30_gen.fn_set_fld(v_r1.emp_phn);
      IF v_r1.emp_phn IS NOT NULL THEN
        pkwf_00_vld.pr_valid_phn (pi_d => v_r1.emp_phn, pi_dsc => 'Employer Phone No.');
      END IF;
      IF v_r1.ann_inc_amt IS NOT NULL THEN
        pkwf_00_vld.pr_not_below_zero (pi_d => v_r1.ann_inc_amt, pi_dsc => 'Annual Income Amount');
      END IF;
      --    
      v_r1.c_pic_yn := '0';
      v_r1.c_sig_yn := '0';
      v_r1.c_ubl_yn := '0';
      v_r1.c_idc_yn := '0';
      --
      v_r1.row_key := pkwf_00_00.fn_rk; 
      v_r1.dc_id := pkwf_30_gen.fn_g_doc_id;
      v_r1.dc_dtt   := SYSDATE;
      --
      -- Create record in object
      INSERT
        INTO wf_vi_30_cs_new
      VALUES v_r1;
      --
      v_ret.po_dc_k := v_r1.row_key;
      --
      --
      v_r2.d_id := 'WFVI30CSNEWJ';
      --pkwf_00_vld.pr_reqd (pi_d => v_r.dc_tp_k, pi_dsc => 'Document Type');
      v_r2.dc_tp_k := 0;
      v_r2.dc_st_dm := '0';
      v_r2.dc_jsn   := NULL;
      v_r1.dc_lnk_yn := '0';
      v_r1.dc_lnk_k := v_r1.row_key;
      --
      v_r2.tt_dm    := pkwf_30_gen.fn_set_fld(v_r2.tt_dm);
      IF v_r2.tt_dm IS NOT NULL THEN
        v_k := pkwf_00_00.fn_get_ttl_k(pi_id => v_r2.tt_dm);
      END IF;
      v_r2.ls_nm    := pkwf_30_gen.fn_set_fld(v_r2.ls_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.ls_nm, pi_dsc => 'Last Name');
      v_r2.md_nm    := pkwf_30_gen.fn_set_fld(v_r2.md_nm);
      v_r2.fi_nm    := pkwf_30_gen.fn_set_fld(v_r2.fi_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.fi_nm, pi_dsc => 'First Name');
      v_r2.gdr_dm   := pkwf_30_gen.fn_set_fld(v_r2.gdr_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.gdr_dm, pi_dsc => 'Gender');
      pkwf_00_00_dmv.pr_val_cs_gdr(pi_dm => v_r2.gdr_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.dob_dt, pi_dsc => 'Date of Birth');
      pkwf_00_vld.pr_not_aft_sys_dt(pi_d => v_r2.dob_dt, pi_dsc => 'Date of Birth');
      v_r2.mar_st_dm   := pkwf_30_gen.fn_set_fld(v_r2.mar_st_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.mar_st_dm, pi_dsc => 'Marital Status');
      pkwf_00_00_dmv.pr_val_cs_mar(pi_dm => v_r2.mar_st_dm);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.nty_cd, pi_dsc => 'Nationality');
      IF v_r2.nty_cd IS NOT NULL THEN
        v_k := pkwf_00_00.fn_get_nty_k(pi_id => v_r2.nty_cd);
      END IF;
      --
      v_r2.pry_a_ad1      := pkwf_30_gen.fn_set_fld(v_r2.pry_a_ad1);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.pry_a_ad1, pi_dsc => 'Primary Address Line 1');
      v_r2.pry_a_ad2      := pkwf_30_gen.fn_set_fld(v_r2.pry_a_ad2);
      v_r2.pry_a_cty      := pkwf_30_gen.fn_set_fld(v_r2.pry_a_cty);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.pry_a_cty, pi_dsc => 'Primary Address City');
      v_r2.pry_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r2.pry_a_sta_cd);
      v_r2.pry_a_zip      := pkwf_30_gen.fn_set_fld(v_r2.pry_a_zip);
      v_r2.pry_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r2.pry_a_ctr_cd);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.pry_a_ctr_cd, pi_dsc => 'Primary Address Country');
      IF v_r2.pry_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r2.pry_a_ctr_cd);
      END IF;
      IF v_r2.pry_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r2.pry_a_ctr_cd,
                                          pi_id     => v_r2.pry_a_sta_cd);
      END IF;
      --
      v_r2.pst_a_ad1      := pkwf_30_gen.fn_set_fld(v_r2.pst_a_ad1);
      v_r2.pst_a_ad2      := pkwf_30_gen.fn_set_fld(v_r2.pst_a_ad2);
      v_r2.pst_a_cty      := pkwf_30_gen.fn_set_fld(v_r2.pst_a_cty);
      v_r2.pst_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r2.pst_a_sta_cd);
      v_r2.pst_a_zip      := pkwf_30_gen.fn_set_fld(v_r2.pst_a_zip);
      v_r2.pst_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r2.pst_a_ctr_cd);
      IF v_r2.pst_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r2.pst_a_ctr_cd);
      END IF;
      IF v_r2.pst_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r2.pst_a_ctr_cd,
                                          pi_id     => v_r2.pst_a_sta_cd);
      END IF;
      --
      v_r2.pry_em_ad      := pkwf_30_gen.fn_set_fld(v_r2.pry_em_ad);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.pry_em_ad, pi_dsc => 'Primary Email Address');
      pkwf_00_vld.pr_valid_eml (pi_d => v_r2.pry_em_ad, pi_dsc => 'Primary Email Address');
      v_r2.sec_em_ad      := pkwf_30_gen.fn_set_fld(v_r2.sec_em_ad);
      IF v_r2.sec_em_ad IS NOT NULL THEN
        pkwf_00_vld.pr_valid_eml (pi_d => v_r2.sec_em_ad, pi_dsc => 'Secondary Email Address');
      END IF;
      v_r2.mbl_phn        := pkwf_30_gen.fn_set_fld(v_r2.mbl_phn);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.mbl_phn, pi_dsc => 'Mobile Phone No.');
      pkwf_00_vld.pr_valid_phn (pi_d => v_r2.mbl_phn, pi_dsc => 'Mobile Phone No.');
      v_r2.oth_phn        := pkwf_30_gen.fn_set_fld(v_r2.oth_phn);
      IF v_r2.oth_phn IS NOT NULL THEN
        pkwf_00_vld.pr_valid_phn (pi_d => v_r2.oth_phn, pi_dsc => 'Other Phone No.');
      END IF;
      v_r2.mmd_nm         := pkwf_30_gen.fn_set_fld(v_r2.mmd_nm);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.mmd_nm, pi_dsc => 'Mothers Maiden Name');
      --
      /*pkwf_00_vld.pr_reqd (pi_d => v_r2.nok_nm, pi_dsc => 'Next of Kin Name');
      IF v_r2.nok_rln_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_rln_k(pi_id => v_r2.nok_rln_cd);
      END IF;
      
      pkwf_00_vld.pr_reqd (pi_d => v_r2.nok_phn, pi_dsc => 'Next of Kin Phone No');
      IF v_r2.nok_phn IS NOT NULL THEN
        pkwf_00_vld.pr_valid_phn (pi_d => v_r2.nok_phn, pi_dsc => 'Next of Kin Phone No.');
      END IF;
      
      pkwf_00_vld.pr_reqd (pi_d => v_r2.nok_a_ad1, pi_dsc => 'Next of Kin Address Line 1');
      v_r2.nok_a_ad2      := pkwf_30_gen.fn_set_fld(v_r2.nok_a_ad2);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.nok_a_cty, pi_dsc => 'Next of Kin Address City');
      v_r2.nok_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r2.nok_a_sta_cd);
      v_r2.nok_a_zip      := pkwf_30_gen.fn_set_fld(v_r2.nok_a_zip);
      pkwf_00_vld.pr_reqd (pi_d => v_r2.nok_a_ctr_cd, pi_dsc => 'Next of Kin Address Country');
      IF v_r2.nok_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r2.nok_a_ctr_cd);
      END IF;
      IF v_r2.nok_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r2.nok_a_ctr_cd,
                                          pi_id     => v_r2.nok_a_sta_cd);
      END IF;*/
      --
      -- Aderemi Alabi 15-SEP-2016
      -- Bank details should only be mandatory for second applicant
     -- pkwf_00_vld.pr_reqd (pi_d => v_r2.bk_nm, pi_dsc => 'Bank Name');
     -- pkwf_00_vld.pr_reqd (pi_d => v_r2.bk_ac_no, pi_dsc => 'Bank Account No.');
     -- pkwf_00_vld.pr_reqd (pi_d => v_r2.bk_bv_no, pi_dsc => 'BVN No.');
      v_r2.bk_ac_nm      := pkwf_30_gen.fn_set_fld(v_r2.bk_ac_nm);
      v_r2.bk_br_nm      := pkwf_30_gen.fn_set_fld(v_r2.bk_br_nm);
      v_r2.bk_st_cd      := pkwf_30_gen.fn_set_fld(v_r2.bk_st_cd);
      v_r2.bk_a_ad1      := pkwf_30_gen.fn_set_fld(v_r2.bk_a_ad1);
      v_r2.bk_a_ad2      := pkwf_30_gen.fn_set_fld(v_r2.bk_a_ad2);
      v_r2.bk_a_cty      := pkwf_30_gen.fn_set_fld(v_r2.bk_a_cty);
      v_r2.bk_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r2.bk_a_sta_cd);
      v_r2.bk_a_zip      := pkwf_30_gen.fn_set_fld(v_r2.bk_a_zip);
      v_r2.bk_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r2.bk_a_ctr_cd);
      IF v_r2.bk_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r2.bk_a_ctr_cd);
      END IF;
      IF v_r2.bk_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r2.bk_a_ctr_cd,
                                          pi_id     => v_r2.bk_a_sta_cd);
      END IF;
      --
      v_r2.ocp_nm        := pkwf_30_gen.fn_set_fld(v_r2.ocp_nm);
      v_r2.emp_nm        := pkwf_30_gen.fn_set_fld(v_r2.emp_nm);
      v_r2.emp_a_ad1      := pkwf_30_gen.fn_set_fld(v_r2.emp_a_ad1);
      v_r2.emp_a_ad2      := pkwf_30_gen.fn_set_fld(v_r2.emp_a_ad2);
      v_r2.emp_a_cty      := pkwf_30_gen.fn_set_fld(v_r2.emp_a_cty);
      v_r2.emp_a_sta_cd   := pkwf_30_gen.fn_set_fld(v_r2.emp_a_sta_cd);
      v_r2.emp_a_zip      := pkwf_30_gen.fn_set_fld(v_r2.emp_a_zip);
      v_r2.emp_a_ctr_cd   := pkwf_30_gen.fn_set_fld(v_r2.emp_a_ctr_cd);
      IF v_r2.emp_a_ctr_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r2.emp_a_ctr_cd);
      END IF;
      IF v_r2.emp_a_sta_cd IS NOT NULL THEN
        v_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r2.emp_a_ctr_cd,
                                          pi_id     => v_r2.emp_a_sta_cd);
      END IF;
      v_r2.emp_phn       := pkwf_30_gen.fn_set_fld(v_r2.emp_phn);
      IF v_r2.emp_phn IS NOT NULL THEN
        pkwf_00_vld.pr_valid_phn (pi_d => v_r2.emp_phn, pi_dsc => 'Employer Phone No.');
      END IF;
      IF v_r2.ann_inc_amt IS NOT NULL THEN
        pkwf_00_vld.pr_not_below_zero (pi_d => v_r2.ann_inc_amt, pi_dsc => 'Annual Income Amount');
      END IF;
      --    
      v_r2.c_pic_yn := '0';
      v_r2.c_sig_yn := '0';
      v_r2.c_ubl_yn := '0';
      v_r2.c_idc_yn := '0'; 
      --
      v_r2.row_key := pkwf_00_00.fn_rk; 
      v_r2.dc_id := v_r1.dc_id||'-2'; --pkwf_30_gen.fn_g_doc_id;
      v_r2.dc_dtt   := SYSDATE;
      --
      -- Create record in object
      INSERT
        INTO wf_vi_30_cs_new
      VALUES v_r2;
      --
      v_ret.po_dc_k := v_r1.row_key;
      --
      pkwf_30_gen.pr_set_dc_dtl(pi_d_id   => v_r1.d_id,
                                pi_dc_id  => v_r1.dc_id,
                                pi_dc_dsc => UPPER(TRIM(v_r1.ls_nm))||', '||INITCAP(v_r1.fi_nm)||' '||INITCAP(v_r1.md_nm));
      --     
    EXCEPTION
      WHEN OTHERS THEN
      v_ret.ret_cd  := SQLCODE;
      --v_ret.rt_id  := 'ON20';
      v_ret.err_dsc := dbms_utility.format_error_stack;
      v_ret.err_sta := dbms_utility.format_error_backtrace;
    END;
    --
logger.log(v_r1.d_id||' RETURNED '||v_ret.ret_cd||' '||v_ret.err_dsc, 'ins', v_ret.err_sta);    
    RETURN v_ret;
    --
  END fn_ins;
  --
  --
  FUNCTION fn_get_j_dc_k(pi_dc_k IN NUMBER) RETURN NUMBER IS
    v_k wf_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT row_key
        INTO v_k
        FROM wf_vi_30_cs_new
       WHERE dc_lnk_k = pi_dc_k;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_k := -1;
      WHEN TOO_MANY_ROWS THEN
        v_k := -2;
    END;
    --
    RETURN v_k;
    --
  END fn_get_j_dc_k;
  --
  -- Set images as appropriate
  FUNCTION fn_set_img(pi_dc_k IN NUMBER) RETURN pkwf_90_gen.r_ret IS
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
  END fn_set_img;
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
      v_cus_j pkwf_90_gen.r_cs_new_j;
      v_ret   pkwf_90_gen.r_ret;
      v_dc_id wf_00_00_dtd.c50%TYPE;
    BEGIN
      --
      SELECT dc_id
        INTO v_dc_id
        FROM wf_20_dc
       WHERE row_key = pi_dc_k;
      --
      SELECT *
        INTO v_cus_j
        FROM wf_vi_30_cs_new_j
       WHERE dc_id = v_dc_id;
      
      pkwf_89_cs.pr_prc_ctc_j(pi_rec => v_cus_j);
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
END pkwf_30_cs_new_j; 
/
