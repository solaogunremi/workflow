CREATE OR REPLACE PACKAGE pkwf_00_jsn AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for JSON <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 09-APR-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  -- 
  -- 
  FUNCTION fn_new_customer(pi_doc IN CLOB) RETURN CLOB;
  --
  -- 
  FUNCTION fn_web_access(pi_doc IN CLOB) RETURN CLOB;
  --
  -- 
  FUNCTION fn_cash_withdraw(pi_doc IN CLOB) RETURN CLOB;
  --
  --
END pkwf_00_jsn; 
/

