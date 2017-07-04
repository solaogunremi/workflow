CREATE OR REPLACE PACKAGE pkwf_00_pmr AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : ST Parameters <br/>
  *  Created By       : Kunle Adebona <br/>
  *  Date Created     : 31-AUG-2012 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  FUNCTION fn_rmt_usr_only RETURN BOOLEAN;
  --
  FUNCTION  fn_alw_rmt_usr RETURN BOOLEAN;
  PROCEDURE pr_alw_rmt_usr (pi_val IN VARCHAR2);
  --
  FUNCTION  fn_alw_lcl_usr RETURN BOOLEAN;
  PROCEDURE pr_alw_lcl_usr (pi_val IN VARCHAR2);
  --
  FUNCTION  fn_eml_frm_adr RETURN VARCHAR2;
  PROCEDURE pr_eml_frm_adr(pi_val IN VARCHAR2);
  --
  FUNCTION  fn_pg_rfrsh RETURN NUMBER;
  PROCEDURE pr_pg_rfrsh(pi_val IN NUMBER);
  --
  FUNCTION  fn_pdf_uri RETURN VARCHAR2;
  PROCEDURE pr_pdf_uri(pi_val IN VARCHAR2);
  --
  FUNCTION fn_st RETURN BOOLEAN;
  FUNCTION fn_am RETURN BOOLEAN;
  --
  FUNCTION  fn_doc_cd RETURN VARCHAR2;
  PROCEDURE pr_doc_cd(pi_val IN VARCHAR2);
  --
END pkwf_00_pmr;
/
