CREATE OR REPLACE PACKAGE pkwf_99_umc AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : User Maintenance Extension <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 13-DEC-2012 <br/>
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
    * Returns the full Setup details
    * @param pi_key     Record key
  */
  FUNCTION fn_dtl (pi_k IN VARCHAR2, pi_key IN NUMBER) RETURN v_99_99_umr%ROWTYPE;
  --  
  /**
    * Returns Setup edit details
    * @param pi_key     Record key
  */
  FUNCTION fn_dtl_e (pi_k IN VARCHAR2, pi_key IN NUMBER) RETURN v_99_99_umr_e%ROWTYPE;
  --  
  /**
    * Delete pending record
    * @param pi_key    Record key
  */
  PROCEDURE pr_del (pi_k IN VARCHAR2, pi_key IN NUMBER);
  --
  /**
    * Approve pending record
    * @param pi_key    Record key
  */
  PROCEDURE pr_apr (pi_k IN VARCHAR2, pi_key IN NUMBER);
  -- 
  /**
    * Lock User Account
    * @param pi_key    Record key
  */
  PROCEDURE pr_lck (pi_k IN VARCHAR2, pi_key IN NUMBER);
  --
  /**
    * Unlock User Account
    * @param pi_key    Record key
  */
  PROCEDURE pr_ulck (pi_k IN VARCHAR2, pi_key IN NUMBER);
  --
  /**
    * Remove User Account
    * @param pi_key    Record key
  */
  PROCEDURE pr_rmv (pi_k IN VARCHAR2, pi_key IN NUMBER);
  --
  /**
    * Returns password after approval or reset
  */  
  FUNCTION fn_upw (pi_k VARCHAR2) RETURN VARCHAR2;
  --
  /**
    * Reset Password
    * @param pi_key    Record key
  */
  PROCEDURE pr_rst_upw (pi_k IN VARCHAR2, pi_key IN NUMBER);
  --  
  /**
    * Validate User
    * @param pi_key    Record key
  */
  PROCEDURE pr_val (pi_k IN VARCHAR2, pi_key IN NUMBER);
  --   
END pkwf_99_umc; 
/
