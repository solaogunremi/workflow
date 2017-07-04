CREATE OR REPLACE PACKAGE pkwf_99_001 AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Admin Maintenance <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 24-dec-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Edit Setup {inserted/modified} record.
    * @param pi_rec Input Data
  */
  PROCEDURE pr_prc (pi_rec IN OUT v_99_99_umr_e%ROWTYPE);
  --
  /**
    * Lock User Account
    * @param pi_key    Record key
  */
  PROCEDURE pr_lck (pi_k IN VARCHAR2, pi_ky IN NUMBER);
  --
  /**
    * Unlock User Account
    * @param pi_key    Record key
  */
  PROCEDURE pr_ulck (pi_k IN VARCHAR2, pi_ky IN NUMBER);
  --
  /**
    * Remove User Account
    * @param pi_key    Record key
  */
  PROCEDURE pr_rmv (pi_k IN VARCHAR2, pi_ky IN NUMBER);
  -- 
  /**
    * Reset password
    * @param pi_ky    Record key
  */
  PROCEDURE pr_rpw (pi_k IN VARCHAR2, pi_ky IN NUMBER, po_pw OUT VARCHAR2);
  --
  /**
    * Is User Admin
    * @param pi_ky    Record key
  */
  FUNCTION fn_is_adm RETURN BOOLEAN;
  --   
END pkwf_99_001;
/

