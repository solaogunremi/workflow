CREATE OR REPLACE PACKAGE BODY pkwf_89_st AS
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
  --
  -- Register new client based on CSCS number
  PROCEDURE pr_prc_reg (pi_rec IN OUT pkwf_90_gen.r_cs_reg) IS
    --
    v_r     pkwf_90_gen.r_cs_reg := pi_rec;
    v_map   pkst_90_wf.r_00_map@WF_SY;
  BEGIN
    --
    v_map.mkt_act_id := v_r.mk_ac_id;
    --
    pkst_90_wf.pr_cre_map@WF_SY(pi_rec => v_map);
    --
    --v_ctc.cus_id;
    --
  END pr_prc_reg;  
  --
  --
END pkwf_89_st; 
/
