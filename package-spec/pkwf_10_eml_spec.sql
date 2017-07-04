CREATE OR REPLACE PACKAGE pkwf_10_eml AUTHID DEFINER AS
  --
  /* Author : Aderemi Alabi, 13-OCT-2014
  **
  ** SCHEMA : Symbols Web
  **
  ** Purpose  : WF - Email Processing Routines
  **
  ** Modification History :
  **
  ** Copyright :  Neulogic Solutions. Ltd, 2014
  **
  */
  --
  /*
   *  Email Sending 
  */
  --
  PROCEDURE pr_send;
  --
  PROCEDURE pr_send_now (pi_key NUMBER);
  --
  PROCEDURE pr_send_test_mail(pi_rcpt IN VARCHAR2 DEFAULT NULL, pi_msg CLOB DEFAULT NULL);
  --
  PROCEDURE pr_val_stp;
  --        
  FUNCTION fn_max_rtry_no RETURN NUMBER;
  --  
  PROCEDURE pr_job_restart;
  --
  PROCEDURE pr_send_mail(pi_rcpt IN VARCHAR2,
                         pi_sbj  IN VARCHAR2,
                         pi_msg  IN CLOB);
  --
END pkwf_10_eml;
/
