CREATE OR REPLACE PACKAGE pkwf_99_pwm AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Password Management<br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Reset User Password
    * @param pi_un     User Name
    * @param pi_un_yn  If Set to 1, then use the User Name as the Password. Otherwise generate Random Password
    * @param po_pw     Generated Password
  */ 
  PROCEDURE pr_reset_upw (pi_k      IN VARCHAR2, 
                          pi_un     IN VARCHAR2,
                          pi_un_yn  IN NUMBER DEFAULT 0,
                          po_pw     OUT VARCHAR2);
  --  
  /** 
    * Change Current Password
    * @param pi_un     User Name
    * @param pi_pw     New Password
    * @param pi_pwc    New Password Confirmation
    * @param pi_opw    Current Password
  */   
  PROCEDURE pr_chg_cpw (pi_k    VARCHAR2, 
                        pi_un   VARCHAR2, 
                        pi_pw   VARCHAR2, 
                        pi_pwc  VARCHAR2, 
                        pi_opw  VARCHAR2);
  --
  /** 
    * Returns TRUE if Login Password is valid
    * @param pi_lu     User Name
    * @param pi_lp     Password
  */ 
  FUNCTION fn_vld_lpw (pi_k   VARCHAR2, 
                       pi_lu  VARCHAR2, 
                       pi_lp  VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Validate New Password. Returns NULL if valid, else Validation Error Text
    * @param pi_un     User Name
    * @param pi_pw     New Password
    * @param pi_pwc    New Password Confirmation
    * @param pi_opw    Current Password    
  */ 
  FUNCTION fn_vld_npw ( pi_k    VARCHAR2, 
                        pi_un   VARCHAR2, 
                        pi_pw   VARCHAR2, 
                        pi_pwc  VARCHAR2, 
                        pi_opw  VARCHAR2) RETURN VARCHAR2;
  --  
  /** 
    * Set User password to be changed at next login
    * @param pi_uk     User Key
  */   
  PROCEDURE pr_set_chg_cpw (pi_k VARCHAR2, pi_uk VARCHAR2);
  --
  /** 
    * Returns TRUE if password must be changed
  */     
  FUNCTION fn_req_pw_chng RETURN BOOLEAN;
  --
  /** 
    * Update User Password
    * @param pi_uk     User Key
    * @param pi_un     User Name
    * @param pi_up     Password
  */     
  PROCEDURE pr_upw_upd (pi_k IN VARCHAR2, pi_uk IN NUMBER, pi_un IN VARCHAR2, pi_up IN VARCHAR2);
  --  
  /** 
    * User Password Expiry
  */     
  FUNCTION fn_is_exp (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN BOOLEAN;
  FUNCTION fn_exp_dys (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN NUMBER;
  --  
END pkwf_99_pwm;
/

