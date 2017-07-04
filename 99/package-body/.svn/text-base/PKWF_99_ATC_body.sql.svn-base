CREATE OR REPLACE PACKAGE BODY pkwf_99_atc AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 15-dec-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Internal Access Routines
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
  gv_s                  VARCHAR2(100); -- Front End Interface key
  gv_usr_ky             NUMBER;
  gv_mdl                VARCHAR2(10)   := '99';
  --
  gv_valid_conn          BOOLEAN := FALSE;
  gv_vrf_xadm            BOOLEAN := FALSE; 
  --
  gv_uvrf_iusr           BOOLEAN := FALSE; 
  gv_vrf_iusr            BOOLEAN := FALSE; 
  gv_vrf_ispt            BOOLEAN := FALSE; 
  gv_vrf_iadm            BOOLEAN := FALSE; 
  --
  PROCEDURE pr_reset IS
  BEGIN
    gv_usr_ky     := NULL;
    gv_s          := NULL;
    gv_vrf_xadm    := FALSE;
    gv_uvrf_iusr   := FALSE;
    gv_vrf_iusr    := FALSE;
    gv_vrf_ispt    := FALSE;
    gv_vrf_iadm    := FALSE;
    gv_valid_conn  := FALSE;
  END pr_reset;
  --
  FUNCTION fn_vlic RETURN BOOLEAN IS
  BEGIN
    RETURN TRUE;
  END fn_vlic;
  --  
  PROCEDURE pr_vlic IS
  BEGIN
    NULL;
  END pr_vlic;
  --    
  FUNCTION fn_is_adm_usr RETURN BOOLEAN IS
    --
    v_n      PLS_INTEGER;
    --
    CURSOR c_adm IS
      SELECT 1
      FROM   t_99_10_ssu
      WHERE  r_s = 1
      AND    sta_dm = 'N'
      AND    usr_dm = 'ADM'
      AND    r_k    = gv_usr_ky;
    --
  BEGIN
    --
    v_n := 0;
    --
    IF gv_usr_ky > 20 THEN
      OPEN  c_adm;
      FETCH c_adm INTO v_n;
      CLOSE c_adm;
    END IF;
    --
    IF v_n = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_is_adm_usr;
  --   
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    pr_reset;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    IF fn_vlic THEN
      --
      gv_valid_conn := pkwf_99_glb.fn_vld_conn (gv_k);
      --
      IF gv_valid_conn THEN
        --
        gv_usr_ky := pkwf_99_glb.fn_usr_key (gv_k);
        --
        IF gv_usr_ky > 20 THEN
          gv_vrf_xadm := fn_is_adm_usr;
        ELSIF gv_usr_ky > 0 THEN
          IF gv_usr_ky = 1 THEN 
            gv_vrf_iadm := TRUE;
          ELSIF gv_usr_ky > 1 THEN
            gv_vrf_iusr := TRUE;
          END IF;
        ELSE
          gv_valid_conn := FALSE;
        END IF;
        --
      END IF;
      --
      IF gv_valid_conn THEN
        gv_s := TO_CHAR(APEX_CUSTOM_AUTH.GET_SESSION_ID)||APEX_APPLICATION.G_FLOW_ID; 
      END IF;
      -- 
    END IF;
    --    
  END pr_load_gvs;
  --
  --       
  /* Public Routines */
  --
  FUNCTION fn_nacs RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN NOT gv_valid_conn;
  END fn_nacs;
  --    
  FUNCTION fn_acsv RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF gv_vrf_xadm OR gv_vrf_ispt OR gv_vrf_iadm OR gv_vrf_iusr THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_acsv;
  --  
  FUNCTION fn_acsuv RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF gv_uvrf_iusr THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_acsuv;
  --    
  FUNCTION fn_sadm RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF gv_vrf_xadm OR gv_vrf_ispt OR gv_vrf_iadm THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_sadm;
  --   
  FUNCTION fn_xadm RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN gv_vrf_xadm;
  END fn_xadm;
  --    
  FUNCTION fn_iadm RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN gv_vrf_iadm;
  END fn_iadm;
  --  
  FUNCTION fn_ispt RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF gv_vrf_ispt THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_ispt;
  --   
  FUNCTION fn_iusr RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    IF gv_vrf_iusr THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_iusr;
  --   
  FUNCTION fn_is_ivrf RETURN BOOLEAN IS
  BEGIN
    RETURN FALSE;
  END fn_is_ivrf;
  --
  FUNCTION fn_cpw RETURN BOOLEAN IS   
    v_bool  BOOLEAN;
  BEGIN
    pr_load_gvs;
    v_bool := FALSE;
    IF gv_valid_conn AND gv_usr_ky > 20 THEN 
      v_bool := pkwf_99_pwm.fn_req_pw_chng;
    END IF;
    RETURN v_bool;
  END fn_cpw;
  --    
  PROCEDURE pr_vld_sadm IS
  BEGIN
    IF fn_sadm THEN
      pr_reset;
    ELSIF gv_uvrf_iusr THEN
      pr_reset;
      pkwf_99_err.pr_raise (pi_id => '990123'); 
    ELSE
      pr_reset;
      pkwf_99_err.pr_raise (pi_id => '990025'); 
    END IF;
    pr_vlic;
  END pr_vld_sadm;
  --     
  PROCEDURE pr_vld_iadm IS
  BEGIN
    IF fn_iadm THEN
      pr_reset;
    ELSIF gv_uvrf_iusr THEN
      pr_reset;
      pkwf_99_err.pr_raise (pi_id => '990123'); 
    ELSE
      pr_reset;
      pkwf_99_err.pr_raise (pi_id => '990122'); 
    END IF;
    pr_vlic;
  END pr_vld_iadm;
  --   
  FUNCTION fn_pik RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    RETURN gv_s;
  END fn_pik;
  --  
  FUNCTION fn_lic RETURN BOOLEAN IS
  BEGIN
    pr_load_gvs;
    RETURN fn_vlic;
  END fn_lic;
  --
END pkwf_99_atc;
/

