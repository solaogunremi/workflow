CREATE OR REPLACE PACKAGE pkwf_90_alt AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Alerts Interface <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 22-oct-2014 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  -- Parameter Values
  TYPE v_alt IS RECORD
  ( pi_msg_id    VARCHAR2 (50)  ,
    pi_rcpt_adr  VARCHAR2 (4000),
    pi_src_key   NUMBER   (38)  ,      
    pi_src_ref   VARCHAR2 (100) ,
    pi_sbj1      VARCHAR2 (50)  ,
    pi_sbj2      VARCHAR2 (50)  ,
    pi_sbj3      VARCHAR2 (50)  ,
    pi_bdy1      VARCHAR2 (500) ,
    pi_bdy2      VARCHAR2 (500) ,
    pi_bdy3      VARCHAR2 (500) ,
    pi_bdy4      VARCHAR2 (500) ,
    pi_bdy5      VARCHAR2 (500) ,
    pi_bdy6      VARCHAR2 (500) ,
    pi_bdy7      VARCHAR2 (500) ,
    pi_bdy8      VARCHAR2 (500) ,
    pi_bdy9      VARCHAR2 (500) ,
    pi_bdy10     VARCHAR2 (500) ,
    pi_bdy11     VARCHAR2 (500) ,
    pi_bdy12     VARCHAR2 (500) ,
    pi_bdy13     VARCHAR2 (500) ,
    pi_bdy14     VARCHAR2 (500) ,
    pi_bdy15     VARCHAR2 (500) 
    );
  --
  /**
    * Format the Quantity Input (Output Format: 999,999,999,990 trimming Leading Blanks if any)
  */   
  FUNCTION fn_fmt_qty (pi_qty NUMBER) RETURN VARCHAR2;
  --
  /**
    * Format the Amount Input (Output Format: 999,999,999,990.99 trimming Leading Blanks if any)
  */   
  FUNCTION fn_fmt_amt (pi_amt NUMBER) RETURN VARCHAR2;
  --
  /**
    * Format the Rate Input (Output Format: 999,999.999999% to input decimal places (max 6), trimming Leading Blanks if any)
  */   
  FUNCTION fn_fmt_rt (pi_rt NUMBER, pi_dcml_pls PLS_INTEGER DEFAULT 2) RETURN VARCHAR2;
  --
  /**
   * Format the Amount Input (Output Format: Amount in words)
  */
  FUNCTION fn_amt_in_word (pi_amt IN NUMBER, pi_cur_id IN VARCHAR2) RETURN VARCHAR2;
  --  
  /**
    * Generate Alert Message
  */
  PROCEDURE pr_crt_msg (pi_rec IN v_alt);
  --
  FUNCTION fn_snd_alt(pi_ptf_tp_k IN NUMBER, pi_alt_id IN VARCHAR2) RETURN BOOLEAN RESULT_CACHE;
  --
  FUNCTION fn_snd_alt_eml(pi_ptf_tp_k IN NUMBER, pi_alt_id IN VARCHAR2) RETURN VARCHAR2 RESULT_CACHE;
  --
END pkwf_90_alt;
/

