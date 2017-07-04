create or replace PACKAGE pk$990 AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Login Authorization <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 15-dec-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Custom User Authentication
    * @param p_username  User Name
    * @param p_password  User Password
  */
  FUNCTION fn_login (p_username VARCHAR2, p_password VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Custom User Authentication (System Admin application)
    * @param p_username  User Name
    * @param p_password  User Password
  */
  FUNCTION fn_loginsa (p_username VARCHAR2, p_password VARCHAR2) RETURN BOOLEAN;
  --  
  /**
    * Custom User Authentication (Pre-Login Authentication)
    * @param pi_k  User Name
  */
  PROCEDURE pr_blath (pi_k VARCHAR2 DEFAULT NULL);
  --
  /**
    * Custom User Authentication (Post-Login Authentication)
    * @param pi_k  Session ID
  */
  PROCEDURE pr_alath (pi_k VARCHAR2 DEFAULT NULL);
  --
  /**
    * Custom User Authentication (Post-Login Authentication for external Non-Apex applications)
  */
  PROCEDURE pr_alathx (pi_k VARCHAR2 DEFAULT NULL);
  --  
  /**
    * Returns TRUE if Connection is valid and authenticated
  */
  FUNCTION fn_atc RETURN BOOLEAN;
  --
  /**
    * Returns TRUE if Connection is valid and authenticated (System Admin)
  */  
  FUNCTION fn_atcsa RETURN BOOLEAN;
  --
  /**
    * Clears Error Message Items
  */
  PROCEDURE pr_clr_err_msg;
  --
  /**
    * Returns Latest Error Message
  */
  FUNCTION fn_get_err_msg RETURN VARCHAR2;
  --
  /**
    * Pre-Logout processing
  */
  FUNCTION fn_plout RETURN BOOLEAN;
  --    
  /**
    * Custom Logout processing
  */
  FUNCTION fn_lout RETURN BOOLEAN;
  --  
  /**
    * Commit or Rollback
  */  
  PROCEDURE pr_commit;
  PROCEDURE pr_rollback;
  --
  /** 
    * Set Application Session parameters
  */    
  PROCEDURE pr_ass (pi_d VARCHAR2); 
  -- 
  /** 
    * Module Privileges
  */   
  FUNCTION fn_acs_cs RETURN BOOLEAN;
  FUNCTION fn_acs_dd RETURN BOOLEAN;
  FUNCTION fn_acs_gl RETURN BOOLEAN;
  FUNCTION fn_acs_ch RETURN BOOLEAN;
  FUNCTION fn_acs_fa RETURN BOOLEAN;
  FUNCTION fn_acs_st RETURN BOOLEAN;
  FUNCTION fn_acs_ln RETURN BOOLEAN;
  FUNCTION fn_acs_am RETURN BOOLEAN;
  FUNCTION fn_acs_ps RETURN BOOLEAN;
  FUNCTION fn_acs_tu RETURN BOOLEAN;
  FUNCTION fn_acs_tr RETURN BOOLEAN;
  --
  /** 
    * Licensing
  */     
  FUNCTION fn_lmsg_shw RETURN BOOLEAN;
  FUNCTION fn_lmsg_txt RETURN VARCHAR2;
  --
END pk$990;