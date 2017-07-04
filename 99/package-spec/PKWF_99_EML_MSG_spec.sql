CREATE OR REPLACE PACKAGE pkwf_99_eml_msg AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Message Processing <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 27-dec-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Return Message Text
    * @param pi_id  Message ID
    * @param pi_p1  Placeholder Substitution Parameter 1
    * @param pi_p2  Placeholder Substitution Parameter 2
    * @param pi_p10 Placeholder Substitution Parameter 10
  */
  --
  FUNCTION fn_bdy  ( pi_id IN VARCHAR2,
                     pi_p1 IN VARCHAR2 DEFAULT NULL,
                     pi_p2 IN VARCHAR2 DEFAULT NULL,
                     pi_p3 IN VARCHAR2 DEFAULT NULL,
                     pi_p4 IN VARCHAR2 DEFAULT NULL,
                     pi_p5 IN VARCHAR2 DEFAULT NULL,
                     pi_p6 IN VARCHAR2 DEFAULT NULL,
                     pi_p7 IN VARCHAR2 DEFAULT NULL,
                     pi_p8 IN VARCHAR2 DEFAULT NULL,
                     pi_p9 IN VARCHAR2 DEFAULT NULL,
                     pi_p10 IN VARCHAR2 DEFAULT NULL) RETURN CLOB;
  --
  /**
    * Return Message Parameters
    * @param pi_id    Message ID
    * @param po_sbj   Message Subject
    * @param po_sndr  Sender Email Address
  */
  --
  PROCEDURE pr_pmr  ( pi_id    IN VARCHAR2,
                      po_sbj   OUT VARCHAR2,
                      po_sndr  OUT VARCHAR2);
  --
  /**
    * Test email message
  */  
  PROCEDURE pr_test (pi_k IN VARCHAR2);
  --    
  /**
    * New User Account creation email message
    * @param pi_ky    User key
    * @param pi_pw    Default Password
  */  
  PROCEDURE pr_usr_crt (pi_k   IN VARCHAR2,
                        pi_ky  IN NUMBER,
                        pi_pw  IN VARCHAR2);
  --  
  /**
    * User password reset
    * @param pi_ky    User key
    * @param pi_pw    Default Password
  */  
  PROCEDURE pr_usr_cpw (pi_k   IN VARCHAR2,
                        pi_ky  IN NUMBER,
                        pi_pw  IN VARCHAR2);
  -- 
  /**
    * Account lock
    * @param pi_ky    User key
  */  
  PROCEDURE pr_usr_lck (pi_k IN VARCHAR2, pi_ky IN NUMBER);
  -- 
  /**
    * Account unlock
    * @param pi_ky    User key
  */  
  PROCEDURE pr_usr_ulck (pi_k IN VARCHAR2, pi_ky IN NUMBER);
  --   
  /**
    * Password Change
    * @param pi_ky    User key
  */  
  PROCEDURE pr_pw_chng (pi_k IN VARCHAR2, pi_ky IN NUMBER);
  --    
  /**
    * Login ID Change
    * @param pi_ky    User key
    * @param pi_ov    Old Value
    * @param pi_nv    New Value
  */  
  PROCEDURE pr_uid_chng (pi_k   IN VARCHAR2,
                         pi_ky  IN NUMBER,
                         pi_ov  IN VARCHAR2,
                         pi_nv  IN VARCHAR2);
  -- 
  /**
    * Email Address Change
    * @param pi_ky    User key
    * @param pi_ov    Old Value
    * @param pi_nv    New Value
  */  
  PROCEDURE pr_eml_chng (pi_k   IN VARCHAR2,
                         pi_ky  IN NUMBER,
                         pi_ov  IN VARCHAR2,
                         pi_nv  IN VARCHAR2);
  --    
END pkwf_99_eml_msg;
/

