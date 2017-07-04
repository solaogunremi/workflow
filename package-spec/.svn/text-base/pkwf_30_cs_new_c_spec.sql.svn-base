CREATE OR REPLACE PACKAGE pkwf_30_cs_new_c AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for document management <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 11-MAR-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  -- Insert/Validation of document
  FUNCTION fn_ins(pi_rec IN wf_vi_30_cs_new_c%ROWTYPE) RETURN pkwf_90_gen.r_ret;
  --
  -- Insert/Validation of document (signatory)
  FUNCTION fn_ins_sig(pi_rec IN wf_vi_30_cs_new_c_sig%ROWTYPE) RETURN pkwf_90_gen.r_ret;
  --
  -- Set images as appropriate
  FUNCTION fn_set_sig_img(pi_dc_k IN NUMBER) RETURN pkwf_90_gen.r_ret;
  --
  -- General processing routine, new customer registration, 
  -- Verifu customer record, if ok
  -- -- Create customer
  -- -- Create cash account
  -- -- Create portfolio
  PROCEDURE pr_cre_rec(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL);
  --
  -- General processing routine, new customer registration
  -- -- Parameter - CSCS number
  -- -- Update / Create market account
  -- -- Register for WEB access
  -- -- Activate account
  PROCEDURE pr_set_act(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL);
  -- 
  --
  --
END pkwf_30_cs_new_c; 
/

