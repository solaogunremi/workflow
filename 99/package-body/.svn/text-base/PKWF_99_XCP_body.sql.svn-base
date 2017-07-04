CREATE OR REPLACE PACKAGE BODY pkwf_99_xcp AS 
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: Pre-defined Application Exceptions
  **
  ** MODIFICATION HISTORY:
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **
  **
  */
  --
  /* Private Routines */
  --
  gv_k          VARCHAR2(100);
  gv_log_err    BOOLEAN;
  gv_err_pgm    VARCHAR2(500);
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    gv_err_pgm := NULL;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT')
    INTO gv_k
    FROM dual;
    --
    gv_log_err := pkwf_99_glb.fn_log_err(gv_k);
    --
  END pr_load_gvs;
  --
  FUNCTION fn_who_called_me RETURN VARCHAR2 IS
    --
    v_owner         VARCHAR2(100);
    v_name          VARCHAR2(100);
    v_lineno        NUMBER;
    v_type          VARCHAR2(100);
    --
  BEGIN
    --
    OWA_UTIL.WHO_CALLED_ME ( owner      => v_owner,
                             name       => v_name,
                             lineno     => v_lineno,
                             caller_t   => v_type);
    --
    IF v_owner IS NOT NULL AND v_name IS NOT NULL THEN
      v_name := v_owner ||'.'||v_name;
    END IF;
    --
    IF v_name IS NOT NULL AND v_lineno > 0 THEN
      v_name := v_name||' : Line '||TO_CHAR(v_lineno);
    END IF;
    --
    RETURN UPPER(v_name);
    --
  END fn_who_called_me;
  --
  --
  /* Public Routines */
  --
  --
  PROCEDURE pr_raise_no_acs_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990023', pi_pg => gv_err_pgm); -- No ACCESS privilege
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_ACS_PRV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_acs_prv;
  --
  PROCEDURE pr_raise_no_dml (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990021', pi_pg => gv_err_pgm); -- Record edit not allowed
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_DML:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_dml;
  --
  --
  PROCEDURE pr_raise_no_dml_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990022', pi_pg => gv_err_pgm); -- No privilege to edit
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_DML_PRV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_dml_prv;
  --
  PROCEDURE pr_raise_no_ins (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990010', pi_pg => gv_err_pgm); -- Record creation not allowed
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_INS:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_ins;
  --
  --
  PROCEDURE pr_raise_no_ins_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990011', pi_pg => gv_err_pgm); -- No privilege to create record
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_INS_PRV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_ins_prv;
  --
  --
  PROCEDURE pr_raise_no_upd (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990012', pi_pg => gv_err_pgm); -- Record modification not allowed
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_UPD:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_upd;
  --
  --
  PROCEDURE pr_raise_no_upd_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990013', pi_pg => gv_err_pgm); -- No privilege to modify
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_UPD_PRV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_upd_prv;
  --
  --
  PROCEDURE pr_raise_no_del (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990014', pi_pg => gv_err_pgm); -- Record deletion not allowed
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_DEL:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_del;
  --
  --
  PROCEDURE pr_raise_no_del_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990015', pi_pg => gv_err_pgm); -- No privilege to delete
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_DEL_PRV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_del_prv;
  --
  --
  PROCEDURE pr_raise_no_apv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990016', pi_pg => gv_err_pgm); -- Record approval not applicable
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_APV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_apv;
  --
  --
  PROCEDURE pr_raise_no_apv_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990017', pi_pg => gv_err_pgm); -- No privilege to approve
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_APV_PRV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_apv_prv;
  --
  --
  PROCEDURE pr_raise_apv_rec (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990018', pi_pg => gv_err_pgm); -- Record already approved
    ELSE
      gv_err_pgm := 'PR_RAISE_APV_REC:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_apv_rec;
  --
  --
  PROCEDURE pr_raise_no_prt (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990019', pi_pg => gv_err_pgm); -- Record approval not applicable
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_PRT:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_prt;
  --
  --
  PROCEDURE pr_raise_no_prt_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990020', pi_pg => gv_err_pgm); -- No privilege to print
    ELSE
      gv_err_pgm := 'PR_RAISE_NO_PRT_PRV:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_no_prt_prv;
  --
  --
  PROCEDURE pr_raise_ivl_pgm (pi_pg IN VARCHAR2 DEFAULT NULL) IS
    v_err_pgm    VARCHAR2(500);
  BEGIN
    --
    pr_load_gvs;
    --
    v_err_pgm := pi_pg;
    IF gv_log_err AND v_err_pgm IS NULL THEN
      v_err_pgm := fn_who_called_me;
    END IF;
    pkwf_99_err.pr_raise (pi_id => '990002', pi_pg => v_err_pgm); -- Invalid program
    --
  END pr_raise_ivl_pgm;
  --
  --
  PROCEDURE pr_raise_restrict_acs (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    gv_err_pgm := pi_pg;
    IF gv_log_err AND gv_err_pgm IS NULL THEN
      gv_err_pgm := fn_who_called_me;
    END IF;
    --
    IF pi_k = gv_k THEN
      pkwf_99_err.pr_raise (pi_id => '990024', pi_pg => gv_err_pgm); -- Access is restricted
    ELSE
      gv_err_pgm := 'PR_RAISE_RESTRICT_ACS:: '||SUBSTR(gv_err_pgm,1,60);
      pr_raise_ivl_pgm (pi_pg => gv_err_pgm);
    END IF;
    --
  END pr_raise_restrict_acs;
  --
  PROCEDURE pr_raise_ivl_in_pmr (pi_pg IN VARCHAR2 DEFAULT NULL) IS
    v_err_pgm    VARCHAR2(500);
  BEGIN
    --
    pr_load_gvs;
    --
    v_err_pgm := pi_pg;
    IF gv_log_err AND v_err_pgm IS NULL THEN
      v_err_pgm := fn_who_called_me;
    END IF;
    pkwf_99_err.pr_raise (pi_id => '990001', pi_pg => v_err_pgm); -- Invalid input parameters
    --
  END pr_raise_ivl_in_pmr;
  --
  PROCEDURE pr_raise_is_in_use (pi_dsc IN VARCHAR2 DEFAULT 'Code', pi_pg IN VARCHAR2 DEFAULT NULL) IS
    v_err_pgm    VARCHAR2(500);
  BEGIN
    --
    pr_load_gvs;
    --
    v_err_pgm := pi_pg;
    IF gv_log_err AND v_err_pgm IS NULL THEN
      v_err_pgm := fn_who_called_me;
    END IF;
    pkwf_99_err.pr_raise (pi_id => '990070', pi_pg => v_err_pgm, pi_p1 => pi_dsc);
    --
  END pr_raise_is_in_use;
  --
  PROCEDURE pr_reserved (pi_dsc IN VARCHAR2 DEFAULT 'Code', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990071', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_reserved;
  --
  PROCEDURE pr_dupl_found (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990062', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_dupl_found;
  --
  PROCEDURE pr_not_found (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990060', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_not_found;
  --
  PROCEDURE pr_not_defined (pi_dsc IN VARCHAR2 DEFAULT 'Code', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990134', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_not_defined;
  --  
  PROCEDURE pr_not_valid (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990120', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_not_valid;
  --  
  PROCEDURE pr_already_approved (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990119', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_already_approved;
  --     
  PROCEDURE pr_pending_approval (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990027', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_pending_approval;
  --  
  PROCEDURE pr_already_rejected (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990026', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_already_rejected;
  --  
  PROCEDURE pr_deleted (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990121', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_deleted;
  --    
  PROCEDURE pr_not_in_use (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990124', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_not_in_use;
  --   
  PROCEDURE pr_own_rec_apr IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990114');
  END pr_own_rec_apr;
  --  
  PROCEDURE pr_no_apl_acs_prv IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990115');
  END pr_no_apl_acs_prv;
  -- 
  PROCEDURE pr_no_execute_prv IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990099');
  END pr_no_execute_prv;
  --    
  PROCEDURE pr_unauth_conn IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990033');
  END pr_unauth_conn;
  --   
  PROCEDURE pr_not_allowed (pi_dsc IN VARCHAR2 DEFAULT 'Processing', pi_pg IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    pkwf_99_err.pr_raise (pi_id => '990154', pi_pg => pi_pg, pi_p1 => pi_dsc);
  END pr_not_allowed;
  --    
END pkwf_99_xcp;
/

