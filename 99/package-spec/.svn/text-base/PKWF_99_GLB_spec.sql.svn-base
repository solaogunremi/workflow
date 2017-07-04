CREATE OR REPLACE PACKAGE pkwf_99_glb AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Global Routines <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
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
    * Returns Currently running Function 
  */   
  FUNCTION fn_fnc_id (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns TRUE if User is an Administrator
  */   
  FUNCTION fn_is_adm_usr (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if Program Errors are logged for Current User
  */   
  FUNCTION fn_log_err (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if User Queries are logged for Current User
  */   
  FUNCTION fn_log_qry (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if Program tracing is turned on for Current User
  */   
  FUNCTION fn_log_trc (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns Next Record Key
  */   
  FUNCTION fn_get_rk (pi_k VARCHAR2) RETURN NUMBER;
  -- 
  /** 
    * Returns Next Audit Record Key
  */   
  FUNCTION fn_get_au_rk (pi_k VARCHAR2) RETURN NUMBER;
  -- 
  /** 
    * Returns Next CORE tables Record Key
  */   
  FUNCTION fn_get_cor_rk (pi_k VARCHAR2) RETURN NUMBER;
  --   
  /** 
    * Returns TRUE if Input is prohibited from usage as USER ID
  */   
  FUNCTION fn_is_invalid_usr_id (pi_k VARCHAR2, pi_id VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Validate Session Connection
  */      
  PROCEDURE pr_vld_conn;
  -- 
  /** 
    * Returns TRUE if Input User is any of the Internal Reserved Users
  */     
  FUNCTION fn_is_rsv_usr (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  /** 
    * Returns User Key of the Input User if any of the Internal Reserved Users
  */    
  FUNCTION fn_rsv_usr_ky (pi_k VARCHAR2, pi_d VARCHAR2) RETURN NUMBER;
  --   
END pkwf_99_glb;
/

