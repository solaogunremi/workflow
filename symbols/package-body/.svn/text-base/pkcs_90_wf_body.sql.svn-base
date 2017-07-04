CREATE OR REPLACE PACKAGE BODY pkcs_90_wf AS 
  --
  /* Created By       : Femi Akintoye
  ** Date Created     : 21-MAR-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: Customer Interface to Workflow
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
  /* Public Routines */
  --  
  --
  PROCEDURE pr_prc_ctc (pi_rec IN OUT r_00_ctc,
                        po_ctc_k  OUT NUMBER,
                        po_cus_k  OUT NUMBER) IS
    v_ctc  r_00_ctc := pi_rec;
    v_cus  cs_vt_00_cus%ROWTYPE;
    v_jctc r_00_ctc;
    v_loc   cs_00_00_dtd.c30%TYPE := pkcs_00_pmr.fn_dft_wf_loc;
  BEGIN 
    v_ctc.r_ps      := 'WF';
    v_jctc.r_ps     := 'WF';
    v_cus.r_ps      := 'WF';
    v_cus.cus_tp_dm := 'I';
    v_cus.cus_nme   := v_ctc.org_nme;
    BEGIN 
      SELECT flx_k2_k
        INTO v_cus.flx_k2
        FROM cs_vl_00_cdv_cus_flx_k2
       WHERE flx_k2_id = v_loc;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] not found');
      WHEN TOO_MANY_ROWS THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] duplicated');
    END; 
    pkcs_wf_cus.pr_prc(pi_cus  => v_cus,
                        pi_ctc1 => v_ctc,
                        pi_ctc2 => v_jctc);  
    pkcs_wf_cus.pr_apr(pi_key => v_cus.cus_k, pi_cn => v_cus.c_n);
    --
    pi_rec := v_ctc;
    po_ctc_k := v_ctc.ctc_k;
    po_cus_k := v_cus.cus_k;
    --
  END pr_prc_ctc;
  --  
  --
  PROCEDURE pr_prc_ctc_c (pi_rec IN OUT r_00_ctc,
                         po_ctc_k  OUT NUMBER,
                         po_cus_k  OUT NUMBER) IS
    v_ctc  r_00_ctc := pi_rec;
    v_cus  cs_vt_00_cus%ROWTYPE;
    v_jctc r_00_ctc;
    v_loc   cs_00_00_dtd.c30%TYPE := pkcs_00_pmr.fn_dft_wf_loc;
  BEGIN
    v_ctc.r_ps      := 'WF';
    v_jctc.r_ps     := 'WF';
    v_cus.r_ps      := 'WF';
    v_cus.cus_tp_dm := 'C';
    v_cus.cus_nme   := v_ctc.org_nme;
    BEGIN 
      SELECT flx_k2_k
        INTO v_cus.flx_k2
        FROM cs_vl_00_cdv_cus_flx_k2
       WHERE flx_k2_id = v_loc;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] not found');
      WHEN TOO_MANY_ROWS THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] duplicated');
    END; 
    pkcs_wf_cus.pr_prc(pi_cus  => v_cus,
                        pi_ctc1 => v_ctc,
                        pi_ctc2 => v_jctc);
    pkcs_wf_cus.pr_apr(pi_key => v_cus.cus_k, pi_cn => v_cus.c_n);
    --
    pi_rec := v_ctc;
    po_ctc_k := v_ctc.ctc_k;
    po_cus_k := v_cus.cus_k;
    --
  END pr_prc_ctc_c;
  --  
  --
  PROCEDURE pr_prc_ctc_j(pi_rec      IN OUT r_00_ctc,
                         pi_rec_j    IN OUT r_00_ctc,
                         po_ctc_k    OUT NUMBER,
                         po_cus_k    OUT NUMBER,
                         po_ctc_j_k  OUT NUMBER) IS
    v_ctc   r_00_ctc := pi_rec;
    v_ctc_j r_00_ctc := pi_rec_j;
    v_cus   cs_vt_00_cus%ROWTYPE;
    v_jctc  r_00_ctc;
    v_loc   cs_00_00_dtd.c30%TYPE := pkcs_00_pmr.fn_dft_wf_loc;
  BEGIN  
    v_ctc.r_ps      := 'WF';
    v_ctc_j.r_ps    := 'WF';
    v_cus.r_ps      := 'WF';
    v_cus.cus_tp_dm := 'J';
    v_cus.cus_nme   := v_ctc.org_nme;
    BEGIN 
      SELECT flx_k2_k
        INTO v_cus.flx_k2
        FROM cs_vl_00_cdv_cus_flx_k2
       WHERE flx_k2_id = v_loc;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] not found');
      WHEN TOO_MANY_ROWS THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] duplicated');
    END;
    pkcs_wf_cus.pr_prc(pi_cus  => v_cus,
                        pi_ctc1 => v_ctc,
                        pi_ctc2 => v_ctc_j);
    pkcs_wf_cus.pr_apr(pi_key => v_cus.cus_k, pi_cn => v_cus.c_n);
    --
    pi_rec     := v_ctc;
    pi_rec_j   := v_ctc_j;
    po_ctc_k   := v_ctc.ctc_k;
    po_cus_k   := v_cus.cus_k;
    po_ctc_j_k := v_ctc_j.ctc_k;
    --
  END pr_prc_ctc_j;
  --
  --
  PROCEDURE pr_prc_img (pi_dc_k   IN NUMBER,
                        pi_dc_id  IN VARCHAR2,
                        pi_cus_k  IN NUMBER,
                        pi_doc_tp IN VARCHAR2) IS
    --
  BEGIN
    -- Insert picture and signature
    INSERT
      INTO cs_00_ctc_img
          (ctc_k, ref_k, ref_id, ref_dsc, img_tp,
           img_blb, mim_tp, fil_nme, chr_set, upd_at)
    SELECT ctc_k, row_key, 'WF-'||pi_dc_id, 'WORKFLOW', tp_dm,
           wf_blb, NULL, NULL, NULL, SYSDATE
      FROM cs_90_wf_blb
     WHERE dc_k = pi_dc_k
       AND tp_dm IN ('S','P');
    --
    pkcs_00_dcs.pr_pop_dcs(pi_cus_k => pi_cus_k);
    --
    DECLARE
      v_dcs    cs_00_dcs%ROWTYPE;
      r_dcs    cs_vt_00_dcs%ROWTYPE;
    BEGIN
      SELECT *
        INTO v_dcs
        FROM cs_00_dcs
       WHERE cus_k = pi_cus_k
         AND doc_k = (SELECT E.row_key
                        FROM cs_00_dcr E, cs_vl_00_cdv_doc_typ F
                       WHERE E.doc_cd_k = F.doc_typ_k
                         AND F.doc_typ_id = pi_doc_tp
                         AND E.cus_tp_dm = 'I');  -- might need to determine the type of customer created. I for now
      --
      INSERT
        INTO cs_00_ctc_img
            (ctc_k, ref_k, ref_id, ref_dsc, img_tp,
             img_blb, mim_tp, fil_nme, chr_set, upd_at)
      SELECT cus_k, row_key, 'WF-'||pi_dc_id, 'WORKFLOW', tp_dm,
             wf_blb, 'application/pdf', pi_dc_id||'.pdf', NULL, SYSDATE
        FROM cs_90_wf_blb
       WHERE dc_k = pi_dc_k
         AND tp_dm IN ('D');
      --
      r_dcs.dcs_k   := v_dcs.row_key;
      r_dcs.r_ps    := 'WF';
      r_dcs.appr_stat_dm := v_dcs.appr_stat_dm;
      r_dcs.c_n     := v_dcs.c_n;
      r_dcs.cus_k   := v_dcs.cus_k;
      r_dcs.doc_k   := v_dcs.doc_k;
      r_dcs.sbm_yn  := '1';
      r_dcs.sbm_cnt := v_dcs.sbm_cnt;
      r_dcs.sbm_dt  := SYSDATE;
      r_dcs.doc_ref := pkcs_wf_cus.fn_cus_id (pi_cus_k => pi_cus_k);
      r_dcs.eff_dt  := pkcs_00.fn_bus_dt;
      r_dcs.rmk_txt := 'WORKFLOW GENERATED';
      --;
      pkcs_00_dcs.pr_prc(pi_rec => r_dcs);
      --	  
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        NULL;
      WHEN TOO_MANY_ROWS THEN
        NULL;
    END; 
    --
  END pr_prc_img;
  --
  --
  PROCEDURE pr_prc_web(pi_cus_k IN NUMBER) IS
    --
    v_cus_id VARCHAR2(30);
    v_cus_nm VARCHAR2(150);
    v_rm     cs_vt_rm_clnts%ROWTYPE;
    v_rm_x   cs_vt_rm_clnts_x%ROWTYPE;
    --
    CURSOR c_cus IS
      SELECT cus_id, cus_nme
      FROM   cs_00_cus
      WHERE  appr_stat_dm IN ('1','3')
      AND    cus_tp_dm = 'I'
      AND    sta_dm = 'N'
      AND    row_key = pi_cus_k
      AND    NVL(blk_lst_yn, '0') = '0';
  BEGIN
    --
    OPEN  c_cus;
    FETCH c_cus INTO v_cus_id, v_cus_nm;
    CLOSE c_cus;
    --
    IF v_cus_id IS NOT NULL THEN
      --
      v_rm.row_key := 0;
      v_rm.c_n := 0;
      v_rm.appr_stat_dm := '0';
      v_rm.clnt_no := v_cus_id;
      v_rm.clnt_name := v_cus_nm;
      v_rm.all_ra_yn := '0';
      v_rm.all_ct_yn := '0';
      --
      pkcs_rm_clnts.pr_prc(v_rm);
      pkcs_rm_clnts.pr_apr(v_rm.row_key,
                           v_rm.c_n);
      --
    END IF; 
    --
  END pr_prc_web;
  --
  --
  PROCEDURE pr_prc_web(pi_cus_id IN VARCHAR2) IS
    v_k  cs_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT row_key
        INTO v_k
        FROM cs_00_cus
       WHERE cus_id = pi_cus_id
         AND appr_stat_dm IN ('1','3');
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Customer with id. ['||pi_cus_id||'] not found.');
      WHEN TOO_MANY_ROWS THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Customer with id. ['||pi_cus_id||'] duplicated.');
    END;
    --
    pr_prc_web(pi_cus_k => v_k);
    --
  END pr_prc_web;    
  --
  --
  PROCEDURE pr_val_wb_cus(pi_wb_cus_id IN VARCHAR2,
                          pi_cus_id    IN VARCHAR2) IS
    --
    v_x NUMBER := 0;
    --
  BEGIN
    --
    BEGIN
      SELECT 1
        INTO v_x
        FROM cs_rm_clnts A, cs_rm_clnts_x B
       WHERE A.clnt_no = b.clnt_no
         AND B.clnt_no = pi_wb_cus_id
         AND B.clnt_id = pi_cus_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Customer with id. ['||pi_cus_id||'] not linked.');
      WHEN TOO_MANY_ROWS THEN
        pkcs_00_00_err.pr_raise(pi_msg => 'Customer with id. ['||pi_cus_id||'] duplicated.');
    END;
    --
  END pr_val_wb_cus;
  --
  --
END pkcs_90_wf; 
/
