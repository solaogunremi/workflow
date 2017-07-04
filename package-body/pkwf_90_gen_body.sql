CREATE OR REPLACE PACKAGE BODY pkwf_90_gen AS
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
  FUNCTION fn_01_cus_ins(pi_rec IN r_cs_new) RETURN r_ret IS
    v_ret   r_ret;
  BEGIN
    --
    v_ret := pkwf_30_cs_new.fn_ins(pi_rec => pi_rec);
    --
    RETURN v_ret;
    --
  END fn_01_cus_ins;
  --
  --
  FUNCTION fn_01_set_img(pi_dc_k IN NUMBER) RETURN r_ret IS
    v_ret   r_ret;
  BEGIN
    --
    v_ret := pkwf_30_cs_new.fn_set_img(pi_dc_k => pi_dc_k);
    --
    RETURN v_ret;
    --
  END fn_01_set_img;
  --
  --
  FUNCTION fn_02_reg_ins(pi_rec IN r_cs_reg) RETURN r_ret IS
    v_ret   r_ret;
  BEGIN
    --
    v_ret := pkwf_30_cs_reg.fn_ins(pi_rec => pi_rec);
    --
    RETURN v_ret;
    --
  END fn_02_reg_ins;
  --
  --
  FUNCTION fn_03_wdr_ins(pi_rec IN r_ch_wdr) RETURN r_ret IS
    v_ret   r_ret;
  BEGIN
    --
    v_ret := pkwf_30_ch_wdr.fn_ins(pi_rec => pi_rec);
    --
    RETURN v_ret;
    --
  END fn_03_wdr_ins;
  --
  --
END pkwf_90_gen; 
/
