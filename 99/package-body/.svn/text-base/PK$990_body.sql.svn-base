create or replace PACKAGE BODY pk$990 AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 15-dec-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Login Routines
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
  gv_k            VARCHAR2(500) := NULL;
  gv_pk           VARCHAR2(500) := NULL;
  gv_un           VARCHAR2(500) := NULL;
  gv_valid_conn   BOOLEAN := FALSE;
  -- 
  PROCEDURE pr_reset IS
  BEGIN
    gv_valid_conn := FALSE;
    gv_pk := NULL;
    gv_un := NULL;
    gv_k  := NULL;
  END pr_reset;
  --  
  PROCEDURE pr_load_gvs IS
  BEGIN
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
  END pr_load_gvs;
  --
  --    
  /* Public Routines */
  --
  FUNCTION fn_login (p_username VARCHAR2, p_password VARCHAR2) RETURN BOOLEAN IS
  BEGIN 
    gv_valid_conn := FALSE;
    IF gv_k IS NOT NULL AND UPPER(p_username) = gv_pk THEN -- PRE-AUTHENTICATED PROCEDURE was executed
      gv_valid_conn := pk99_ath.fn_ath (pi_k => gv_k, pi_u => p_username, pi_p => p_password);
    END IF;
    gv_pk := NULL;
    gv_un := NULL;
    IF gv_valid_conn THEN
      gv_pk := APEX_UTIL.GET_SESSION_STATE('APP_SESSION');
      gv_un := p_username;
    END IF;
    RETURN gv_valid_conn;    
  END fn_login;
  -- 
  FUNCTION fn_loginsa (p_username VARCHAR2, p_password VARCHAR2) RETURN BOOLEAN IS
  BEGIN 
    gv_valid_conn := FALSE;
    IF gv_k IS NOT NULL AND UPPER(p_username) = gv_pk THEN -- PRE-AUTHENTICATED PROCEDURE was executed
      gv_valid_conn := pk99_ath.fn_athsa (pi_k => gv_k, pi_u => p_username, pi_p => p_password);
    END IF;
    gv_pk := NULL;
    gv_un := NULL;
    IF gv_valid_conn THEN
      gv_pk := APEX_UTIL.GET_SESSION_STATE('APP_SESSION');
      gv_un := p_username;
    END IF;
    RETURN gv_valid_conn;    
  END fn_loginsa;
  --    
  -- PRE-LOGIN AUTHENTICATION 
  PROCEDURE pr_blath (pi_k VARCHAR2 DEFAULT NULL) IS 
  BEGIN
    pr_reset;
    pr_load_gvs;
    IF pi_k IS NOT NULL THEN
      gv_pk := UPPER(pi_k);
    END IF;      
  END pr_blath;
  --
  -- POST-LOGIN AUTHENTICATION   
  PROCEDURE pr_alath (pi_k VARCHAR2 DEFAULT NULL) IS 
    v_b   BOOLEAN;
  BEGIN
    v_b := FALSE;
    IF gv_valid_conn THEN -- AND pi_k = gv_pk THEN
      v_b := pk99_ath.fn_ath_sss (pi_k => gv_k, pi_u => gv_un);
    END IF;  
    IF NOT v_b THEN
      pr_load_gvs;
      pkwf_99_sss.pr_lgnoff (pi_k => gv_k);
    END IF;
    --
    pr_reset;     
    -- 
  END pr_alath;
  --
  -- POST-LOGIN AUTHENTICATION  (for External applications) 
  PROCEDURE pr_alathx (pi_k VARCHAR2 DEFAULT NULL) IS 
    v_b   BOOLEAN;
  BEGIN
    v_b := FALSE;
    IF pi_k = 'XT' AND gv_valid_conn THEN 
      v_b := pk99_ath.fn_ath_sss (pi_k => gv_k, pi_u => gv_un);
    END IF;  
    IF NOT v_b THEN
      pr_load_gvs;
      pkwf_99_sss.pr_lgnoff (pi_k => gv_k);
    END IF;
    --
    pr_reset;     
    -- 
  END pr_alathx;
  --  
  -- Connection Authorization
  FUNCTION fn_atc RETURN BOOLEAN IS
    v_k NUMBER;
  BEGIN
    --
    v_k := 0;
    --
    IF APEX_CUSTOM_AUTH.CURRENT_PAGE_IS_PUBLIC THEN
      v_k := 1; 
    ELSE
      pr_load_gvs;
      IF NOT pkwf_99_sss.fn_crnt_appl_sa (gv_k) THEN
        v_k := pkwf_99_sss.fn_usr_key (pi_k => gv_k);
      END IF;
    END IF;
    --
    IF v_k > 0 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_atc;
  --   
  -- Connection Authorization
  FUNCTION fn_atcsa RETURN BOOLEAN IS
    v_k NUMBER;
  BEGIN
    --
    v_k := 0;
    --
    IF APEX_CUSTOM_AUTH.CURRENT_PAGE_IS_PUBLIC THEN
      v_k := 1; 
    ELSE
      pr_load_gvs;
      IF pkwf_99_sss.fn_crnt_appl_sa (gv_k) THEN
        v_k := pkwf_99_sss.fn_usr_key (pi_k => gv_k);
      END IF;
    END IF;
    --
    --
    IF v_k > 0 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_atcsa;
  --   
  PROCEDURE pr_clr_err_msg IS
  BEGIN
    pr_load_gvs;
    pkwf_99_err.pr_reset (pi_k => gv_k);  
  END pr_clr_err_msg;
  -- 
  FUNCTION fn_get_err_msg RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    RETURN pkwf_99_err.fn_lst_msg (pi_k => gv_k);  
  END fn_get_err_msg;
  --  
  FUNCTION fn_plout RETURN BOOLEAN IS
  BEGIN
    pr_reset;    
    pkwf_99_sss.pr_clr_ses;
    RETURN TRUE;
  END fn_plout;
  --  
  FUNCTION fn_lout RETURN BOOLEAN IS
  BEGIN
    pr_reset;    
    pr_load_gvs;
    pkwf_99_sss.pr_lgnoff (pi_k => gv_k);
    RETURN TRUE;
  END fn_lout;
  --
  PROCEDURE pr_commit IS
  BEGIN
    COMMIT;
  END pr_commit;
  --
  PROCEDURE pr_ass (pi_d VARCHAR2) IS
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;
      pkwf_99_sss.pr_set_app (pi_k => gv_k, pi_p1 => pi_d);
    END IF;
  END pr_ass;
  --
  PROCEDURE pr_rollback IS
  BEGIN
    ROLLBACK;
  END pr_rollback;
  --  
  FUNCTION fn_acs_cs RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'CS');
    END IF;
    RETURN v_bool;
  END;
  --
  FUNCTION fn_acs_dd RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'DD');
    END IF;
    RETURN v_bool;
  END;
  --  
  FUNCTION fn_acs_gl RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'GL');
    END IF;
    RETURN v_bool;
  END;
  --    
  FUNCTION fn_acs_st RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'ST');
    END IF;
    RETURN v_bool;
  END;
  --    
  FUNCTION fn_acs_ln RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'LN');
    END IF;
    RETURN v_bool;
  END;
  --    
  FUNCTION fn_acs_fa RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'FA');
    END IF;
    RETURN v_bool;
  END;
  --    
  FUNCTION fn_acs_am RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'AM');
    END IF;
    RETURN v_bool;
  END;
  --    
  FUNCTION fn_acs_tu RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'TU');
    END IF;
    RETURN v_bool;
  END;
  --  
  FUNCTION fn_acs_ps RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'PS');
    END IF;
    RETURN v_bool;
  END;
  --    
  FUNCTION fn_acs_ch RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'CH');
    END IF;
    RETURN v_bool;
  END;
  --  
  FUNCTION fn_acs_tr RETURN BOOLEAN IS
    v_bool BOOLEAN := FALSE;
  BEGIN
    IF fn_atc THEN
      pr_load_gvs;  
      v_bool := pkwf_99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => 'TR');
    END IF;
    RETURN v_bool;
  END;
  --   
  FUNCTION fn_lmsg_shw RETURN BOOLEAN IS
  BEGIN
    RETURN TRUE;--pk99$$sym_lic.fn_exshw;
  END;
  -- 
  FUNCTION fn_lmsg_txt RETURN VARCHAR2 IS
  BEGIN
    RETURN NULL; --pk99$$sym_lic.fn_exmsg;
  END;
  --   
END pk$990;