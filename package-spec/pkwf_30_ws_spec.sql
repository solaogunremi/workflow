CREATE OR REPLACE PACKAGE pkwf_30_ws AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for WS Requests <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 25-JUN-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  -- 
  -- 
  FUNCTION fn_web_access(pi_obj IN CLOB) RETURN CLOB;
  FUNCTION fn_web_access2(pi_obj IN CLOB) RETURN CLOB;
  --
  FUNCTION fn_cash_withdraw(pi_obj IN CLOB) RETURN CLOB;
  --
  FUNCTION fn_if_mandate(pi_obj IN CLOB) RETURN CLOB;
  --
  FUNCTION fn_mf_redeem(pi_obj IN CLOB) RETURN CLOB;
  --
  FUNCTION fn_cs_new_i(pi_obj IN CLOB) RETURN CLOB;
  --
  FUNCTION fn_cs_new_j(pi_obj IN CLOB) RETURN CLOB;
  --
  FUNCTION fn_cs_new_c(pi_obj IN CLOB) RETURN CLOB;
  --
  FUNCTION fn_cs_new_sig(pi_obj  IN CLOB) RETURN CLOB;
  --                       
END pkwf_30_ws; 
/

