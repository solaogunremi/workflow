CREATE OR REPLACE PACKAGE BODY pkwf_90 AS 
  --
  /* Created By       : Femi Akintoye
  ** Date Created     : 21-MAR-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: Stockbroking Interface to Workflow
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
  /* Package Variables */
  --
  v_k VARCHAR2(100);
  --
  --
  PROCEDURE pr_load IS
  BEGIN
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO v_k
    FROM dual;
    --
  END;
  --
  --
  /* Public Routines */
  --  
  --
  FUNCTION  fn_99_1 (pi_p1 IN VARCHAR2,
                     pi_p2 IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load;
    RETURN pk99_pwm.fn_vld_lpw (pi_k => v_k, pi_lu => pi_p1, pi_lp => pi_p2); 
  END;
  --
  --
END pkwf_90; 
/
