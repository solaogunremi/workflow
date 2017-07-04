CREATE OR REPLACE PACKAGE BODY pk99_90_wf AS
  --
  /* Created By       : Aderemi Alabi 
  ** Date Created     : 20-APR-2016
  **
  ** PURPOSE: WF Routines for SSU Sharing
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
   /* Package Variables */
  -- 
  pv_ls logger_logs.scope%type := $$plsql_unit;
  --pv_lp logger.tab_param;
  --
  /* Private Routines */
  --  
  --
  /* Public Routines */
  -- 
  PROCEDURE pr_inherit_user(pi_k IN NUMBER) IS
    --
      v_k   VARCHAR2(100);
      v_ssu NUMBER;
    --
    CURSOR c_ssu IS
      SELECT r_k
      FROM   t_99_10_ssu@wf_sy a
      WHERE  r_k = pi_k
      AND NOT EXISTS (SELECT 1
                        FROM   t_99_10_ssu b
                        WHERE  a.lgn_id = b.lgn_id);
    --  
  BEGIN
    --
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO v_k
    FROM dual;
    --
    OPEN  c_ssu;
    FETCH c_ssu INTO v_ssu;
    CLOSE c_ssu;
    --
    IF NVL(v_ssu, 0) > 0 THEN
      pk99_trg.pr_set_sdml (pi_k => v_k);
      INSERT INTO t_99_10_ssu 
      SELECT * FROM t_99_10_ssu@wf_sy where r_k = pi_k;
      UPDATE t_99_10_ssu SET trc_yn = '1' WHERE r_k = pi_k;
      pk99_trg.pr_reset_sdml;
    END IF;      
    -- 
  END pr_inherit_user;
  -- 
  --
END pk99_90_wf; 
/
