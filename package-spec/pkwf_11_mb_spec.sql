CREATE OR REPLACE PACKAGE pkwf_11_mb AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Workflow User Management <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 02-JUN-2016 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  --
  /* Public Record Types */
  --
  -- User record type
  TYPE r_usr IS RECORD (
        u_k       wf_00_00_dtd.n38%TYPE,
        usr_id    wf_00_00_dtd.c30%TYPE,
        usr_dsc   wf_00_00_dtd.c100%TYPE,
        usr_eml   wf_00_00_dtd.c100%TYPE,
        iu_yn     wf_00_00_dtd.c1%TYPE,
        usr_rl    wf_00_00_dtd.c500%TYPE,
        is_adm_yn wf_00_00_dtd.c1%TYPE
      );
  --
  -- 
  --  Update Workflow user list
  PROCEDURE pr_refresh;
  --
  --  Get user details
  FUNCTION fn_get_usr_l(pi_usr IN NUMBER) RETURN r_usr; -- workflow only
  FUNCTION fn_get_usr_r(pi_usr IN NUMBER) RETURN r_usr; -- symbols user
  --
  -- Create Local User
  PROCEDURE pr_new_usr_l(pi_rec IN r_usr);
  --
  -- Update user details
  PROCEDURE pr_upd_usr_l(pi_rec IN r_usr);
  PROCEDURE pr_upd_usr_r(pi_rec IN r_usr);
  --
  -- Get user roles
  FUNCTION fn_get_usr_role(pi_usr IN NUMBER) RETURN VARCHAR2;
  --
  -- Is User an Administrator
  FUNCTION fn_is_admin(pi_usr IN NUMBER) RETURN BOOLEAN;
  FUNCTION fn_is_admin(pi_usr IN VARCHAR2 DEFAULT NULL) RETURN BOOLEAN;
  --
  -- Is User a Local User
  FUNCTION fn_is_lcl_usr(pi_usr IN VARCHAR2 DEFAULT NULL) RETURN BOOLEAN;
  --
END pkwf_11_mb;
/
