create or replace PACKAGE BODY pkwf_00 AS
  --
  /* Created By       : Mike Onuoha
  ** Date Created     : 06-SEPT-2012
  ** Release Version  : 3.0
  **
  ** PURPOSE: General Routines
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
  ** Copyright:  ProGenics Corp. Ltd, 2012
  **
  */
  --
  /* Package Variables */
  --
  gv_k                VARCHAR2(100);
  --
  /* Private Routines */
  --  
  FUNCTION fn_dmv_dsc (pi_dm_id VARCHAR2, pi_dmv_id VARCHAR2) RETURN VARCHAR2 IS
    v_dsc  wf_00_00_dmv.dmv_dsc%TYPE;
    CURSOR cur_dmv IS
    SELECT A.dmv_dsc
      FROM wf_00_00_dmv A, wf_00_00_dmd b
     WHERE b.dmd_dm = pi_dm_id
       AND b.row_key = A.dmd_k
       AND A.dmv_id = pi_dmv_id
       AND A.ius_yn = 1;
  BEGIN
    v_dsc := NULL;
    OPEN cur_dmv;
    FETCH cur_dmv INTO v_dsc;
    CLOSE cur_dmv;
    RETURN v_dsc;
  END fn_dmv_dsc;
  --
  FUNCTION fn_valid_conn RETURN BOOLEAN IS
  BEGIN
    RETURN TRUE; --pk99$$00.fn_valid_session;
  END fn_valid_conn;
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
  -- Next Row Key
  FUNCTION fn_nxt_key RETURN NUMBER IS
  BEGIN
    RETURN s_99_rk.NEXTVAL;
  END fn_nxt_key;
  --
  -- Current DB Time
  FUNCTION fn_now RETURN TIMESTAMP IS
  BEGIN
    RETURN SYSDATE; -- pk99$$00.fn_sys_dtm;
  END fn_now;
  --
  -- Current APEX User
  FUNCTION fn_crnt_apx_usr RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_00_apx.fn_crnt_apx_usr;
  END fn_crnt_apx_usr;
  --
  -- Current APEX Application
  FUNCTION fn_crnt_apx_ap RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_00_apx.fn_crnt_apx_ap;
  END fn_crnt_apx_ap;
  --
  -- Current APEX Page
  FUNCTION fn_crnt_apx_pg RETURN VARCHAR2 IS
  BEGIN
    RETURN pkwf_00_apx.fn_crnt_apx_pg;
  END fn_crnt_apx_pg;
  --
  -- Current APEX User Agent
  FUNCTION fn_crnt_apx_ag RETURN VARCHAR2 IS
  BEGIN
   RETURN pkwf_00_apx.fn_crnt_apx_ag;
  END fn_crnt_apx_ag;
  --
  -- Current APEX User IP
  FUNCTION fn_crnt_apx_ip RETURN VARCHAR2 IS
  BEGIN
   RETURN pkwf_00_apx.fn_crnt_apx_ip;
  END fn_crnt_apx_ip;
  --
  -- Counter Number
  FUNCTION fn_c_n (pi_c_n IN NUMBER) RETURN NUMBER IS
    v_c_n NUMBER;
  BEGIN
    v_c_n := NVL(pi_c_n,0) + 1;
    RETURN v_c_n;
  END fn_c_n;
  --
  -- User Key
  FUNCTION fn_usr_ky RETURN NUMBER IS
  BEGIN
    pr_load_gvs;
    RETURN pkwf_99_sss.fn_usr_key(gv_k);
  END fn_usr_ky;
  --
  -- APPR_STAT_DSC
  FUNCTION fn_appr_stat(pi_id IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE IS
  BEGIN
    RETURN fn_dmv_dsc (pi_dm_id => '00_APPR_STAT', pi_dmv_id => pi_id);
  END fn_appr_stat;
  --
  -- YN columns
  FUNCTION fn_yn(pi_id IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE IS
  BEGIN
    RETURN fn_dmv_dsc (pi_dm_id => '00_YES_NO', pi_dmv_id => pi_id);
  END fn_yn;
  --
  PROCEDURE pr_commit IS
  BEGIN
    COMMIT;
  END pr_commit;
  --
  PROCEDURE pr_rollback IS
  BEGIN
    ROLLBACK;
  END pr_rollback;
  --
  FUNCTION fn_bus_dt RETURN DATE IS
  BEGIN
    RETURN SYSDATE;--pk99$$00.fn_bus_dt;
  END;
END pkwf_00;