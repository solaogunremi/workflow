CREATE OR REPLACE PACKAGE BODY pkwf_99_sss AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: SME Session States
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
  gv_k                VARCHAR2(100);
  gv_vld_user_key     NUMBER;
  gv_99_appl          VARCHAR2(5) := '99';
  gv_upd_appl         VARCHAR2(5) := 'SA';
  gv_slgn_app_val     VARCHAR2(1000);
  gv_ass_id VARCHAR2(100);
  gv_uk     NUMBER;
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
  END pr_load_gvs;
  --
  PROCEDURE pr_setath (pi_id VARCHAR2, pi_vl VARCHAR2) IS
  BEGIN
    pr_load_gvs;
    IF gv_uk > 0 AND gv_ass_id IS NOT NULL AND SUBSTR(pi_id,1,3) = '99_' THEN
      pk99_trg.pr_set_sdml (pi_k => gv_k);
      UPDATE t_99_90_sss SET
        sss_vl = pi_vl
      WHERE ass_id = gv_ass_id
      AND   s_ky   = gv_uk
      AND   sss_id = pi_id;
      pk99_trg.pr_reset_sdml;    
    END IF;
  END pr_setath;
  --
  PROCEDURE pr_set_slgn_val (pi_v VARCHAR2) IS
    v_apx_app  NUMBER;
  BEGIN
    --
    gv_slgn_app_val := NULL;
    pr_load_gvs;
    --
    -- Check if running System Admin application
    v_apx_app := pkwf_99_pmr.fn_apx_apl (pi_k => gv_k);
    IF v_apx_app = APEX_APPLICATION.G_FLOW_ID THEN
      NULL; -- skip
    ELSE
      -- Get from System Login application
      v_apx_app := pkwf_99_pmr.fn_slgn_apl (pi_k => gv_k);
      IF v_apx_app > 0 THEN
        BEGIN
          gv_slgn_app_val := APEX_UTIL.FETCH_APP_ITEM (p_item => pi_v, p_app => v_apx_app);
        EXCEPTION
          WHEN OTHERS THEN
            NULL;
        END;
      END IF;
      --
    END IF;  
    --
  END pr_set_slgn_val;
  --
  -- YN Session States
  FUNCTION fn_get_bool_sess_val (pi_v VARCHAR2) RETURN BOOLEAN IS
    v_yn        PLS_INTEGER;
  BEGIN
    --
    v_yn := NULL;
    --
    BEGIN
      v_yn := TO_NUMBER(APEX_UTIL.GET_SESSION_STATE(pi_v));
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    --
    IF v_yn = 0 OR v_yn = 1 THEN
      NULL;
    ELSE
      pr_set_slgn_val (pi_v);
      IF gv_slgn_app_val IN ('0','1') THEN
        v_yn := TO_NUMBER(gv_slgn_app_val);
      END IF;
    END IF;
    --
    IF v_yn = 1 THEN    
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --      
  END fn_get_bool_sess_val;
  --  
  -- CHAR Session States
  FUNCTION fn_get_char_sess_val (pi_v VARCHAR2) RETURN VARCHAR2 IS
    v_val VARCHAR2(500);
  BEGIN
    --
    v_val := NULL;
    --
    BEGIN
      v_val := APEX_UTIL.GET_SESSION_STATE(pi_v);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    --
    IF v_val IS NULL THEN
      pr_set_slgn_val (pi_v);
      v_val := gv_slgn_app_val;
    END IF;
    --
    RETURN v_val;
    --
  END fn_get_char_sess_val;
  -- 
  -- NUMBER Session States
  FUNCTION fn_get_num_sess_val (pi_v VARCHAR2) RETURN NUMBER IS
    v_val NUMBER;
  BEGIN
    --
    v_val := NULL;
    BEGIN
      v_val := TO_NUMBER(APEX_UTIL.GET_SESSION_STATE(pi_v));
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    --
    IF v_val IS NULL THEN
      pr_set_slgn_val (pi_v);
      IF gv_slgn_app_val IS NOT NULL THEN
        BEGIN
          v_val := TO_NUMBER(gv_slgn_app_val);
        EXCEPTION
          WHEN OTHERS THEN
            NULL;
        END;
      END IF;
    END IF;
    --    
    RETURN v_val;
    --
  END fn_get_num_sess_val;
  --    
  PROCEDURE pr_mnt_apl_id (pi_mdl IN VARCHAR2) IS
    --
    v_apl_id   VARCHAR2(30) := NULL;
    v_capl_id  VARCHAR2(30) := NULL;
    --
    CURSOR cur_apl IS
    SELECT apl_id
    FROM t_99_00_mdl
    WHERE mdl_dm = pi_mdl;
    --
  BEGIN
    --
    /*
    IF pi_mdl = 'AM' THEN 
      v_apl_id := pk99$$am.fn_get_hm_apx_apl;
    ELSE
      v_apl_id := TO_CHAR(APEX_APPLICATION.G_FLOW_ID);
    END IF;
    */
    --
    IF v_apl_id IS NOT NULL THEN
      --
      OPEN cur_apl;
      FETCH cur_apl INTO v_capl_id;
      CLOSE cur_apl;
      --
      IF v_apl_id = v_capl_id THEN
        NULL;
      ELSE
        pr_load_gvs;
        pkwf_99_trg.pr_set_smnt (pi_k => gv_k); 
        UPDATE t_99_00_mdl SET
          apl_id = v_apl_id
        WHERE mdl_dm = pi_mdl;
        pkwf_99_trg.pr_reset_sdml;  
      END IF;
      --
    END IF;      
    --
  END pr_mnt_apl_id;
  --     
  PROCEDURE pr_set_slgn_apl IS
    v_apl   NUMBER;
    v_apx   NUMBER := APEX_APPLICATION.G_FLOW_ID;
  BEGIN
    v_apl := pkwf_99_pmr.fn_slgn_apl (pi_k => gv_k);
    IF v_apl = v_apx THEN
      NULL;
    ELSE
      pkwf_99_trg.pr_set_smnt (pi_k => gv_k); 
      UPDATE t_99_00_pmv SET
        v_n = v_apx,
        v_c = TO_CHAR(v_apx)
      WHERE p_id = '99_SLGN_APL'
      AND   r_p IN (SELECT a.r_k 
                    FROM t_99_00_pmd a 
                    WHERE a.mdl_dm = gv_99_appl
                    AND   a.p_dm = '99');
      pkwf_99_trg.pr_reset_sdml;    
    END IF;
  END pr_set_slgn_apl;
  -- 
  PROCEDURE pr_set_adm_apl IS
    v_apl   NUMBER;
    v_apx   NUMBER := APEX_APPLICATION.G_FLOW_ID;
  BEGIN
    v_apl := pkwf_99_pmr.fn_apx_apl (pi_k => gv_k);
    IF v_apl = v_apx THEN
      NULL;
    ELSE
      pkwf_99_trg.pr_set_smnt (pi_k => gv_k); 
      UPDATE t_99_00_pmv SET
        v_n = v_apx,
        v_c = TO_CHAR(v_apx)
      WHERE p_id = '99_APL_ID'
      AND   r_p IN (SELECT a.r_k 
                    FROM t_99_00_pmd a 
                    WHERE a.mdl_dm = gv_99_appl
                    AND   a.p_dm = '99');
      pkwf_99_trg.pr_reset_sdml;    
    END IF;
  END pr_set_adm_apl;
  --   
  -- Update Logon Log record
  PROCEDURE pr_usr_lgn_upd IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_k             NUMBER;
    v_tm            t_99_90_lgu.out_tm%TYPE;
    v_ses_id        t_99_90_lgu.ses_id%TYPE;
  BEGIN
    --
    pr_load_gvs;
    v_k := fn_get_num_sess_val (pi_v => 'SSU_LKY'); -- Logon key
    v_ses_id := APEX_CUSTOM_AUTH.GET_SESSION_ID;
    --
    IF v_k > 0 THEN
      --
      v_tm := pkwf_99_dtm.fn_sys_tmm;
      pkwf_99_trg.pr_set_sdml (pi_k => gv_k); -- VIP otherwise table trigger will shout 
      UPDATE t_99_90_lgu SET
        out_tm = v_tm
      WHERE r_k = v_k;
      -- Delete current Role privileges
      pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
      DELETE FROM t_99_90_lgp WHERE lgn_ky = v_k;
      --     
    END IF;
    --
    --
    v_k := fn_get_num_sess_val (pi_v => 'SSU_UKY'); -- User key  
    IF v_k > 0 THEN
      --
      pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
      DELETE FROM t_99_90_lgp WHERE s_ky = v_k;
      --
      pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
      DELETE FROM t_99_90_sss 
      WHERE s_ky = v_k OR ass_id = v_ses_id;
      --         
    END IF;
    --
    pkwf_99_trg.pr_reset_sdml;
    --          
    COMMIT;
    --
  END pr_usr_lgn_upd;
  --  
  FUNCTION fn_99_apx_apl RETURN NUMBER IS
    v_apx_apl  NUMBER := 99;
  BEGIN
    RETURN v_apx_apl;
  END fn_99_apx_apl;
  --       
  --       
  /* Public Routines */
  --  
  -- Reset PARAMETERS Session States
  PROCEDURE pr_clr_pmr (pi_k  VARCHAR2) IS
  BEGIN
    --
    apex_util.set_session_state('SSP_PMV',NULL);     -- FRONT-END Interface Parameter variable
    --  
  END pr_clr_pmr;
  --      
  -- Reset Authentication Session States
  FUNCTION fn_clr_usr (pi_k  VARCHAR2) RETURN BOOLEAN IS
    v_bool  BOOLEAN;
  BEGIN
    -- 
    pr_load_gvs;
    --
    /*
    -- Reset User Session States
    apex_util.set_session_state('USR_FULNAME',NULL);  
    apex_util.set_session_state('USR_SHTNAME',NULL);   
    apex_util.set_session_state('USR_LANG',NULL);      -- USER LANGUAGE  
    apex_util.set_session_state('USR_TIME_IN',NULL);   -- LOGIN time
    apex_util.set_session_state('USR_LTIME_IN',NULL);  -- Last LOGIN time
    apex_util.set_session_state('USR_TMZ_OFS',NULL);   -- Timezone Offset
    apex_util.set_session_state('USR_TMZ_NME',NULL);   -- Timezone Region
    --      
    apex_util.set_session_state('SSU_UKY',NULL);       -- USER key
    apex_util.set_session_state('SSU_LKY',NULL);       -- LOGON key      
    apex_util.set_session_state('SSU_ID',NULL);        -- USER ID
    apex_util.set_session_state('SSU_VPDID',NULL);     -- VPD ID
    apex_util.set_session_state('SSU_TYP',NULL);       -- User Type
    apex_util.set_session_state('SSU_ADM_YN',NULL);    -- ADMIN flag
    apex_util.set_session_state('SSU_APL',NULL);        -- Current APPLICATION 
    apex_util.set_session_state('SSU_CPY',NULL);        -- Current Company 
    apex_util.set_session_state('SSU_QRYONLY_YN',NULL); -- Query-only allowed
    --
    -- Set System Parameters Session States
    apex_util.set_session_state('SSP_PIN',NULL);     -- FRONT-END Interface Programs Parameter Key
    --    
    -- Reset Application Session States
    pr_clr_apl (gv_k); 
    --  
    -- Reset Parameters Session States
    pr_clr_pmr (gv_k); 
    --        
    -- Reset Error Messages Session States
    pkwf_99_err.pr_reset (gv_k);
    --
    -- Reset Internal Users Session States (Set from PK99_SSI)
    apex_util.set_session_state('SSI_01',NULL);  
    apex_util.set_session_state('SSI_02',NULL);  
    apex_util.set_session_state('SSI_03',NULL);  
    apex_util.set_session_state('SSI_04',NULL);  
    -- 
    -- Clear User's VPD Data
    pkwf_99_vpd.pr_purge;
    --
    -- Reset Authentication Result
    apex_util.set_authentication_result(-1);
    --
    */
    --
    --
    RETURN TRUE;
    --    
  END fn_clr_usr;
  --  
  -- Reset Module Session States
  PROCEDURE pr_clr_apl (pi_k VARCHAR2) IS
  BEGIN
    -- 
    pr_load_gvs;
    -- Reset Function Access Session States 
    apex_util.set_session_state('SSU_APL',NULL);   
    -- Reset Error Messages Session States
    pkwf_99_err.pr_reset (gv_k);
    --         
  END pr_clr_apl;
  -- 
  -- Pre-logout 
  PROCEDURE pr_clr_ses IS
    v_bool  BOOLEAN;
  BEGIN
    -- 
    pr_load_gvs;
    --
    -- Update Audit table
    pr_usr_lgn_upd;
    --
    -- Purge VPD data
    pkwf_99_vpd.pr_purge;
    --
    -- Clean up Application Session States
    v_bool := fn_clr_usr (gv_k);
    --
    -- Purge APEX sessions older than 8 hours
    -- wwv_flow_cache.purge_sessions(p_purge_sess_older_then_hrs => 8);
    --
  END pr_clr_ses;
  --   
  -- Logout Procedure
  PROCEDURE pr_lgnoff (pi_k  VARCHAR2) IS
    v_bool      BOOLEAN;
    v_apx_app   NUMBER;
  BEGIN
    -- 
    /*
    pr_load_gvs;
    v_apx_app := pkwf_99_pmr.fn_apx_apl (pi_k => gv_k);
    IF v_apx_app = APEX_APPLICATION.G_FLOW_ID THEN
      NULL; 
    ELSE
      v_apx_app := pkwf_99_pmr.fn_slgn_apl (pi_k => gv_k);   
      IF v_apx_app IS NULL THEN
        v_apx_app := APEX_APPLICATION.G_FLOW_ID;
      END IF;
    END IF;
    --
    --    
    pr_clr_ses;
    --
    */
    --
    -- Delete all collections defined in the current session
    APEX_COLLECTION.DELETE_ALL_COLLECTIONS_SESSION;    
    --
    -- Clear User Cache
    APEX_UTIL.CLEAR_USER_CACHE;
    --
    APEX_APPLICATION.G_UNRECOVERABLE_ERROR := TRUE; 
    --
    APEX_CUSTOM_AUTH.LOGOUT
    (p_this_app             => V('APP_ID'),
     p_next_app_page_sess   => v_apx_app||':101:'||APEX_CUSTOM_AUTH.GET_NEXT_SESSION_ID); 
    --
    APEX_APPLICATION.STOP_APEX_ENGINE;
    --
  END pr_lgnoff;
  --  
  -- Returns Error Code if Session Connection is invalid
  FUNCTION fn_sss_err (pi_k VARCHAR2) RETURN VARCHAR2 IS
    v_err         VARCHAR2(30);
    v_err_msg     VARCHAR2(1000);
    gv_vld_user_key    NUMBER;
  BEGIN
    --
    v_err := '990033'; -- Invalid Session
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN   
      --
      IF APEX_CUSTOM_AUTH.IS_SESSION_VALID THEN
        --
        IF APEX_CUSTOM_AUTH.SESSION_ID_EXISTS THEN
          --
          gv_vld_user_key := fn_get_num_sess_val ('SSU_UKY');
          --
          IF gv_vld_user_key > 0 THEN
            v_err := NULL;
          ELSE
            v_err := '990035'; -- Session not authenticated
          END IF;
          --
        ELSE
          v_err := '990034'; -- Session Identifier not found
        END IF;
        --
      ELSE
        v_err := '990033'; -- Invalid Session
      END IF;
      --
    ELSE
      v_err := '990002'; -- Invalid Program
    END IF;
    --
    IF v_err IS NOT NULL THEN
      v_err_msg := pkwf_99_err.fn_err_msg (pi_id => v_err);
      pkwf_99_err.pr_set (pi_k => gv_k, pi_id => v_err, pi_dsc => v_err_msg);
    END IF;
    --  
    RETURN v_err;
    --    
  END fn_sss_err;
  --  
  -- Validate Session Connection
  PROCEDURE pr_vld_sss (pi_k VARCHAR2) IS
    v_err  VARCHAR2(30);
  BEGIN
    --
    v_err := fn_sss_err (pi_k => pi_k);
    --
    IF v_err IS NOT NULL THEN
      pr_load_gvs;
      pr_lgnoff (pi_k => gv_k);
      pkwf_99_err.pr_raise (pi_id => v_err); 
    END IF;
    --
  END pr_vld_sss;
  --  
  -- Validate Demo Mode
  PROCEDURE pr_chk_demo_app IS
  BEGIN
    NULL;
  END pr_chk_demo_app;
  --  
  -- Set Authenticated Session parameters
  PROCEDURE pr_set_ath (pi_r  IN v_99_99_sss%rowtype) IS
    v_c     VARCHAR2(100);
  BEGIN
    --
    pr_load_gvs;
    --
    IF pi_r.ssu_p1 = gv_k AND pi_r.ssu_p2 = pi_r.ssu_lky THEN  
      --    
      apex_util.set_session_state('USR_FULNAME',  pi_r.usr_fulname);  
      apex_util.set_session_state('USR_SHTNAME',  pi_r.usr_shtname);   
      apex_util.set_session_state('USR_LANG',     pi_r.usr_lang); 
      apex_util.set_session_state('USR_TIME_IN',  pi_r.usr_time_in);
      apex_util.set_session_state('USR_LTIME_IN', pi_r.usr_ltime_in);
      --
      apex_util.set_session_state('SSU_UKY',      pi_r.ssu_uky);    
      apex_util.set_session_state('SSU_LKY',      pi_r.ssu_lky);  
      apex_util.set_session_state('SSU_ID',       pi_r.ssu_id);
      apex_util.set_session_state('SSU_ADM_YN',   pi_r.ssu_adm_yn);
      apex_util.set_session_state('SSU_TYP',      pi_r.ssu_typ); 
      apex_util.set_session_state('SSU_APL',      pi_r.ssu_apl); 
      --  
      v_c := pkwf_99_pmr.fn_tmz_offset (gv_k); 
      apex_util.set_session_state('USR_TMZ_OFS', v_c);  
      v_c := pkwf_99_pmr.fn_tmz_region (gv_k); 
      apex_util.set_session_state('USR_TMZ_NME', v_c);        
      --
      IF pi_r.ssu_adm_yn = '1' OR TO_NUMBER(pi_r.ssu_uky) < 20  THEN
         apex_util.set_session_state('SSU_QRYONLY_YN','0');
      ELSE
        v_c := pkwf_99_pmr.fn_restrict_sta (pi_k => gv_k); -- SYSTEM RESTRICTION STATUS
        IF v_c = '1' THEN -- QUERY-only mode for all Users
          apex_util.set_session_state('SSU_QRYONLY_YN','1');
        END IF;
      END IF;
      --
      IF pi_r.ssu_apl = gv_99_appl THEN
        pr_set_adm_apl; -- System Admin APEX Application
      ELSE
        pr_set_slgn_apl; -- System Login APEX Application
      END IF;
      --
      --
      pr_setath (pi_id => '99_LGN_KY',  pi_vl => pi_r.ssu_lky);
      pr_setath (pi_id => '99_LGN_ID',  pi_vl => pi_r.ssu_id);
      pr_setath (pi_id => '99_USR_KY',  pi_vl => pi_r.ssu_uky);
      pr_setath (pi_id => '99_USR_NM',  pi_vl => pi_r.usr_fulname);
      pr_setath (pi_id => '99_RPT_NM',  pi_vl => pi_r.usr_shtname);
      --
      --
    ELSE
      pr_lgnoff (pi_k => gv_k);
      pkwf_99_err.pr_raise (pi_id => '990033'); -- Invalid session
    END IF;
    --
  END pr_set_ath;
  --
  FUNCTION fn_vld_conn (pi_k VARCHAR2) RETURN BOOLEAN IS
    v_yn       PLS_INTEGER;
    v_bool     BOOLEAN := FALSE;
    v_sss_vl   VARCHAR2(4000) := NULL;
  BEGIN
    --
    gv_vld_user_key := NULL;
    pr_load_gvs;
    v_yn := 0;
    --  
    IF APEX_CUSTOM_AUTH.SESSION_ID_EXISTS THEN
      IF APEX_CUSTOM_AUTH.CURRENT_PAGE_IS_PUBLIC THEN    
        v_yn := 1;
      ELSIF WWV_FLOW.PUBLIC_ROLE_CHECK (p_role => 'MUST_NOT_BE_PUBLIC_USER') THEN
        v_yn := 1;
      END IF;
    END IF;
    --
    IF v_yn = 1 THEN
      gv_vld_user_key := fn_get_num_sess_val('SSU_UKY');
    END IF;
    --
    IF gv_vld_user_key > 0 THEN
      --v_sss_vl := pk99$$ss.fn_get (pi_id => '99_USR_KY');
      --IF v_sss_vl = TO_CHAR(gv_vld_user_key) THEN
        v_bool := TRUE;
      --END IF;
    END IF;
    --
    IF v_bool THEN
      RETURN TRUE;
    ELSE
      gv_vld_user_key := NULL;
      RETURN FALSE;    
    END IF;
    --
  END fn_vld_conn;
  --  
  -- Returns User Key
  FUNCTION fn_usr_key (pi_k VARCHAR2) RETURN NUMBER IS
    v_bool  BOOLEAN;
  BEGIN
    gv_vld_user_key := NULL;
    v_bool := fn_vld_conn (pi_k);
    RETURN gv_vld_user_key;
  END fn_usr_key;
  --  
  -- Return User ID
  FUNCTION fn_usr_id (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF fn_vld_conn (pi_k) THEN
      RETURN fn_get_char_sess_val (pi_v => 'SSU_ID');
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_id;
  --
  -- Return User Type
  FUNCTION fn_usr_typ (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF fn_vld_conn (pi_k) THEN
      RETURN fn_get_char_sess_val (pi_v => 'SSU_TYP');
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_typ;
  --    
  -- Return User Language
  FUNCTION fn_usr_lang (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF fn_vld_conn (pi_k) THEN
      RETURN fn_get_char_sess_val (pi_v => 'USR_LANG');
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_lang;
  --  
  -- Return Logon Key
  FUNCTION fn_lgn_key (pi_k VARCHAR2) RETURN NUMBER IS
  BEGIN
    IF fn_vld_conn (pi_k) THEN
      RETURN fn_get_num_sess_val (pi_v => 'SSU_LKY');
    ELSE
      RETURN NULL;
    END IF;
  END fn_lgn_key;
  -- 
  -- Returns TRUE if user is a SYSTEM ADMIN
  FUNCTION fn_is_adm_usr (pi_k VARCHAR2) RETURN BOOLEAN IS
    v_bool  BOOLEAN;
  BEGIN
    --
    v_bool := FALSE;
    --
    IF fn_vld_conn (pi_k) THEN
      IF gv_vld_user_key > 20 THEN -- SYSTEM USERS
        v_bool := fn_get_bool_sess_val (pi_v => 'SSU_ADM_YN');
      ELSIF gv_vld_user_key > 0 THEN -- INSTALLATION ADMIN or INTERNAL SUPPORT
        IF pkwf_99_ssi.fn_is_vrf_usr THEN
          v_bool := pkwf_99_ssi.fn_is_apl_adm (pi_k);
          IF NOT v_bool THEN
            v_bool := pkwf_99_ssi.fn_is_spt_usr (pi_k);
          END IF;
        END IF;
      END IF;
    END IF;
    --
    IF v_bool THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_is_adm_usr;
  --  
  -- Return User Timezone Offset
  FUNCTION fn_usr_tmz_offset (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF fn_vld_conn (pi_k) THEN
      RETURN fn_get_char_sess_val (pi_v => 'USR_TMZ_OFS');
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_tmz_offset;
  --  
  -- Return User Timezone Region
  FUNCTION fn_usr_tmz_region (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF fn_vld_conn (pi_k) THEN
      RETURN fn_get_char_sess_val (pi_v => 'USR_TMZ_NME');
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_tmz_region;
  --    
  -- Return User's current application
  FUNCTION fn_crnt_appl (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF fn_vld_conn (pi_k) THEN
      RETURN fn_get_char_sess_val (pi_v => 'SSU_APL');
    ELSE
      RETURN NULL;
    END IF;
  END fn_crnt_appl;
  -- 
  -- Returns TRUE if user is a SYSTEM ADMIN
  FUNCTION fn_query_only (pi_k VARCHAR2) RETURN BOOLEAN IS
    v_bool  BOOLEAN;
  BEGIN
    --
    v_bool := TRUE;
    --
    IF fn_vld_conn (pi_k) THEN
      v_bool := FALSE;
      IF gv_vld_user_key > 20 THEN -- SYSTEM USERS
        v_bool := fn_get_bool_sess_val (pi_v => 'SSU_QRYONLY_YN');
      END IF;
    END IF;
    --
    RETURN v_bool;
    --
  END fn_query_only;
  -- 
  -- Returns User Key (during Auditing)
  FUNCTION fn_au_uk (pi_k VARCHAR2) RETURN NUMBER IS
  BEGIN
    IF pi_k = '$$PK99$AuDiT$$' THEN
      RETURN fn_get_num_sess_val (pi_v => 'SSU_UKY');
    ELSE
      RETURN NULL;
    END IF;
  END fn_au_uk;
  --    
  -- Returns Logon Key (during Auditing)
  FUNCTION fn_au_lk (pi_k VARCHAR2) RETURN NUMBER IS
  BEGIN
    IF pi_k = '$$PK99$AuDiT$$' THEN
      RETURN fn_get_num_sess_val (pi_v => 'SSU_LKY');
    ELSE
      RETURN NULL;
    END IF;
  END fn_au_lk;
  --      
  -- Return Currently running Function
  FUNCTION fn_fnc_id (pi_k VARCHAR2) RETURN VARCHAR2 IS
    v_id      VARCHAR2(100);
  BEGIN
    v_id := NULL;
    pr_load_gvs;
    IF pi_k = gv_k THEN 
      BEGIN
        v_id := APEX_APPLICATION.G_FLOW_STEP_ID;
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END IF;
    RETURN v_id;
  END fn_fnc_id;
  --   
  FUNCTION fn_crnt_appl_sa (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF fn_crnt_appl (pi_k) = gv_99_appl THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_crnt_appl_sa;
  --  
  FUNCTION fn_ars_val RETURN NUMBER IS
  BEGIN
    RETURN 675435;
  END fn_ars_val;
  --  
  -- Set Application Session parameters
  PROCEDURE pr_set_app (pi_k VARCHAR2, pi_p1 VARCHAR2) IS
    --
    v_app_id    VARCHAR2(100) := UPPER(pi_p1);
    v_ssu_apl   VARCHAR2(100);
    v_lgn_app   NUMBER;
    --
    /*
    PROCEDURE pr_reset_val IS
    BEGIN
      apex_util.set_session_state('USR_FULNAME',  NULL);  
      apex_util.set_session_state('USR_TIME_IN',  NULL);
      apex_util.set_session_state('USR_LTIME_IN', NULL);
      apex_util.set_session_state('SSU_UKY',      NULL);    
      apex_util.set_session_state('SSU_ID',       NULL);
    END;
    --    
    PROCEDURE pr_set_val (pi_v  VARCHAR2) IS
      v_val  VARCHAR2(500);
    BEGIN
      v_val := NULL;
      BEGIN
        v_val := APEX_UTIL.FETCH_APP_ITEM (p_item => pi_v, p_app => v_lgn_app);
        APEX_UTIL.SET_SESSION_STATE(pi_v, v_val);  
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;      
    END;
    */
    -- 
  BEGIN
    --
    v_ssu_apl := fn_get_char_sess_val (pi_v => 'SSU_APL');
    --
    /*
    IF v_app_id = v_ssu_apl THEN -- already updated
      pr_mnt_apl_id (pi_mdl => v_app_id);
    ELSIF v_app_id = gv_99_appl THEN -- System Admin
      pr_mnt_apl_id (pi_mdl => v_app_id);
    ELSIF v_app_id = gv_upd_appl THEN -- Updates  
      --
      v_lgn_app := fn_99_apx_apl; -- System Admin Apex application
      --
      IF v_lgn_app > 0 THEN
        --
        pr_reset_val;
        --
        APEX_UTIL.SET_SESSION_STATE('SSU_APL',v_app_id);  
        pk99$$ss.pr_set_crnt_mdl (pi_id => v_app_id);
        --
        pr_set_val('USR_FULNAME');
        pr_set_val('USR_TIME_IN');
        pr_set_val('USR_LTIME_IN');
        pr_set_val('SSU_UKY');
        pr_set_val('SSU_ID');
        --
        pr_mnt_apl_id (pi_mdl => v_app_id);
        --      
      END IF;
      --
    ELSIF APEX_CUSTOM_AUTH.CURRENT_PAGE_IS_PUBLIC THEN
      NULL;      
    ELSIF v_app_id IS NOT NULL THEN
      --
      pr_load_gvs;
      --
      IF pi_k = gv_k THEN  
        --  
        -- Check if running System Admin application
        v_lgn_app := pkwf_99_pmr.fn_apx_apl (pi_k => gv_k);
        IF v_lgn_app = APEX_APPLICATION.G_FLOW_ID THEN
          NULL; -- skip
        ELSE
          -- Check if running System Login application
          v_lgn_app := pkwf_99_pmr.fn_slgn_apl (pi_k => gv_k);
          --
          IF v_lgn_app = APEX_APPLICATION.G_FLOW_ID THEN
            --
            pr_mnt_apl_id (pi_mdl => v_app_id);
            --
          ELSIF v_lgn_app > 0 THEN
            --
            pr_reset_val;
            --
            APEX_UTIL.SET_SESSION_STATE('SSU_APL',v_app_id);  
            pk99$$ss.pr_set_crnt_mdl (pi_id => v_app_id);
            --
            pr_set_val('USR_FULNAME');
            pr_set_val('USR_TIME_IN');
            pr_set_val('USR_LTIME_IN');
            pr_set_val('SSU_UKY');
            pr_set_val('SSU_ID');
            --
            pr_mnt_apl_id (pi_mdl => v_app_id);
            --
          END IF;
          --
        END IF;
        --
      ELSE
        pr_lgnoff (pi_k => gv_k);
        pkwf_99_err.pr_raise (pi_id => '990033'); -- Invalid session        
      END IF;
      --      
    ELSE
      pr_lgnoff (pi_k => gv_k);
      pkwf_99_err.pr_raise (pi_id => '990033'); -- Invalid session
    END IF;
    --
    */
    --
  END pr_set_app;
  --  
END pkwf_99_sss;
/

