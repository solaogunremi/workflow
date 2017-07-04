CREATE OR REPLACE PACKAGE pkwf_30_gen AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for document management <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 11-MAR-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  -- 
  -- Get Document Id
  FUNCTION fn_g_doc_id RETURN VARCHAR2;
  --
  --
  FUNCTION fn_set_fld (pi_dat IN VARCHAR2) RETURN VARCHAR2;
  --
  --
  PROCEDURE pr_set_dc_dtl(pi_d_id   IN VARCHAR2,
                          pi_dc_id  IN VARCHAR2,
                          pi_dc_dsc IN VARCHAR2);
  --
  --
END pkwf_30_gen; 
/

