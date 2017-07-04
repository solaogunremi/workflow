CREATE OR REPLACE PACKAGE pkwf_00_00 AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for Preship Objects <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 11-MAR-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns ROW KEY for Internal Objects
  */
  FUNCTION fn_rk RETURN NUMBER;
  -- 
  /** 
    * Returns Document No for Internal Objects
  */
  FUNCTION fn_doc RETURN NUMBER;
  -- 
  /** 
    * Returns Action Sequence No for Internal Objects
  */
  FUNCTION fn_act RETURN NUMBER;
  -- 
  FUNCTION fn_get_ctr_k(pi_id IN VARCHAR2) RETURN NUMBER;
  FUNCTION fn_get_ctr_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  FUNCTION fn_get_nty_k(pi_id IN VARCHAR2) RETURN NUMBER;
  FUNCTION fn_get_nty_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  FUNCTION fn_get_sta_k(pi_ctr_id IN VARCHAR2, pi_id IN VARCHAR2) RETURN NUMBER;
  FUNCTION fn_get_sta_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  FUNCTION fn_get_ttl_k(pi_id IN VARCHAR2) RETURN NUMBER;
  FUNCTION fn_get_ttl_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  FUNCTION fn_get_rln_k(pi_id IN VARCHAR2) RETURN NUMBER;
  FUNCTION fn_get_rln_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  FUNCTION fn_get_bnk_k(pi_id IN VARCHAR2) RETURN NUMBER;
  FUNCTION fn_get_bnk_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  PROCEDURE pr_migr_data;
  --
END pkwf_00_00; 
/

