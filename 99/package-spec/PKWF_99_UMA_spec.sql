CREATE OR REPLACE PACKAGE pkwf_99_uma AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : User Maintenance A <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 12-dec-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns TRUE if Login ID already exists 
  */ 
  FUNCTION fn_usr_id_exists (pi_k IN VARCHAR2, pi_usr IN VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns TRUE if Short Name (Reporting ID) already exists 
  */ 
  FUNCTION fn_sht_nm_exists (pi_k IN VARCHAR2, pi_nm IN VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Email Address already exists 
  */ 
  FUNCTION fn_eml_adr_exists (pi_k IN VARCHAR2, pi_adr IN VARCHAR2) RETURN BOOLEAN;
  --    
  /** 
    * Validate that Current User is an Administrator
  */     
  PROCEDURE pr_val_adm_usr (pi_k IN VARCHAR2);
  --
  /** 
    * Returns System-generated Login ID
    * @param pi_fir_nm    First Name 
    * @param pi_lst_nm    Last Name
    * @param pi_eml_adr   Email Address
  */   
  FUNCTION fn_gen_dflt_lgn_id (pi_k VARCHAR2, pi_fir_nm VARCHAR2, pi_lst_nm VARCHAR2, pi_eml_adr VARCHAR2) RETURN VARCHAR2;
  --
  /** 
    * Returns System-generated Short Name (Reporting ID)
    * @param pi_fir_nm    First Name 
    * @param pi_lst_nm    Last Name
  */   
  FUNCTION fn_gen_dflt_sht_nm (pi_k VARCHAR2, pi_fir_nm VARCHAR2, pi_lst_nm VARCHAR2) RETURN VARCHAR2;
  --
  /** 
    * Returns User Type
    * @param pi_uk    User Key
  */   
  FUNCTION fn_get_usr_typ (pi_k VARCHAR2, pi_uk NUMBER) RETURN VARCHAR2;
  --  
  /** 
    * Sets the TEMPORARY ADMINISTRATOR STATUS flag. Used by Calling Programs to allow NON-ADMIN users execute ADMIN programs.
  */     
  PROCEDURE pr_set_tmp_adm (pi_k VARCHAR2);  
  --
  /** 
    * Resets the TEMPORARY ADMINISTRATOR STATUS flag
  */     
  PROCEDURE pr_rst_tmp_adm;  
  -- 
  /** 
    * Returns TRUE if User is a Normal System User i.e. exclude INTERNAL users
  */   
  FUNCTION fn_is_normal_usr (pi_k IN VARCHAR2, pi_uk IN VARCHAR2, pi_raise_yn NUMBER DEFAULT 1) RETURN BOOLEAN;
  --
  /** 
    * Returns User's Login ID
    * @param pi_uk    User Key
  */     
  FUNCTION fn_get_usr_id (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2;
  -- 
  /** 
    * Returns User's Report Name
    * @param pi_uk    User Key
  */     
  FUNCTION fn_get_rpt_nm (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2;
  -- 
  /** 
    * Returns User Key
    * @param pi_id    User ID
  */     
  FUNCTION fn_get_usr_k (pi_k IN VARCHAR2, pi_id IN VARCHAR2) RETURN NUMBER;
  --   
  /** 
    * Returns User Type description
  */    
  FUNCTION fn_usr_typ_dsc (pi_usr_dm VARCHAR2) RETURN VARCHAR2;
  --  
  /** 
    * Returns User Status description
  */    
  FUNCTION fn_usr_sta_dsc (pi_sta_dm VARCHAR2) RETURN VARCHAR2;
  --  
  /** 
    * Returns TRUE if current session user can execute User maintenance
  */   
  FUNCTION fn_is_uma (pi_k IN VARCHAR2) RETURN BOOLEAN;
  --   
  /** 
    * Returns User's Full Name
    * @param pi_uk    User Key
  */     
  FUNCTION fn_get_full_nm (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2;
  --   
  /** 
    * Returns User's Email Address
    * @param pi_uk    User Key
  */     
  FUNCTION fn_get_eml_adr (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2;
  --
END pkwf_99_uma; 
/

