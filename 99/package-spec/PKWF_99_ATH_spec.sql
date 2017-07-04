CREATE OR REPLACE PACKAGE pkwf_99_ath AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Authentication and Authorization Routines<br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Custom User Authentication
    * @param pi_u  User Name
    * @param pi_p  User Password
  */
  FUNCTION fn_ath (pi_k VARCHAR2, pi_u IN VARCHAR2, pi_p IN VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Custom User Authentication (System Admin)
    * @param pi_u  User Name
    * @param pi_p  User Password
  */
  FUNCTION fn_athsa (pi_k VARCHAR2, pi_u IN VARCHAR2, pi_p IN VARCHAR2) RETURN BOOLEAN;
  --  
  /**
    * Post-Authentication and Session States Initialization.
    * @param pi_u  User Name
  */
  FUNCTION fn_ath_sss (pi_k VARCHAR2, pi_u IN VARCHAR2) RETURN BOOLEAN;
  --
END pkwf_99_ath;
/

