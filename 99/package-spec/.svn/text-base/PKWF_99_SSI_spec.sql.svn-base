CREATE OR REPLACE PACKAGE pkwf_99_ssi AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Internal System Users Processing Routines <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 01-JUNE-2010 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns TRUE if Input User is an Internal System User
    * @param pi_d          User ID
  */   
  FUNCTION fn_is_ssi_usr (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns TRUE if Input User is INSTALLATION ADMINISTRATOR
    * @param pi_d          User ID
  */   
  FUNCTION fn_is_ssi_usr_adm (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Input User is INSTALLATION USER
    * @param pi_d          User ID
  */   
  FUNCTION fn_is_ssi_usr_usr (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Input User is SUPPORT USER
    * @param pi_d          User ID
  */   
  FUNCTION fn_is_ssi_usr_spt (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Input User is ACCOUNTS USER
    * @param pi_d          User ID
  */   
  FUNCTION fn_is_ssi_usr_acc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --    
  /** 
    * Returns Internal System User KEY
    * @param pi_d          User ID
  */   
  FUNCTION fn_ssi_ky (pi_k VARCHAR2, pi_d VARCHAR2) RETURN NUMBER;
  -- 
  /** 
    * Returns Internal System ID
    * @param pi_rk          User key
  */   
  FUNCTION fn_ssi_id (pi_k VARCHAR2, pi_rk NUMBER) RETURN VARCHAR2;
  --    
  /** 
    * Returns TRUE if Logon User is an Internal System User
  */   
  FUNCTION fn_is_ssi_lgn_usr (pi_k VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns TRUE if Logon User is INSTALLATION ADMINISTRATOR
  */   
  FUNCTION fn_is_apl_adm (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Logon User is INSTALLATION USER
  */   
  FUNCTION fn_is_apl_usr (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Logon User is SYSTEM SUPPORT
  */   
  FUNCTION fn_is_spt_usr (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Logon User is SYSTEM ACCOUNTS
  */   
  FUNCTION fn_is_acc_usr (pi_k VARCHAR2) RETURN BOOLEAN;
  --     
  FUNCTION fn_itl_adm_id (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns Installation User ID
  */   
  FUNCTION fn_itl_usr_id (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns TRUE if Input User ID is reserved for INTERNAL use
    * @param pi_d          User ID
  */   
  FUNCTION fn_is_rsv_usr_id (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --   
  FUNCTION fn_dflt_ipw (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns TRUE if User has been verified after logon
  */   
  FUNCTION fn_is_vrf_usr RETURN BOOLEAN;
  --    
  /** 
    * Inserted into any procedure to ensure that INTERNAL USERS cannot execute that Procedure
  */     
  PROCEDURE pr_rej_itl_usr (pi_k VARCHAR2);
  --
  /** 
    * Inserted into any procedure to ensure that only INTERNAL USERS can execute that Procedure
  */     
  PROCEDURE pr_only_itl_usr (pi_k VARCHAR2);
  -- 
  /** 
    * Checks that INSTALLATION ADMIN password has been set
  */     
  PROCEDURE pr_chk_adm_rst_pw (pi_k VARCHAR2);
  --  
END pkwf_99_ssi;
/

