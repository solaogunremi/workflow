CREATE OR REPLACE PACKAGE pkwf_89_cs AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for document management <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 11-MAR-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  -- General routine to create customer
  PROCEDURE pr_prc_ctc (pi_rec IN OUT pkwf_90_gen.r_cs_new);
  --
  -- General routine to create corporate customer
  PROCEDURE pr_prc_ctc_c (pi_rec IN OUT pkwf_90_gen.r_cs_new_c);
  --
  -- General routine to create joint customer
  PROCEDURE pr_prc_ctc_j (pi_rec   IN OUT pkwf_90_gen.r_cs_new_j);
  --
  -- Register new client based on CSCS number
  PROCEDURE pr_prc_reg_2 (pi_rec IN OUT pkwf_90_gen.r_cs_reg2);
  --
  --
END pkwf_89_cs; 
/

