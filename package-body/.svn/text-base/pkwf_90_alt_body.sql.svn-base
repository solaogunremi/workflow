CREATE OR REPLACE PACKAGE BODY pkwf_90_alt AS
  --
  /* Created By       : Femi Akintoye
  ** Date Created     : 22-OCT-2014
  ** Release Version  : 2.0
  **
  ** PURPOSE: Alerts Interface
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
  /* Private Routines */
  --
  gv_pvm          pkwf_99_eml.r_pv;
  --
  --
  /* Public Routines */
  --
  PROCEDURE pr_crt_msg (pi_rec IN v_alt) IS
  BEGIN
    --
    gv_pvm  := NULL;
    --
    gv_pvm.pi_src_app := 'WF';  
    gv_pvm.pi_msg_id := pi_rec.pi_msg_id;
    gv_pvm.pi_rcpt_adr := pi_rec.pi_rcpt_adr;
    gv_pvm.pi_now_yn := '1';  
    --
    gv_pvm.pi_src_ref := pi_rec.pi_src_ref;
    gv_pvm.pi_src_key := pi_rec.pi_src_key;
    --
    gv_pvm.pi_sbj1  := pi_rec.pi_sbj1;
    gv_pvm.pi_sbj2  := pi_rec.pi_sbj2;
    gv_pvm.pi_sbj3  := pi_rec.pi_sbj3;
    gv_pvm.pi_bdy1  := pi_rec.pi_bdy1;
    gv_pvm.pi_bdy2  := pi_rec.pi_bdy2;
    gv_pvm.pi_bdy3  := pi_rec.pi_bdy3;
    gv_pvm.pi_bdy4  := pi_rec.pi_bdy4;
    gv_pvm.pi_bdy5  := pi_rec.pi_bdy5;
    gv_pvm.pi_bdy6  := pi_rec.pi_bdy6;
    gv_pvm.pi_bdy7  := pi_rec.pi_bdy7;
    gv_pvm.pi_bdy8  := pi_rec.pi_bdy8;
    gv_pvm.pi_bdy9  := pi_rec.pi_bdy9;
    gv_pvm.pi_bdy10 := pi_rec.pi_bdy10;
    gv_pvm.pi_bdy11 := pi_rec.pi_bdy11;
    gv_pvm.pi_bdy12 := pi_rec.pi_bdy12;
    gv_pvm.pi_bdy13 := pi_rec.pi_bdy13;
    gv_pvm.pi_bdy14 := pi_rec.pi_bdy14;
    gv_pvm.pi_bdy15 := pi_rec.pi_bdy15; 
    --    
    -- Generate Alert Message    
logger.log('ALERT-'||gv_pvm.pi_msg_id||'/'||gv_pvm.pi_rcpt_adr);
    pkwf_99_eml.pr_snd2 (pi_pv => gv_pvm);
    --
logger.log('ALERT RESULT='||gv_pvm.po_snt_yn||'/'||gv_pvm.po_err_txt);
    --    
  END pr_crt_msg;
  --  
  -- Format the Amount Input (Output Format: 999,999,999,999,990.99 trimming Leading Blanks if any)
  FUNCTION fn_fmt_qty (pi_qty NUMBER) RETURN VARCHAR2 IS
  BEGIN
   RETURN pkwf_00_dsp.fn_fmt_qty(pi_qty);
  END fn_fmt_qty;
  --  
  -- Format the Amount Input (Output Format: 999,999,999,999,990.99 trimming Leading Blanks if any)
  FUNCTION fn_fmt_amt (pi_amt NUMBER) RETURN VARCHAR2 IS
  BEGIN
   RETURN pkwf_00_dsp.fn_fmt_amt(pi_amt); --pk99$$00_alrt.fn_fmt_amt (pi_amt);
  END fn_fmt_amt;
  --
  -- Format the Rate Input (Output Format: 999,999.999999% to input decimal places (max 6), trimming Leading Blanks if any)
  FUNCTION fn_fmt_rt (pi_rt NUMBER, pi_dcml_pls PLS_INTEGER DEFAULT 2) RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_00_dsp.fn_fmt_rt (pi_rt => pi_rt, pi_dcml_pls => pi_dcml_pls);
  END fn_fmt_rt;
  -- 
  -- Format the Amount Input (Output Format: Amount in words)
  FUNCTION fn_amt_in_word (pi_amt IN NUMBER, pi_cur_id IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN '';--pk99$$00.fn_amt_in_word (pi_amt => pi_amt, pi_cur_id => pi_cur_id) ;
  END fn_amt_in_word;
  --
  FUNCTION fn_snd_alt(pi_ptf_tp_k IN NUMBER, pi_alt_id IN VARCHAR2) RETURN BOOLEAN RESULT_CACHE IS
    v_yn wf_00_00_dtd.c1%TYPE := 0;
  BEGIN
    --
--    BEGIN
--      SELECT snd_yn
--        INTO v_yn
--        FROM st_10_ptf_tps_alt
--       WHERE ptf_tp_k = pi_ptf_tp_k
--         AND alt_dm = pi_alt_id;
--    EXCEPTION
--      WHEN NO_DATA_FOUND THEN
--        logger.log_warning('ALERT [alt='||pi_alt_id||'] in [ptp='||pi_ptf_tp_k||'] not found');
--        v_yn := '0';
--    END;
    --
    IF v_yn = '1' THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END;
  --
  --
  FUNCTION fn_snd_alt_eml(pi_ptf_tp_k IN NUMBER, pi_alt_id IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE IS
    v_eml wf_00_00_dtd.C1000%TYPE;
  BEGIN
    --
--    BEGIN
--      SELECT dft_eml_adr
--        INTO v_eml
--        FROM st_10_ptf_tps_alt
--       WHERE ptf_tp_k = pi_ptf_tp_k
--         AND alt_dm = pi_alt_id;
--    EXCEPTION
--      WHEN NO_DATA_FOUND THEN
--        logger.log_warning('ALERT ADDR [alt='||pi_alt_id||'] in [ptp='||pi_ptf_tp_k||'] not found');
--        v_eml := NULL;
--    END;
    --
    RETURN v_eml;
    --
  END;
  --
END pkwf_90_alt;
/

