CREATE OR REPLACE PACKAGE BODY pkwf_00_apx AS
  --
  /* Created By       : Kunle Adebona
  ** Date Created     : 31-AUG-2012
  ** Release Version  : 3.0
  **
  ** PURPOSE: APEX ENGINE interfacing routines
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
  FUNCTION fn_get_bool_ssv (pi_itm VARCHAR2) RETURN BOOLEAN IS
    v_yn  PLS_INTEGER := 0;
  BEGIN
    BEGIN
      v_yn := TO_NUMBER(APEX_UTIL.GET_SESSION_STATE(pi_itm));
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    IF v_yn = 1 THEN    
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;  
  END fn_get_bool_ssv;
  --  
  -- CHAR Session States
  FUNCTION fn_get_char_ssv (pi_itm VARCHAR2) RETURN VARCHAR2 IS
    v_val VARCHAR2(500) := NULL;
  BEGIN
    BEGIN
      v_val := APEX_UTIL.GET_SESSION_STATE(pi_itm);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    RETURN v_val;
  END fn_get_char_ssv;
  -- 
  -- NUMBER Session States
  FUNCTION fn_get_num_ssv (pi_itm VARCHAR2) RETURN NUMBER IS
    v_val NUMBER := NULL;
  BEGIN
    BEGIN
      v_val := TO_NUMBER(APEX_UTIL.GET_SESSION_STATE(pi_itm));
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    RETURN v_val;
  END fn_get_num_ssv;
  --  
  -- Reset 00 Session States
  PROCEDURE pr_clr_all IS
  BEGIN
    APEX_UTIL.SET_SESSION_STATE('AI_USR_KY',NULL);     -- Login User Key
    APEX_UTIL.SET_SESSION_STATE('AI_USR_BRCH',NULL);   -- Current Login Branch
    -- APEX_UTIL.SET_SESSION_STATE('AI_BRCH_INTM',NULL);  -- Current Branch Login Time
    -- APEX_UTIL.SET_SESSION_STATE('AI_USR_ID',NULL);  -- Login User ID
  END pr_clr_all;
  --     
  -- Clear Application Session State
  PROCEDURE pr_reset_app_ssv (pi_ssn VARCHAR2) IS
    v_sn  VARCHAR2(100) := UPPER(pi_ssn);
  BEGIN
    IF v_sn IS NOT NULL THEN
      APEX_UTIL.SET_SESSION_STATE(v_sn,NULL);
    END IF;  
  END pr_reset_app_ssv;
  --  
  -- Set Session State
  PROCEDURE pr_set_app_ssv (pi_ssn VARCHAR2, pi_ssv VARCHAR2) IS
    v_sn  VARCHAR2(100) := UPPER(pi_ssn);
  BEGIN
    IF v_sn IS NOT NULL THEN
      APEX_UTIL.SET_SESSION_STATE(v_sn,pi_ssv);
    END IF;
  END pr_set_app_ssv;
  --
  -- Set Session State
  PROCEDURE pr_set_app_ssv (pi_ssn VARCHAR2, pi_ssv NUMBER) IS
    v_sn  VARCHAR2(100) := UPPER(pi_ssn);
  BEGIN
    IF v_sn IS NOT NULL THEN
      APEX_UTIL.SET_SESSION_STATE(v_sn,TO_CHAR(pi_ssv));
    END IF;
  END pr_set_app_ssv;
  --    
  --       
  /* Public Routines */
  --  
  -- Clear all Application Session values
  PROCEDURE pr_reset_all_ssv IS
  BEGIN
    pr_clr_all;
  END pr_reset_all_ssv;
  --
  -- Clear Branch Session values
  PROCEDURE pr_reset_brch_ssv IS
  BEGIN
    pr_reset_app_ssv (pi_ssn => 'AI_USR_BRCH');
    -- pr_reset_app_ssv (pi_ssn => 'AI_BRCH_INTM');
    -- pr_reset_app_ssv (pi_ssn => 'AI_USR_ID');
  END pr_reset_brch_ssv;
  --  
  -- Current APEX User
  FUNCTION fn_crnt_apx_usr RETURN VARCHAR2 IS
    v_itm CONSTANT VARCHAR2(100) := 'APP_USER';
  BEGIN
    RETURN fn_get_char_ssv (pi_itm => v_itm);
  END fn_crnt_apx_usr;
  --
  -- Current APEX Application
  FUNCTION fn_crnt_apx_ap RETURN VARCHAR2 IS
    v_itm CONSTANT VARCHAR2(100) := 'APP_ID';
  BEGIN
    RETURN fn_get_char_ssv(pi_itm => v_itm);
  END fn_crnt_apx_ap;
  --
  -- Current APEX Page
  FUNCTION fn_crnt_apx_pg RETURN VARCHAR2 IS
    v_itm CONSTANT VARCHAR2(100) := 'APP_PAGE_ID';
  BEGIN
    RETURN fn_get_char_ssv(pi_itm => v_itm);
  END fn_crnt_apx_pg;
  --
  -- Current APEX User Agent
  FUNCTION fn_crnt_apx_ag RETURN VARCHAR2 IS
    v_ag VARCHAR2(500) := NULL;
  BEGIN
    v_ag := SUBSTR(OWA_UTIL.GET_CGI_ENV ('HTTP_USER_AGENT'),1,100); 
    RETURN v_ag;
  END fn_crnt_apx_ag;
  --
  -- Current APEX User IP
  FUNCTION fn_crnt_apx_ip RETURN VARCHAR2 IS
    v_ip VARCHAR2(500) := NULL;
  BEGIN
    v_ip := SUBSTR(OWA_UTIL.GET_CGI_ENV ('REMOTE_ADDR'),1,20); 
    RETURN v_ip;
  END fn_crnt_apx_ip;
  --
  -- Current User Key
  FUNCTION fn_usr_ky RETURN NUMBER IS
    v_itm CONSTANT VARCHAR2(100) := 'AI_USR_KY';
  BEGIN
    RETURN fn_get_num_ssv (pi_itm => v_itm);
  END fn_usr_ky;
  --
  -- Current User ID
  FUNCTION fn_usr_id RETURN VARCHAR2 IS
    v_itm CONSTANT VARCHAR2(100) := 'AI_USR_ID';
  BEGIN
    RETURN fn_crnt_apx_usr; -- fn_get_char_ssv (pi_itm => v_itm);
  END fn_usr_id;
  --  
  -- Set User Key
  PROCEDURE pr_set_usr_ky (pi_key NUMBER)  IS
    v_itm CONSTANT VARCHAR2(100) := 'AI_USR_KY';
  BEGIN
    pr_set_app_ssv (pi_ssn => v_itm, pi_ssv => pi_key);
  END pr_set_usr_ky;
  --
  -- Set User Branch
  PROCEDURE pr_brch_login (pi_brch_id VARCHAR2, pi_usr_id VARCHAR2) IS
    v_now TIMESTAMP;
  BEGIN
    v_now := pkwf_00.fn_now;
    pr_set_app_ssv (pi_ssn => 'AI_USR_BRCH', pi_ssv => pi_brch_id);
    -- pr_set_app_ssv (pi_ssn => 'AI_BRCH_INTM', pi_ssv => v_now);
    -- pr_set_app_ssv (pi_ssn => 'AI_USR_BRCH', pi_ssv => pi_usr_id);
  END pr_brch_login;
  --
  -- APEX wrapper for apex_util.string_to_table
  FUNCTION fn_apx_str_to_tbl(pi_str IN VARCHAR2, pi_sep IN VARCHAR2 DEFAULT ':') RETURN APEX_APPLICATION_GLOBAL.vc_arr2 IS
  BEGIN
    RETURN APEX_UTIL.STRING_TO_TABLE(pi_str, pi_sep);
  END;
  --
  -- APEX wrapper for apex_util.table_to_string
  FUNCTION fn_apx_tbl_to_str(pi_tbl IN APEX_APPLICATION_GLOBAL.vc_arr2, pi_sep IN VARCHAR2 DEFAULT ':') RETURN VARCHAR2 IS
  BEGIN
    RETURN APEX_UTIL.TABLE_TO_STRING(pi_tbl, pi_sep);
  END;
  --
  -- APEX wrapper for apex_util.public_check_authorization
  FUNCTION fn_apx_chk_auth(pi_scheme IN VARCHAR2) RETURN NUMBER IS
    v_return NUMBER;
  BEGIN
    v_return := 0;
    IF apex_util.public_check_authorization(pi_scheme) THEN
      v_return := 1;
    END IF;
    --
    RETURN v_return;
    --
  END fn_apx_chk_auth;
  --
  PROCEDURE pr_clr_pss IS
  BEGIN
    pr_reset_app_ssv('AI_P01');
    pr_reset_app_ssv('AI_P02');
    pr_reset_app_ssv('AI_P03');
    pr_reset_app_ssv('AI_P04');
    pr_reset_app_ssv('AI_P05');
    pr_reset_app_ssv('AI_P06');
    pr_reset_app_ssv('AI_P07');
    pr_reset_app_ssv('AI_P08');
    pr_reset_app_ssv('AI_P09');
    pr_reset_app_ssv('AI_P10');
  END pr_clr_pss;
  --
  PROCEDURE pr_set_pss (p01 IN VARCHAR2 DEFAULT NULL,  
                        p02 IN VARCHAR2 DEFAULT NULL,
                        p03 IN VARCHAR2 DEFAULT NULL,  
                        p04 IN VARCHAR2 DEFAULT NULL,
                        p05 IN VARCHAR2 DEFAULT NULL,  
                        p06 IN VARCHAR2 DEFAULT NULL,
                        p07 IN VARCHAR2 DEFAULT NULL,  
                        p08 IN VARCHAR2 DEFAULT NULL,
                        p09 IN VARCHAR2 DEFAULT NULL,  
                        p10 IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pr_clr_pss;
    pr_set_app_ssv (pi_ssn => 'AI_P01', pi_ssv => p01);
    pr_set_app_ssv (pi_ssn => 'AI_P02', pi_ssv => p02);
    pr_set_app_ssv (pi_ssn => 'AI_P03', pi_ssv => p03);
    pr_set_app_ssv (pi_ssn => 'AI_P04', pi_ssv => p04);
    pr_set_app_ssv (pi_ssn => 'AI_P05', pi_ssv => p05);
    pr_set_app_ssv (pi_ssn => 'AI_P06', pi_ssv => p06);
    pr_set_app_ssv (pi_ssn => 'AI_P07', pi_ssv => p07);
    pr_set_app_ssv (pi_ssn => 'AI_P08', pi_ssv => p08);
    pr_set_app_ssv (pi_ssn => 'AI_P09', pi_ssv => p09);
    pr_set_app_ssv (pi_ssn => 'AI_P10', pi_ssv => p10);
  END pr_set_pss;
  --  
  FUNCTION fn_get_pss (p_no PLS_INTEGER) RETURN VARCHAR2 IS
    v_itm VARCHAR2(50) := NULL;
  BEGIN
    IF p_no BETWEEN 1 AND 9 THEN
      v_itm := 'AI_P0'||TO_CHAR(p_no);
    ELSIF p_no = 10 THEN
      v_itm := 'AI_P10';
    END IF;
    IF v_itm IS NOT NULL THEN
      RETURN fn_get_char_ssv (pi_itm => v_itm);
    ELSE
      RETURN NULL;
    END IF;
  END fn_get_pss;
  --
  -- 
  PROCEDURE pr_set_uss IS
  BEGIN
    --
    -- Set APEX context security group 
    wwv_flow_api.set_security_group_id;
    apex_application.g_user := 'SYSTEM';
    --
    -- Set UPDATES Session States
    pr_reset_all_ssv;
    --
    pr_set_app_ssv (pi_ssn => 'AI_USR_KY', pi_ssv => 1);
    pr_set_app_ssv (pi_ssn => 'APP_USER', pi_ssv => 'SYSTEM');
    --
    --
  END pr_set_uss;
  --  
  PROCEDURE pr_clr_uss IS
  BEGIN
    pr_reset_all_ssv;
  END pr_clr_uss;
  --    
  --
END pkwf_00_apx;
/

