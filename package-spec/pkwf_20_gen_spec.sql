CREATE OR REPLACE PACKAGE pkwf_20_gen AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : WF Routines for document management <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 11-MAR-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  -- General processing routine template. Does nothing
  PROCEDURE pr_gen_prc(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL);
  -- 
  --
  FUNCTION fn_get_dc (pi_dc_k IN NUMBER) RETURN wf_20_dc%ROWTYPE;
  --
  -- Outstanding Tasks
  FUNCTION fn_u_ot_tk RETURN OT$_WF_DC_TK_TB PIPELINED;
  --
  -- Users Tasks
  FUNCTION fn_m_tk RETURN OT$_WF_DC_TK_TB PIPELINED;
  --
  -- Document Task Status
  FUNCTION fn_dc_tk_st(pi_dc_k IN NUMBER) RETURN OT$_WF_DC_ST_TB PIPELINED;
  --
  -- Document Actions
  FUNCTION fn_dc_ac(pi_dc_k IN NUMBER, pi_dc_tk_k IN NUMBER DEFAULT NULL) RETURN OT$_WF_DC_AC_TB PIPELINED;
  --
  -- Accept Task
  PROCEDURE pr_acc_tk(pi_dc_tk_k  IN NUMBER);
  --
  -- Post Action
  PROCEDURE pr_act(pi_action   IN wf_20_dc_ac%ROWTYPE);
  --
  -- Corporate Documents
  FUNCTION fn_cpr_doc RETURN OT$_WF_DC_CPR_DOC_TB PIPELINED;
  --
  --
  FUNCTION fn_cpr_doc_links(pi_app_id IN VARCHAR2) RETURN VARCHAR2;
  --
  --
END pkwf_20_gen; 
/

