CREATE OR REPLACE PACKAGE pkwf_99_eml_pmr AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Email Parameters <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 27-DEC-2012 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Send Email ?
  */
  FUNCTION fn_eml_yn RETURN BOOLEAN;
  --
  /**
    * Raise Error ?
  */
  FUNCTION fn_eml_raise RETURN BOOLEAN;
  --
  /**
    * SMTP Host IP Address
  */
  FUNCTION fn_eml_smtp_ip RETURN VARCHAR2;
  --
  /**
    * SMTP Host Port Number
  */
  FUNCTION fn_eml_smtp_prt RETURN VARCHAR2;
  --
  /**
    * SMTP Username
  */
  FUNCTION fn_eml_smtp_usr RETURN VARCHAR2;
  --
  /**
    * SMTP Password
  */
  FUNCTION fn_eml_smtp_pwd RETURN VARCHAR2;
  --
  /**
    * SMTP Domain
  */
  FUNCTION fn_eml_smtp_dm RETURN VARCHAR2;
  --
  /**
    * SMTP Authentication
  */
  FUNCTION fn_eml_smtp_auth RETURN BOOLEAN;
  --
  /**
    * SMTP Server Timeout
  */
  FUNCTION fn_eml_smtp_tout RETURN NUMBER;
  --
  /**
    * Email Sender Name
  */
  FUNCTION fn_eml_sndr_nme RETURN VARCHAR2;
  --
  /**
    * Email Sender Email
  */
  FUNCTION fn_eml_sndr_eml RETURN VARCHAR2;
  --
  /**
    * Email Test Recipient address
  */
  FUNCTION fn_eml_test_rcp RETURN VARCHAR2;
  --
  /**
    * Send All Mails to Test Recipient
  */
  FUNCTION fn_eml_all_to_test RETURN BOOLEAN;
  --  
  /**
    * Email Header Text
  */
  FUNCTION fn_eml_hdr_txt RETURN VARCHAR2;
  --
  /**
    * Email Footer Text
  */
  FUNCTION fn_eml_ftr_txt RETURN VARCHAR2; 
  --
  /**
    * APEX Application URL
  */
  FUNCTION fn_eml_apx_url RETURN VARCHAR2;
  --
  /**
    * APEX Images Directory URL
  */
  FUNCTION fn_eml_img_url RETURN VARCHAR2; 
  --  
END pkwf_99_eml_pmr;
/