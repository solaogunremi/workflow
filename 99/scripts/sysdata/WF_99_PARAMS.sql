ALTER TABLE T_99_00_PMD DISABLE ALL TRIGGERS
/

ALTER TABLE T_99_00_PMV DISABLE ALL TRIGGERS
/

DECLARE
    --
    v_apl_dm     VARCHAR2(5) := '99';
    --
    v_pdm_k      NUMBER;
    v_pvl_ord    PLS_INTEGER;
    v_pdm_ord    PLS_INTEGER;
    v_pmr_dm     VARCHAR2(5);
    v_pmr_dsc    VARCHAR2(50);
    --
    FUNCTION fn_rk RETURN NUMBER IS
      v_k  NUMBER;
    BEGIN
      SELECT S_99_00_RK.NEXTVAL INTO v_k FROM DUAL;
      RETURN v_k;
    END fn_rk;
    --    
    PROCEDURE pr_mnt_pdm IS
    BEGIN
      v_pdm_ord := v_pdm_ord + 10;
      UPDATE T_99_00_PMD SET
        p_dsc = v_pmr_dsc,
        dsp_ord = v_pdm_ord
      WHERE p_dm = v_pmr_dm
      RETURNING r_k INTO v_pdm_k;
      IF SQL%NOTFOUND THEN
        v_pdm_k := fn_rk;
        INSERT INTO T_99_00_PMD
        (r_k, mdl_dm, p_dm, p_dsc, dsp_ord)
        VALUES
        (v_pdm_k, v_apl_dm, v_pmr_dm, v_pmr_dsc, v_pdm_ord);
      END IF;
    END pr_mnt_pdm;
    --
    PROCEDURE pr_mnt_pvl (pi_id     VARCHAR2, 
                          pi_tp     VARCHAR2,  
                          pi_dsc    VARCHAR2, 
                          pi_chg_yn NUMBER DEFAULT 0,
                          pi_dsp_yn NUMBER DEFAULT 0) IS
      v_k     NUMBER;                
      v_dsc   T_99_00_PMV.P_DSC%TYPE := pi_dsc;        
    BEGIN
      IF pi_id LIKE '99_INT%' OR pi_dsp_yn = 0 THEN
        v_dsc := 'System Internal Process';
      END IF;     
      v_pvl_ord := v_pvl_ord + 10;
      UPDATE T_99_00_PMV SET
        p_dsc = v_dsc,
        t_dm = pi_tp,
        core_yn = 1,
        cng_yn = pi_chg_yn,
        dsp_yn = pi_dsp_yn,
        dsp_ord = v_pvl_ord
      WHERE r_p = v_pdm_k
      AND   p_id = pi_id;
      IF SQL%NOTFOUND THEN
        v_k := fn_rk;
        INSERT INTO T_99_00_PMV
        (r_k, r_p, p_id, t_dm, core_yn, p_dsc, cng_yn, dsp_yn, dsp_ord)
        VALUES
        (v_k, v_pdm_k, pi_id, pi_tp, 1, v_dsc, pi_chg_yn, pi_dsp_yn, v_pvl_ord);
      END IF;
    END pr_mnt_pvl;
    --   
    PROCEDURE pr_mnt_dflts IS
    BEGIN
      --
      UPDATE T_99_00_PMV SET V_B = 1 WHERE P_ID = '99_LVO' AND V_B IS NULL;
      UPDATE T_99_00_PMV SET V_B = 1 WHERE P_ID = '99_ADM_YN' AND V_B IS NULL;
      UPDATE T_99_00_PMV SET V_B = 0 WHERE P_ID = '99_OLD_SYM'; --  AND V_B IS NULL;
      UPDATE T_99_00_PMV SET V_C = UPPER(USER) WHERE P_ID = '99_DB_SCH';
      UPDATE T_99_00_PMV SET V_C = 'SYM_99_CTX' WHERE P_ID = '99_APL_CTX' AND V_C IS NULL;
      UPDATE T_99_00_PMV SET V_C = 'SYM' WHERE P_ID = '99_APL_ALS' AND V_C IS NULL;       
      --
      UPDATE T_99_00_PMV SET V_B = 0 WHERE P_ID = '00_EML_DUP_YN'; -- email sharing/duplicates not allowed
      UPDATE T_99_00_PMV SET V_B = 1 WHERE P_ID = '00_APV_YN';     -- approvals are mandatory
      UPDATE T_99_00_PMV SET V_C = 'EN' WHERE P_ID = '00_LGG_DM' AND V_C IS NULL; 
      UPDATE T_99_00_PMV SET V_C = '5' WHERE P_ID = '00_RST_DM' AND V_C IS NULL; -- Retricted from all except ADMINISTRATORS
      UPDATE T_99_00_PMV SET V_N = 5 WHERE P_ID = '00_NME_LEN' AND V_N IS NULL;  
      UPDATE T_99_00_PMV SET V_N = 6 WHERE P_ID = '00_PWD_LEN' AND V_N IS NULL;  
      UPDATE T_99_00_PMV SET V_N = 18000 WHERE P_ID = '00_MST_SECS' AND V_N IS NULL; -- 5 hours
      UPDATE T_99_00_PMV SET V_N = 1800 WHERE P_ID = '00_MIT_SECS' AND V_N IS NULL;   -- 30 mins
      UPDATE T_99_00_PMV SET V_B = 1 WHERE P_ID = '00_AUD_YN' AND V_B IS NULL;
      --
      UPDATE T_99_00_PMV SET V_N = 1900 WHERE P_ID = '00_KPAD' AND V_N IS NULL;   -- over 5 yrs
      UPDATE T_99_00_PMV SET V_N = 5 WHERE P_ID = '00_TLUC' AND V_N IS NULL;  
      UPDATE T_99_00_PMV SET V_N = 1 WHERE P_ID = '00_TLCC' AND V_N IS NULL;        
      --   
      UPDATE T_99_00_PMV SET V_B = 0 WHERE P_ID = 'SMS_PRC_YN' AND V_B IS NULL;
      UPDATE T_99_00_PMV SET V_B = 1 WHERE P_ID = 'SMS_RAISE_ERR' AND V_B IS NULL;
      UPDATE T_99_00_PMV SET V_B = 0 WHERE P_ID = 'SMS_PRXY_IUS' AND V_B IS NULL;  
      UPDATE T_99_00_PMV SET V_N = 0 WHERE P_ID = 'SMS_RSND_CNT' AND V_N IS NULL;    
      UPDATE T_99_00_PMV SET V_N = 234 WHERE P_ID = 'SMS_LZR_RPLC' AND V_N IS NULL;         
      --
    END pr_mnt_dflts;
    --    
    PROCEDURE pr_mnt_int_dflts IS
    BEGIN
      UPDATE T_99_00_PMV SET V_C = '0', V_B = 0, V_N = 0 WHERE P_ID = '99_INT_PRC1' AND V_C IS NULL AND V_N IS NULL;
      UPDATE T_99_00_PMV SET V_C = '0', V_B = 0, V_N = 0 WHERE P_ID = '99_INT_PRC2' AND V_C IS NULL AND V_N IS NULL;
      UPDATE T_99_00_PMV SET V_C = '0', V_B = 0, V_N = 0 WHERE P_ID = '99_INT_PRC3' AND V_C IS NULL AND V_N IS NULL;
      UPDATE T_99_00_PMV SET V_C = '0', V_B = 0, V_N = 0 WHERE P_ID = '99_INT_PRC4' AND V_C IS NULL AND V_N IS NULL;
      UPDATE T_99_00_PMV SET V_C = '0', V_B = 0, V_N = 0 WHERE P_ID = '99_INT_PRC5' AND V_C IS NULL AND V_N IS NULL;
    END pr_mnt_int_dflts;
    --      
