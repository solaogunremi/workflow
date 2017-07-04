CREATE OR REPLACE PACKAGE pkwf_99_acp AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Access Privileges Routines <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 27-OCT-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Returns TRUE if Current User can access the Application
    * @param pi_apl_dm  Application 
  */
  FUNCTION fn_apl_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's access to the Application
    * @param pi_apl_dm  Application 
  */  
  PROCEDURE pr_apl_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2);
  --
  /**
    * Returns TRUE if Current User can access the Application Sub-Module
    * @param pi_apl_dm      Application 
    * @param pi_submod_dm   Sub-module 
  */
  FUNCTION fn_submod_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_submod_dm VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's access to the Application Sub-Module
    * @param pi_apl_dm      Application 
    * @param pi_submod_dm   Sub-module
  */  
  PROCEDURE pr_submod_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_submod_dm VARCHAR2);
  --  
  /**
    * Returns TRUE if Current User has EDIT privilege on the Role
    * @param pi_apl_dm      Application 
    * @param pi_rol_id      Role ID
  */  
  FUNCTION fn_rol_edt_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's EDIT privilege on the Role
    * @param pi_apl_dm      Application 
    * @param pi_rol_id      Role ID
  */  
  PROCEDURE pr_rol_edt_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2);
  --  
  /**
    * Returns TRUE if Current User has VERIFY privilege on the Role
    * @param pi_apl_dm      Application 
    * @param pi_rol_id      Role ID
  */  
  FUNCTION fn_rol_vrf_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's VERIFY privilege on the Role
    * @param pi_apl_dm      Application 
    * @param pi_rol_id      Role ID
    * @param pi_ins_uky     Created By User key    
  */  
  PROCEDURE pr_rol_vrf_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2, pi_ins_uky IN NUMBER);
  -- 
  /**
    * Returns TRUE if Current User has APPROVAL privilege on the Role
    * @param pi_apl_dm      Application 
    * @param pi_rol_id      Role ID
  */  
  FUNCTION fn_rol_apr_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Validate Current User's APPROVAL privilege on the Role
    * @param pi_apl_dm      Application 
    * @param pi_rol_id      Role ID
    * @param pi_ins_uky     Created By User key
  */  
  PROCEDURE pr_rol_apr_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2, pi_ins_uky IN NUMBER);
  --  
  /**
    * Log Function access
  */  
  PROCEDURE pr_log_fnc_acs;
  --  
END pkwf_99_acp;
/

