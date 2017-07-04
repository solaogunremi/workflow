CREATE OR REPLACE PACKAGE pkwf_99_dtm AUTHID DEFINER AS 
 /**
  * ===========================================================<br/>
  *  PURPOSE : Date/Time Parameters <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 25-oct-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Returns System Date, including time
  */
  FUNCTION fn_sys_dtm RETURN DATE;
  --
  /**
    * Returns System Date, excluding time 
  */
  FUNCTION fn_sys_dt RETURN DATE;
  --
  /**
    * Returns Organization Timestamp with Timezone 
  */
  FUNCTION fn_sys_tmm RETURN v_99_99_dtm.tms_tz%TYPE;
  --
  /**
    * Returns TIMESTAMP WITH TIMEZONE as DD-MON-YYYY HH24:MI:SS AM (TIMEZONE)
  */  
  FUNCTION fn_tmm_dsc (pi_tmm IN "TIMESTAMP WITH TIME ZONE") RETURN VARCHAR2;
  --
  /**
    * Returns DATE as DD-MON-YYYY HH24:MI:SS AM
  */  
  FUNCTION fn_dtm_dsc (pi_dtm IN DATE) RETURN VARCHAR2;
  --  
END pkwf_99_dtm;
/