BEGIN
    --
    v_pdm_ord := 0;
    --
    -- INSTALLATION PARAMETERS
    v_pdm_k := NULL;
    v_pmr_dm  := '99';
    v_pmr_dsc := 'Installation Parameters';
    pr_mnt_pdm;
    --
    v_pvl_ord := 0;
    pr_mnt_pvl (pi_id => '99_MTI',      pi_tp => 'B', pi_dsc => 'Allow Multiple Business Groups',    pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '99_LVO',      pi_tp => 'B', pi_dsc => 'Installation running in Live mode', pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '99_ADM_YN',   pi_tp => 'B', pi_dsc => 'Allow Installation Administrator logon', pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '99_USR_YN',   pi_tp => 'B', pi_dsc => 'Allow Installation User logon',          pi_chg_yn => 0, pi_dsp_yn => 0);   
    pr_mnt_pvl (pi_id => '99_COR_YN',   pi_tp => 'B', pi_dsc => 'Allow editing of Core Setup data',       pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '99_VIP_YN',   pi_tp => 'B', pi_dsc => 'Validate Installation Parameters',       pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '99_WKS_ID',   pi_tp => 'C', pi_dsc => 'Installation Workspace name',            pi_chg_yn => 0, pi_dsp_yn => 0);    
    pr_mnt_pvl (pi_id => '99_APL_ID',   pi_tp => 'N', pi_dsc => 'System Admin APEX Application',          pi_chg_yn => 0, pi_dsp_yn => 0);   
    pr_mnt_pvl (pi_id => '99_SLGN_APL', pi_tp => 'N', pi_dsc => 'System Login APEX Application',          pi_chg_yn => 0, pi_dsp_yn => 0);     
    pr_mnt_pvl (pi_id => '99_OLD_SYM',  pi_tp => 'B', pi_dsc => 'Not In Use',                             pi_chg_yn => 0, pi_dsp_yn => 0);  
    pr_mnt_pvl (pi_id => '99_DB_SCH',   pi_tp => 'C', pi_dsc => 'Database Schema Name',                   pi_chg_yn => 0, pi_dsp_yn => 0);  
    pr_mnt_pvl (pi_id => '99_APL_CTX',  pi_tp => 'C', pi_dsc => 'Global Application Context',             pi_chg_yn => 0, pi_dsp_yn => 0);  
    pr_mnt_pvl (pi_id => '99_APL_ALS',  pi_tp => 'C', pi_dsc => 'Global Application Alias',               pi_chg_yn => 0, pi_dsp_yn => 0);  
    -- Internal process parameters. Please do not touch!
    pr_mnt_pvl (pi_id => '99_INT_PRC1', pi_tp => 'N', pi_dsc => 'System Internal Process',                pi_chg_yn => 0, pi_dsp_yn => 0);   
    pr_mnt_pvl (pi_id => '99_INT_PRC2', pi_tp => 'N', pi_dsc => 'System Internal Process',                pi_chg_yn => 0, pi_dsp_yn => 0);   
    pr_mnt_pvl (pi_id => '99_INT_PRC3', pi_tp => 'C', pi_dsc => 'System Internal Process',                pi_chg_yn => 0, pi_dsp_yn => 0);   
    pr_mnt_pvl (pi_id => '99_INT_PRC4', pi_tp => 'C', pi_dsc => 'System Internal Process',                pi_chg_yn => 0, pi_dsp_yn => 0);        
    pr_mnt_pvl (pi_id => '99_INT_PRC5', pi_tp => 'C', pi_dsc => 'System Internal Process',                pi_chg_yn => 0, pi_dsp_yn => 0);            
    --    
    -- CORE PARAMETERS
    v_pdm_k := NULL;
    v_pmr_dm  := '00';
    v_pmr_dsc := 'System Core Parameters';
    pr_mnt_pdm;
    --
    v_pvl_ord := 0;
    pr_mnt_pvl (pi_id => '00_CLNT_ID',  pi_tp => 'C', pi_dsc => 'License Organization ID',                  pi_chg_yn => 0, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => '00_CLNT_NME', pi_tp => 'C', pi_dsc => 'License Organization Name',                pi_chg_yn => 0, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => '00_TMZ_NME',  pi_tp => 'C', pi_dsc => 'Organization Timezone Region',             pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_TMZ_OFS',  pi_tp => 'C', pi_dsc => 'Organization Timezone Offset',             pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_TLCC',     pi_tp => 'N', pi_dsc => 'Not In Use',                               pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_TLUC',     pi_tp => 'N', pi_dsc => 'Licensed Number of Users',                 pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_TLVD',     pi_tp => 'N', pi_dsc => 'License Validity Days',                    pi_chg_yn => 0, pi_dsp_yn => 0);  
    pr_mnt_pvl (pi_id => '00_TLIC',     pi_tp => 'C', pi_dsc => 'Not In Use',                               pi_chg_yn => 0, pi_dsp_yn => 0);    
    pr_mnt_pvl (pi_id => '00_LGG_DM',   pi_tp => 'C', pi_dsc => 'Default Language',                         pi_chg_yn => 1, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_NME_LEN',  pi_tp => 'N', pi_dsc => 'Minimum Length of User Names',             pi_chg_yn => 1, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_PWD_LEN',  pi_tp => 'N', pi_dsc => 'Minimum Length of Passwords',              pi_chg_yn => 1, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_RST_DM',   pi_tp => 'C', pi_dsc => 'System Access Restriction Mode',           pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => '00_AUD_ULF_YN', pi_tp => 'B', pi_dsc => 'Audit Unsuccessful User Logins',         pi_chg_yn => 0, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => '00_EML_DUP_YN', pi_tp => 'B', pi_dsc => 'Allow same Email address for multiple users',  pi_chg_yn => 0, pi_dsp_yn => 1);    
    pr_mnt_pvl (pi_id => '00_EML_USR_ID', pi_tp => 'B', pi_dsc => 'Use Email Address as User ID',           pi_chg_yn => 0, pi_dsp_yn => 0); 
    pr_mnt_pvl (pi_id => '00_DSPUSR_PWD', pi_tp => 'B', pi_dsc => 'Display default password at user approval or password reset', pi_chg_yn => 1, pi_dsp_yn => 0); 
    pr_mnt_pvl (pi_id => '00_TIP_YN',     pi_tp => 'B', pi_dsc => 'Only allow Connections from Trusted IP Addresses', pi_chg_yn => 1, pi_dsp_yn => 1);
    --
    pr_mnt_pvl (pi_id => '00_AUD_YN', pi_tp => 'B', pi_dsc => 'Enable Data Auditing',                       pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_APV_YN', pi_tp => 'B', pi_dsc => 'Not In Use',                                 pi_chg_yn => 0, pi_dsp_yn => 0); 
    pr_mnt_pvl (pi_id => '00_EML_YN', pi_tp => 'B', pi_dsc => 'Not In Use',                                 pi_chg_yn => 0, pi_dsp_yn => 0); 
    pr_mnt_pvl (pi_id => '00_SMS_YN', pi_tp => 'B', pi_dsc => 'Not In Use',                                 pi_chg_yn => 0, pi_dsp_yn => 0); 
    pr_mnt_pvl (pi_id => '00_ERR_YN', pi_tp => 'B', pi_dsc => 'Log User Error Messages',                    pi_chg_yn => 1, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_QRY_YN', pi_tp => 'B', pi_dsc => 'Log User Queries',                           pi_chg_yn => 1, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_TRC_YN', pi_tp => 'B', pi_dsc => 'Log Program Trace',                          pi_chg_yn => 1, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_AUD_DEL_YN', pi_tp => 'B', pi_dsc => 'Enable Audit data purge',                pi_chg_yn => 0, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_KPAD',       pi_tp => 'N', pi_dsc => 'Number of Days to keep AUDIT data',      pi_chg_yn => 1, pi_dsp_yn => 0);    
    pr_mnt_pvl (pi_id => '00_LOG_DEL_YN', pi_tp => 'B', pi_dsc => 'Enable Log/Trace data purge',            pi_chg_yn => 1, pi_dsp_yn => 0);
    pr_mnt_pvl (pi_id => '00_KPLD',       pi_tp => 'N', pi_dsc => 'Number of Days to keep LOG data',        pi_chg_yn => 1, pi_dsp_yn => 0);
    --
    pr_mnt_pvl (pi_id => '00_MST_SECS', pi_tp => 'N', pi_dsc => 'Maximum Session Time (In Seconds)',            pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => '00_MIT_SECS', pi_tp => 'N', pi_dsc => 'Maximum Idle Time (In Seconds)',               pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => '00_MUS_CNT',  pi_tp => 'N', pi_dsc => 'Not In Use',                                   pi_chg_yn => 0, pi_dsp_yn => 0); 
    --
    -- EMAIL PARAMETERS
    v_pdm_k := NULL;
    v_pmr_dm  := 'EML';
    v_pmr_dsc := 'Email Parameters';
    pr_mnt_pdm;  
    --    
    v_pvl_ord := 0;
    pr_mnt_pvl (pi_id => 'EML_YN',           pi_tp => 'B', pi_dsc => 'Send Email Messages', pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_RAISE_ERR',    pi_tp => 'B', pi_dsc => 'Raise Email Errors',  pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_INST_URL',     pi_tp => 'C', pi_dsc => 'Email Link - APEX Application URL', pi_chg_yn => 1, pi_dsp_yn => 1);    
    pr_mnt_pvl (pi_id => 'EML_IMG_URL',      pi_tp => 'C', pi_dsc => 'Email Link - APEX Images Directory URL', pi_chg_yn => 1, pi_dsp_yn => 1);    
    pr_mnt_pvl (pi_id => 'EML_SMTP_IP',      pi_tp => 'C', pi_dsc => 'SMTP Host IP',        pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SMTP_PRT',     pi_tp => 'C', pi_dsc => 'SMTP Host Port',      pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SMTP_USR',     pi_tp => 'C', pi_dsc => 'SMTP Username',       pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SMTP_PWD',     pi_tp => 'C', pi_dsc => 'SMTP Password',       pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SMTP_DM',      pi_tp => 'C', pi_dsc => 'SMTP Domain',         pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SMTP_AUTH',    pi_tp => 'B', pi_dsc => 'SMTP Authentication', pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SMTP_TOUT',    pi_tp => 'N', pi_dsc => 'SMTP Timeout (In Seconds)', pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SNDR_NME',     pi_tp => 'C', pi_dsc => 'Email Sender Default Name',   pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SNDR_EML',     pi_tp => 'C', pi_dsc => 'Email Sender Default Address',  pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_TEST_EML',     pi_tp => 'C', pi_dsc => 'Email Test Recipient Address',  pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_SEND_TEST',    pi_tp => 'B', pi_dsc => 'Send All Emails To Test Recipient Address',  pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_HDR_TXT',      pi_tp => 'C', pi_dsc => 'Email Header Text',   pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_FTR_TXT',      pi_tp => 'C', pi_dsc => 'Email Footer Text',   pi_chg_yn => 1, pi_dsp_yn => 1);
    pr_mnt_pvl (pi_id => 'EML_PRC_ITV',      pi_tp => 'N', pi_dsc => 'Email Send Process Interval (In Minutes)', pi_chg_yn => 1, pi_dsp_yn => 1);
    --   
    -- Maintain Default Values
    pr_mnt_dflts;
    pr_mnt_int_dflts;
    --    
END;
/

COMMIT
/

ALTER TABLE T_99_00_PMD ENABLE ALL TRIGGERS
/

ALTER TABLE T_99_00_PMV ENABLE ALL TRIGGERS
/

