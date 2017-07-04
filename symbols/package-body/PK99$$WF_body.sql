create or replace PACKAGE BODY PK99$$WF AS
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 27-JAN-2013
  ** Release Version  : 2.0
  **
  ** PURPOSE: Interface to WF Module
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
  gv_k        VARCHAR2(100);
  gv_apl_dm   VARCHAR2(5) := 'WF';
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT')
    INTO gv_k
    FROM dual;
    --
  END pr_load_gvs;
  --
  PROCEDURE pr_no_priv IS
  BEGIN
    RAISE_APPLICATION_ERROR (-20000, 'Privilege to execute this operation not granted.');
  END pr_no_priv;
  --
  FUNCTION fn_sys_param_bool (pi_id VARCHAR2) RETURN BOOLEAN IS
    v_v  t_99_00_pmv.v_b%TYPE;
    CURSOR cur_pmv_b IS
    SELECT a.v_b
    FROM t_99_00_pmv a, t_99_00_pmd b
    WHERE a.p_id    = pi_id
    AND   a.r_p     = b.r_k
    AND   b.mdl_dm  = gv_apl_dm;
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_b;
    FETCH cur_pmv_b INTO v_v;
    CLOSE cur_pmv_b;     
    IF v_v = 1 THEN    
      RETURN TRUE;
    ELSIF v_v = 0 THEN
      RETURN FALSE;
    ELSE -- DEFAULT=FALSE
      RETURN FALSE;
    END IF;
  END fn_sys_param_bool;
  --
  FUNCTION fn_sys_param_char (pi_id VARCHAR2) RETURN VARCHAR2 IS
    v_v  t_99_00_pmv.v_c%TYPE;
    CURSOR cur_pmv_c IS
    SELECT a.v_c
    FROM t_99_00_pmv a, t_99_00_pmd b
    WHERE a.p_id    = pi_id
    AND   a.r_p     = b.r_k
    AND   b.mdl_dm  = gv_apl_dm;
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_c;
    FETCH cur_pmv_c INTO v_v;
    CLOSE cur_pmv_c;     
    RETURN v_v;
  END fn_sys_param_char;
  --  
  FUNCTION fn_sys_param_num (pi_id VARCHAR2) RETURN NUMBER IS
    v_v  t_99_00_pmv.v_n%TYPE;
    CURSOR cur_pmv_n IS
    SELECT a.v_n
    FROM t_99_00_pmv a, t_99_00_pmd b
    WHERE a.p_id    = pi_id
    AND   a.r_p     = b.r_k
    AND   b.mdl_dm  = gv_apl_dm;
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_n;
    FETCH cur_pmv_n INTO v_v;
    CLOSE cur_pmv_n;     
    RETURN v_v;
  END fn_sys_param_num;
  -- 
  FUNCTION fn_sys_param_dt (pi_id VARCHAR2) RETURN DATE IS
    v_v  t_99_00_pmv.v_d%TYPE;
    CURSOR cur_pmv_n IS
    SELECT a.v_d
    FROM t_99_00_pmv a, t_99_00_pmd b
    WHERE a.p_id    = pi_id
    AND   a.r_p     = b.r_k
    AND   b.mdl_dm  = gv_apl_dm;
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_n;
    FETCH cur_pmv_n INTO v_v;
    CLOSE cur_pmv_n;     
    RETURN v_v;
  END fn_sys_param_dt;
  --        
  --
  /* Public Routines */
  --
  FUNCTION fn_appl_acs RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN pk99_acp.fn_apl_acs (pi_k => gv_k, pi_apl_dm => gv_apl_dm);
  END;
  --
  PROCEDURE pr_val_appl_acs IS
  BEGIN
    pr_load_gvs;
    pk99_acp.pr_apl_acs (pi_k => gv_k, pi_apl_dm => gv_apl_dm);  
  END;
  --  
  FUNCTION fn_smdl_acs (pi_smdl_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN pk99_acp.fn_submod_acs (pi_k           => gv_k, 
                                   pi_apl_dm      => gv_apl_dm, 
                                   pi_submod_dm   => pi_smdl_id);
  END;
  --  
  PROCEDURE pr_val_smdl_acs (pi_smdl_id VARCHAR2) IS
  BEGIN
    pr_load_gvs;
    pk99_acp.pr_submod_acs (  pi_k           => gv_k, 
                             pi_apl_dm      => gv_apl_dm, 
                             pi_submod_dm   => pi_smdl_id);                                 
  END;
  --   
  FUNCTION fn_edt_prv (pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN pk99_acp.fn_rol_edt_prv (pi_k       => gv_k, 
                                    pi_apl_dm  => gv_apl_dm, 
                                    pi_rol_id  => pi_rol_id);
  END;
  -- 
  PROCEDURE pr_val_edt_prv (pi_rol_id VARCHAR2) IS
  BEGIN
    pr_load_gvs;
    pk99_acp.pr_rol_edt_prv ( pi_k       => gv_k, 
                              pi_apl_dm  => gv_apl_dm, 
                              pi_rol_id  => pi_rol_id);
  END;
  --   
  FUNCTION fn_vrf_prv (pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN pk99_acp.fn_rol_vrf_prv (pi_k       => gv_k, 
                                    pi_apl_dm  => gv_apl_dm, 
                                    pi_rol_id  => pi_rol_id);
  END;
  -- 
  PROCEDURE pr_val_vrf_prv (pi_rol_id VARCHAR2, pi_edt_uky NUMBER) IS
  BEGIN
    pr_load_gvs;
    pk99_acp.pr_rol_vrf_prv ( pi_k       => gv_k, 
                              pi_apl_dm  => gv_apl_dm, 
                              pi_rol_id  => pi_rol_id,
                              pi_ins_uky => pi_edt_uky);
  END;
  -- 
  FUNCTION fn_apr_prv (pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN pk99_acp.fn_rol_apr_prv (pi_k       => gv_k, 
                                    pi_apl_dm  => gv_apl_dm, 
                                    pi_rol_id  => pi_rol_id);
  END;
  -- 
  PROCEDURE pr_val_apr_prv (pi_rol_id VARCHAR2, pi_edt_uky NUMBER) IS
  BEGIN
    pr_load_gvs;
    pk99_acp.pr_rol_apr_prv ( pi_k       => gv_k, 
                              pi_apl_dm  => gv_apl_dm, 
                              pi_rol_id  => pi_rol_id,
                              pi_ins_uky => pi_edt_uky);
  END;
  --   
  FUNCTION fn_log_apx_err (pi_err IN apex_error.t_error) RETURN NUMBER IS
  BEGIN
    RETURN pk99_err.fn_log_apx_error (p_error => pi_err);
  END;
  --  
  PROCEDURE pr_val_brch (pi_id VARCHAR2) IS
  BEGIN
    pr_load_gvs;
    pk99_cpy.pr_val (pi_k => gv_k, pi_id => pi_id);
  END pr_val_brch;
  --
  PROCEDURE pr_val_brch_acs (pi_id VARCHAR2) IS
  BEGIN
    pr_load_gvs;
    pk99_cpy.pr_val_mdl (pi_k => gv_k, pi_id => pi_id, pi_mdl => gv_apl_dm);
    pk99_cpy.pr_val_usr (pi_k => gv_k, pi_id => pi_id, pi_uk => pk99$$00.fn_login_usr_key); 
  END;
  --    
  PROCEDURE pr_val_brch_acs1 (pi_id VARCHAR2, pi_uk NUMBER) IS
  BEGIN
    pr_load_gvs;
    pk99_cpy.pr_val_mdl (pi_k => gv_k, pi_id => pi_id, pi_mdl => gv_apl_dm);
    pk99_cpy.pr_val_usr (pi_k => gv_k, pi_id => pi_id, pi_uk => pi_uk); 
  END;
  --   
  FUNCTION fn_b_pmv (pi_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_sys_param_bool (pi_id => pi_id);
  END fn_b_pmv;
  --   
  FUNCTION fn_n_pmv (pi_id VARCHAR2) RETURN NUMBER IS
  BEGIN
    RETURN fn_sys_param_num (pi_id => pi_id);
  END fn_n_pmv;
  --  
  FUNCTION fn_c_pmv (pi_id VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_sys_param_char (pi_id => pi_id);
  END fn_c_pmv;
  --      
  FUNCTION fn_d_pmv (pi_id VARCHAR2) RETURN DATE IS
  BEGIN
    RETURN fn_sys_param_dt (pi_id => pi_id);
  END fn_d_pmv;
  --      
  PROCEDURE pr_val_lic IS
  BEGIN
    pk99$$00.pr_val_lic; 
  END pr_val_lic;
  --  
  FUNCTION fn_vld_lpw (pi_lu VARCHAR2, pi_lp VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN pk99_pwm.fn_vld_lpw (pi_k => gv_k, pi_lu => pi_lu, pi_lp => pi_lp);
  END fn_vld_lpw;   
  -- 
  FUNCTION fn_login(p_username VARCHAR2, p_password VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN pk$990.fn_login(p_username, p_password);
  END fn_login;
  --
  PROCEDURE pr_blath(pi_user IN VARCHAR2) IS
  BEGIN
    pk$990.pr_blath(pi_user);
  END pr_blath;
  --
  PROCEDURE pr_alath IS 
  BEGIN
    pk$990.pr_alath;
  END pr_alath;
  --
END pk99$$WF;
/