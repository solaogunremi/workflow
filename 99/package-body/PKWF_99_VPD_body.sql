CREATE OR REPLACE PACKAGE BODY pkwf_99_vpd AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 20-OCTOBER-2010
  ** Release Version  : 2.0
  **
  ** PURPOSE: Virtual Private Data Processing
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
  gv_k                  VARCHAR2(100);
  v_is_valid_session    BOOLEAN := FALSE;
  gv_sess_id            VARCHAR2(100);
  --
  /* Private Routines */
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    v_is_valid_session := FALSE;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    gv_sess_id := TO_CHAR(APEX_CUSTOM_AUTH.GET_SESSION_ID);
    v_is_valid_session := pkwf_99_glb.fn_vld_conn (gv_k);
    --
  END pr_load_gvs;
  --  
  FUNCTION fn_get_vpd_ky RETURN NUMBER IS
  BEGIN
    RETURN pkwf_99_glb.fn_usr_key (gv_k);
  END fn_get_vpd_ky;
  --  
  --
  /* Public Routines */
  --  
  -- 
  FUNCTION fn_vpd_ky RETURN NUMBER IS
  BEGIN
    pr_load_gvs;
    IF v_is_valid_session THEN
      RETURN fn_get_vpd_ky;
    ELSE
      RETURN NULL;
    END IF;
  END fn_vpd_ky;
  --
  FUNCTION fn_vpd_id RETURN VARCHAR2 IS
    v_id  VARCHAR2(500);  
  BEGIN
    v_id := NULL;
    pr_load_gvs;
    IF v_is_valid_session THEN 
      BEGIN
        v_id := APEX_UTIL.GET_SESSION_STATE('SSU_VPDID');
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
      IF v_id IS NULL THEN
        v_id := gv_sess_id||pkwf_99_sss.fn_fnc_id (gv_k);
      END IF;
    END IF;
    RETURN SUBSTR(v_id,1,50);
  END fn_vpd_id;
  --    
  PROCEDURE pr_set_vpd_id (pi_id VARCHAR2 DEFAULT NULL) IS
    v_id  VARCHAR2(500);  
  BEGIN
    v_id := NULL;
    pr_load_gvs;
    IF v_is_valid_session THEN 
      IF pi_id IS NOT NULL THEN
        v_id := pi_id;
      ELSE
        v_id := pkwf_99_sss.fn_fnc_id (gv_k);
      END IF;
      v_id := SUBSTR((gv_sess_id||v_id),1,50);
    END IF;  
    BEGIN
      APEX_UTIL.SET_SESSION_STATE('SSU_VPDID',v_id);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;  
  END pr_set_vpd_id;
  --
  PROCEDURE pr_purge IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_vpd_ky NUMBER;
  BEGIN
    pr_load_gvs;
    v_vpd_ky := fn_get_vpd_ky;
    IF v_vpd_ky > 0 THEN
      -- Delete Logon User data AND all 'stale' (24hrs or older) records
      DELETE FROM T_99_30_VPD 
      WHERE vpd_ky = v_vpd_ky
      AND   vpd_id LIKE gv_sess_id||'%';
      --
      DELETE FROM T_99_30_VPD WHERE i_tm < SYSDATE-1;   
      --      
      COMMIT;
    END IF;
  END pr_purge;
  --
  PROCEDURE pr_purge_all IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    EXECUTE IMMEDIATE ('TRUNCATE TABLE T_99_30_VPD REUSE STORAGE');
    COMMIT;
  END pr_purge_all;
  --  
  PROCEDURE pr_clr_data (pi_id VARCHAR2 DEFAULT NULL) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_vpd_ky  NUMBER;
    v_vpd_id  VARCHAR2(500);
  BEGIN
    pr_load_gvs;
    v_vpd_ky := fn_get_vpd_ky;
    IF v_vpd_ky > 0 THEN
      IF pi_id IS NULL THEN
        v_vpd_id := fn_vpd_id;
      ELSE
        v_vpd_id := SUBSTR((gv_sess_id||pi_id),1,50);
      END IF;    
      IF v_vpd_id IS NULL THEN
        DELETE FROM T_99_30_VPD 
        WHERE vpd_ky = v_vpd_ky
        AND   vpd_id LIKE gv_sess_id||'%';
      ELSE
        DELETE FROM T_99_30_VPD 
        WHERE vpd_ky = v_vpd_ky 
        AND vpd_id = v_vpd_id;
      END IF;
      -- Help to clean up 'stale' (older than 24hrs) data
      DELETE FROM T_99_30_VPD WHERE i_tm < SYSDATE-1;
      --
      COMMIT;
    END IF;
  END pr_clr_data;
  --  
END pkwf_99_vpd;
/

