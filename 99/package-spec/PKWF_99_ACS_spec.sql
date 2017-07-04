CREATE OR REPLACE PACKAGE pkwf_99_acs AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : System Access/Security Routines <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Specific User Detail
    * @param pi_uk  User Key
  */
  FUNCTION fn_usr_dtl (pi_k VARCHAR2, pi_uk NUMBER) RETURN v_99_99_usr%ROWTYPE;
  --
  /**
    * Specific User Detail
    * @param pi_id  User ID
  */
  FUNCTION fn_usr_dtl1 (pi_k VARCHAR2, pi_id VARCHAR2) RETURN v_99_99_usr%ROWTYPE;
  --
END pkwf_99_acs;
/

