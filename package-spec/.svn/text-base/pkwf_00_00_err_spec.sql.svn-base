CREATE OR REPLACE PACKAGE pkwf_00_00_err AUTHID DEFINER 
AS
  --
  /** 
  * ===========================================================<br/>
  *  PURPOSE : Error Handling Routines<br/>
  *  SCHEMA: SYMPLUS <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 31-FEB-2016 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  -- External Package Definitions
  --
  --
  /*
   *  Wrapper Interface Function APEX 4.1 Error Management 
   *  @param p_error Standard APEX Error Type
  */
  FUNCTION fn_apex_error(p_error apex_error.t_error) RETURN apex_error.t_error_result;
  --
  /*
   *  Interface error procedure
   *  For passing out a message directly to the page
   *  @param pi_msg Error Message
  */
  --
  PROCEDURE pr_raise(pi_msg IN VARCHAR2);
  /*
   *  Interface error procedure
   *  For passing out a message directly to the page
   *  @param pi_msg Error Message
   *  @param pi_p1  Error Message Placeholders 1 to 9
  */
  --
  PROCEDURE pr_raise(pi_id IN VARCHAR2,
                     pi_p1 IN VARCHAR2 DEFAULT NULL,
                     pi_p2 IN VARCHAR2 DEFAULT NULL,
                     pi_p3 IN VARCHAR2 DEFAULT NULL,
                     pi_p4 IN VARCHAR2 DEFAULT NULL,
                     pi_p5 IN VARCHAR2 DEFAULT NULL,
                     pi_p6 IN VARCHAR2 DEFAULT NULL,
                     pi_p7 IN VARCHAR2 DEFAULT NULL,
                     pi_p8 IN VARCHAR2 DEFAULT NULL,
                     pi_p9 IN VARCHAR2 DEFAULT NULL);
  /*
   *  Interface error procedure
   *  For passing out a message directly to the page
   *  @param pi_msg Error Message
   *  @param pi_p1  Error Message Placeholders 1 to 9
   *  @param pi_ci  Name of Column/Item on page that raised this exception.
  */
  --
--  PROCEDURE pr_raise(pi_id IN VARCHAR2,
--                     pi_ci IN VARCHAR2,
--                     pi_p1 IN VARCHAR2 DEFAULT NULL,
--                     pi_p2 IN VARCHAR2 DEFAULT NULL,
--                     pi_p3 IN VARCHAR2 DEFAULT NULL,
--                     pi_p4 IN VARCHAR2 DEFAULT NULL,
--                     pi_p5 IN VARCHAR2 DEFAULT NULL,
--                     pi_p6 IN VARCHAR2 DEFAULT NULL,
--                     pi_p7 IN VARCHAR2 DEFAULT NULL,
--                     pi_p8 IN VARCHAR2 DEFAULT NULL,
--                     pi_p9 IN VARCHAR2 DEFAULT NULL);
  --
END pkwf_00_00_err;
/
