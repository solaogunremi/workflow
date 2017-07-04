CREATE OR REPLACE PACKAGE BODY pkwf_10_rl_mb AS
  --
  /* Created By       : Kunle Adebona
  ** Date Created     : 06-SEP-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Operating Parameters
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
  **
  */
  --
  --
  pv_rec      wf_vt_10_rl_mb%ROWTYPE;
  pv_rec_e    wf_vt_10_rl_mb%ROWTYPE;
  --
  pv_tbl      wf_10_rl_mb%ROWTYPE;
  pv_tbl_i    wf_10_rl_mb%ROWTYPE;
  --
  /* Private Routines */
  --      
  --
  PROCEDURE pr_clear_recs IS
  BEGIN
    pv_tbl          := NULL;
    pv_rec          := NULL;
    pv_rec_e        := NULL;
  END pr_clear_recs;
  --    
  /* Public Routines */
  --  
  --
  PROCEDURE pr_prc(pi_rec IN OUT wf_vt_10_rl_mb%ROWTYPE) IS
  BEGIN
    --    
  --  pr_auth;
    --
    pr_clear_recs;
    --  
    pv_rec_e := pi_rec;
    --
    pv_rec_e.row_key := NVL(pv_rec_e.row_key,0);
    --
--    IF pv_rec_e.row_key = 0 THEN -- NEW
--      --
--      pv_rec_e.appr_stat_dm := '0';
--      --
--    ELSE  -- UPDATE
--      --
--      pr_load_cur_rec (pi_key => pv_rec_e.row_key);
--      --
--      IF pv_tbl.row_key = pv_rec_e.row_key THEN -- record found
--        --
--        IF pv_tbl.appr_stat_dm = '0' THEN
--          NULL;
--        ELSIF pv_tbl.appr_stat_dm IN ('1','3') THEN 
--          pv_rec_e.cur_id := pv_tbl.cur_id;
--        ELSE
--          pkst_00_xcp.pr_not_valid (pi_dsc => 'Currency record');
--        END IF;
--        --
--      ELSE
--        pkst_00_xcp.pr_not_valid (pi_dsc => 'Currency record');
--      END IF;
--      --
--      pv_rec_e.appr_stat_dm := pv_tbl.appr_stat_dm;
--      --
--    END IF;
    --
    --
    --pr_fmt_pv_rec_e;
    --pr_val_pv_rec_e;
    --  
    --
     IF pv_rec_e.row_key = 0 THEN -- INSERT
      --  
      pv_tbl_i.row_key := pkwf_00.fn_nxt_key;
      pv_tbl_i.appr_stat_dm := '0';
      pv_tbl_i.c_n := 1;
      --
      pv_tbl_i.rl_k  := pv_rec_e.rl_k;
      pv_tbl_i.mb_k  := pv_rec_e.mb_k;
      pv_tbl_i.iu_yn := pv_rec_e.iu_yn;
      --
      INSERT INTO wf_10_rl_mb VALUES pv_tbl_i;
      --
      pv_rec_e.row_key := pv_tbl_i.row_key;
--      pv_rec_e.c_n     := pv_tbl_i.c_n;
      --
    ELSE -- UPDATE
--      IF fn_same_cn (pi_key => pv_tbl_i.row_key, pi_cn => pv_tbl_i.c_n) THEN
--        IF pv_rec_e.appr_stat_dm IN('0','1','3') THEN
          UPDATE wf_10_rl_mb
             SET rl_k       = pv_rec_e.rl_k,     
                 mb_k       = pv_rec_e.mb_k,  
                 iu_yn      = pv_rec_e.iu_yn     
           WHERE row_key =  pv_rec_e.row_key;
--        END IF;
--      ELSE
--        pkst_00_xcp.pr_rec_changed (pi_dsc => 'Currency record', pi_ci  => 'cur_id');
--      END IF;
    END IF;
   --
    pi_rec := pv_rec_e; 
   --
   END pr_prc;
  --
  PROCEDURE pr_del(pi_k IN NUMBER) IS
  BEGIN
    DELETE
      FROM wf_10_rl_mb
     WHERE row_key = pi_k;
  END pr_del;
  --     
  --
END pkwf_10_rl_mb;
/
