CREATE OR REPLACE PACKAGE BODY pkwf_99_dtm AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 25-oct-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Date/Time Parameters
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
  gv_k         VARCHAR2(100);
  gv_time      v_99_99_dtm.tms_tz%TYPE;
  --
  /* Private Routines */
  --
  --
  PROCEDURE pr_load_gvs IS
    v_tmz       VARCHAR2(100);
    v_dflt_tmz  VARCHAR2(100) := 'UTC+01:00'; -- 'GMT'; 
  BEGIN
    --
    gv_time := NULL;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    -- Using Authenticated User Timezone Offset
    v_tmz := pkwf_99_sss.fn_usr_tmz_offset (gv_k);
    IF v_tmz IS NOT NULL THEN
      BEGIN
        gv_time := CURRENT_TIMESTAMP AT TIME ZONE v_tmz;
      EXCEPTION
        WHEN others THEN
          NULL;
      END;
    END IF;
    --
    -- Using Default
    IF gv_time IS NULL THEN
      BEGIN
        gv_time := CURRENT_TIMESTAMP AT TIME ZONE v_dflt_tmz;
      EXCEPTION
        WHEN others THEN
          NULL;
      END;
    END IF;
    --    
    -- Last option - Use Current Timestamp
    IF gv_time IS NULL THEN
      gv_time := CURRENT_TIMESTAMP;
    END IF;
    --    
  END pr_load_gvs;
  --  
  --    
  /* Public Routines */
  --  
  -- Returns System Date, including time
  FUNCTION fn_sys_dtm RETURN DATE IS
    v_dt   DATE;
  BEGIN
    pr_load_gvs;
    v_dt := CAST(gv_time AS DATE);
    IF v_dt IS NULL THEN
      v_dt := SYSDATE;
    END IF;
    RETURN v_dt;
  END fn_sys_dtm;
  --
  -- Returns System Date, excluding time 
  FUNCTION fn_sys_dt RETURN DATE IS
  BEGIN
    RETURN TRUNC(fn_sys_dtm);
  END fn_sys_dt;
  --  
  -- Returns System Timestamp
  FUNCTION fn_sys_tmm RETURN v_99_99_dtm.tms_tz%TYPE IS
  BEGIN
    pr_load_gvs;
    RETURN gv_time;
  END fn_sys_tmm;
  --    
  -- Returns Timestamp as DD-MON-YYYY HH24:MI:SS AM (TIMEZONE)
  FUNCTION fn_tmm_dsc (pi_tmm IN "TIMESTAMP WITH TIME ZONE") RETURN VARCHAR2 IS
  BEGIN
    IF pi_tmm IS NOT NULL THEN
      RETURN TO_CHAR(pi_tmm,'DD-MON-YYYY HH24:MI:SS AM (TZR)');
      -- RETURN TO_CHAR(pi_tmm,'DD-MON-YYYY HH24:MI:SS AM (TZH:TZM)');
    ELSE
      RETURN NULL;
    END IF;
  END fn_tmm_dsc;
  --      
  -- Returns Date as DD-MON-YYYY HH24:MI:SS AM 
  FUNCTION fn_dtm_dsc (pi_dtm IN DATE) RETURN VARCHAR2 IS
  BEGIN
    IF pi_dtm IS NOT NULL THEN
      RETURN TO_CHAR(pi_dtm,'DD-MON-YYYY HH24:MI:SS AM');
    ELSE
      RETURN NULL;
    END IF;
  END fn_dtm_dsc;
  --        
END pkwf_99_dtm;
/

