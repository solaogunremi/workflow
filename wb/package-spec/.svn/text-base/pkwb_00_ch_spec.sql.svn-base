CREATE OR REPLACE PACKAGE pkwb_00_ch AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Symbols Web Cash Management <br/>
  *  SCHEMA: PG_WEB <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 18-APR-2016 <br/>
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
  FUNCTION fn_xfr(pi_tp   IN VARCHAR2,
                  pi_frm IN VARCHAR2, 
                  pi_to   IN VARCHAR2, 
                  pi_amt  IN NUMBER) RETURN VARCHAR2;
  --
  PROCEDURE pr_pms(pi_ref IN VARCHAR2); 
  --
  PROCEDURE pr_rxfr(pi_ref IN VARCHAR2);
  --
  FUNCTION fn_val_to_act(pi_act IN VARCHAR2) RETURN VARCHAR2;
  --
END pkwb_00_ch;

/
