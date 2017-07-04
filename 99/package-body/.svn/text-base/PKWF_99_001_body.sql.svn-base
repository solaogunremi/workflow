CREATE OR REPLACE PACKAGE BODY pkwf_99_001 AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 24-dec-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: User Maintenance
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
  gv_s            VARCHAR2(100);
  gv_vrf_sysadm   BOOLEAN := FALSE;
  --
  CURSOR c_valid_usrs IS
  SELECT r_k, usr_dm
  FROM t_99_10_ssu
  WHERE r_s = 1
  AND   sta_dm IN ('N','L') 
  AND   r_k > 20    
  ORDER BY UPPER(lst_nm), UPPER(fir_nm);
  --  
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    gv_s := NULL;
    gv_vrf_sysadm := FALSE;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    gv_vrf_sysadm := pkwf_99_atc.fn_sadm;
    IF gv_vrf_sysadm THEN
      gv_s := pkwf_99_atc.fn_pik;
    END IF;
    --
  END pr_load_gvs;
  --
  --       
  /* Public Routines */
  --
  --  
  PROCEDURE pr_prc (pi_rec IN OUT v_99_99_umr_e%ROWTYPE) IS
    v_rec  v_99_99_umr_e%ROWTYPE;
  BEGIN
    --
    pr_load_gvs;
    v_rec := pi_rec;
    --
    IF gv_vrf_sysadm THEN    
      v_rec.p_k := gv_k;
      pkwf_99_atc.pr_vld_sadm;
      pkwf_99_umc.pr_prc (pi_rec => v_rec);
      COMMIT;
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --    
    pi_rec := v_rec;
    --
  END pr_prc;
  --
  PROCEDURE pr_lck (pi_k IN VARCHAR2, pi_ky IN NUMBER) IS
  BEGIN
    --
    pr_load_gvs;
    --
    IF gv_vrf_sysadm THEN    
      pkwf_99_atc.pr_vld_sadm;
      pkwf_99_umc.pr_lck (pi_k => gv_k, pi_key => pi_ky);
      COMMIT;
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --      
  END pr_lck;
  --
  PROCEDURE pr_ulck (pi_k IN VARCHAR2, pi_ky IN NUMBER) IS
  BEGIN
    --
    pr_load_gvs;
    --
    IF gv_vrf_sysadm THEN    
      pkwf_99_atc.pr_vld_sadm;
      pkwf_99_umc.pr_ulck (pi_k => gv_k, pi_key => pi_ky);
      COMMIT;
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --      
  END pr_ulck;
  --
  PROCEDURE pr_rmv (pi_k IN VARCHAR2, pi_ky IN NUMBER) IS
  BEGIN
    --
    pr_load_gvs;
    --
    IF gv_vrf_sysadm THEN    
      pkwf_99_atc.pr_vld_sadm;
      pkwf_99_umc.pr_rmv (pi_k => gv_k, pi_key => pi_ky);
      COMMIT;
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --      
  END pr_rmv;
  -- 
  PROCEDURE pr_rpw (pi_k IN VARCHAR2, pi_ky IN NUMBER, po_pw OUT VARCHAR2) IS
    v_pw   VARCHAR2(500) := NULL;
  BEGIN
    --
    pr_load_gvs;
    --
    IF gv_vrf_sysadm THEN    
      pkwf_99_atc.pr_vld_sadm;
      pkwf_99_umc.pr_rst_upw (pi_k => gv_k, pi_key => pi_ky);
      v_pw := pkwf_99_umc.fn_upw (pi_k => TO_CHAR(pi_ky));
      COMMIT;
      po_pw := v_pw;
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --      
  END pr_rpw;
  --    
  FUNCTION fn_is_adm RETURN BOOLEAN IS 
    --
    v_return BOOLEAN := FALSE;
    v_usr    t_99_10_ssu%ROWTYPE;
    --
    CURSOR c_usr IS 
      SELECT *
      FROM   t_99_10_ssu
      WHERE  UPPER(lgn_id) = UPPER(v('APP_USER'));
    --
  BEGIN
    --
    OPEN  c_usr;
    FETCH c_usr INTO v_usr;
    CLOSE c_usr;
    --
    IF NVL(v_usr.usr_dm,'USR') = 'ADM' THEN
      v_return := TRUE;
    END IF;  
    --
    RETURN v_return;
    --
  END fn_is_adm;
  --
END pkwf_99_001;
/

