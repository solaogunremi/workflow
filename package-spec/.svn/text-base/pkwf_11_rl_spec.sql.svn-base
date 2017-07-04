CREATE OR REPLACE PACKAGE pkwf_11_rl AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Workflow User Management <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 10-JUN-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  --
  /* Public Record Types */
  --
  -- User record type
  TYPE r_rl IS RECORD (
        rl_k     wf_00_00_dtd.n38%TYPE,
        rl_id    wf_00_00_dtd.c30%TYPE,
        rl_dsc   wf_00_00_dtd.c100%TYPE,
        iu_yn    wf_00_00_dtd.c1%TYPE
      );
  --
  -- 
  --  Create Role
  PROCEDURE pr_create(pi_rec IN r_rl);
  --
  --  Update Role
  PROCEDURE pr_update(pi_rec IN r_rl);
  --
  --  Delete Role
  PROCEDURE pr_delete(pi_k IN NUMBER);
  --
END pkwf_11_rl;
/
