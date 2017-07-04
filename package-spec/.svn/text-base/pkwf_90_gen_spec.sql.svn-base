CREATE OR REPLACE PACKAGE pkwf_90_gen AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for document management <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 11-MAR-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  TYPE r_ret IS RECORD (
         ret_cd          wf_00_00_dtd.n38%TYPE,
         err_dsc         wf_00_00_dtd.c4000%TYPE,
         err_sta         wf_00_00_dtd.c4000%TYPE,
         po_dc_k         wf_00_00_dtd.n38%TYPE
         );
  --
  SUBTYPE r_cs_new   IS wf_vi_30_cs_new%ROWTYPE;
  SUBTYPE r_cs_new_c IS wf_vi_30_cs_new_c%ROWTYPE;
  SUBTYPE r_cs_new_j IS wf_vi_30_cs_new_j%ROWTYPE;
  SUBTYPE r_cs_reg   IS wf_vi_30_cs_reg%ROWTYPE;
  SUBTYPE r_cs_reg2  IS wf_vi_30_cs_reg_2%ROWTYPE;
  SUBTYPE r_ch_wdr   IS wf_vi_30_ch_wdr%ROWTYPE;
  --
  --
  FUNCTION fn_01_cus_ins(pi_rec IN r_cs_new) RETURN r_ret;
  --
  --
  FUNCTION fn_01_set_img(pi_dc_k IN NUMBER) RETURN r_ret;
  --
  --
  FUNCTION fn_02_reg_ins(pi_rec IN r_cs_reg) RETURN r_ret;
  --
  --
  FUNCTION fn_03_wdr_ins(pi_rec IN r_ch_wdr) RETURN r_ret;
  --
  --
END pkwf_90_gen; 
/

