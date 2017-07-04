create or replace PACKAGE pk99$$wf AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : WF Application Privileges <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 27-jan-2013 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Returns TRUE if Current User can access the Application
  */
  FUNCTION fn_appl_acs RETURN BOOLEAN;
  --
  /**
    * Validate Current User's access to the Application
  */  
  PROCEDURE pr_val_appl_acs;
  --
  /**
    * Returns TRUE if Current User can access the Application Sub-Module
    * @param pi_smdl_id   Sub-module 
  */
  FUNCTION fn_smdl_acs (pi_smdl_id VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's access to the Application Sub-Module
    * @param pi_smdl_id   Sub-module
  */  
  PROCEDURE pr_val_smdl_acs (pi_smdl_id VARCHAR2);
  --  
  /**
    * Returns TRUE if Current User has EDIT privilege on the Role
    * @param pi_rol_id      Role ID
  */  
  FUNCTION fn_edt_prv (pi_rol_id VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's EDIT privilege on the Role
    * @param pi_rol_id      Role ID
  */  
  PROCEDURE pr_val_edt_prv (pi_rol_id VARCHAR2);
  --  
  /**
    * Returns TRUE if Current User has VERIFY privilege on the Role
    * @param pi_rol_id      Role ID
  */  
  FUNCTION fn_vrf_prv (pi_rol_id VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's VERIFY privilege on the Role
    * @param pi_rol_id      Role ID
    * @param pi_edt_uky     Created/Edited By User key    
  */  
  PROCEDURE pr_val_vrf_prv (pi_rol_id VARCHAR2, pi_edt_uky IN NUMBER);
  -- 
  /**
    * Returns TRUE if Current User has APPROVAL privilege on the Role
    * @param pi_rol_id      Role ID
  */  
  FUNCTION fn_apr_prv (pi_rol_id VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's APPROVAL privilege on the Role
    * @param pi_rol_id      Role ID
    * @param pi_edt_uky     Created/Edited By User key    
  */  
  PROCEDURE pr_val_apr_prv (pi_rol_id VARCHAR2, pi_edt_uky IN NUMBER);
  --  
  /**
    * Log APEX-specific Internal errors
  */ 
  FUNCTION fn_log_apx_err (pi_err IN apex_error.t_error) RETURN NUMBER;
  --  
  /**
    * Validate Company
  */   
  PROCEDURE pr_val_brch (pi_id VARCHAR2);
  -- 
  /**
    * Validate Current User's access to the Company
  */  
  PROCEDURE pr_val_brch_acs (pi_id VARCHAR2);
  --  
  /**
    * Validate Input User's access to the Company
  */  
  PROCEDURE pr_val_brch_acs1 (pi_id VARCHAR2, pi_uk NUMBER);
  --     
  /**
    * Returns Parameter Value
  */  
  FUNCTION fn_b_pmv (pi_id VARCHAR2) RETURN BOOLEAN;
  FUNCTION fn_n_pmv (pi_id VARCHAR2) RETURN NUMBER;
  FUNCTION fn_c_pmv (pi_id VARCHAR2) RETURN VARCHAR2;
  FUNCTION fn_d_pmv (pi_id VARCHAR2) RETURN DATE;
  --  
  /** 
    * Validate License
  */    
  PROCEDURE pr_val_lic;
  --
  /** 
    * Validate Authentication for WF users
  */
  FUNCTION fn_vld_lpw (pi_lu VARCHAR2, pi_lp VARCHAR2) RETURN BOOLEAN ;
  --  
  FUNCTION fn_login(p_username VARCHAR2, p_password VARCHAR2) RETURN BOOLEAN;
  --
  PROCEDURE pr_blath(pi_user IN VARCHAR2);
  --
  PROCEDURE pr_alath;
  --
END pk99$$wf;
/