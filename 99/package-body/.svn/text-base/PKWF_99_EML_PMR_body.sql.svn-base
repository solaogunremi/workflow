CREATE OR REPLACE PACKAGE BODY pkwf_99_eml_pmr AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 27-dec-2012
  ** Release Version  : 3.0
  **
  ** PURPOSE: Email Parameters
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
    v_v  t_99_00_pmv.v_b%TYPE;
    CURSOR cur_pmv_b IS
    SELECT A.v_b
    FROM t_99_00_pmv A
    WHERE A.p_id = pi_id
    AND   A.t_dm = 'B';
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_b;
    FETCH cur_pmv_b INTO v_v;
    CLOSE cur_pmv_b;     
    IF v_v = 1 THEN    
      RETURN TRUE;
    ELSIF v_v = 0 THEN
      RETURN FALSE;
    ELSIF pi_id IN ('xx','yy') THEN -- DEFAULT=TRUE 
      RETURN TRUE;
    ELSE -- DEFAULT=FALSE
      RETURN FALSE;
    END IF;
  END fn_get_pmr_bool;
  --
  FUNCTION fn_get_pmr_char (pi_id VARCHAR2) RETURN VARCHAR2 IS
    v_v  t_99_00_pmv.v_c%TYPE;
    CURSOR cur_pmv_c IS
    SELECT A.v_c
    FROM t_99_00_pmv A
    WHERE A.p_id = pi_id
    AND   A.t_dm = 'C';
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_c;
    FETCH cur_pmv_c INTO v_v;
    CLOSE cur_pmv_c;     
    RETURN v_v;
  END fn_get_pmr_char;
  --  
  FUNCTION fn_get_pmr_num (pi_id VARCHAR2) RETURN NUMBER IS
    v_v  t_99_00_pmv.v_n%TYPE;
    CURSOR cur_pmv_n IS
    SELECT A.v_n
    FROM t_99_00_pmv A
    WHERE A.p_id = pi_id
    AND   A.t_dm = 'N';
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_n;
    FETCH cur_pmv_n INTO v_v;
    CLOSE cur_pmv_n;     
    RETURN v_v;
  END fn_get_pmr_num;
  --      
  --    
  /* Public Routines */
  --  
  -- Send Email
  FUNCTION fn_eml_yn RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool(pi_id => 'EML_YN');
  END fn_eml_yn;
  --
  -- Raise Error
  FUNCTION fn_eml_raise RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool(pi_id => 'EML_RAISE_ERR');
  END fn_eml_raise;
  --
  -- SMTP Host IP Address
  FUNCTION fn_eml_smtp_ip RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_SMTP_IP');
  END fn_eml_smtp_ip;
  --
  -- SMTP Host Port Number
  FUNCTION fn_eml_smtp_prt RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_SMTP_PRT');
  END fn_eml_smtp_prt;
  --
  -- SMTP Username
  FUNCTION fn_eml_smtp_usr RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_SMTP_USR');
  END fn_eml_smtp_usr;
  --
  -- SMTP Password
  FUNCTION fn_eml_smtp_pwd RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_SMTP_PWD');
  END fn_eml_smtp_pwd;
  --
  -- SMTP Domain
  FUNCTION fn_eml_smtp_dm RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_SMTP_DM');
  END fn_eml_smtp_dm;
  --
  -- SMTP Authetication
  FUNCTION fn_eml_smtp_auth RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool(pi_id => 'EML_SMTP_AUTH');
  END fn_eml_smtp_auth;
  --
  -- SMTP Server Timeout
  FUNCTION fn_eml_smtp_tout RETURN NUMBER IS
  BEGIN
    RETURN fn_get_pmr_num(pi_id => 'EML_SMTP_TOUT');
  END fn_eml_smtp_tout;
  --
  -- Email Sender Name
  FUNCTION fn_eml_sndr_nme RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_SNDR_NME');
  END fn_eml_sndr_nme;
  --
  -- Email Test Recipient Address
  FUNCTION fn_eml_test_rcp RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_TEST_EML');
  END fn_eml_test_rcp;
  --
  -- Send All Mails to Test Recipient
  FUNCTION fn_eml_all_to_test RETURN BOOLEAN IS
  BEGIN
    RETURN fn_get_pmr_bool(pi_id => 'EML_SEND_TEST');
  END fn_eml_all_to_test;
  --  
  -- Email Sender Email
  FUNCTION fn_eml_sndr_eml RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_SNDR_EML');
  END fn_eml_sndr_eml;
  --
  -- Email Header Text
  FUNCTION fn_eml_hdr_txt RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_HDR_TXT');
  END fn_eml_hdr_txt;
  --
  -- Email Footer Text
  FUNCTION fn_eml_ftr_txt RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_FTR_TXT');
  END fn_eml_ftr_txt;
  --
  -- APEX Application URL
  FUNCTION fn_eml_apx_url RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_INST_URL');
  END fn_eml_apx_url;
  --
  -- APEX Images Directory URL
  FUNCTION fn_eml_img_url RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_get_pmr_char(pi_id => 'EML_IMG_URL');
  END fn_eml_img_url;
  --  
END pkwf_99_eml_pmr;
/

