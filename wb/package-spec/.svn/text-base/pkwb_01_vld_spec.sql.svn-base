CREATE OR REPLACE PACKAGE pkwb_01_vld AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Symbols Web Validations <br/>
  *  SCHEMA: PG_WEB <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 14-APR-2016 <br/>
  *  Release Version  : 0.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /* Record Types */
  --
  /* Package Variable */
  --
  /* Package Routines */
  --       
  --
  FUNCTION fn_is_valid_email (pi_addr IN VARCHAR2) RETURN BOOLEAN;
  --
  FUNCTION fn_is_valid_phone (pi_no IN VARCHAR2) RETURN BOOLEAN;
  --
  FUNCTION fn_is_valid_money (pi_amt IN NUMBER) RETURN BOOLEAN; 
  --
  FUNCTION fn_is_json (pi_string IN VARCHAR2)RETURN BOOLEAN;
  --
END pkwb_01_vld;

/
