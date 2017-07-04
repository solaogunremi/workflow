CREATE OR REPLACE PACKAGE BODY pkwf_99_glb AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: SME Globals
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
  gv_k           VARCHAR2(100);
  --  
  /* Private Routines */
  --
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
  -- Validate Session Connection
  FUNCTION fn_vld_conn (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN pkwf_99_sss.fn_vld_conn (pi_k);
  END fn_vld_conn;
  --  
  -- Returns User Key
  FUNCTION fn_usr_key (pi_k VARCHAR2) RETURN NUMBER IS
  BEGIN
    RETURN pkwf_99_sss.fn_usr_key (pi_k);
  END fn_usr_key;
  --  
  -- Return User ID
  FUNCTION fn_usr_id (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_99_sss.fn_usr_id (pi_k);
  END fn_usr_id;
  --
  -- Return User Type
  FUNCTION fn_usr_typ (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_99_sss.fn_usr_typ (pi_k); 
  END fn_usr_typ;
  --    
  -- Return User Language
  FUNCTION fn_usr_lang (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_99_sss.fn_usr_lang (pi_k);
  END fn_usr_lang;
  --  
  -- Return Logon Key
  FUNCTION fn_lgn_key (pi_k VARCHAR2) RETURN NUMBER IS
  BEGIN
    RETURN pkwf_99_sss.fn_lgn_key (pi_k);
  END fn_lgn_key;
  --   
  -- Return Currently running Function
  FUNCTION fn_fnc_id (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_99_sss.fn_fnc_id (pi_k);
  END fn_fnc_id;
  -- 
  -- Returns TRUE if user is a SYSTEM ADMIN
  FUNCTION fn_is_adm_usr (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN pkwf_99_sss.fn_is_adm_usr (pi_k);
  END fn_is_adm_usr;
  -- 
  FUNCTION fn_log_err (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN FALSE;
  END fn_log_err;
  --  
  FUNCTION fn_log_qry (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN FALSE;
  END fn_log_qry;
  --  
  FUNCTION fn_log_trc (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN FALSE;
  END fn_log_trc;
  -- 
  FUNCTION fn_get_rk (pi_k VARCHAR2) RETURN NUMBER IS
    v_n   NUMBER;
  BEGIN
    v_n := NULL;
    pr_load_gvs;
    IF pi_k = gv_k THEN
      BEGIN
        SELECT S_99_RK.NEXTVAL
        INTO v_n
        FROM DUAL;
      END;
    END IF;
    RETURN v_n;
  END fn_get_rk;
  --
  FUNCTION fn_get_au_rk (pi_k VARCHAR2) RETURN NUMBER IS
    v_n   NUMBER;
  BEGIN
    v_n := NULL;
    pr_load_gvs;
    IF pi_k = gv_k THEN
      BEGIN
        SELECT S_99_RK.NEXTVAL
        INTO v_n
        FROM DUAL;
      END;
    END IF;
    RETURN v_n;
  END fn_get_au_rk;
  --  
  FUNCTION fn_get_cor_rk (pi_k VARCHAR2) RETURN NUMBER IS
    v_n   NUMBER;
  BEGIN
    v_n := NULL;
    pr_load_gvs;
    IF pi_k = gv_k THEN
      BEGIN
        SELECT S_99_00_RK.NEXTVAL
        INTO v_n
        FROM DUAL;
      END;
    END IF;
    RETURN v_n;
  END fn_get_cor_rk;
  --  
  -- Returns TRUE if Name is a reserved name and cannot be used as USER ID
  FUNCTION fn_is_invalid_usr_id (pi_k VARCHAR2, pi_id VARCHAR2) RETURN BOOLEAN IS
    --
    v_usr_id  VARCHAR2(100);
    v_bool    BOOLEAN;
    v_yn      PLS_INTEGER;
    --
    CURSOR cur_prohibited_names IS
    SELECT 1
    FROM t_99_10_pun
    WHERE UPPER(nm_txt) = v_usr_id;
    --
  BEGIN
    --
    v_bool := TRUE;
    pr_load_gvs;
    --
    IF pi_k = gv_k AND pi_id IS NOT NULL THEN
      --
      v_bool := FALSE;
      v_usr_id := UPPER(SUBSTR(pi_id,1,100));
      --
      IF pkwf_99_ssi.fn_is_rsv_usr_id (pi_k => gv_k, pi_d => v_usr_id) THEN
        v_bool := TRUE;
      ELSIF v_usr_id IN ('SYS','SYSTEM','ORACLE','ADMIN','ADMINISTRATOR','DATABASE','APEX','PG_OWNER','PG_ADMIN') THEN
        v_bool := TRUE;
      ELSIF v_usr_id IN ('GUEST','EXECUTIVE','OPERATOR','MANAGER','USER','PASSWORD','WINDOWS','UNIX','LINUX','SETUP') THEN
        v_bool := TRUE;        
      END IF;
      --
      IF NOT v_bool THEN
        --
        v_yn := 0;
        OPEN cur_prohibited_names;
        FETCH cur_prohibited_names INTO v_yn;
        CLOSE cur_prohibited_names;
        --
        IF v_yn = 1 THEN
          v_bool := TRUE;
        END IF;
        --
      END IF;
      --
    END IF;
    --
    RETURN v_bool;
    --
  END fn_is_invalid_usr_id;
  --
  -- Validate Connection
  PROCEDURE pr_vld_conn IS
  BEGIN
    pr_load_gvs;
    pkwf_99_sss.pr_vld_sss (pi_k => gv_k);
  END pr_vld_conn;
  -- 
  -- Returns TRUE if User is a Reserved Internal User
  FUNCTION fn_is_rsv_usr (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
    v_bool    BOOLEAN;
  BEGIN
    pr_load_gvs;
    v_bool := FALSE;
    IF pi_k = gv_k THEN
      v_bool := pkwf_99_ssi.fn_is_ssi_usr (pi_k => gv_k, pi_d => pi_d);
    END IF;
    RETURN v_bool;
  END fn_is_rsv_usr;
  --   
  -- Returns KEY if User is a Reserved Internal User
  FUNCTION fn_rsv_usr_ky (pi_k VARCHAR2, pi_d VARCHAR2) RETURN NUMBER IS
    v_key  NUMBER;
  BEGIN
    pr_load_gvs;
    v_key := NULL;
    IF pi_k = gv_k THEN
      v_key := pkwf_99_ssi.fn_ssi_ky (pi_k => gv_k, pi_d => pi_d);
    END IF;
    RETURN v_key;
  END fn_rsv_usr_ky;
  --   
END pkwf_99_glb;
/

