CREATE OR REPLACE PACKAGE BODY pkwf_00_pmr AS
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
  /* Private Routines */
  --
  --
  FUNCTION fn_get_pmr_bool (pi_id VARCHAR2) RETURN BOOLEAN IS
    v_v  wf_00_00_pvl.bln_val%TYPE;
    CURSOR cur_pmv_b IS
    SELECT A.bln_val
    FROM wf_00_00_pvl A
    WHERE A.pmr_id = pi_id
    AND   A.tp_dm = 'B';
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_b;
    FETCH cur_pmv_b INTO v_v;
    CLOSE cur_pmv_b;     
    IF v_v = 1 THEN    
      RETURN TRUE;
    ELSIF v_v = 0 THEN
      RETURN FALSE;
    ELSE -- DEFAULT=FALSE
      RETURN FALSE;
    END IF;
  END fn_get_pmr_bool;
  --
  FUNCTION fn_get_pmr_char (pi_id VARCHAR2) RETURN VARCHAR2 IS
    v_v  wf_00_00_pvl.chr_val%TYPE;
    CURSOR cur_pmv_c IS
    SELECT A.chr_val
    FROM wf_00_00_pvl A
    WHERE A.pmr_id = pi_id
    AND   A.tp_dm = 'C';
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_c;
    FETCH cur_pmv_c INTO v_v;
    CLOSE cur_pmv_c;     
    RETURN v_v;
  END fn_get_pmr_char;
  --  
  FUNCTION fn_get_pmr_num (pi_id VARCHAR2) RETURN NUMBER IS
    v_v  wf_00_00_pvl.nbr_val%TYPE;
    CURSOR cur_pmv_n IS
    SELECT A.nbr_val
    FROM wf_00_00_pvl A
    WHERE A.pmr_id = pi_id
    AND   A.tp_dm = 'N';
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_n;
    FETCH cur_pmv_n INTO v_v;
    CLOSE cur_pmv_n;     
    RETURN v_v;
  END fn_get_pmr_num;
  --  
  FUNCTION fn_get_pmr_dt (pi_id VARCHAR2) RETURN DATE IS
    v_v  wf_00_00_pvl.dt_val%TYPE;
    CURSOR cur_pmv_d IS
    SELECT A.dt_val
    FROM wf_00_00_pvl A
    WHERE A.pmr_id = pi_id
    AND   A.tp_dm = 'D';
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_d;
    FETCH cur_pmv_d INTO v_v;
    CLOSE cur_pmv_d;     
    RETURN v_v;
  END fn_get_pmr_dt;
  --  
  PROCEDURE pr_set_pmr_char(pi_id IN VARCHAR2, pi_val IN VARCHAR2) IS
  BEGIN
    UPDATE wf_00_00_pvl
    SET    chr_val = pi_val
    WHERE pmr_id = pi_id;
  END pr_set_pmr_char;
  --
  PROCEDURE pr_set_pmr_num(pi_id IN VARCHAR2, pi_val IN NUMBER) IS
  BEGIN
    UPDATE wf_00_00_pvl
    SET    nbr_val = pi_val
    WHERE pmr_id = pi_id;
  END pr_set_pmr_num;
  -- 
  PROCEDURE pr_set_pmr_bool(pi_id IN VARCHAR2, pi_val IN VARCHAR2) IS
  BEGIN
    UPDATE wf_00_00_pvl
    SET    bln_val = pi_val
    WHERE pmr_id = pi_id;
  END pr_set_pmr_bool;
  --
  PROCEDURE pr_set_pmr_dt(pi_id IN VARCHAR2, pi_val IN DATE) IS
  BEGIN
    UPDATE wf_00_00_pvl
    SET    dt_val = pi_val
    WHERE pmr_id = pi_id;
  END pr_set_pmr_dt;
  --   
  --    
  /* Public Routines */
  --  
  --
  -- Yes if using remote users
  FUNCTION fn_rmt_usr_only RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool (pi_id => 'WF_USC');
  END fn_rmt_usr_only;
  --
  -- Returns TRUE if remote users are allowed
  FUNCTION fn_alw_rmt_usr RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool (pi_id => 'WF_ALW_RMT');
  END fn_alw_rmt_usr;
  -- 
  PROCEDURE pr_alw_rmt_usr (pi_val IN VARCHAR2) IS
  BEGIN
    pr_set_pmr_bool (pi_id => 'WF_ALW_RMT', pi_val => pi_val);
  END pr_alw_rmt_usr;
  -- 
  -- Returns TRUE if remote users are allowed
  FUNCTION fn_alw_lcl_usr RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool (pi_id => 'WF_ALW_LCL');
  END fn_alw_lcl_usr;
  --
  PROCEDURE pr_alw_lcl_usr (pi_val IN VARCHAR2) IS
  BEGIN
    pr_set_pmr_bool (pi_id => 'WF_ALW_LCL', pi_val => pi_val);
  END pr_alw_lcl_usr;
  -- 
  -- Returns default email from address
  FUNCTION fn_eml_frm_adr RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char (pi_id => 'EML_FRM_ADR');
  END fn_eml_frm_adr;
  --
  PROCEDURE pr_eml_frm_adr(pi_val IN VARCHAR2) IS
  BEGIN
    pr_set_pmr_char (pi_id => 'EML_FRM_ADR', pi_val => pi_val);
  END pr_eml_frm_adr;
  --
  -- Returns default page auto refresh time
  FUNCTION fn_pg_rfrsh RETURN NUMBER IS
  BEGIN
    RETURN fn_get_pmr_num (pi_id => 'WF_RFH_TM');
  END fn_pg_rfrsh;
  --
  PROCEDURE pr_pg_rfrsh(pi_val IN NUMBER) IS
  BEGIN
    pr_set_pmr_num (pi_id => 'WF_RFH_TM', pi_val => pi_val);
  END pr_pg_rfrsh;
  --   
  -- Returns REST End point for PDF
  FUNCTION fn_pdf_uri RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char (pi_id => 'WF_PDF_URI');
  END fn_pdf_uri;
  --
  PROCEDURE pr_pdf_uri(pi_val IN VARCHAR2) IS
  BEGIN
    pr_set_pmr_char (pi_id => 'WF_PDF_URI', pi_val => pi_val);
  END pr_pdf_uri;
  -- 
  FUNCTION fn_st RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool (pi_id => 'WF_ST_YN');
  END fn_st;
  --
  FUNCTION fn_am RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool (pi_id => 'WF_AM_YN');
  END fn_am;
  --
  FUNCTION fn_doc_cd RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char (pi_id => 'SY_DOC_CD');
  END fn_doc_cd;
  --
  PROCEDURE pr_doc_cd(pi_val IN VARCHAR2) IS
  BEGIN
    pr_set_pmr_char (pi_id => 'SY_DOC_CD', pi_val => pi_val);
  END pr_doc_cd;
  --
  --
END pkwf_00_pmr;
/
