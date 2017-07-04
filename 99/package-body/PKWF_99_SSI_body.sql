CREATE OR REPLACE PACKAGE BODY pkwf_99_ssi AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 01-JUNE-2010
  ** Release Version  : 2.0
  **
  ** PURPOSE: Internal System Users Processing Routines
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
  gv_k                  VARCHAR2(100);
  v_is_valid_session    BOOLEAN := FALSE;
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    v_is_valid_session := FALSE;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    v_is_valid_session := pkwf_99_glb.fn_vld_conn (gv_k);
    --
  END pr_load_gvs;
  --
  FUNCTION fn_is_ssi_valid_usr (pi_k VARCHAR2, pi_dm VARCHAR2) RETURN BOOLEAN IS
    v_b        PLS_INTEGER;
    v_usr_id   VARCHAR2(500);
    v_usr_ky   NUMBER;
    CURSOR c_yes IS
    SELECT 1
    FROM t_99_00_ssi
    WHERE r_k = v_usr_ky
    AND   ssi_id = v_usr_id
    AND   ius_yn = 1
    AND   ssi_dm = pi_dm
    AND   r_k BETWEEN 1 AND 20;
  BEGIN
    --
    pr_load_gvs;
    v_b := 0;
    v_usr_ky := 0;
    v_usr_id := NULL;
    --
    IF pi_k = gv_k AND APEX_UTIL.GET_SESSION_STATE('SSI_03') = pi_dm THEN
      v_usr_id := pkwf_99_glb.fn_usr_id (gv_k);
      v_usr_ky := pkwf_99_glb.fn_usr_key (gv_k);
      OPEN c_yes;
      FETCH c_yes INTO v_b;
      CLOSE c_yes;
    END IF;
    --
    IF v_b = 1 THEN
      v_b := 0;
      IF APEX_UTIL.GET_SESSION_STATE('SSI_02') = v_usr_id THEN
        v_b := 1;
      END IF;
    END IF;
    --
    IF v_b = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_is_ssi_valid_usr;  
  --  
  FUNCTION fn_is_ssi_usr_ius (pi_k VARCHAR2, pi_d VARCHAR2, pi_dm VARCHAR2 DEFAULT NULL) RETURN BOOLEAN IS
    v_b   PLS_INTEGER;
    CURSOR c_yes IS
    SELECT ssi_dm
    FROM t_99_00_ssi
    WHERE UPPER(ssi_id) = UPPER(pi_d)
    AND   ius_yn = 1
    AND   r_k BETWEEN 1 AND 20;
  BEGIN
    --
    pr_load_gvs;
    v_b := 0;
    --
    IF pi_k = gv_k AND pi_d IS NOT NULL THEN
      FOR cr IN c_yes LOOP
        IF pi_dm IS NULL THEN
          v_b := 1;
        ELSIF cr.ssi_dm = pi_dm THEN
          v_b := 1;
        END IF;
      END LOOP;
    END IF;
    --
    IF v_b = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_is_ssi_usr_ius;
  --  
  --       
  /* Public Routines */
  --
  FUNCTION fn_is_ssi_usr (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_usr_ius (pi_k => pi_k, pi_d => pi_d, pi_dm => NULL);
  END fn_is_ssi_usr;
  --
  FUNCTION fn_is_ssi_usr_adm (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_usr_ius (pi_k => pi_k, pi_d => pi_d, pi_dm => 'ADM');
  END fn_is_ssi_usr_adm;
  --  
  FUNCTION fn_is_ssi_usr_usr (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_usr_ius (pi_k => pi_k, pi_d => pi_d, pi_dm => 'USR');
  END fn_is_ssi_usr_usr;
  --  
  FUNCTION fn_is_ssi_usr_spt (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_usr_ius (pi_k => pi_k, pi_d => pi_d, pi_dm => 'SPT');
  END fn_is_ssi_usr_spt;
  --  
  FUNCTION fn_is_ssi_usr_acc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_usr_ius (pi_k => pi_k, pi_d => pi_d, pi_dm => 'ACC');
  END fn_is_ssi_usr_acc;
  --  
  FUNCTION fn_ssi_ky (pi_k VARCHAR2, pi_d VARCHAR2) RETURN NUMBER IS
    v_b   NUMBER;
    CURSOR c_yes IS
    SELECT r_k
    FROM t_99_00_ssi
    WHERE UPPER(ssi_id) = UPPER(pi_d)
    AND   ius_yn = 1
    AND   r_k BETWEEN 1 AND 20;
  BEGIN
    --
    pr_load_gvs;
    v_b := NULL;
    --
    IF pi_k = gv_k AND pi_d IS NOT NULL THEN
      OPEN c_yes;
      FETCH c_yes INTO v_b;
      CLOSE c_yes;
    END IF;
    --
    RETURN v_b;
    --
  END fn_ssi_ky;
  -- 
  FUNCTION fn_ssi_id (pi_k VARCHAR2, pi_rk NUMBER) RETURN VARCHAR2 IS
    v_b   VARCHAR2(500);
    CURSOR c_yes IS
    SELECT ssi_id
    FROM t_99_00_ssi
    WHERE r_k = pi_rk
    AND   r_k BETWEEN 1 AND 20;
  BEGIN
    --
    pr_load_gvs;
    v_b := NULL;
    --
    IF pi_k = gv_k AND pi_rk > 0 THEN
      OPEN c_yes;
      FETCH c_yes INTO v_b;
      CLOSE c_yes;
    END IF;
    --
    RETURN v_b;
    --
  END fn_ssi_id;
  --    
  FUNCTION fn_is_ssi_lgn_usr (pi_k VARCHAR2) RETURN BOOLEAN IS
    v_usr_id   VARCHAR2(500);
  BEGIN
    --
    pr_load_gvs;
    v_usr_id := NULL;
    --
    IF v_is_valid_session AND 1 = 1 THEN -- pi_k = gv_k THEN 
      v_usr_id := pkwf_99_glb.fn_usr_id (gv_k);
      RETURN fn_is_ssi_usr (pi_k => gv_k, pi_d => v_usr_id);
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_is_ssi_lgn_usr;
  -- 
  FUNCTION fn_is_apl_adm (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_valid_usr (pi_k => pi_k, pi_dm => 'ADM');
  END fn_is_apl_adm;
  -- 
  FUNCTION fn_is_apl_usr (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_valid_usr (pi_k => pi_k, pi_dm => 'USR');
  END fn_is_apl_usr;
  -- 
  FUNCTION fn_is_spt_usr (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_valid_usr (pi_k => pi_k, pi_dm => 'SPT');
  END fn_is_spt_usr;
  --  
  FUNCTION fn_is_acc_usr (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN fn_is_ssi_valid_usr (pi_k => pi_k, pi_dm => 'ACC');
  END fn_is_acc_usr;
  --
  -- Reset Internal Users Passwords
  PROCEDURE pr_ssi_rp (pi_k1 VARCHAR2, pi_k2 VARCHAR2, pi_uk NUMBER) IS
    v_s   VARCHAR2(500);
  BEGIN 
    pr_load_gvs;
    v_s := TO_CHAR(SYSDATE,'DDMMYYYY')||TO_CHAR(SYSDATE,'YYYYMMDD');  
    IF pi_k1 = gv_k AND pi_k2 = v_s AND fn_is_apl_adm (gv_k) THEN
      pkwf_99_sss.pr_chk_demo_app;
      FOR cr IN (SELECT * FROM t_99_00_ssi ) LOOP
        IF pi_uk = 9999 OR pi_uk = cr.r_k THEN
          pkwf_99_pwm.pr_reset_upw (pi_k => gv_k, pi_un => cr.ssi_id, po_pw => v_s);
        END IF;
      END LOOP;
    ELSE
      pkwf_99_err.pr_raise (pi_id => '990099');      
    END IF;
  END pr_ssi_rp;
  --  
  FUNCTION fn_itl_adm_id (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      RETURN 'APL_ADMIN';
    ELSE
      RETURN NULL;
    END IF;
  END fn_itl_adm_id;
  --  
  -- Installation User ID
  FUNCTION fn_itl_usr_id (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      RETURN 'APL_USER';
    ELSE
      RETURN NULL;
    END IF;
  END fn_itl_usr_id;
  --   
  FUNCTION fn_is_rsv_usr_id (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
    v_b   PLS_INTEGER;
    v_d   VARCHAR2(500);
    CURSOR c_yes IS
    SELECT 1
    FROM t_99_00_ssi
    WHERE (UPPER(ssi_id) = v_d) OR 
          (UPPER(itl_id) = v_d);
  BEGIN
    --
    pr_load_gvs;
    v_b := 1;
    v_d := UPPER(pi_d);
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      v_b := 0;
      OPEN c_yes;
      FETCH c_yes INTO v_b;
      CLOSE c_yes;
      --
      IF NVL(v_b,0) = 0 THEN
        IF v_d IN ('APL_ADMIN','APL_USER') THEN
          v_b := 1;
        ELSIF v_d IN ('SPT_USR1','SPT_USR2','SPT_USR3','SPT_USR4','SPT_USR5') THEN
          v_b := 1;
        ELSIF v_d IN ('ACC_USR1','ACC_USR2','ACC_USR3','ACC_USR4','ACC_USR5') THEN
          v_b := 1;
        END IF;
      END IF;
      --
    END IF;
    --
    IF v_b = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_is_rsv_usr_id;
  --  
  FUNCTION fn_dflt_ipw (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF pi_k = gv_k AND fn_is_apl_adm (gv_k) THEN 
      RETURN 'Jan01$Dec31';
    ELSE
      RETURN NULL;
    END IF;
  END fn_dflt_ipw;
  --  
  FUNCTION fn_is_vrf_usr RETURN BOOLEAN IS
    v_b        PLS_INTEGER;
    v_usr_id   VARCHAR2(500);
    v_usr_ky   NUMBER;
    v_dm       VARCHAR2(30);
    CURSOR c_yes IS
    SELECT 1
    FROM t_99_00_ssi
    WHERE r_k = v_usr_ky
    AND   ssi_id = v_usr_id
    AND   ius_yn = 1
    AND   ssi_dm = v_dm
    AND   r_k BETWEEN 1 AND 20;
  BEGIN
    --
    pr_load_gvs;
    v_b := 0;
    v_usr_ky := 0;
    v_usr_id := NULL;
    v_dm := NULL;
    --
    IF v_is_valid_session THEN
      v_dm := APEX_UTIL.GET_SESSION_STATE('SSI_03');
      v_usr_id := pkwf_99_glb.fn_usr_id (gv_k);
      v_usr_ky := pkwf_99_glb.fn_usr_key (gv_k);
      OPEN c_yes;
      FETCH c_yes INTO v_b;
      CLOSE c_yes;
    END IF;
    --
    IF v_b = 1 THEN
      v_b := 0;
      IF APEX_UTIL.GET_SESSION_STATE('SSI_02') = v_usr_id THEN
        v_b := 1;
      END IF;
    END IF;
    --
    IF v_b = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_is_vrf_usr;  
  --   
  -- Blocks INTERNAL USERS from executing the Procedure
  PROCEDURE pr_rej_itl_usr (pi_k VARCHAR2) IS
    v_bool  BOOLEAN;
  BEGIN
    pr_load_gvs;
    v_bool := TRUE;
    IF v_is_valid_session THEN
      IF NOT fn_is_ssi_lgn_usr (pi_k) THEN
        v_bool := FALSE;
      END IF;      
    END IF;  
    IF v_bool THEN
      pkwf_99_xcp.pr_raise_no_dml_prv (pi_k => gv_k, pi_pg => 'pkwf_99_SSI.PR_REJ_ITL_USR');
    END IF;    
  END pr_rej_itl_usr;
  --
  -- Ensures that only INTERNAL USERS can execute the Procedure  
  PROCEDURE pr_only_itl_usr (pi_k VARCHAR2) IS
    v_bool  BOOLEAN;
  BEGIN
    pr_load_gvs;
    v_bool := TRUE;
    IF v_is_valid_session THEN
      IF fn_is_ssi_lgn_usr (pi_k) THEN
        v_bool := FALSE;
      END IF;      
    END IF;  
    IF v_bool THEN
      pkwf_99_xcp.pr_raise_no_dml_prv (pi_k => gv_k, pi_pg => 'pkwf_99_SSI.PR_ONLY_ITL_USR');
    END IF;    
  END pr_only_itl_usr;
  --  
  PROCEDURE pr_chk_adm_rst_pw (pi_k VARCHAR2) IS
    v_n  PLS_INTEGER := 0;
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      SELECT COUNT(*) INTO v_n FROM t_99_10_pwu; 
      IF NVL(v_n,0) = 0 THEN 
        pkwf_99_err.pr_raise (pi_id => '990066', pi_p1 => 'Before any further processing, change of INSTALL ADMIN password'); 
      END IF;
    ELSE
      pkwf_99_err.pr_raise (pi_id => '990033');
    END IF;      
  END pr_chk_adm_rst_pw;
  --
END pkwf_99_ssi;
/

