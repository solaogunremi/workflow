create or replace PACKAGE BODY pkwf_99_acp AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 27-oct-2012
  **
  ** PURPOSE: 99 Access Privileges
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
  --
  gv_usr_key            NUMBER;
  gv_lgn_key            NUMBER;
  gv_usr_id             VARCHAR2(100);
  gv_sa_apl             VARCHAR2(5) := '99';
  gv_upd_apl            VARCHAR2(5) := 'SA';    
  gv_ssi_usr            BOOLEAN := FALSE;
  gv_valid_usr          BOOLEAN := FALSE;
  gv_change_pwd         BOOLEAN := FALSE;
  gv_adm_user           BOOLEAN := FALSE;
  gv_force_logout       BOOLEAN := FALSE;
  gv_expired_lic        BOOLEAN := FALSE;
  --
  gv_allow_own_apr      BOOLEAN := FALSE;
  --
  --
  CURSOR cur_usr IS
  SELECT r_k, lgn_id, usr_dm, cng_pw_yn, edt_yn, vrf_yn, apr_yn, rst_lgn_yn
  FROM t_99_10_ssu
  WHERE r_k = gv_usr_key
  AND   r_s = 1
  AND   sta_dm = 'N';
  --
  gv_cr  cur_usr%rowtype;
  --  
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    gv_ssi_usr     := FALSE;
    gv_valid_usr   := FALSE;
    gv_change_pwd  := FALSE;
    gv_adm_user    := FALSE;    
    gv_force_logout := FALSE;   
    gv_expired_lic := TRUE;    
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    gv_usr_key := pkwf_99_sss.fn_usr_key (pi_k => gv_k);
    gv_usr_id  := pkwf_99_sss.fn_usr_id (pi_k => gv_k);
    gv_lgn_key := pkwf_99_sss.fn_lgn_key (pi_k => gv_k);
    --
    /*IF pk99$$sym_lic.fn_exuse THEN
      gv_expired_lic := FALSE;
    ELSE
      gv_expired_lic := TRUE;
    END IF;
    */
    --    
    IF gv_usr_key > 20 THEN
      NULL;
    ELSIF gv_lgn_key > 0 AND gv_usr_key > 0 THEN -- Authenticated Internal Users
      IF pkwf_99_ssi.fn_is_ssi_usr (pi_k => gv_k, pi_d => gv_usr_id) THEN
        IF pkwf_99_ssi.fn_is_spt_usr (gv_k) THEN
          gv_ssi_usr := TRUE;
        ELSIF pkwf_99_ssi.fn_is_apl_adm (gv_k) THEN
          gv_ssi_usr := TRUE;
        ELSIF pkwf_99_ssi.fn_is_apl_usr (gv_k) THEN
          gv_ssi_usr := TRUE;
        END IF;      
      END IF;
    END IF;
    --
    IF gv_ssi_usr THEN
      gv_expired_lic := FALSE;
    END IF;
    --
  END pr_load_gvs;
  --   
  PROCEDURE pr_load_usr_gvs IS
  BEGIN
    --
    gv_cr := NULL;
    --
    IF gv_lgn_key > 0 THEN
      --
      IF gv_usr_key > 20 THEN -- System Users
        --
        OPEN cur_usr;
        FETCH cur_usr INTO gv_cr;
        CLOSE cur_usr;
        --
        IF gv_cr.lgn_id = gv_usr_id THEN
          gv_valid_usr := TRUE;
          IF gv_cr.usr_dm = 'ADM' THEN
            gv_adm_user := TRUE;
          END IF;
          IF gv_cr.cng_pw_yn = 1 THEN
            gv_change_pwd := TRUE;
          ELSIF pkwf_99_pwm.fn_is_exp (pi_k => gv_k, pi_uk => gv_usr_key) THEN -- Expired
            gv_change_pwd := TRUE;
          END IF; 
          IF gv_cr.rst_lgn_yn = 1 THEN
            gv_force_logout := TRUE;
          END IF;                     
        END IF;
        --
      ELSIF gv_ssi_usr THEN -- Internal Users
        --
        gv_valid_usr := TRUE;
        gv_cr.edt_yn := 1; 
        gv_cr.vrf_yn := 1;
        gv_cr.apr_yn := 1;
        --        
        IF pkwf_99_ssi.fn_is_spt_usr (gv_k) THEN
          gv_adm_user := TRUE;
        ELSIF pkwf_99_ssi.fn_is_apl_adm (gv_k) THEN
          gv_adm_user := TRUE;
        END IF;
        --
      END IF;
      --
    END IF;
    --
  END pr_load_usr_gvs;
  --
  -- Role Privilege
  FUNCTION fn_rol_prv (pi_mdl_dm VARCHAR2, pi_rol_id VARCHAR2, pi_tp VARCHAR2) RETURN BOOLEAN IS
    --
    v_allow   BOOLEAN := FALSE;
    --
    CURSOR cur_rol IS
    SELECT rol.orl_id, rol.edt_yn, rol.vrf_yn, rol.apr_yn, rol.own_apr_yn, 
           (CASE WHEN mdl.adm_yn = 1  THEN 1
                 WHEN smdl.adm_yn = 1 THEN 1
              ELSE rol.adm_yn
            END)    adm_only_yn
    FROM  t_99_00_rol   rol, 
          t_99_00_smdl  smdl,
          t_99_00_mdl   mdl,
          t_99_11_mdu   mdu
    WHERE rol.orl_id   = pi_rol_id
    AND mdl.mdl_dm     = pi_mdl_dm
    AND smdl.smdl_dm   = rol.smdl_dm
    AND mdl.mdl_dm     = smdl.mdl_dm
    AND mdl.mdl_dm     = mdu.mdl_dm
    AND mdu.s_ky       = gv_usr_key
    AND rol.ius_yn     = 1
    AND smdl.ius_yn    = 1
    AND mdl.ius_yn     = 1
    AND mdu.r_s        = 1;
    --
    CURSOR cur_rol_ssi IS
    SELECT rol.orl_id, rol.edt_yn, rol.vrf_yn, rol.apr_yn, rol.own_apr_yn, 
           (CASE WHEN mdl.adm_yn = 1  THEN 1
                 WHEN smdl.adm_yn = 1 THEN 1
              ELSE rol.adm_yn
            END)    adm_only_yn
    FROM  t_99_00_rol   rol, 
          t_99_00_smdl  smdl,
          t_99_00_mdl   mdl
    WHERE rol.orl_id   = pi_rol_id
    AND mdl.mdl_dm     = pi_mdl_dm
    AND smdl.smdl_dm   = rol.smdl_dm
    AND mdl.mdl_dm     = smdl.mdl_dm
    AND rol.ius_yn     = 1
    AND smdl.ius_yn    = 1
    AND mdl.ius_yn     = 1;    
    --
    cv  cur_rol%ROWTYPE;
    --
    CURSOR cur_rec IS
    SELECT *
    FROM  t_99_90_lgp 
    WHERE s_ky = gv_usr_key
    AND   lgn_ky = gv_lgn_key
    AND   orl_id = pi_rol_id; 
    --
    cr  cur_rec%ROWTYPE;
    --
  BEGIN
    --
    gv_allow_own_apr := FALSE;
    v_allow          := FALSE;
    --
    pr_load_usr_gvs;
    --
    IF gv_expired_lic AND pi_mdl_dm <> gv_sa_apl THEN
      NULL;
    ELSIF gv_valid_usr THEN
      --
      IF (pi_tp = 'E' AND gv_cr.edt_yn = 1) OR    -- User can edit records
         (pi_tp = 'V' AND gv_cr.vrf_yn = 1) OR    -- User can verify records
         (pi_tp = 'A' AND gv_cr.apr_yn = 1) THEN  -- User can approve records
        -- 
        cv := NULL;
        --
        IF gv_ssi_usr AND gv_usr_key <= 20 THEN  -- Internal user
          OPEN cur_rol_ssi;
          FETCH cur_rol_ssi INTO cv;
          CLOSE cur_rol_ssi;  
        ELSE
          OPEN cur_rol;
          FETCH cur_rol INTO cv;
          CLOSE cur_rol;         
        END IF;
        --
        IF cv.orl_id = pi_rol_id THEN -- Role exists
          --
          IF gv_ssi_usr THEN  -- Internal user
            --
            IF (pi_tp = 'E' AND cv.edt_yn = 1) OR   -- Role can edit
               (pi_tp = 'V' AND cv.vrf_yn = 1) OR   -- Role can verify
               (pi_tp = 'A' AND cv.apr_yn = 1) THEN -- Role can approve            
              v_allow := TRUE;
              gv_allow_own_apr := TRUE;
            END IF;
            --
          ELSE
            --
            IF gv_adm_user OR cv.adm_only_yn = 0 THEN  -- User is an Admin User or Role is not an Admin role
              --
              IF (pi_tp = 'E' AND cv.edt_yn = 1) OR   -- Role can edit
                 (pi_tp = 'V' AND cv.vrf_yn = 1) OR   -- Role can verify
                 (pi_tp = 'A' AND cv.apr_yn = 1) THEN -- Role can approve
                --
                cr := NULL;
                OPEN cur_rec;
                FETCH cur_rec INTO cr;
                CLOSE cur_rec;
                --
                IF cr.s_ky = gv_usr_key AND cr.lgn_ky = gv_lgn_key THEN -- Role has been granted to User
                  IF pi_tp = 'E' AND cr.edt_yn = 1 THEN     -- User has Role Edit privilege
                    v_allow := TRUE;
                  ELSIF pi_tp = 'V' AND cr.vrf_yn = 1 THEN  -- User has Role Verification privilege
                    v_allow := TRUE;  
                  ELSIF pi_tp = 'A' AND cr.apr_yn = 1 THEN  -- User has Role Approval privilege
                    v_allow := TRUE;  
                  END IF; 
                  IF cv.own_apr_yn = 1 THEN
                    gv_allow_own_apr := TRUE;  -- Role allows User to approve own records
                  END IF;
                END IF;
                --
              END IF;
              --
            END IF;
            --
          END IF;
          --
        END IF;
        --
      END IF;
      --
    END IF;
    --
    RETURN v_allow;
    --
  END fn_rol_prv;
  --  
  FUNCTION fn_edt_prv (pi_mdl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN  
    RETURN fn_rol_prv (pi_mdl_dm => pi_mdl_dm, pi_rol_id => pi_rol_id, pi_tp => 'E');
  END fn_edt_prv;
  -- 
  FUNCTION fn_vrf_prv (pi_mdl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN  
    RETURN fn_rol_prv (pi_mdl_dm => pi_mdl_dm, pi_rol_id => pi_rol_id, pi_tp => 'V');
  END fn_vrf_prv;
  --   
  FUNCTION fn_apr_prv (pi_mdl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN  
    RETURN fn_rol_prv (pi_mdl_dm => pi_mdl_dm, pi_rol_id => pi_rol_id, pi_tp => 'A');
  END fn_apr_prv;
  --  
  PROCEDURE pr_val_own_apr (pi_ins_uky NUMBER) IS
  BEGIN
    IF gv_allow_own_apr THEN
      NULL;
    ELSIF gv_usr_key = NVL(pi_ins_uky,gv_usr_key) THEN
      pkwf_99_err.pr_raise (pi_id => '990114'); -- Not authorized to approve own record
    END IF;
    gv_allow_own_apr := FALSE;
  END pr_val_own_apr;  
  --
  PROCEDURE pr_vlic (pi_mdl_dm IN VARCHAR2) IS
    v_k    VARCHAR2(500)  := NULL;
    v_k1   VARCHAR2(500)  := NULL;
    v_k2   VARCHAR2(500)  := NULL;
  BEGIN
    --
    --pk99$$sym_sa_scrty.pr_val_licm (pi_d => pi_mdl_dm);
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT')
    INTO v_k
    FROM dual;
    --
    /*
    pk99_alp.pr_slk (pi_k => v_k);
    --
    v_k1 := pk99_alp.fn_vpi (pi_k => v_k);
    v_k2 := pk99_alp.fn_vpo (pi_k => v_k);
    --
    pk99_alp.pr_vmdl (pi_k => v_k1, pi_d => pi_mdl_dm);
    --
    IF v_k2 = pk99_alp.fn_vmdl (pi_k => v_k1, pi_d => pi_mdl_dm) THEN
      NULL;
    ELSE
      pk99_alp.pr_rlk (pi_k => v_k);
      pkwf_99_err.pr_raise (pi_id => '990125');
      RAISE_APPLICATION_ERROR (-20000,'Some internal programs have been illegally modified! Further processing aborted.');     
    END IF;
    --
    pk99_alp.pr_rlk (pi_k => v_k);
    --
    */
  END pr_vlic;
  --  
  --       
  /* Public Routines */
  --  
  -- User can access Application
  FUNCTION fn_apl_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2) RETURN BOOLEAN IS
    --
    v_yn    PLS_INTEGER := 0;
    --
    CURSOR cur_mdl_usr IS
    SELECT 1
    FROM t_99_11_mdu a, t_99_00_mdl b
    WHERE a.mdl_dm = pi_apl_dm
    AND   a.mdl_dm = b.mdl_dm
    AND   a.s_ky = gv_usr_key
    AND   a.r_s = 1
    AND   b.ius_yn = 1;
    --
  BEGIN
    --
    pr_load_gvs;
    v_yn := 0;
    /*
    --
    IF pi_k = gv_k AND gv_lgn_key > 0 AND gv_usr_key > 0 THEN -- authenticated user session
      --
      IF gv_ssi_usr THEN -- internal users
        --
        v_yn := 1;
        --
      ELSE
        --
        v_yn := 0;
        --
        
        IF pkwf_99_pmr.fn_is_capl (pi_d => pi_apl_dm) THEN 
          v_yn := 1;
        ELSE
          v_yn := pk99$$sym_lic.fn_usr_lic_opt (pi_id => pi_apl_dm);  
        END IF;
        
        --   
        IF v_yn > 0 THEN        
          v_yn := 0;
          OPEN cur_mdl_usr;
          FETCH cur_mdl_usr INTO v_yn;
          CLOSE cur_mdl_usr;
        ELSE
          v_yn := 0;
        END IF;
        --
        IF v_yn = 1 THEN 
          --
          v_yn := 0;
          --
          BEGIN
            SELECT  1
            INTO v_yn
            FROM  T_99_10_SSU USR,
                  T_99_11_AGU GUSR,
                  T_99_11_AGP GRP,
                  T_99_00_MDL MDL
            WHERE USR.R_K       = gv_usr_key
            AND USR.LGN_ID      = gv_usr_id
            AND MDL.MDL_DM      = pi_apl_dm
            AND USR.R_K         = GUSR.S_KY
            AND GRP.R_K         = GUSR.AGP_KY
            AND GRP.MDL_DM      = MDL.MDL_DM
            AND USR.STA_DM      = 'N'
            AND USR.R_S         = 1
            AND GRP.R_S         = 1
            AND GRP.IUS_YN      = 1
            AND GUSR.R_S        = 1
            AND GUSR.IUS_YN     = 1
            AND MDL.IUS_YN      = 1
            AND ( (USR.USR_DM = 'ADM') OR
                  (MDL.ADM_YN = 0 AND GRP.ADM_YN = 0) );      
          EXCEPTION
            WHEN no_data_found THEN
              NULL;
            WHEN too_many_rows THEN
              v_yn := 1;
          END;
          --
        END IF;
        --
      END IF;
    END IF;
    --
    */
    IF v_yn = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_apl_acs;
  --
  PROCEDURE pr_apl_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2) IS
  BEGIN
    pr_vlic (pi_mdl_dm => pi_apl_dm);
    IF NOT fn_apl_acs (pi_k => pi_k, pi_apl_dm => pi_apl_dm) THEN
      pkwf_99_err.pr_raise (pi_id => '990115'); -- Not authorized to access this application
    END IF;
  END pr_apl_acs;
  --  
  -- User can access Application Sub-module
  FUNCTION fn_submod_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_submod_dm VARCHAR2) RETURN BOOLEAN IS
    v_yn    PLS_INTEGER := 0;
  BEGIN
    --
    pr_load_gvs;
    v_yn := 0;
    --
    /*
    IF pi_k = gv_k AND gv_lgn_key > 0 AND gv_usr_key > 0 THEN -- authenticated user session
      --
      IF gv_ssi_usr THEN -- internal users
        --
        v_yn := 1;
        --
      ELSE
        --
        BEGIN
          SELECT  1
          INTO v_yn
          FROM  T_99_10_SSU   USR,
                T_99_11_AGU   GUSR,
                T_99_11_AGP   GRP,
                T_99_11_AGS   GSMDL,
                T_99_00_SMDL  SMDL,                
                T_99_00_MDL   MDL,
                T_99_11_MDU   MDU
          WHERE USR.R_K       = gv_usr_key
          AND USR.LGN_ID      = gv_usr_id
          AND MDL.MDL_DM      = pi_apl_dm
          AND SMDL.SMDL_DM    = pi_submod_dm
          AND USR.R_K         = GUSR.S_KY
          AND GRP.R_K         = GUSR.AGP_KY
          AND GRP.R_K         = GSMDL.AGP_KY
          AND SMDL.SMDL_DM    = GSMDL.SMDL_DM   
          AND MDL.MDL_DM      = SMDL.MDL_DM           
          AND MDL.MDL_DM      = GRP.MDL_DM
          AND MDL.MDL_DM      = MDU.MDL_DM
          AND USR.R_K         = MDU.S_KY          
          AND USR.STA_DM      = 'N'
          AND USR.R_S         = 1
          AND MDU.R_S         = 1
          AND GRP.R_S         = 1
          AND GRP.IUS_YN      = 1
          AND GUSR.R_S        = 1
          AND GUSR.IUS_YN     = 1
          AND GSMDL.R_S       = 1
          AND GSMDL.IUS_YN    = 1    
          AND SMDL.IUS_YN     = 1          
          AND MDL.IUS_YN      = 1
          AND ( (USR.USR_DM = 'ADM') OR
                (MDL.ADM_YN = 0 AND SMDL.ADM_YN = 0 AND GRP.ADM_YN = 0) );      
        EXCEPTION
          WHEN no_data_found THEN
            NULL;
          WHEN too_many_rows THEN
            v_yn := 1;
        END;
        --
      END IF;
    END IF;
    --*/
    IF v_yn = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_submod_acs;
  --  
  PROCEDURE pr_submod_acs (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_submod_dm VARCHAR2) IS
  BEGIN
    -- Check if separately licensed sub-module
   -- IF pk99_pmr.fn_is_slsm (pi_d => pi_submod_dm) THEN
   --   pk99$$sym_sa_scrty.pr_val_licm (pi_d => pi_submod_dm);
   -- END IF;
    --
    IF NOT fn_submod_acs (pi_k => pi_k, pi_apl_dm => pi_apl_dm, pi_submod_dm => pi_submod_dm) THEN
      pkwf_99_err.pr_raise (pi_id => '990136'); -- Not authorized to access this sub-module
    END IF;
    --
  END pr_submod_acs;
  --    
  -- Edit Privilege 
  FUNCTION fn_rol_edt_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF pi_k = gv_k AND gv_lgn_key > 0 AND gv_usr_key > 0 THEN -- authenticated user session
      RETURN fn_edt_prv (pi_mdl_dm => pi_apl_dm, pi_rol_id => pi_rol_id);
    ELSE
      RETURN FALSE;
    END IF;
  END fn_rol_edt_prv;
  --
  PROCEDURE pr_rol_edt_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2) IS
  BEGIN
    IF NOT fn_rol_edt_prv (pi_k => pi_k, pi_apl_dm => pi_apl_dm, pi_rol_id => pi_rol_id) THEN
      pkwf_99_err.pr_raise (pi_id => '990022'); -- No privilege to edit or create new record
    END IF;
    IF gv_force_logout THEN
      pkwf_99_err.pr_raise (pi_id => '990118'); -- User must logout immediately and login again
    END IF;     
    IF gv_change_pwd THEN
      pkwf_99_err.pr_raise (pi_id => '990117'); -- Password has expired and should be changed immediately
    END IF;  
    IF gv_expired_lic AND pi_apl_dm <> gv_sa_apl THEN
      pkwf_99_err.pr_raise (pi_id => '990125'); -- Not licensed to use application
    END IF;     
  END pr_rol_edt_prv;
  --  
  -- Verify Privilege 
  FUNCTION fn_rol_vrf_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF pi_k = gv_k AND gv_lgn_key > 0 AND gv_usr_key > 0 THEN -- authenticated user session
      RETURN fn_vrf_prv (pi_mdl_dm => pi_apl_dm, pi_rol_id => pi_rol_id);
    ELSE
      RETURN FALSE;
    END IF;
  END fn_rol_vrf_prv;
  --
  PROCEDURE pr_rol_vrf_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2, pi_ins_uky IN NUMBER) IS
  BEGIN
    IF NOT fn_rol_vrf_prv (pi_k => pi_k, pi_apl_dm => pi_apl_dm, pi_rol_id => pi_rol_id) THEN
      IF gv_expired_lic AND pi_apl_dm <> gv_sa_apl THEN
        pkwf_99_err.pr_raise (pi_id => '990125'); -- Not licensed to use application
      END IF;     
      pkwf_99_err.pr_raise (pi_id => '990116'); -- No privilege to verify record
    END IF;
    IF gv_force_logout THEN
      pkwf_99_err.pr_raise (pi_id => '990118'); -- User must logout immediately and login again
    END IF;     
    IF gv_change_pwd THEN
      pkwf_99_err.pr_raise (pi_id => '990117'); -- Password has expired and should be changed immediately
    END IF; 
    IF gv_expired_lic AND pi_apl_dm <> gv_sa_apl THEN
      pkwf_99_err.pr_raise (pi_id => '990125'); -- Not licensed to use application
    END IF;     
    -- Own verification checks not yet implemented    
    IF NOT gv_ssi_usr THEN -- Internal user
      NULL; -- pr_val_own_vrf (pi_ins_uky => pi_ins_uky);
    END IF;  
    --    
  END pr_rol_vrf_prv;
  --  
  -- Approve Privilege 
  FUNCTION fn_rol_apr_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF pi_k = gv_k AND gv_lgn_key > 0 AND gv_usr_key > 0 THEN -- authenticated user session
      RETURN fn_apr_prv (pi_mdl_dm => pi_apl_dm, pi_rol_id => pi_rol_id);
    ELSE
      RETURN FALSE;
    END IF;
  END fn_rol_apr_prv;
  --
  PROCEDURE pr_rol_apr_prv (pi_k VARCHAR2, pi_apl_dm VARCHAR2, pi_rol_id VARCHAR2, pi_ins_uky IN NUMBER) IS
  BEGIN
    IF NOT fn_rol_apr_prv (pi_k => pi_k, pi_apl_dm => pi_apl_dm, pi_rol_id => pi_rol_id) THEN
      IF gv_expired_lic AND pi_apl_dm <> gv_sa_apl THEN
        pkwf_99_err.pr_raise (pi_id => '990125'); -- Not licensed to use application
      END IF;     
      pkwf_99_err.pr_raise (pi_id => '990017'); -- No privilege to approve record
    END IF;
    IF gv_force_logout THEN
      pkwf_99_err.pr_raise (pi_id => '990118'); -- User must logout immediately and login again
    END IF;     
    IF gv_change_pwd THEN
      pkwf_99_err.pr_raise (pi_id => '990117'); -- Password has expired and should be changed immediately
    END IF;  
    IF gv_expired_lic AND pi_apl_dm <> gv_sa_apl THEN
      pkwf_99_err.pr_raise (pi_id => '990125'); -- Not licensed to use application
    END IF;    
    IF NOT gv_ssi_usr THEN -- Internal user
      pr_val_own_apr (pi_ins_uky => pi_ins_uky);
    END IF;
  END pr_rol_apr_prv;
  --    
  -- Create Access Log record
  
  PROCEDURE pr_log_fnc_acs IS
    PRAGMA AUTONOMOUS_TRANSACTION;
   -- ar   t_99_90_lgf%ROWTYPE;
  BEGIN
    --
    pr_load_gvs;
    --/*
    -- Get key directly from sequence to save time
    /*
    SELECT s_99_au_rk.NEXTVAL 
    INTO ar.r_k 
    FROM dual; 
    --
    ar.in_tm := pk99_dtm.fn_sys_tmm;
    ar.lgn_ky := pkwf_99_sss.fn_au_lk('$$PK99$AuDiT$$');
    ar.lgn_ky := NVL(ar.lgn_ky,0);
    ar.s_ky := pkwf_99_sss.fn_au_uk('$$PK99$AuDiT$$');
    ar.s_ky := NVL(ar.s_ky,0);
    ar.sce_pgm := APEX_UTIL.GET_SESSION_STATE('APP_PAGE_ID');
    ar.ses_id := APEX_CUSTOM_AUTH.GET_SESSION_ID;
    --
    pk99_trg.pr_set_sdml (pi_k => gv_k); -- VIP otherwise table trigger will shout 
    INSERT INTO t_99_90_lgf VALUES ar;
    pk99_trg.pr_reset_sdml;
    --
    COMMIT;
    --
    */
  END pr_log_fnc_acs;
  --    
END pkwf_99_acp;