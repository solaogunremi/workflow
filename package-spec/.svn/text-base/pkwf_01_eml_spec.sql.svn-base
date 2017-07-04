CREATE OR REPLACE   PACKAGE "PKWF_01_EML" AUTHID DEFINER AS
  --
  /* Author : Aderemi Alabi, 02-MAY-2013
  **
  ** SCHEMA : Symbols Web
  **
  ** Purpose  : WB - Email Processing Routines
  **
  ** Modification History :
  **
  ** Copyright :  ProGenics Corp. Ltd, 2013
  **
  */
  --package variables
  --
  --
  /*
   *  Process Email Template
   *  @Param pi_rec Record of an Email template
   */
  PROCEDURE pr_prc(pi_rec IN wf_v_00_eml%ROWTYPE);
  --
  /*
   *  Web Access Request
   *  @Param pi_cus_nm  Market Account No
   *  @Param pi_eml_adr     Account Name
   *  @Param pi_pwd Email Address
   */
  --
  PROCEDURE pr_pwd_rst(pi_cus_nm    IN VARCHAR2, 
                       pi_eml_adr   IN VARCHAR2,
                       pi_pwd       IN VARCHAR2); 
  --
  
  /*
   *  New User 
   *  @Param pi_usr_nme  Customer Name
   *  @Param pi_lgn_id   Login ID
   *  @Param pi_lgn_pwd  Password
   *  @Param pi_eml_adr  Email Address
   */
  --
  PROCEDURE pr_new_usr(pi_usr_nme   IN VARCHAR2, 
                       pi_lgn_id    IN VARCHAR2,
                       pi_lgn_pwd   IN VARCHAR2,
                       pi_eml_adr   IN VARCHAR2); 
  --
  /*
   *  Onboarding Receipt
   *  @Param pi_app_name  Applicant Name
   *  @Param pi_type      Application Type
   *  @Param pi_product   Interested Products
   *  @Param pi_eml_adr   Email Address
   */
  --
  PROCEDURE pr_onb_rcpt(pi_app_name IN VARCHAR2,
                        pi_type     IN VARCHAR2,
                        pi_product  IN VARCHAR2,
                        pi_eml_adr  IN VARCHAR2);
  --
  /*
   *  Application Rejection
   *  @Param pi_tp_id   Application Type
   *  @Param pi_app_id  Application ID
   *  @Param pi_reason  Reject Reason
   */
  --  
  PROCEDURE pr_app_rej(pi_tp_id  IN VARCHAR2,
                       pi_app_id IN VARCHAR2,
                       pi_app_nm IN VARCHAR2,
                       pi_product IN VARCHAR2,
                       pi_reason IN VARCHAR2);
  --
  /*
   *  Application Rejection
   *  @Param pi_rl_id   Task Key
   *  @Param pi_app_id  Application ID
   */
  PROCEDURE pr_new_tsk(pi_tk_k   IN NUMBER,
                       pi_app_id IN VARCHAR2,
                       pi_product IN VARCHAR2,  
                       pi_app_nm IN VARCHAR2);  
END pkwf_01_eml;
/
