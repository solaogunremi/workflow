CREATE OR REPLACE PACKAGE pkwf_00_apx AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : APEX ENGINE interfacing routine <br/>
  *  SCHEMA: SYMPLUS <br/>
  *  Created By       : Kunle Adebona <br/>
  *  Date Created     : 31-AUG-2012 <br/>
  *  Release Version  : 3.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Clear all Application Session values
    * 
  */
  PROCEDURE pr_reset_all_ssv;
  --
  /**
    * Clear Branch Session values
    * 
  */
  PROCEDURE pr_reset_brch_ssv;
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
    * Returns logged on user key
    * 
  */
  FUNCTION fn_usr_ky RETURN NUMBER;
  --
  /**
    * Returns current User's ID
    * 
  */
  FUNCTION fn_usr_id RETURN VARCHAR2;
  -- 
  /**
    * Set User key
    * 
  */
  PROCEDURE pr_set_usr_ky (pi_key NUMBER);
  -- 
  /**
    * Set User key
    * 
  */
  PROCEDURE pr_brch_login (pi_brch_id VARCHAR2, pi_usr_id VARCHAR2);
  --
  /**
    * APEX Wrapper function for String to Table
    * 
  */
  FUNCTION fn_apx_str_to_tbl(pi_str IN VARCHAR2, pi_sep IN VARCHAR2 DEFAULT ':') RETURN APEX_APPLICATION_GLOBAL.vc_arr2;
  --
  /**
    * APEX Wrapper function for Table to String
    * 
  */
  FUNCTION fn_apx_tbl_to_str(pi_tbl IN APEX_APPLICATION_GLOBAL.vc_arr2, pi_sep IN VARCHAR2 DEFAULT ':') RETURN VARCHAR2;
  --
  /**
    * APEX Wrapper function for Authorization 
    * 
  */
  FUNCTION fn_apx_chk_auth(pi_scheme IN VARCHAR2) RETURN NUMBER;
  --  
  /**
    * Clear Parameter Session States 
    *
  */
  --
  PROCEDURE pr_clr_pss;
  --
  /**
    * Set Parameter Session States values for database routines
    *
  */  
  PROCEDURE pr_set_pss (p01 IN VARCHAR2 DEFAULT NULL,  
                        p02 IN VARCHAR2 DEFAULT NULL,
                        p03 IN VARCHAR2 DEFAULT NULL,  
                        p04 IN VARCHAR2 DEFAULT NULL,
                        p05 IN VARCHAR2 DEFAULT NULL,  
                        p06 IN VARCHAR2 DEFAULT NULL,
                        p07 IN VARCHAR2 DEFAULT NULL,  
                        p08 IN VARCHAR2 DEFAULT NULL,
                        p09 IN VARCHAR2 DEFAULT NULL,  
                        p10 IN VARCHAR2 DEFAULT NULL);
  -- 
  /**
    * Reads value of a specific Parameter Session State
    * @param p_no     Parameter Number (between 1 and 10)
    *
  */
  FUNCTION fn_get_pss (p_no PLS_INTEGER) RETURN VARCHAR2;
  -- 
  /**
    * Clear UPDATES Session States 
    *
  */
  --
  PROCEDURE pr_clr_uss;
  --  
  /**
    * Set UPDATES Session States 
    *
  */
  --
  PROCEDURE pr_set_uss;
  --    
  --      
END pkwf_00_apx;
/

