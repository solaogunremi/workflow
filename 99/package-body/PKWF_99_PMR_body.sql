CREATE OR REPLACE PACKAGE BODY pkwf_99_pmr AS 
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 25-oct-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Parameters
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
  gv_k           VARCHAR2(100);
  --  
  /* Private Routines */
  --
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
  FUNCTION fn_vlic (pi_mdl VARCHAR2) RETURN BOOLEAN IS
    v_x   VARCHAR2(100);
  BEGIN
    RETURN FALSE;
  END fn_vlic;
  --   
  FUNCTION fn_sys_param_bool (pi_id VARCHAR2) RETURN BOOLEAN IS
    v_v  t_99_00_pmv.v_b%TYPE;
    CURSOR cur_pmv_b IS
    SELECT v_b
    FROM t_99_00_pmv
    WHERE p_id = pi_id;
  BEGIN
    v_v := NULL;
    OPEN cur_pmv_b;
    FETCH cur_pmv_b INTO v_v;
    CLOSE cur_pmv_b;     
    IF v_v = 1 THEN    
      RETURN TRUE;
    ELSIF v_v = 0 THEN
      RETURN FALSE;
    ELSIF pi_id IN ('00_AUD_ULF_YN') THEN -- DEFAULT=TRUE
      RETURN TRUE;
    ELSE -- DEFAULT=FALSE
      RETURN FALSE;
    END IF;
  END fn_sys_param_bool;
  --
  FUNCTION fn_sys_param_char (pi_id VARCHAR2) RETURN VARCHAR2 IS
    v_v  t_99_00_pmv.v_c%TYPE;
    CURSOR cur_pmv_c IS
    SELECT v_c
    FROM t_99_00_pmv
    WHERE p_id = pi_id;
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
    SELECT v_n
    FROM t_99_00_pmv
    WHERE p_id = pi_id;
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
    SELECT v_d
    FROM t_99_00_pmv
    WHERE p_id = pi_id;
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
  -- System Restriction Status
  FUNCTION fn_restrict_sta (pi_k VARCHAR2) RETURN VARCHAR2 IS
    v_vc    t_99_00_pmv.v_c%TYPE;
  BEGIN
    v_vc := '9'; -- INSTALLATION "ADMIN" only
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      v_vc := fn_sys_param_char (pi_id => '00_RST_DM');
    END IF;
    RETURN NVL(v_vc,'9');
  END fn_restrict_sta;
  --
  -- TRUE if System is restricted from user
  FUNCTION fn_restrict_usr_acs (pi_k VARCHAR2, pi_usr_typ VARCHAR2) RETURN BOOLEAN IS
    v_bool  BOOLEAN;
    v_dm    VARCHAR2(30);
    v_vc    t_99_00_pmv.v_c%TYPE;
  BEGIN
    --
    v_bool := FALSE;
    RETURN v_bool;
    --
  END fn_restrict_usr_acs;
  --
  -- Allow Installation Administrator
  FUNCTION fn_use_itl_adm (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_ITL_ADM_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_itl_adm;
  -- 
  -- Allow Installation User
  FUNCTION fn_use_itl_usr (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_ITL_USR_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_itl_usr;
  --   
  FUNCTION fn_use_apv (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_APV_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_apv;
  --    
  FUNCTION fn_use_tip (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_TIP_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_tip;
  --
  FUNCTION fn_use_eml (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN pkwf_99_eml_pmr.fn_eml_yn;
  END fn_use_eml;
  -- 
  FUNCTION fn_use_sms (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_SMS_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_sms;
  --  
  FUNCTION fn_use_err_log (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_ERR_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_err_log;
  --
  FUNCTION fn_use_qry_log (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_QRY_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_qry_log;
  -- 
  FUNCTION fn_use_trc_log (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_TRC_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_trc_log;
  --  
  FUNCTION fn_use_aud (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_AUD_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_aud;
  --  
  -- Maximum Session Time (In Seconds)
  FUNCTION fn_apx_mst (pi_k VARCHAR2) RETURN NUMBER IS
    v_n  NUMBER;
  BEGIN
    --
    pr_load_gvs;
    v_n := 0;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      v_n := fn_sys_param_num (pi_id => '00_MST_SECS');
      v_n := ROUND(v_n);
      --
      IF NVL(v_n,0) <= 0 THEN
        v_n := 7200; -- 2 hours
      ELSIF v_n > 36000 THEN
        v_n := 36000; -- 10 hours
      END IF;    
      --      
    END IF;
    --
    RETURN v_n;
    --
  END fn_apx_mst;
  -- 
  -- Maximum Idle Time (In Seconds)
  FUNCTION fn_apx_mit (pi_k VARCHAR2) RETURN NUMBER IS
    v_n  NUMBER;
  BEGIN
    --
    pr_load_gvs;
    v_n := 0;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      v_n := fn_sys_param_num (pi_id => '00_MIT_SECS');
      v_n := ROUND(v_n);
      --
      IF NVL(v_n,0) <= 0 THEN
        v_n := 900; -- 15 minutes
      ELSIF v_n > 3600 THEN
        v_n := 3600; -- 1 hour
      END IF;    
      --      
    END IF;
    --
    RETURN v_n;
    --
  END fn_apx_mit;
  -- 
  -- Return Installation Language
  FUNCTION fn_itl_lang (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_char (pi_id => '00_LGG_DM');
    ELSE
      RETURN NULL;      
    END IF;
  END fn_itl_lang;
  --  
  -- Minimum length of User Names 
  FUNCTION fn_min_nme_len (pi_k VARCHAR2) RETURN NUMBER IS
    v_n  NUMBER;
  BEGIN
    --
    pr_load_gvs;
    v_n := 500;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      v_n := fn_sys_param_num (pi_id => '00_NME_LEN');
      v_n := ROUND(v_n);
      --
      IF NVL(v_n,0) <= 4 THEN
        v_n := 4; 
      ELSIF v_n > 30 THEN
        v_n := 30; 
      END IF;    
      --      
    END IF;
    --
    RETURN v_n;
    --
  END fn_min_nme_len;
  -- 
  -- Minimum length of Passwords
  FUNCTION fn_min_pw_len (pi_k VARCHAR2) RETURN NUMBER IS
    v_n  NUMBER;
  BEGIN
    --
    pr_load_gvs;
    v_n := 500;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      v_n := fn_sys_param_num (pi_id => '00_PWD_LEN');
      v_n := ROUND(v_n);
      --
      IF NVL(v_n,0) <= 6 THEN
        v_n := 6; 
      ELSIF v_n > 30 THEN
        v_n := 30; 
      END IF;    
      --      
    END IF;
    --
    RETURN v_n;
    --
  END fn_min_pw_len;
  -- 
  -- Yes to same Email address for multiple users registration
  FUNCTION fn_usr_reg_eml_dupl (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_EML_DUP_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_usr_reg_eml_dupl;
  --  
  -- Maximum number of days for verification of Automated User Registration
  FUNCTION fn_max_auv_dys (pi_k VARCHAR2) RETURN NUMBER IS
    v_n  NUMBER;
  BEGIN
    --
    pr_load_gvs;
    v_n := 0;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      v_n := fn_sys_param_num (pi_id => '00_AUV_DYS');
      v_n := ROUND(v_n);
      --
      IF NVL(v_n,0) <= 0 THEN -- 1 day min
        v_n := 1; 
      ELSIF v_n > 180 THEN -- 6 months max 
        v_n := 180; 
      END IF;    
      --      
    END IF;
    --
    RETURN v_n;
    --
  END fn_max_auv_dys;
  --   
  -- Yes to enable editing of Core data
  FUNCTION fn_alw_cor_dml (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_COR_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_alw_cor_dml;
  -- 
  -- Yes to enable purging of AUDIT data
  FUNCTION fn_purge_aud (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_AUD_DEL_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_purge_aud;
  -- 
  -- Yes to enable purging of TRACE/ERROR/QUERY log data
  FUNCTION fn_purge_log (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_LOG_DEL_YN');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_purge_log;
  -- 
  -- Yes to enable auditing of Failed (Unsuccessful) User Logins
  FUNCTION fn_aud_lgn_f (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_AUD_ULF_YN');
    ELSE
      RETURN TRUE;
    END IF;
  END fn_aud_lgn_f;
  -- 
  -- Use Email Address as User ID
  FUNCTION fn_use_email_as_uid (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_EML_USR_ID');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_use_email_as_uid;
  --  
  -- Return Installation Organization ID
  FUNCTION fn_itl_org_id (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_char (pi_id => '00_CLNT_ID');
    ELSE
      RETURN NULL;      
    END IF;
  END fn_itl_org_id;
  --  
  -- Return Installation Organization ID
  FUNCTION fn_itl_org_nme (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_char (pi_id => '00_CLNT_NME');
    ELSE
      RETURN NULL;      
    END IF;
  END fn_itl_org_nme;
  --  
  -- Return Organization timezone offset
  FUNCTION fn_tmz_offset (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_char (pi_id => '00_TMZ_OFS');
    ELSE
      RETURN NULL;      
    END IF;   
  END fn_tmz_offset;
  --    
  -- Return Organization timezone region
  FUNCTION fn_tmz_region (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_char (pi_id => '00_TMZ_NME');
    ELSE
      RETURN NULL;      
    END IF;   
  END fn_tmz_region;
  --      
  FUNCTION fn_is_demo_app RETURN BOOLEAN IS
  BEGIN
    IF fn_sys_param_char (pi_id => '00_WKS_ID') = 'DEMO' THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_is_demo_app;
  --  
  FUNCTION fn_dsp_upw (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '00_DSPUSR_PWD');
    ELSE
      RETURN FALSE;
    END IF;
  END fn_dsp_upw;
  --  
  -- Return APEX Installation Workspace
  FUNCTION fn_apx_wsp (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_char (pi_id => '99_WKS_ID');
    ELSE
      RETURN NULL;
    END IF;  
  END fn_apx_wsp;
  -- 
  -- Return System Admin APEX Application Number
  FUNCTION fn_apx_apl (pi_k VARCHAR2) RETURN NUMBER IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_num (pi_id => '99_APL_ID');
    ELSE
      RETURN NULL;      
    END IF;  
  END fn_apx_apl;
  --  
  -- Return System Login APEX Application Number
  FUNCTION fn_slgn_apl (pi_k VARCHAR2) RETURN NUMBER IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_num (pi_id => '99_SLGN_APL');
    ELSE
      RETURN NULL;      
    END IF;  
  END fn_slgn_apl;
  --     
  FUNCTION fn_vld_itl_pmr (pi_k VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_bool (pi_id => '99_VIP_YN'); -- Validate Install Parameters
    ELSE
      RETURN TRUE;
    END IF;
  END fn_vld_itl_pmr;
  --  
  FUNCTION fn_gl_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('GL');
  END fn_gl_intrf;
  --  
  FUNCTION fn_ln_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('LN');
  END fn_ln_intrf;
  --
  FUNCTION fn_st_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('ST');
  END fn_st_intrf;
  --
  FUNCTION fn_xt_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('XT');
  END fn_xt_intrf;
  -- 
  FUNCTION fn_am_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('AM');
  END fn_am_intrf;
  --    
  FUNCTION fn_tu_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('TU');
  END fn_tu_intrf;
  --  
  FUNCTION fn_ch_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('CH');
  END fn_ch_intrf;
  -- 
  FUNCTION fn_tr_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('TR');
  END fn_tr_intrf;
  --    
  FUNCTION fn_ps_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('PS');
  END fn_ps_intrf;
  --  
  FUNCTION fn_fa_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN fn_vlic ('FA');
  END fn_fa_intrf;
  --    
  FUNCTION fn_oldsa_intrf RETURN BOOLEAN IS
  BEGIN
    RETURN TRUE; -- fn_sys_param_bool (pi_id => '99_OLD_SYM');
  END fn_oldsa_intrf;
  -- 
  FUNCTION fn_dbp_sch (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_sys_param_char (pi_id => '99_DB_SCH');
    ELSE
      RETURN NULL;
    END IF;  
  END fn_dbp_sch;
  --  
  FUNCTION fn_apl_ctx RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_sys_param_char (pi_id => '99_APL_CTX');
  END fn_apl_ctx;
  --   
  FUNCTION fn_apl_ali RETURN VARCHAR2 IS
  BEGIN
    RETURN fn_sys_param_char (pi_id => '99_APL_ALS');
  END fn_apl_ali;
  --    
  FUNCTION fn_lcpy_cnt (pi_k VARCHAR2) RETURN NUMBER IS
    v_c1  NUMBER := 0;
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      v_c1 := fn_sys_param_num (pi_id => '00_TLCC');    
      v_c1 := FLOOR(NVL(v_c1,0));
      IF v_c1 <= 0 THEN
        v_c1 := 1;
      END IF;
    END IF;  
    RETURN v_c1;
  END fn_lcpy_cnt;
  --   
  FUNCTION fn_is_capl (pi_d VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF pi_d IN ('99','SA','CS','DD') THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_is_capl;
  --
  FUNCTION fn_is_slsm (pi_d VARCHAR2) RETURN BOOLEAN IS
    v_m     VARCHAR2(100);
    CURSOR cur_smdl IS
    SELECT mdl_dm
    FROM t_99_00_smdl a
    WHERE a.smdl_dm = pi_d
    AND   a.slo_yn = 1; -- Separately Licensed Option  
  BEGIN
    --
    v_m := NULL;
    OPEN cur_smdl;
    FETCH cur_smdl INTO v_m;
    CLOSE cur_smdl;
    --
    IF v_m IS NULL THEN
      RETURN FALSE;
    ELSIF fn_is_capl (pi_d => v_m) THEN 
      RETURN FALSE;
    ELSE  
      RETURN TRUE;
    END IF;
    --
  END fn_is_slsm;
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
END pkwf_99_pmr;
/

