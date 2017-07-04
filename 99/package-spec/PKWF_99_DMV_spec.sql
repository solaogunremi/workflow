CREATE OR REPLACE PACKAGE pkwf_99_dmv AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Domain-Related Validations and Processing <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns TRUE if ROLE TYPE is valid
    * @param pi_rol_dm  Role Type 
  */
  FUNCTION fn_vld_rol_typ (pi_k VARCHAR2, pi_rol_dm VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns ROLE TYPE DESCRIPTION
    * @param pi_rol_dm  Role Type
  */
  FUNCTION fn_rol_typ_dsc (pi_k VARCHAR2, pi_rol_dm VARCHAR2) RETURN VARCHAR2;
  --        
  /** 
    * Returns TRUE if USER TYPE is valid
    * @param pi_usr_dm  User Type 
  */
  FUNCTION fn_vld_usr_typ (pi_k VARCHAR2, pi_usr_dm VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns USER TYPE DESCRIPTION
    * @param pi_usr_dm  User Type
  */
  FUNCTION fn_usr_typ_dsc (pi_k VARCHAR2, pi_usr_dm VARCHAR2) RETURN VARCHAR2;
  --    
  /** 
    * Returns TRUE if USER STATUS is valid
    * @param pi_sta_dm  User Status 
  */
  FUNCTION fn_vld_usr_sta (pi_k VARCHAR2, pi_sta_dm VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns USER STATUS DESCRIPTION
    * @param pi_sta_dm  User Status
  */
  FUNCTION fn_usr_sta_dsc (pi_k VARCHAR2, pi_sta_dm VARCHAR2) RETURN VARCHAR2;
  --      
  /** 
    * Returns COUNTRY DESCRIPTION
    * @param pi_ctr_dm  Country 
  */
  FUNCTION fn_usr_ctr_dsc (pi_k VARCHAR2, pi_ctr_dm VARCHAR2) RETURN VARCHAR2;
  --
  /** 
    * Returns TRUE if SYSTEM RESTRICTION MODE is valid
    * @param pi_d  Restriction Mode
  */
  FUNCTION fn_vld_sys_rst (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns SYSTEM RESTRICTION MODE DESCRIPTION
    * @param pi_d  Restriction Mode
  */
  FUNCTION fn_sys_rst_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2;
  --  
  /** 
    * Returns LANGUAGE DESCRIPTION
    * @param pi_d  Language Code
  */
  FUNCTION fn_lang_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2;
  --     
  /** 
    * Returns DOMAIN VALUE DESCRIPTION
    * @param pi_d  Domain ID
    * @param pi_v  Domain Value
  */
  FUNCTION fn_dmv_dsc (pi_k VARCHAR2, pi_d VARCHAR2, pi_v VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns TRUE if RECORD STATUS is valid
    * @param pi_d  Status Domain
  */
  FUNCTION fn_vld_rec_sta (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Returns RECORD STATUS DESCRIPTION
    * @param pi_d  Status Domain
  */
  FUNCTION fn_rec_sta_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2;
  --     
  /** 
    * Returns GENDER DESCRIPTION
    * @param pi_d  Domain
  */
  FUNCTION fn_gdr_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Validates GENDER TYPE
    * @param pi_d  Domain
  */
  PROCEDURE pr_gdr_vld (pi_k VARCHAR2, pi_d VARCHAR2);
  --   
  /** 
    * Returns FREQUENCY INTERVAL DESCRIPTION
    * @param pi_d  Domain
  */
  FUNCTION fn_freq_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Validates FREQUENCY INTERVAL
    * @param pi_d  Domain
  */
  PROCEDURE pr_freq_vld (pi_k VARCHAR2, pi_d VARCHAR2);
  --  
END pkwf_99_dmv; 
/

