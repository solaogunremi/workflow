CREATE OR REPLACE PACKAGE pkwf_99_sss AUTHID DEFINER AS 
 /**
  * ===========================================================<br/>
  *  PURPOSE : Session States Processing <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Reset PARAMETERS Session States
  */
  PROCEDURE pr_clr_pmr (pi_k  VARCHAR2);
  --
  /**
    * Reset USER AUTHENTICATION Session States
  */
  FUNCTION fn_clr_usr (pi_k  VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Reset Current Module 
  */
  PROCEDURE pr_clr_apl (pi_k  VARCHAR2);
  --
  /**
    * Clear Application Session States (Pre Logout)
  */
  PROCEDURE pr_clr_ses;
  --  
  /**
    * Logout
  */
  PROCEDURE pr_lgnoff (pi_k  VARCHAR2);
  --
 /**
    * Returns Error Code if Session States are invalid
  */
  FUNCTION fn_sss_err (pi_k VARCHAR2) RETURN VARCHAR2;
  --
 /**
    * Validate Session States
  */
  PROCEDURE pr_vld_sss (pi_k  VARCHAR2);
  --
 /**
    * Validate that application is not in DEMO mode
  */
  PROCEDURE pr_chk_demo_app;
  --  
 /**
    * Set Authenticated Session parameters
  */  
  PROCEDURE pr_set_ath (pi_r  IN v_99_99_sss%rowtype);
  --
  /** 
    * Returns Validity of Session Connection
  */ 
  FUNCTION fn_vld_conn (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns Current User Key
  */   
  FUNCTION fn_usr_key (pi_k VARCHAR2) RETURN NUMBER;
  -- 
  /** 
    * Returns Current User ID
  */   
  FUNCTION fn_usr_id (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns Current User Type
  */   
  FUNCTION fn_usr_typ (pi_k VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Returns Current User Language
  */   
  FUNCTION fn_usr_lang (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns Current User Logon Key
  */   
  FUNCTION fn_lgn_key (pi_k VARCHAR2) RETURN NUMBER;
  -- 
  /** 
    * Returns TRUE if User is an Administrator
  */   
  FUNCTION fn_is_adm_usr (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns User Timezone Offset
  */   
  FUNCTION fn_usr_tmz_offset (pi_k VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Returns User Timezone Region
  */   
  FUNCTION fn_usr_tmz_region (pi_k VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Returns User's current application
  */   
  FUNCTION fn_crnt_appl (pi_k VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Returns TRUE if User can only run in query mode
  */   
  FUNCTION fn_query_only (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns Current User Key (AUDIT only)
  */   
  FUNCTION fn_au_uk (pi_k VARCHAR2) RETURN NUMBER;
  --   
  /** 
    * Returns Current User Logon Key (AUDIT only)
  */   
  FUNCTION fn_au_lk (pi_k VARCHAR2) RETURN NUMBER;
  --   
  /** 
    * Returns Currently running Function 
  */   
  FUNCTION fn_fnc_id (pi_k VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Returns TRUE if currently Sys Admin application
  */   
  FUNCTION fn_crnt_appl_sa (pi_k VARCHAR2) RETURN BOOLEAN;
  --   
  /** 
    * Returns Authenticated Result Code Value.
  */    
  FUNCTION fn_ars_val RETURN NUMBER;
  --
  /** 
    * Set Application Session parameters
  */    
  PROCEDURE pr_set_app (pi_k VARCHAR2, pi_p1 VARCHAR2);
  --  
END pkwf_99_sss;
/

