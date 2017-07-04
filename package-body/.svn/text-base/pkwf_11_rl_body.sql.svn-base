CREATE OR REPLACE PACKAGE BODY pkwf_11_rl AS
  --
  /* Created By       : Aderemi Alabi
  ** Date Created     : 10-JUN-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: Workflow Role Management
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
  --
  gv_k                  VARCHAR2(100);
  r_gv_k                VARCHAR2(100);
  v_is_valid_session    BOOLEAN := FALSE;
  r_v_is_valid_session  BOOLEAN := FALSE;
  --
  /* Private Routines */
  -- 
  -- global variables
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
    v_is_valid_session := pkwf_99_glb.fn_vld_conn (gv_k);
    --
  END pr_load_gvs;
  --
  --
  /* Public Routines */
  --      
  --
  --    
  /* Public Routines */
  -- 
--  Create Role
  PROCEDURE pr_create(pi_rec IN r_rl) IS
  BEGIN
    --
    INSERT INTO wf_10_rl(row_key, rl_id, rl_dsc, iu_yn)
    VALUES (wf_seq_00_key.NEXTVAL, pi_rec.rl_id, 
           pi_rec.rl_dsc, NVL(pi_rec.iu_yn,'0'));
  END pr_create;  
  --
  --  Update Role
  PROCEDURE pr_update(pi_rec IN r_rl) IS
  BEGIN
    --
    UPDATE wf_10_rl
    SET    rl_id  = pi_rec.rl_id, 
           rl_dsc = pi_rec.rl_dsc, 
           iu_yn  = pi_rec.iu_yn
    WHERE  row_key = pi_rec.rl_k; 
    --       
  END pr_update;  
  --
  --  Delete Role
  PROCEDURE pr_delete(pi_k IN NUMBER) IS
  BEGIN
    -- Remove main record
    DELETE FROM wf_10_rl WHERE row_key = pi_k;
    -- Remove other assignments
    UPDATE wf_10_tp_tk
    SET    ac_rl_k = NULL
    WHERE  ac_rl_k = pi_k;
    --
    DELETE FROM wf_10_rl_mb
    WHERE rl_k = pi_k;
    --
  END pr_delete;
  --  
  --
END pkwf_11_rl;
/
