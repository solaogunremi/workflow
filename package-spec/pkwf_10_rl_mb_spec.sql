CREATE OR REPLACE PACKAGE pkwf_10_rl_mb AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : ST Parameters <br/>
  *  Created By       : Kunle Adebona <br/>
  *  Date Created     : 31-AUG-2012 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns TRUE if record verification is in use
  */     
  PROCEDURE pr_prc(pi_rec IN OUT wf_vt_10_rl_mb%ROWTYPE);
  --
  PROCEDURE pr_del(pi_k IN NUMBER);
  --
END pkwf_10_rl_mb;
/
