CREATE OR REPLACE PACKAGE pkwf_99_err AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Error Processing <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Log internal errors
  */ 
  FUNCTION fn_log_apx_error (p_error IN apex_error.t_error) RETURN NUMBER;
  --
  /**
    * Raise application database error
    * @param pi_id  Error ID
    * @param pi_pg  Program Name raising the error
    * @param pi_p1  Placeholder Substitution Parameter 1
    * @param pi_p2  Placeholder Substitution Parameter 2
    * @param pi_p9  Placeholder Substitution Parameter 9
  */
  --
  PROCEDURE pr_raise ( pi_id IN VARCHAR2,
                       pi_pg IN VARCHAR2 DEFAULT NULL,
                       pi_p1 IN VARCHAR2 DEFAULT NULL,
                       pi_p2 IN VARCHAR2 DEFAULT NULL,
                       pi_p3 IN VARCHAR2 DEFAULT NULL,
                       pi_p4 IN VARCHAR2 DEFAULT NULL,
                       pi_p5 IN VARCHAR2 DEFAULT NULL,
                       pi_p6 IN VARCHAR2 DEFAULT NULL,
                       pi_p7 IN VARCHAR2 DEFAULT NULL,
                       pi_p8 IN VARCHAR2 DEFAULT NULL,
                       pi_p9 IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Raise FRONT-END INTERFACE error. Does not log errors or reference Session States.
    * @param pi_id  Error ID
    * @param pi_lg  Error Language
    * @param pi_p1  Placeholder Substitution Parameter 1
    * @param pi_p2  Placeholder Substitution Parameter 2
    * @param pi_p9  Placeholder Substitution Parameter 9
  */
  --
  PROCEDURE pr_raise_f ( pi_id IN VARCHAR2,
                         pi_lg IN VARCHAR2 DEFAULT NULL,
                         pi_p1 IN VARCHAR2 DEFAULT NULL,
                         pi_p2 IN VARCHAR2 DEFAULT NULL,
                         pi_p3 IN VARCHAR2 DEFAULT NULL,
                         pi_p4 IN VARCHAR2 DEFAULT NULL,
                         pi_p5 IN VARCHAR2 DEFAULT NULL,
                         pi_p6 IN VARCHAR2 DEFAULT NULL,
                         pi_p7 IN VARCHAR2 DEFAULT NULL,
                         pi_p8 IN VARCHAR2 DEFAULT NULL,
                         pi_p9 IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Reset Error Session States values
  */
  PROCEDURE pr_reset (pi_k  VARCHAR2);
  --
  /**
    * Set Error Session States values
  */
  PROCEDURE pr_set (pi_k VARCHAR2, pi_id VARCHAR2, pi_dsc VARCHAR2);
  --
  /**
    * Returns Error Message
    * @param pi_id  Error ID
    * @param pi_lg  Error Language
    * @param pi_p1  Placeholder Substitution Parameter 1
    * @param pi_p2  Placeholder Substitution Parameter 2
    * @param pi_p9  Placeholder Substitution Parameter 9
  */
  FUNCTION fn_err_msg (  pi_id IN VARCHAR2,
                         pi_lg IN VARCHAR2 DEFAULT NULL,
                         pi_p1 IN VARCHAR2 DEFAULT NULL,
                         pi_p2 IN VARCHAR2 DEFAULT NULL,
                         pi_p3 IN VARCHAR2 DEFAULT NULL,
                         pi_p4 IN VARCHAR2 DEFAULT NULL,
                         pi_p5 IN VARCHAR2 DEFAULT NULL,
                         pi_p6 IN VARCHAR2 DEFAULT NULL,
                         pi_p7 IN VARCHAR2 DEFAULT NULL,
                         pi_p8 IN VARCHAR2 DEFAULT NULL,
                         pi_p9 IN VARCHAR2 DEFAULT NULL) RETURN VARCHAR2;
  --
  /**
    * Returns Latest Error Message generated
  */
  FUNCTION fn_lst_msg (pi_k VARCHAR2) RETURN VARCHAR2;
  --
  /**
    * Raise Input text error. Does not log errors or reference Session States.
    * @param pi_txt  Error Text
  */
  --
  PROCEDURE pr_raise_t (pi_txt IN VARCHAR2);
  --
  /**
    * Apex Error Message
  */
  --  
  FUNCTION fn_apex_error(p_error apex_error.t_error) RETURN apex_error.t_error_result;
  --
  /**
    * Clear internal errors
  */   
  PROCEDURE pr_del_apx_log (pi_key IN NUMBER DEFAULT NULL, pi_all_yn IN VARCHAR2 DEFAULT '0');
  --
END pkwf_99_err;
/

