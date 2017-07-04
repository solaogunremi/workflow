CREATE OR REPLACE PACKAGE BODY pkst_90_wf AS 
  --
  /* Created By       : Femi Akintoye
  ** Date Created     : 21-MAR-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: Stockbroking Interface to Workflow
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
  PROCEDURE pr_cre_ptf (pi_rec IN OUT r_00_ptf,
                        pi_loc IN VARCHAR2 DEFAULT '001') IS
    --
    v_mkt    st_10_mkt%ROWTYPE;
    v_ptt    st_10_ptf_tps%ROWTYPE;
    v_ptr    st_10_prd%ROWTYPE;
    --
    v_ptf    st_vt_20_ptf_e%ROWTYPE;
    v_ptm    st_vt_20_ptf_mkt_e%ROWTYPE;
    v_loc    st_00_00_dtd.c30%TYPE := pi_loc;--pkst_00_pmr.fn_dft_wf_loc;
    --
  BEGIN
    --
logger.log('CREATING PORTFOLIOS');    
    BEGIN
      --
      SELECT *
        INTO v_mkt
        FROM st_10_mkt
       WHERE mkt_id = pi_rec.mkt_id;
      --
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Market record not found ['||pi_rec.mkt_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Market record duplicated ['||pi_rec.mkt_id||']');
    END;
    --
    BEGIN
      --
      SELECT *
        INTO v_ptt
        FROM st_10_ptf_tps
       WHERE ptf_tp_id = pi_rec.ptf_tp_id;
      --
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Portfolio type record not found ['||pi_rec.ptf_tp_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Portfolio type record duplicated ['||pi_rec.ptf_tp_id||']');
    END;
    --
    BEGIN
      --
      SELECT *
        INTO v_ptr
        FROM st_10_prd
       WHERE prd_id = pi_rec.prd_id;
      --
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Portfolio product record not found ['||pi_rec.prd_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Portfolio product record duplicated ['||pi_rec.prd_id||']');
    END;
    --
    v_ptf.c_n       := -99;
    v_ptf.ptf_tp_k  := v_ptt.row_key;
    v_ptf.cst_id    := pi_rec.cus_id;
    v_ptf.ptf_dsc   := pi_rec.cus_nme;
    --
    pkst_00_apx.pr_set_uss;
    pkst_00_00_trg.pr_set_xpgm;
    pkdd_00_00_trg.pr_set_xpgm;
    --
    pkst_20_ptf.pr_prc(pi_rec => v_ptf);
    v_ptm.c_n         := -99;
    v_ptm.ptf_k       := v_ptf.row_key;
    v_ptm.mkt_k       := v_mkt.row_key;
    v_ptm.prd_k       := v_ptr.row_key;
    v_ptm.mkt_act_id  := pi_rec.mkt_act_id;
    v_ptm.mkt_clt_id  := pi_rec.mkt_chn_no;
    v_ptm.ptf_mkt_dsc := pi_rec.cus_nme;
    v_ptm.c_fnd_yn    := '1';
    v_ptm.ptf_mkt_dsc := pi_rec.cus_nme;
    BEGIN 
      SELECT cdv_k
        INTO v_ptm.loc_cd_k
        FROM st_vc_00_loc
       WHERE cdv_id = v_loc;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] not found');--    := 1632702032; --v_ctc.loc_cd_k LOCATION
      WHEN TOO_MANY_ROWS THEN
        pkst_00_00_err.pr_raise(pi_msg => 'Default Location Code ['||v_loc||'] duplicated');
    END;
    --
    pkst_20_ptf_mkt.pr_prc(pi_rec => v_ptm);
    --
    --v_ptf.c_n       := -99;
    pkst_20_ptf.pr_apr(pi_key => v_ptf.row_key, pi_cn => -99); --v_ptf.c_n);  -- This will also approve the pending ptm
    --v_ptm.c_n       := -99;
    pkst_20_ptf_mkt.pr_apr(pi_key => v_ptm.row_key, pi_cn => -99); --v_ptm.c_n);
    --
    pkdd_00_00_trg.pr_rset_xpgm;
    pkst_00_00_trg.pr_rset_xpgm;
    --    
  END pr_cre_ptf;
  --
  --
  PROCEDURE pr_cre_map (pi_rec IN OUT r_00_map) IS
    v_cus_id  st_00_00_dtd.c30%TYPE;
  BEGIN
    IF pi_rec.mkt_act_id IS NOT NULL THEN
      BEGIN
        SELECT P.cst_id
          INTO v_cus_id
          FROM st_20_ptf_mkt M, st_20_ptf P
         WHERE M.mkt_act_id = pi_rec.mkt_act_id
           AND M.ptf_k = P.row_key
           AND M.appr_stat_dm IN ('1','3')
           AND P.appr_stat_dm IN ('1','3')
           AND NVL(P.cls_yn,'0') = '0'
           AND NVL(P.blk_yn,'0') = '0';
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          pkst_00_00_err.pr_raise(pi_msg => 'Record with market account no. ['||pi_rec.mkt_act_id||'] not found.');
        WHEN TOO_MANY_ROWS THEN
          pkst_00_00_err.pr_raise(pi_msg => 'Record with market account no. ['||pi_rec.mkt_act_id||'] duplicated.');
      END;
    END IF;
    --
    pkcs_90_wf.pr_prc_web(pi_cus_id => v_cus_id); -- Web mapping
    --
  END pr_cre_map;
  --
  --
END pkst_90_wf; 
/
