CREATE OR REPLACE PACKAGE BODY pkwf_99_ath AS 
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: SME Authentication Routines
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
  gv_k            VARCHAR2(100);
  --
  gv_ath_usr      VARCHAR2(500);
  gv_ath_ky       NUMBER;
  gv_sa_ath       BOOLEAN := FALSE;
  gv_sa_apl       VARCHAR2(5) := '99';
  gv_upd_apl      VARCHAR2(5) := 'SA';  
  gv_setup_key    NUMBER := 100;  
  gv_setup_usr    VARCHAR2(30) := 'SETUP';
  gv_is_setup_usr BOOLEAN := FALSE;
  --
  --
  PROCEDURE pr_reset_ath_gvs IS
  BEGIN
    gv_ath_usr := NULL;
    gv_ath_ky := 0;
  END pr_reset_ath_gvs;
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
  FUNCTION fn_is_itl_usr_id (pi_usr VARCHAR2) RETURN BOOLEAN IS
    v_usr   VARCHAR2(500);
  BEGIN
    pr_load_gvs;
    v_usr := UPPER(pi_usr);
    RETURN pkwf_99_ssi.fn_is_ssi_usr (pi_k => gv_k, pi_d => v_usr);
  END fn_is_itl_usr_id;
  --
  -- Create Logon Log record
  FUNCTION fn_log_usr_lgn (pi_r IN t_99_90_lgu%ROWTYPE) RETURN NUMBER IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_r       t_99_90_lgu%ROWTYPE;
  BEGIN
    --
    v_r := pi_r;
    --
    -- Get key directly from sequence to save time
    SELECT s_99_rk.NEXTVAL 
    INTO v_r.r_k 
    FROM dual; 
    --
    v_r.in_tm := pkwf_99_dtm.fn_sys_tmm;
    --
    IF pi_r.s_ky > 0 AND pi_r.usr_dm IS NOT NULL THEN
      v_r.lgn_id := pi_r.usr_dm; -- Hide actual login id (pi_r.lgn_id reveals too much)
    ELSE
      v_r.lgn_id := pi_r.lgn_id; -- User does not exist
    END IF;
    --
    pkwf_99_trg.pr_set_sdml (pi_k => gv_k); -- VIP otherwise table trigger will shout 
    INSERT INTO t_99_90_lgu VALUES v_r;
    pkwf_99_trg.pr_reset_sdml;
    --
    COMMIT;
    --
    RETURN v_r.r_k;
    --
  END fn_log_usr_lgn;
  --
  -- Authentication
  FUNCTION fn_auth (pi_k VARCHAR2, pi_u IN VARCHAR2, pi_p IN VARCHAR2) RETURN BOOLEAN IS
    --
    v_yn            PLS_INTEGER;
    v_valid_yn      PLS_INTEGER;
    v_au_ky         NUMBER;
    v_bool          BOOLEAN;
    v_err_msg       VARCHAR2(1000);
    --
    r_usr           v_99_99_usr%ROWTYPE;
    v_vc            t_99_00_pmv.v_c%TYPE;
    v_vn            t_99_00_pmv.v_n%TYPE;
    r_au            t_99_90_lgu%ROWTYPE;
    --
    CURSOR c_apex_install IS
    SELECT SUBSTR(workspace,1,50) workspace_name, application_id
    FROM apex_applications
    WHERE application_id = APEX_APPLICATION.G_FLOW_ID; 
    --    
    r_apx   c_apex_install%ROWTYPE;
    --
    CURSOR cur_prohibited_ip IS
    SELECT 1
    FROM t_99_10_pip
    WHERE ip_adr = r_au.ip_adr;
    --
    CURSOR cur_trusted_ip IS
    SELECT 1
    FROM t_99_10_tip
    WHERE ip_adr = r_au.ip_adr;
    -- 
    FUNCTION fn_password_is_valid RETURN BOOLEAN IS
    BEGIN
      RETURN pkwf_99_pwm.fn_vld_lpw (pi_k => gv_k, pi_lu => pi_u, pi_lp => pi_p);
    END fn_password_is_valid;
    --
  BEGIN
    --
    pr_reset_ath_gvs;    
    pr_load_gvs;
    pkwf_99_err.pr_reset (pi_k => gv_k);
    v_bool := pkwf_99_sss.fn_clr_usr (gv_k); -- Reset Session States    
    --    
    r_au := NULL;
    r_usr := NULL;
    --
    r_au.lgn_id := UPPER(pi_u);
    r_au.db_sch := SYS_CONTEXT('USERENV','SESSION_USER'); 
    r_au.aci_yn := 0;
    r_au.scs_yn := 0;
    r_au.ip_adr  := SUBSTR(OWA_UTIL.GET_CGI_ENV ('REMOTE_ADDR'),1,20); 
    r_au.web_agt := SUBSTR(OWA_UTIL.GET_CGI_ENV ('HTTP_USER_AGENT'),1,250);
    --
    r_au.ses_id  := APEX_CUSTOM_AUTH.GET_SESSION_ID;
    r_au.cses_id := APEX_CUSTOM_AUTH.GET_SESSION_ID_FROM_COOKIE;
    --
    v_valid_yn := 0;
    gv_is_setup_usr := FALSE;
    --
    IF pi_k = gv_k THEN -- AND r_au.db_sch IN ('APEX_PUBLIC_USER','ANONYMOUS') THEN       
      --  
      -- IF NOT pkwf_99_alp.fn_vlic (pi_k => gv_k, pi_d => gv_sa_apl) THEN -- Not licensed to use application
        -- v_valid_yn := 0;
        -- r_au.err_id := '990125';     
        -- GOTO end_ath_label;        
      -- END IF;
      
      -- Authenticate User
      r_usr := pkwf_99_acs.fn_usr_dtl1 (pi_k => gv_k, pi_id => pi_u);
      --
      IF (r_usr.usr_ky > 0) AND (r_usr.sta_dm IN ('N','L')) THEN
        --
        r_au.s_ky   := r_usr.usr_ky;
        r_au.usr_dm := r_usr.usr_dm;
        --
        IF r_usr.usr_ky = gv_setup_key THEN
          gv_is_setup_usr := TRUE;
        END IF;
        --
        --
        /* IF r_usr.acs_yn = 0 THEN
          --
          r_usr := NULL;
          r_au.err_id := '990033'; -- Invalid connection
          GOTO end_ath_label;        */  
          --
        IF fn_password_is_valid THEN
          --
          IF r_usr.sta_dm = 'L' THEN -- Locked
            v_valid_yn := 0;
            r_au.err_id := '990006'; -- Account is locked       
            GOTO end_ath_label;  
          ELSE
            v_valid_yn := 1;
          END IF;
          --     
        ELSE
          r_usr := NULL;
          r_au.err_id := '990005'; -- Invalid password
          GOTO end_ath_label;
        END IF;   
        --         
      ELSE
        r_usr := NULL;
        r_au.err_id := '990005'; -- Invalid user
        GOTO end_ath_label;
      END IF;
      --    
      -- Validate Installation Parameters
      IF v_valid_yn = 1 THEN
        --
        IF pkwf_99_pmr.fn_vld_itl_pmr (gv_k) AND NOT gv_sa_ath THEN
          --
          r_apx := NULL;
          OPEN c_apex_install;
          FETCH c_apex_install INTO r_apx;
          CLOSE c_apex_install;   
          --
          -- Installation Workspace
          v_vc := pkwf_99_pmr.fn_apx_wsp (gv_k);
          IF UPPER(v_vc) = UPPER(r_apx.workspace_name) THEN
            NULL;
          ELSE
            v_valid_yn := 0; 
            r_au.err_id := '990031'; -- Invalid Installation [1]: Workspace
            GOTO end_ath_label;
          END IF;
          --   
          -- System Admin APEX Application Number
          IF v_valid_yn = 1 THEN
            v_vn := pkwf_99_pmr.fn_apx_apl (gv_k);
            IF v_vn = r_apx.application_id THEN
              NULL;
            ELSE
              v_valid_yn := 0; 
              r_au.err_id := '990032'; -- Invalid Installation [2]: Application
              GOTO end_ath_label;
            END IF;
            --        
          END IF;
          --   
        END IF;
        --        
        -- Running DEMO appication
        IF pkwf_99_pmr.fn_is_demo_app THEN
          IF r_au.ip_adr = '127.0.0.1' THEN
            GOTO end_ath_label;
          ELSE
            v_valid_yn := 0;
            r_au.err_id := '990008'; -- IP ADDRESS is not authorized    
            GOTO end_ath_label;                 
          END IF;
        END IF;
        --
      END IF;
      --
      -- Check IP Address is not prohibited
      IF v_valid_yn = 1 THEN     
        IF gv_is_setup_usr THEN
          NULL;
        ELSE          
          v_yn := 0;
          OPEN cur_prohibited_ip;
          FETCH cur_prohibited_ip INTO v_yn;
          CLOSE cur_prohibited_ip;
          IF v_yn = 1 THEN
            v_valid_yn := 0;
            r_au.err_id := '990007'; -- IP ADDRESS is prohibited       
            GOTO end_ath_label;          
          END IF;
        END IF;
      END IF;
      --
      -- Check IP Address is 'trusted', if so required
      IF v_valid_yn = 1 THEN  
        --
        IF gv_is_setup_usr THEN
          NULL;
        ELSIF pkwf_99_pmr.fn_use_tip (gv_k) THEN
          v_yn := 0;
          OPEN cur_trusted_ip;
          FETCH cur_trusted_ip INTO v_yn;
          CLOSE cur_trusted_ip;
          IF NOT (v_yn = 1) THEN
            v_valid_yn := 0;
            r_au.err_id := '990008'; -- IP ADDRESS is not authorized
            GOTO end_ath_label;
          END IF;   
        END IF;
        --        
      END IF;
      -- 
      -- Additional Checks not applicable to INTERNAL users
      IF r_usr.usr_ky <= 20 THEN
        NULL;
      ELSIF v_valid_yn = 1 THEN 
        --
        IF gv_sa_ath THEN 
          -- Only Admin users allowed to access System Admin 
          IF r_usr.usr_dm = 'ADM' THEN
            NULL;
          ELSE
            v_valid_yn := 0;
            r_au.err_id := '990115'; 
            GOTO end_ath_label;          
          END IF;
          --
        ELSE
          -- Admin users not allowed to access the main applications
          /*
          IF r_usr.usr_dm = 'ADM' THEN
            v_valid_yn := 0;
            r_au.err_id := '990138'; 
            GOTO end_ath_label;          
          END IF;   
          */
          NULL;
          --          
        END IF;
        --     
        -- Check SYSTEM RESTRICTION mode
        IF v_valid_yn = 1 THEN
          IF gv_is_setup_usr THEN
            NULL;
          ELSIF pkwf_99_pmr.fn_restrict_usr_acs (pi_k => gv_k, pi_usr_typ => r_usr.usr_dm) THEN
            v_valid_yn := 0;
            r_au.err_id := '990024'; -- System operating in restricted mode; Access not allowed.   
            GOTO end_ath_label;
          END IF; 
        END IF;          
        -- 
      END IF;        
      --  
    ELSE
      v_valid_yn := 0;
      r_au.err_id := '990002'; -- Invalid Program
    END IF;
    --
    <<end_ath_label>>
    --    
    IF v_valid_yn = 1 THEN
      --     
      -- Create Logon Audit record
      r_au.scs_yn := 1;         
      v_au_ky := fn_log_usr_lgn (pi_r => r_au);     
      -- 
      -- Used by FN_ATH_SSS in confirming that Authentication was successful
      gv_ath_usr := pi_u;
      gv_ath_ky := v_au_ky;
      --
      RETURN TRUE;
      --
    ELSE
      -- AUDIT Unsuccessful Login
      IF pkwf_99_pmr.fn_aud_lgn_f (pi_k => gv_k) THEN
        v_au_ky := fn_log_usr_lgn (pi_r => r_au);     
      END IF;
      --  
      IF r_au.err_id IS NOT NULL THEN
        v_err_msg := pkwf_99_err.fn_err_msg (pi_id => r_au.err_id);
        pkwf_99_err.pr_set (pi_k => gv_k, pi_id => r_au.err_id, pi_dsc => v_err_msg);
      ELSE
        pkwf_99_err.pr_set (pi_k => gv_k, pi_id => NULL, pi_dsc => 'Login Validation Failure.');
      END IF;
      --      
      RETURN FALSE;    
      --
    END IF;
    --
  END fn_auth;
  --
  --       
  /* Public Routines */
  --    
  FUNCTION fn_ath (pi_k VARCHAR2, pi_u IN VARCHAR2, pi_p IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    gv_sa_ath := FALSE;
    RETURN fn_auth (pi_k => pi_k, pi_u => pi_u, pi_p => pi_p);
  END fn_ath;
  --
  FUNCTION fn_athsa (pi_k VARCHAR2, pi_u IN VARCHAR2, pi_p IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    gv_sa_ath := TRUE;
    RETURN fn_auth (pi_k => pi_k, pi_u => pi_u, pi_p => pi_p);
  END fn_athsa;
  --  
  -- Set Post-Authentication Session States
  FUNCTION fn_ath_sss (pi_k VARCHAR2, pi_u IN VARCHAR2) RETURN BOOLEAN IS
    --
    v_uky         NUMBER;
    v_tmm         t_99_00_stc.tmm%TYPE;
    v_cses_id     t_99_90_lgu.cses_id%TYPE;
    v_ses_id      t_99_90_lgu.ses_id%TYPE;
    v_vn          t_99_00_pmv.v_n%TYPE;
    v_vc          t_99_00_pmv.v_c%TYPE;
    v_err_msg     VARCHAR2(1000);
    v_bool        BOOLEAN;
    --
    r_usr         v_99_99_usr%ROWTYPE;
    r_s           v_99_99_sss%ROWTYPE;
    v_sa_yn       VARCHAR2(5);
    --
  BEGIN
    --
    pr_load_gvs;
    pkwf_99_err.pr_reset (pi_k => gv_k);  
    --
    v_bool := pkwf_99_sss.fn_clr_usr (gv_k); -- Reset Session States
    --
    v_bool := FALSE;
    r_s    := NULL;
    r_usr  := NULL;
    --    
    IF (pi_k = gv_k) AND (gv_ath_ky > 0) AND (gv_ath_usr = pi_u) THEN       
      --
      v_uky := NULL;
      --
      BEGIN
        SELECT s_ky
        INTO v_uky
        FROM t_99_90_lgu
        WHERE r_k = gv_ath_ky
        AND   scs_yn = 1
        AND   aci_yn = 0;
      EXCEPTION
        WHEN no_data_found THEN
          NULL;
      END;
      --
      IF v_uky > 0 THEN
        --
        r_usr := pkwf_99_acs.fn_usr_dtl1 (pi_k => gv_k, pi_id => pi_u);
        --
        IF r_usr.usr_ky = v_uky AND r_usr.sta_dm = 'N' THEN
          --
          v_tmm := pkwf_99_dtm.fn_sys_tmm;
          --
          r_s.ssu_p1        := gv_k;
          r_s.ssu_p2        := gv_ath_ky;
          r_s.usr_fulname   := r_usr.ful_nm;
          r_s.usr_shtname   := r_usr.sht_nm;
          r_s.usr_lang      := r_usr.lgg_dm;
          r_s.usr_time_in   := pkwf_99_dtm.fn_tmm_dsc(v_tmm);
          r_s.usr_ltime_in  := r_usr.lin_dt_dsc;
          r_s.ssu_uky       := r_usr.usr_ky;
          r_s.ssu_lky       := gv_ath_ky;
          r_s.ssu_id        := r_usr.usr_id;
          r_s.ssu_adm_yn    := r_usr.adm_yn;
          r_s.ssu_typ       := r_usr.usr_dm;
          --
          v_sa_yn := '0';
          IF gv_sa_ath THEN -- VIP
            r_s.ssu_apl := gv_sa_apl; 
            v_sa_yn := '1';
          END IF;
          --
          --
          v_ses_id  := APEX_CUSTOM_AUTH.GET_SESSION_ID;
          v_cses_id := APEX_CUSTOM_AUTH.GET_SESSION_ID_FROM_COOKIE;
          --            
          -- Delete any current Session States
          pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
          DELETE FROM t_99_90_sss 
          WHERE s_ky = v_uky OR ass_id = v_ses_id;
          --    
          -- Insert Session States for current session
          IF v_sa_yn = '1' THEN
            pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
            INSERT INTO t_99_90_sss
            (r_k, s_ky, ass_id, sss_id)
            SELECT s_99_rk.NEXTVAL, v_uky, v_ses_id, a.sss_id
            FROM t_99_00_sss a
            WHERE a.mdl_dm IN (gv_sa_apl,gv_upd_apl);
          ELSE
            pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
            INSERT INTO t_99_90_sss
            (r_k, s_ky, ass_id, sss_id)
            SELECT s_99_rk.NEXTVAL, v_uky, v_ses_id, a.sss_id
            FROM t_99_00_sss a;          
          END IF;
          --  
          --          
          pkwf_99_sss.pr_set_ath (pi_r => r_s);
          --      
          -- Maximum Session Time (in seconds)
          IF v_uky <= 20 THEN -- Reserved Users
            v_vn := 14400; -- 4 Hours
          ELSE
            v_vn := pkwf_99_pmr.fn_apx_mst (gv_k);
          END IF;
          APEX_UTIL.SET_SESSION_LIFETIME_SECONDS(p_seconds => v_vn);
          --
          -- Maximum Idle Time (in seconds)
          IF v_uky <= 20 THEN -- Reserved Users
            v_vn := 900; -- 15 minutes
          ELSE
            v_vn := pkwf_99_pmr.fn_apx_mit (gv_k);
          END IF;          
          APEX_UTIL.SET_SESSION_MAX_IDLE_SECONDS(p_seconds => v_vn);
          --
          --
          -- Purge User's VPD data
          pkwf_99_vpd.pr_purge;
          --         
          -- Others 
          IF v_uky > 10 THEN
            --
            pkwf_99_trg.pr_set_sdml (pi_k => gv_k); -- VIP otherwise Update won't happen
            UPDATE t_99_90_lgu SET
              aci_yn = 1,
              ses_id = v_ses_id,
              cses_id = v_cses_id
            WHERE r_k = gv_ath_ky;
            --          
            IF v_uky > 20 THEN
              -- Last login 
              pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
              UPDATE t_99_10_ssu SET
                lst_lgn_dt = v_tmm,           -- last logon time
                lgn_cnt = NVL(lgn_cnt,0) + 1, -- logon count,
                rst_lgn_yn = 0                -- force logout
              WHERE r_k = v_uky;     
              --                
            END IF;
            --            
            pkwf_99_trg.pr_reset_sdml;
            --    
            v_bool := TRUE;
            --            
          ELSIF v_uky > 0 THEN
            --
            -- Erase Trace for INSTALLATION ADMIN/USER
            pkwf_99_trg.pr_set_sdml (pi_k => gv_k); -- VIP otherwise Update won't happen
            -- DELETE FROM t_99_90_lgu WHERE r_k = gv_ath_ky;
            UPDATE t_99_90_lgu SET
              aci_yn = 1,
              ses_id = v_ses_id,
              cses_id = v_cses_id
            WHERE r_k = gv_ath_ky;            
            pkwf_99_trg.pr_reset_sdml;
            --   
            v_bool := TRUE;
            --            
          END IF;
          --
          --
        END IF;
        --
      END IF;
      --
    END IF;
    --
    IF v_bool THEN
      v_uky := pkwf_99_sss.fn_ars_val;
      apex_util.set_authentication_result (v_uky);
      IF v_sa_yn = '1' THEN
        pkwf_99_sss.pr_set_app (pi_k => gv_k, pi_p1 => gv_sa_apl);
      END IF;
    ELSE
      v_err_msg := pkwf_99_err.fn_err_msg (pi_id => '990036', pi_p1 => gv_ath_ky, pi_p2 => gv_ath_usr, pi_p3 => pi_u);
      pkwf_99_err.pr_set (pi_k => gv_k, pi_id => '990036', pi_dsc => nvl(v_err_msg,'Post-Authentication failed.'));
    END IF;
    --
    pr_reset_ath_gvs;
    --    
    RETURN v_bool;
    --
  END fn_ath_sss;
  --  
END pkwf_99_ath;
/

