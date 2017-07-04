create or replace PACKAGE pkwf_00 AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : General Routines <br/>
  *  SCHEMA: SYMPLUS <br/>
  *  Created By       : Kunle Adebona <br/>
  *  Date Created     : 31-AUG-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  --
  /**
    * Returns the next row key
    * 
  */
  FUNCTION fn_nxt_key RETURN NUMBER;
  --
  /**
    * Returns the current DB time
    * 
  */
  FUNCTION fn_now RETURN TIMESTAMP;
  --
  /**
    * Returns the current APEX User
    * 
  */
  FUNCTION fn_crnt_apx_usr RETURN VARCHAR2;
  --
  /**
    * Returns the current APEX Application
    * 
  */
  FUNCTION fn_crnt_apx_ap RETURN VARCHAR2;
  --
  /**
    * Returns the current APEX Page
    * 
  */
  FUNCTION fn_crnt_apx_pg RETURN VARCHAR2;
  --
  /**
    * Returns the current APEX User Agent
    * 
  */
  FUNCTION fn_crnt_apx_ag RETURN VARCHAR2;
  --
  /**
    * Returns the current APEX User IP
    * 
  */
  FUNCTION fn_crnt_apx_ip RETURN VARCHAR2;
  --
  /**
    * Returns the Counter Number
    * 
  */
  FUNCTION fn_c_n(pi_c_n IN NUMBER) RETURN NUMBER;
  --
  /**
    * Returns logged on user key
    * 
  */
  FUNCTION fn_usr_ky RETURN NUMBER;
  --
  /**
    * Returns the Desciption for APPR_STAT_DM
    * 
  */
  FUNCTION fn_appr_stat(pi_id IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  --
  /**
    * Returns the Desciption for YN Columns
    * 
  */
  FUNCTION fn_yn(pi_id  IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  --
  /**
    * Commits a transaction
    * 
  */
  PROCEDURE pr_commit;
  --
  /**
    * Rollbacks a transaction
    * 
  */
  PROCEDURE pr_rollback;
  -- 
  -- Current Business Date
  FUNCTION fn_bus_dt RETURN DATE;
  --
END pkwf_00;