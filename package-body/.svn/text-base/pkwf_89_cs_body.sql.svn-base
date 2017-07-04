CREATE OR REPLACE PACKAGE BODY pkwf_89_cs AS
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
  --
  /* Public Routines */
  -- corporate account
  PROCEDURE pr_prc_ctc_c (pi_rec IN OUT pkwf_90_gen.r_cs_new_c) IS
    --
    v_r     pkwf_90_gen.r_cs_new_c := pi_rec;
    v_ctc   pkcs_90_wf.r_00_ctc@WF_SY;
    v_ptf   pkst_90_wf.r_00_ptf@WF_SY;
  BEGIN
    --
    v_ctc.r_ps             := 'WF';
    v_ctc.ind_yn           := '0';
    v_ctc.reg_id           := v_r.reg_nbr;
    v_ctc.reg_dt           := v_r.reg_dt;
    v_ctc.tax_idn_nbr      :=  v_r.tax_id;
    v_ctc.org_nme          := v_r.org_nm;
    -- Address Details
    v_ctc.pry_adr_l1       := v_r.org_ad1;
    v_ctc.pry_adr_l2       := v_r.org_ad2;
    v_ctc.pry_adr_cty      := v_r.org_cty;
    v_ctc.pry_adr_zip      := v_r.org_zip;
    v_ctc.pry_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.org_ctr_cd,
                                                      pi_id     => v_r.org_sta_cd);
    v_ctc.pry_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.org_ctr_cd);
    -- Bank Details
    v_ctc.pry_bnk_nme      := v_r.bk_nm;
    v_ctc.pry_bnk_srt_cd   := v_r.bk_st_cd;
    v_ctc.pry_bnk_acct_nbr := v_r.bk_ac_no;
    --
    DECLARE
      v_ctc_k wf_00_00_dtd.n38%TYPE;
      v_cus_k wf_00_00_dtd.n38%TYPE;
      v_k     wf_00_00_dtd.n38%TYPE;      
    BEGIN
      -- create customer record
      pkcs_90_wf.pr_prc_ctc_c@WF_SY(pi_rec => v_ctc,
                                  po_ctc_k => v_ctc_k,
                                  po_cus_k => v_cus_k);
      -- remote access      
      pkcs_90_wf.pr_prc_web@WF_SY(pi_cus_k => v_cus_k); -- Web mapping
      -- 
      -- create portfolio
      IF pkwf_00_pmr.fn_st AND pi_rec.mdl_id = 'ST' THEN
        v_ptf.mkt_id     := 'NSE1';
        v_ptf.ptf_tp_id  := '10';    -- NEED A PARAMETER FOR THIS, PORTFOLIO TYPE
        v_ptf.cus_id     := v_ctc.cus_id;
        v_ptf.cus_nme    := v_ctc.org_nme;
        v_ptf.prd_id     := 'P10';   -- NEED A PARAMETER FOR THIS, PRODUCT
        v_ptf.mkt_act_id := v_r.mkt_act_id;
        v_ptf.mkt_chn_no := v_r.mkt_chn_no;
        --     
        pkst_90_wf.pr_cre_ptf@WF_SY(pi_rec => v_ptf);
        --
      END IF;  
    END;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log('ERROR SENDING NEW CUS - '||dbms_utility.format_error_backtrace);
      ROLLBACK;
      RAISE;
  END pr_prc_ctc_c;  
  --
  
  PROCEDURE pr_prc_ctc (pi_rec IN OUT pkwf_90_gen.r_cs_new) IS
    --
    v_r     pkwf_90_gen.r_cs_new := pi_rec;
    v_ctc   pkcs_90_wf.r_00_ctc@WF_SY;
    v_ptf   pkst_90_wf.r_00_ptf@WF_SY;
    v_ctc_k wf_00_00_dtd.n38%TYPE;
    v_cus_k wf_00_00_dtd.n38%TYPE;
    v_b     BLOB := EMPTY_BLOB();
  BEGIN
    --
    v_ctc.r_ps             := 'WF';
    v_ctc.ind_yn           := '1';
    v_ctc.nty_cd_k         := pkwf_00_00.fn_get_nty_k(pi_id => v_r.nty_cd);
    v_ctc.ttl_cd_k         := pkwf_00_00.fn_get_ttl_k(pi_id => v_r.tt_dm);
    v_ctc.lst_nme          := v_r.ls_nm;
    v_ctc.fir_nme          := v_r.fi_nm;
    v_ctc.mle_nme          := v_r.md_nm;
    v_ctc.org_nme          := UPPER(v_r.ls_nm)||' '||INITCAP(v_r.fi_nm)||' '||INITCAP(v_r.md_nm);
    v_ctc.dt_of_bth        := v_r.dob_dt;
    v_ctc.mrl_sta_dm       := v_r.mar_st_dm;
    v_ctc.gdr_dm           := v_r.gdr_dm;
    v_ctc.mtr_mdn_nme      := v_r.mmd_nm;
    -- Employee Details
    v_ctc.jb_ttl_dsc       := v_r.ocp_nm;
    v_ctc.empr_nme         := v_r.emp_nm;
    v_ctc.empr_adr_l1      := v_r.emp_a_ad1;
    v_ctc.empr_adr_l2      := v_r.emp_a_ad2;   
    v_ctc.empr_adr_cty     := v_r.emp_a_cty;
    IF v_r.pst_a_ctr_cd IS NOT NULL THEN
      v_ctc.empr_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.emp_a_ctr_cd);
    END IF;
    IF v_r.pst_a_sta_cd IS NOT NULL THEN
      v_ctc.empr_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.emp_a_ctr_cd,
                                                         pi_id     => v_r.emp_a_sta_cd);
    END IF;
    --
    v_ctc.bus_phn          := v_r.emp_phn;
    v_ctc.hom_phn          := v_r.oth_phn;
    v_ctc.mbl_phn          := v_r.mbl_phn;
    --v_ctc.sms_phn,
    --v_ctc.fax_nbr,
    v_ctc.pry_eml_adr      := v_r.pry_em_ad;
    v_ctc.alt_eml_adr      := v_r.sec_em_ad;
    -- Address Details
    v_ctc.pry_adr_l1       := v_r.pry_a_ad1;
    v_ctc.pry_adr_l2       := v_r.pry_a_ad2;
    v_ctc.pry_adr_cty      := v_r.pry_a_cty;
    v_ctc.pry_adr_zip      := v_r.pry_a_zip;
    v_ctc.pry_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.pry_a_ctr_cd,
                                                      pi_id     => v_r.pry_a_sta_cd);
    v_ctc.pry_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.pry_a_ctr_cd);
    v_ctc.alt_adr_l1       := v_r.pst_a_ad1;
    v_ctc.alt_adr_l2       := v_r.pst_a_ad2;
    v_ctc.alt_adr_cty      := v_r.pst_a_cty;
    v_ctc.alt_adr_zip      := v_r.pst_a_zip;
    IF v_r.pst_a_ctr_cd IS NOT NULL THEN
      v_ctc.alt_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.pst_a_ctr_cd);
    END IF;
    IF v_r.pst_a_sta_cd IS NOT NULL THEN
      v_ctc.alt_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.pst_a_ctr_cd,
                                                        pi_id     => v_r.pst_a_sta_cd);
    END IF;
    -- Bank Details
    v_ctc.pry_bnk_nme      := v_r.bk_nm;
    v_ctc.pry_bnk_srt_cd   := v_r.bk_st_cd;
    v_ctc.pry_bnk_acct_nbr := v_r.bk_ac_no;
    v_ctc.bvn_id           := v_r.bk_bv_no;
    -- Next of Kin (NOK)
    v_ctc.nok_ctc_nme      := v_r.nok_nm;
    IF v_r.nok_rln_cd IS NOT NULL THEN
      v_ctc.nok_rltn_cd_k    := pkwf_00_00.fn_get_rln_k(pi_id => v_r.nok_rln_cd);
    END IF;
    v_ctc.nok_adr_l1       := v_r.nok_a_ad1;
    v_ctc.nok_adr_l2       := v_r.nok_a_ad2;
    v_ctc.nok_adr_cty      := v_r.nok_a_cty;
    v_ctc.nok_adr_zip      := v_r.nok_a_zip;
    IF v_r.nok_a_ctr_cd IS NOT NULL THEN
      v_ctc.nok_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.nok_a_ctr_cd);
    END IF;
    IF v_r.nok_a_sta_cd IS NOT NULL THEN
     v_ctc.nok_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.nok_a_ctr_cd,
                                                       pi_id     => v_r.nok_a_sta_cd);
    END IF;
    v_ctc.nok_pry_phn_nbr  := v_r.nok_phn;
    --
    /*DECLARE
      v_ctc_k wf_00_00_dtd.n38%TYPE;
      v_cus_k wf_00_00_dtd.n38%TYPE;
      v_b     BLOB := EMPTY_BLOB();*/
    BEGIN     
      pkcs_90_wf.pr_prc_ctc@WF_SY(pi_rec => v_ctc,
                                  po_ctc_k => v_ctc_k,
                                  po_cus_k => v_cus_k);
      -- Process Images and Other Documents
      -- load 
      INSERT INTO cs_90_wf_blb (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT pkwf_00_00.fn_rk, t.dc_k, v_r.dc_id,  v_ctc_k, v_cus_k, 'P', t.pic_img
      FROM   wf_vp_30_cs_new_im t WHERE dc_id = v_r.dc_id;
      --
      INSERT INTO cs_90_wf_blb (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT pkwf_00_00.fn_rk, t.dc_k, v_r.dc_id,  v_ctc_k, v_cus_k, 'S', t.pic_sgn
      FROM   wf_vp_30_cs_new_im t WHERE dc_id = v_r.dc_id;
      --
      INSERT INTO cs_90_wf_blb (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT pkwf_00_00.fn_rk, t1.dc_k, v_r.dc_id,  v_ctc_k, v_cus_k, 'D', t2.dc_blb
      FROM   wf_vp_30_cs_new_im t1,
             wf_20_dc t2 
      WHERE t1.dc_id = v_r.dc_id
      AND   t1.dc_id = t2.dc_id;
      --
      INSERT INTO cs_90_wf_blb (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT pkwf_00_00.fn_rk, t.dc_k, v_r.dc_id,  v_ctc_k, v_cus_k, 'D', t.pic_usr
      FROM   wf_vp_30_cs_new_im t WHERE dc_id = v_r.dc_id;
      --
      INSERT INTO cs_90_wf_blb (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT pkwf_00_00.fn_rk, t.dc_k, v_r.dc_id,  v_ctc_k, v_cus_k, 'D', t.pic_utl
      FROM   wf_vp_30_cs_new_im t WHERE dc_id = v_r.dc_id;
      --  
      INSERT 
      INTO   cs_90_wf_blb@wf_sy 
      SELECT * 
      FROM   cs_90_wf_blb 
      WHERE  cus_k = v_cus_k;
      --
      pkcs_90_wf.pr_prc_img@WF_SY(pi_dc_k   => v_r.row_key,
                                  pi_dc_id  => v_r.dc_id,
                                  pi_cus_k  => v_cus_k,
                                  pi_doc_tp => NVL(pkwf_00_pmr.fn_doc_cd,'001')); 
      --
      -- Web mapping                          
      pkcs_90_wf.pr_prc_web@WF_SY(pi_cus_k => v_cus_k); 
      --
      -- create ST Portfolio if interfaced
      IF pkwf_00_pmr.fn_st AND pi_rec.mdl_id = 'ST' THEN
        v_ptf.mkt_id     := 'NSE1';
        v_ptf.ptf_tp_id  := '10';    -- NEED A PARAMETER FOR THIS, PORTFOLIO TYPE
        v_ptf.cus_id     := v_ctc.cus_id;
        v_ptf.cus_nme    := v_ctc.org_nme;
        v_ptf.prd_id     := 'P10';   -- NEED A PARAMETER FOR THIS, PRODUCT
        v_ptf.mkt_act_id := v_r.mkt_act_id;
        v_ptf.mkt_chn_no := v_r.mkt_chn_no;
        --     
        pkst_90_wf.pr_cre_ptf@WF_SY(pi_rec => v_ptf);
        --
      END IF;   
    END;
    --
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END pr_prc_ctc;  
  --
  --
  PROCEDURE pr_prc_ctc_j (pi_rec   IN OUT pkwf_90_gen.r_cs_new_j) IS
    --
    v_r      pkwf_90_gen.r_cs_new_j := pi_rec;
    v_ctc    pkcs_90_wf.r_00_ctc@WF_SY;
    v_ctc_j  pkcs_90_wf.r_00_ctc@WF_SY;
    v_ptf    pkst_90_wf.r_00_ptf@WF_SY;
  BEGIN
    -- 
    --==========================================================================
    -- PRIMARY CONTACT
    v_ctc.r_ps             := 'WF';
    v_ctc.ind_yn           := '1';
    v_ctc.nty_cd_k         := pkwf_00_00.fn_get_nty_k(pi_id => v_r.nty_cd);
    v_ctc.ttl_cd_k         := pkwf_00_00.fn_get_ttl_k(pi_id => v_r.tt_dm);
    v_ctc.lst_nme          := v_r.ls_nm;
    v_ctc.fir_nme          := v_r.fi_nm;
    v_ctc.mle_nme          := v_r.md_nm;
    v_ctc.org_nme          := UPPER(v_r.ls_nm)||' '||INITCAP(v_r.fi_nm)||' '||INITCAP(v_r.md_nm);
    v_ctc.dt_of_bth        := v_r.dob_dt;
    v_ctc.mrl_sta_dm       := v_r.mar_st_dm;
    v_ctc.gdr_dm           := v_r.gdr_dm;
    v_ctc.mtr_mdn_nme      := v_r.mmd_nm;
    -- Employee Details
    v_ctc.jb_ttl_dsc       := v_r.ocp_nm;
    v_ctc.empr_nme         := v_r.emp_nm;
    v_ctc.empr_adr_l1      := v_r.emp_a_ad1;
    v_ctc.empr_adr_l2      := v_r.emp_a_ad2;   
    v_ctc.empr_adr_cty     := v_r.emp_a_cty;
    IF v_r.pst_a_ctr_cd IS NOT NULL THEN
      v_ctc.empr_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.emp_a_ctr_cd);
    END IF;
    IF v_r.pst_a_sta_cd IS NOT NULL THEN
      v_ctc.empr_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.emp_a_ctr_cd,
                                                         pi_id     => v_r.emp_a_sta_cd);
    END IF;
    --
    v_ctc.bus_phn          := v_r.emp_phn;
    v_ctc.hom_phn          := v_r.oth_phn;
    v_ctc.mbl_phn          := v_r.mbl_phn;
    v_ctc.pry_eml_adr      := v_r.pry_em_ad;
    v_ctc.alt_eml_adr      := v_r.sec_em_ad;
    -- Address Details
    v_ctc.pry_adr_l1       := v_r.pry_a_ad1;
    v_ctc.pry_adr_l2       := v_r.pry_a_ad2;
    v_ctc.pry_adr_cty      := v_r.pry_a_cty;
    v_ctc.pry_adr_zip      := v_r.pry_a_zip;
    v_ctc.pry_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.pry_a_ctr_cd,
                                                      pi_id     => v_r.pry_a_sta_cd);
    v_ctc.pry_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.pry_a_ctr_cd);
    v_ctc.alt_adr_l1       := v_r.pst_a_ad1;
    v_ctc.alt_adr_l2       := v_r.pst_a_ad2;
    v_ctc.alt_adr_cty      := v_r.pst_a_cty;
    v_ctc.alt_adr_zip      := v_r.pst_a_zip;
    IF v_r.pst_a_ctr_cd IS NOT NULL THEN
      v_ctc.alt_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.pst_a_ctr_cd);
    END IF;
    IF v_r.pst_a_sta_cd IS NOT NULL THEN
      v_ctc.alt_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.pst_a_ctr_cd,
                                                        pi_id     => v_r.pst_a_sta_cd);
    END IF;
    -- Bank Details
    v_ctc.pry_bnk_nme      := v_r.bk_nm;
    v_ctc.pry_bnk_srt_cd   := v_r.bk_st_cd;
    v_ctc.pry_bnk_acct_nbr := v_r.bk_ac_no;
    --v_ctc.pry_bnk_adr,
    v_ctc.bvn_id           := v_r.bk_bv_no;
    --
    -- Next of Kin (NOK)
    v_ctc.nok_ctc_nme      := v_r.nok_nm;
    IF v_r.nok_rln_cd IS NOT NULL THEN
      v_ctc.nok_rltn_cd_k    := pkwf_00_00.fn_get_rln_k(pi_id => v_r.nok_rln_cd);
    END IF;
    --v_ctc.nok_rltn_cd_dsc,
    v_ctc.nok_adr_l1       := v_r.nok_a_ad1;
    v_ctc.nok_adr_l2       := v_r.nok_a_ad2;
    v_ctc.nok_adr_cty      := v_r.nok_a_cty;
    v_ctc.nok_adr_zip      := v_r.nok_a_zip;
    IF v_r.nok_a_ctr_cd IS NOT NULL THEN
      v_ctc.nok_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.nok_a_ctr_cd);
    END IF;
    IF v_r.nok_a_sta_cd IS NOT NULL THEN
     v_ctc.nok_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.nok_a_ctr_cd,
                                                       pi_id     => v_r.nok_a_sta_cd);
    END IF;
    v_ctc.nok_pry_phn_nbr  := v_r.nok_phn;
    --
    --==========================================================================
    -- SECONDARY CONTACT
    v_ctc_j.r_ps             := 'WF';
    v_ctc_j.ind_yn           := '1';
    v_ctc_j.nty_cd_k         := pkwf_00_00.fn_get_nty_k(pi_id => v_r.j_nty_cd);
    v_ctc_j.ttl_cd_k         := pkwf_00_00.fn_get_ttl_k(pi_id => v_r.j_tt_dm);
    v_ctc_j.lst_nme          := v_r.j_ls_nm;
    v_ctc_j.fir_nme          := v_r.j_fi_nm;
    v_ctc_j.mle_nme          := v_r.j_md_nm;
    v_ctc_j.org_nme          := UPPER(v_r.j_ls_nm)||' '||INITCAP(v_r.j_fi_nm)||' '||INITCAP(v_r.j_md_nm);
    v_ctc_j.dt_of_bth        := v_r.j_dob_dt;
    v_ctc_j.mrl_sta_dm       := v_r.j_mar_st_dm;
    v_ctc_j.gdr_dm           := v_r.j_gdr_dm;
    v_ctc_j.mtr_mdn_nme      := v_r.j_mmd_nm;
    -- Employee Details
    v_ctc_j.jb_ttl_dsc       := v_r.j_ocp_nm;
    v_ctc_j.empr_nme         := v_r.j_emp_nm;
    v_ctc_j.empr_adr_l1      := v_r.j_emp_a_ad1;
    v_ctc_j.empr_adr_l2      := v_r.j_emp_a_ad2;   
    v_ctc_j.empr_adr_cty     := v_r.j_emp_a_cty;
    IF v_r.j_pst_a_ctr_cd IS NOT NULL THEN
      v_ctc_j.empr_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.j_emp_a_ctr_cd);
    END IF;
    IF v_r.j_pst_a_sta_cd IS NOT NULL THEN
      v_ctc_j.empr_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.j_emp_a_ctr_cd,
                                                           pi_id     => v_r.j_emp_a_sta_cd);
    END IF;
    --
    v_ctc_j.bus_phn          := v_r.j_emp_phn;
    v_ctc_j.hom_phn          := v_r.j_oth_phn;
    v_ctc_j.mbl_phn          := v_r.j_mbl_phn;
    v_ctc_j.pry_eml_adr      := v_r.j_pry_em_ad;
    v_ctc_j.alt_eml_adr      := v_r.j_sec_em_ad;
    -- Address Details
    v_ctc_j.pry_adr_l1       := v_r.j_pry_a_ad1;
    v_ctc_j.pry_adr_l2       := v_r.j_pry_a_ad2;
    v_ctc_j.pry_adr_cty      := v_r.j_pry_a_cty;
    v_ctc_j.pry_adr_zip      := v_r.j_pry_a_zip;
    v_ctc_j.pry_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.j_pry_a_ctr_cd,
                                                        pi_id     => v_r.j_pry_a_sta_cd);
    v_ctc_j.pry_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.j_pry_a_ctr_cd);
    v_ctc_j.alt_adr_l1       := v_r.j_pst_a_ad1;
    v_ctc_j.alt_adr_l2       := v_r.j_pst_a_ad2;
    v_ctc_j.alt_adr_cty      := v_r.j_pst_a_cty;
    v_ctc_j.alt_adr_zip      := v_r.j_pst_a_zip;
    IF v_r.j_pst_a_ctr_cd IS NOT NULL THEN
      v_ctc_j.alt_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.j_pst_a_ctr_cd);
    END IF;
    IF v_r.j_pst_a_sta_cd IS NOT NULL THEN
      v_ctc_j.alt_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.j_pst_a_ctr_cd,
                                                          pi_id     => v_r.j_pst_a_sta_cd);
    END IF;
    -- Bank Details
    v_ctc_j.pry_bnk_nme      := v_r.j_bk_nm;
    v_ctc_j.pry_bnk_srt_cd   := v_r.j_bk_st_cd;
    v_ctc_j.pry_bnk_acct_nbr := v_r.j_bk_ac_no;
    --v_ctc_j.pry_bnk_adr,
    v_ctc_j.bvn_id           := v_r.j_bk_bv_no;
    --
    -- Next of Kin (NOK)
    v_ctc_j.nok_ctc_nme      := v_r.j_nok_nm;
    IF v_r.j_nok_rln_cd IS NOT NULL THEN
      v_ctc_j.nok_rltn_cd_k    := pkwf_00_00.fn_get_rln_k(pi_id => v_r.j_nok_rln_cd);
    END IF;
    --v_ctc_j.nok_rltn_cd_dsc,
    v_ctc_j.nok_adr_l1       := v_r.j_nok_a_ad1;
    v_ctc_j.nok_adr_l2       := v_r.j_nok_a_ad2;
    v_ctc_j.nok_adr_cty      := v_r.j_nok_a_cty;
    v_ctc_j.nok_adr_zip      := v_r.j_nok_a_zip;
    IF v_r.j_nok_a_ctr_cd IS NOT NULL THEN
      v_ctc_j.nok_adr_ctr_k    := pkwf_00_00.fn_get_ctr_k(pi_id => v_r.j_nok_a_ctr_cd);
    END IF;
    IF v_r.j_nok_a_sta_cd IS NOT NULL THEN
     v_ctc_j.nok_adr_sta_k    := pkwf_00_00.fn_get_sta_k(pi_ctr_id => v_r.j_nok_a_ctr_cd,
                                                         pi_id     => v_r.j_nok_a_sta_cd);
    END IF;
    v_ctc_j.nok_pry_phn_nbr  := v_r.j_nok_phn;
    --
    --==========================================================================
    --
    DECLARE
      v_ctc_k   wf_00_00_dtd.n38%TYPE;
      v_ctc_j_k wf_00_00_dtd.n38%TYPE;
      v_cus_k   wf_00_00_dtd.n38%TYPE;
      v_k       wf_00_00_dtd.n38%TYPE;
    BEGIN
      pkcs_90_wf.pr_prc_ctc_j@WF_SY(pi_rec     => v_ctc,
                                    pi_rec_j   => v_ctc_j,
                                    po_ctc_k   => v_ctc_k,
                                    po_ctc_j_k => v_ctc_j_k,
                                    po_cus_k   => v_cus_k);
      --
      -- Push images accross and process
      v_k := pkwf_00_00.fn_rk;
      INSERT
        INTO cs_90_wf_blb
            (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT
            v_k, row_key, 'x', v_ctc_k, v_cus_k, 'P', pic_img
        FROM wf_vi_30_cs_new
       WHERE row_key = v_r.row_key;
       INSERT INTO cs_90_wf_blb@wf_sy SELECT * FROM cs_90_wf_blb WHERE row_key = v_r.row_key;
      --
      v_k := pkwf_00_00.fn_rk;
      INSERT
        INTO cs_90_wf_blb
            (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT
            v_k, row_key, 'x', v_ctc_k, v_cus_k, 'S', sig_img
        FROM wf_vi_30_cs_new
       WHERE row_key = v_r.row_key;
       INSERT INTO cs_90_wf_blb@wf_sy SELECT * FROM cs_90_wf_blb WHERE row_key = v_r.row_key;
      -- 
      v_k := pkwf_00_00.fn_rk;
      INSERT
        INTO cs_90_wf_blb
            (row_key, dc_k, blb_ref, ctc_k, cus_k, tp_dm, wf_blb)
      SELECT v_k, v_r.row_key, 'x', v_ctc_k, v_cus_k, 'D', dc_blb
        FROM wf_20_dc
       WHERE dc_id = v_r.dc_id;
       INSERT INTO cs_90_wf_blb@wf_sy SELECT * FROM cs_90_wf_blb WHERE row_key = v_r.row_key;
      --     
      pkcs_90_wf.pr_prc_img@WF_SY(pi_dc_k   => v_r.row_key,
                                  pi_dc_id  => v_r.dc_id,
                                  pi_cus_k  => v_cus_k,
                                  pi_doc_tp => 'CD001');  -- NEED A PARAMETER FOR THIS, DOCUMENT TYPE
      --  
      pkcs_90_wf.pr_prc_web@WF_SY(pi_cus_k => v_cus_k); -- Web mapping
      --        
      --
      IF pkwf_00_pmr.fn_st AND pi_rec.mdl_id = 'ST' THEN
        v_ptf.mkt_id     := 'NSE1';
        v_ptf.ptf_tp_id  := '10';    -- NEED A PARAMETER FOR THIS, PORTFOLIO TYPE
        v_ptf.cus_id     := v_ctc.cus_id;
        v_ptf.cus_nme    := v_ctc.org_nme;
        v_ptf.prd_id     := 'P10';   -- NEED A PARAMETER FOR THIS, PRODUCT
        v_ptf.mkt_act_id := v_r.mkt_act_id;
        v_ptf.mkt_chn_no := v_r.mkt_chn_no;
        --     
        pkst_90_wf.pr_cre_ptf@WF_SY(pi_rec => v_ptf);
        -- 
      END IF;           
    END;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log('ERROR SENDING NEW CUS - '||dbms_utility.format_error_backtrace);
      ROLLBACK;
      RAISE;
  END pr_prc_ctc_j;  
  --
  -- Register new client based on CSCS number
  PROCEDURE pr_prc_reg_2 (pi_rec IN OUT pkwf_90_gen.r_cs_reg2) IS
    --
    v_r     pkwf_90_gen.r_cs_reg2 := pi_rec;
    --
  BEGIN
    --
    pkcs_90_wf.pr_prc_web@WF_SY(pi_cus_id => v_r.cus_id); -- Web mapping
    --
    --
  END pr_prc_reg_2;  
  --
  --
END pkwf_89_cs; 
/
