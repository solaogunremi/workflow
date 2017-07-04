CREATE OR REPLACE PACKAGE BODY pkwf_99_gen AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 15-dec-2012
  ** Release Version  : 2.0
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
  **
  */
  --
  /* Private Routines */
  --
  gv_k                  VARCHAR2(100);
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
  END pr_load_gvs;
  --
  --       
  /* Public Routines */
  --
  FUNCTION fn_pending_rec (pi_rs NUMBER) RETURN BOOLEAN IS
  BEGIN
    IF pi_rs IN (-1,0) THEN 
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_pending_rec;
  --
  FUNCTION fn_approved_rec (pi_rs NUMBER) RETURN BOOLEAN IS
  BEGIN
    IF pi_rs = 1 THEN 
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_approved_rec;
  --  
END pkwf_99_gen;
/

