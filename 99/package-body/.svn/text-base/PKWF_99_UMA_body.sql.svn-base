CREATE OR REPLACE PACKAGE BODY pkwf_99_uma AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 12-dec-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: User Maintenance A
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
  gv_k            VARCHAR2(100);
  gv_tmp_adm_yn   PLS_INTEGER; -- Set by Programs to allow NON-ADMIN users 
  v_valid_sess    BOOLEAN := FALSE;
  --
  --
  /* Private Routines */
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    v_valid_sess := FALSE;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    v_valid_sess := pkwf_99_glb.fn_vld_conn (gv_k);
    --    
  END pr_load_gvs;
  --  
  FUNCTION fn_generate_usr_id (pi_fir_nm VARCHAR2, pi_lst_nm VARCHAR2, pi_eml_adr VARCHAR2) RETURN VARCHAR2 IS
    v_id        VARCHAR2(500);
    v_id_base   VARCHAR2(500);
    v_yn        PLS_INTEGER;
    v_cnt       PLS_INTEGER;
    v_fn        PLS_INTEGER;
    v_ln        PLS_INTEGER;
  BEGIN
    --
    pr_load_gvs;
    --
    pkwf_99_vld.pr_reqd (pi_d => pi_fir_nm, pi_dsc => 'First Name', pi_pgm => 'GENERATE_USERID');
    pkwf_99_vld.pr_reqd (pi_d => pi_lst_nm, pi_dsc => 'Last Name', pi_pgm => 'GENERATE_USERID');
    --
    IF 1 = 2 THEN -- pkwf_99_pmr.fn_use_email_as_uid (gv_k) THEN -- Use Email Address as User ID
      v_id := LOWER(pi_eml_adr);    
    ELSE
      --
      v_ln := pkwf_99_pmr.fn_min_nme_len (gv_k);
      IF NVL(v_ln,0) < 5 THEN
        v_ln := 5;
      END IF;
      v_ln := v_ln + 1;
      --      
      v_yn := 1;
      WHILE (v_yn = 1) LOOP
        v_id := SYS.DBMS_RANDOM.STRING('U',v_ln);
        BEGIN
          SELECT 1
          INTO v_yn
          FROM t_99_10_ssu
          WHERE UPPER(lgn_id) = v_id;
        EXCEPTION
          WHEN no_data_found THEN
            v_yn := 0;
          WHEN too_many_rows THEN
            v_yn := 1;
        END;
      END LOOP;
    END IF; 
    --
    RETURN v_id;
    --
  END fn_generate_usr_id;
  --
  FUNCTION fn_generate_sht_nm (pi_fir_nm VARCHAR2, pi_lst_nm VARCHAR2) RETURN VARCHAR2 IS
    v_id        VARCHAR2(30);
    v_id_base   VARCHAR2(30);
    v_yn        PLS_INTEGER;
    v_cnt       PLS_INTEGER;
    v_fn        PLS_INTEGER;
    v_ln        PLS_INTEGER;
  BEGIN
    --
    pkwf_99_vld.pr_reqd (pi_d => pi_fir_nm, pi_dsc => 'First Name', pi_pgm => 'GENERATE_SHORT_NAME');
    pkwf_99_vld.pr_reqd (pi_d => pi_lst_nm, pi_dsc => 'Last Name', pi_pgm => 'GENERATE_SHORT_NAME');
    --    
    v_id := UPPER(TRIM(SUBSTR(pi_fir_nm,1,1))||'.'||TRIM(SUBSTR(pi_lst_nm,1,15)));
    --
    RETURN v_id;
    --
  END fn_generate_sht_nm;
  --  
  --
  /* Public Routines */
  --  
  -- TRUE if Username exists
  FUNCTION fn_usr_id_exists (pi_k IN VARCHAR2, pi_usr IN VARCHAR2) RETURN BOOLEAN IS
    --
    v_yn        PLS_INTEGER;
    v_usr       VARCHAR2(500) := UPPER(pi_usr);
    --
    CURSOR cur_acs IS
    SELECT 1
    FROM t_99_10_ssu a
    WHERE UPPER(a.lgn_id) = v_usr;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_yn := 1; 
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      IF v_usr IN ('SYSTEM','EXTERNAL','UNKNOWN','ADMIN','SETUP','ROOT','USER','WEB','MOBILE','ORACLE','INTERNAL','OPERATOR') THEN
        v_yn := 1;     
      ELSIF pkwf_99_ssi.fn_is_rsv_usr_id (pi_k => gv_k, pi_d => v_usr) THEN
        v_yn := 1; 
      ELSE
        v_yn := 0; 
        OPEN cur_acs;
        FETCH cur_acs INTO v_yn;
        CLOSE cur_acs;
      END IF;
    END IF;
    --
    IF v_yn = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --    
  END fn_usr_id_exists;
  --    
  FUNCTION fn_sht_nm_exists (pi_k IN VARCHAR2, pi_nm IN VARCHAR2) RETURN BOOLEAN IS
    --
    v_yn        PLS_INTEGER;
    v_usr       VARCHAR2(500) := UPPER(pi_nm);
    --
    CURSOR cur_acs IS
    SELECT 1
    FROM t_99_10_ssu a
    WHERE UPPER(a.sht_nm) = v_usr;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_yn := 1; 
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      IF v_usr IN ('SYSTEM','EXTERNAL','UNKNOWN','ADMIN','SETUP','ROOT','USER','WEB','MOBILE','INTERNAL','OPERATOR') THEN
        v_yn := 1; 
      ELSIF pkwf_99_ssi.fn_is_rsv_usr_id (pi_k => gv_k, pi_d => v_usr) THEN
        v_yn := 1; 
      ELSE
        v_yn := 0; 
        OPEN cur_acs;
        FETCH cur_acs INTO v_yn;
        CLOSE cur_acs;
      END IF;
    END IF;
    --
    IF v_yn = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --    
  END fn_sht_nm_exists;
  --  
  FUNCTION fn_eml_adr_exists (pi_k IN VARCHAR2, pi_adr IN VARCHAR2) RETURN BOOLEAN IS
    --
    v_yn        PLS_INTEGER;
    v_adr       VARCHAR2(500) := UPPER(pi_adr);
    --
    CURSOR cur_acs IS
    SELECT 1
    FROM t_99_10_ssu a
    WHERE UPPER(a.eml_adr) = v_adr
    AND   NVL(a.sta_dm,'P') <> 'D';
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_yn := 1; 
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      v_yn := 0; 
      OPEN cur_acs;
      FETCH cur_acs INTO v_yn;
      CLOSE cur_acs;
    END IF;
    --
    IF v_yn = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --    
  END fn_eml_adr_exists;  
  --
  PROCEDURE pr_val_adm_usr (pi_k IN VARCHAR2) IS
  BEGIN
    pkwf_99_glb.pr_vld_conn;
    IF gv_tmp_adm_yn = 1 OR pkwf_99_glb.fn_is_adm_usr (pi_k) THEN
      NULL;
    ELSE
      pkwf_99_err.pr_raise (pi_id => '990025');
    END IF;
    pr_rst_tmp_adm;
  END pr_val_adm_usr;
  --
  FUNCTION fn_gen_dflt_lgn_id (pi_k VARCHAR2, pi_fir_nm VARCHAR2, pi_lst_nm VARCHAR2, pi_eml_adr VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      RETURN fn_generate_usr_id (pi_fir_nm => pi_fir_nm, pi_lst_nm => pi_lst_nm, pi_eml_adr => pi_eml_adr);
    ELSE
      RETURN NULL;
    END IF;
  END fn_gen_dflt_lgn_id;
  --
  FUNCTION fn_gen_dflt_sht_nm (pi_k VARCHAR2, pi_fir_nm VARCHAR2, pi_lst_nm VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      RETURN fn_generate_sht_nm (pi_fir_nm => pi_fir_nm, pi_lst_nm => pi_lst_nm);
    ELSE
      RETURN NULL;
    END IF;
  END fn_gen_dflt_sht_nm;
  --  
  FUNCTION fn_get_usr_typ (pi_k VARCHAR2, pi_uk NUMBER) RETURN VARCHAR2 IS
    v_dm  VARCHAR2(30);
  BEGIN
    pr_load_gvs;
    v_dm := NULL;
    IF pi_uk > 20 THEN  
      BEGIN
        SELECT usr_dm
        INTO v_dm
        FROM t_99_10_ssu
        WHERE r_k = pi_uk;
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END IF;
    RETURN v_dm;
  END fn_get_usr_typ;
  --
  PROCEDURE pr_set_tmp_adm (pi_k VARCHAR2) IS
  BEGIN
    gv_tmp_adm_yn := 0;
    pkwf_99_glb.pr_vld_conn;
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      gv_tmp_adm_yn := 1;
    END IF;
  END pr_set_tmp_adm;
  --
  PROCEDURE pr_rst_tmp_adm IS
  BEGIN
    gv_tmp_adm_yn := 0;
  END pr_rst_tmp_adm;
  -- 
  -- Validate Normal System User
  FUNCTION fn_is_normal_usr (pi_k IN VARCHAR2, pi_uk IN VARCHAR2, pi_raise_yn NUMBER DEFAULT 1) RETURN BOOLEAN IS
    v_yn   PLS_INTEGER;
    CURSOR cur_acs IS
    SELECT 1
    FROM t_99_10_ssu a
    WHERE r_k = pi_uk
    AND   r_s = 1
    AND   sta_dm IN ('N','L');
    --
  BEGIN
    --
    v_yn := 0; 
    pr_load_gvs;
    --
    IF pi_uk > 20 THEN 
      OPEN cur_acs;
      FETCH cur_acs INTO v_yn;
      CLOSE cur_acs;
    END IF;
    --
    IF v_yn = 1 THEN
      RETURN TRUE;
    ELSE
      IF pi_raise_yn = 1 THEN
        pkwf_99_err.pr_raise (pi_id => '990094');
      END IF;
      RETURN FALSE;
    END IF;
    --    
  END fn_is_normal_usr;
  --  
  -- Get Login ID
  FUNCTION fn_get_usr_id (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2 IS
    v_id    t_99_10_ssu.lgn_id%TYPE;
    CURSOR c_id IS
    SELECT lgn_id
    FROM t_99_10_ssu
    WHERE r_k = pi_uk;
  BEGIN
    --
    pr_load_gvs;
    v_id := NULL;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      IF pi_uk > 20 THEN
        OPEN c_id;
        FETCH c_id INTO v_id;
        CLOSE c_id;
      ELSIF pi_uk = 19 THEN
        v_id := 'EXTERNAL';
      ELSIF pi_uk = 1 THEN
        v_id := 'SYSTEM';
      ELSIF pi_uk > 0 THEN
        v_id := 'UNKNOWN';     
      END IF;        
    END IF;
    --
    RETURN v_id;
    --
  END fn_get_usr_id;
  --  
  -- Get Report Name
  FUNCTION fn_get_rpt_nm (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2 IS
    v_id    t_99_10_ssu.sht_nm%TYPE;
    CURSOR c_id IS
    SELECT UPPER(SUBSTR(sht_nm,1,30))
    FROM t_99_10_ssu
    WHERE r_k = pi_uk;
  BEGIN
    --
    pr_load_gvs;
    v_id := NULL;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      IF pi_uk > 20 THEN
        OPEN c_id;
        FETCH c_id INTO v_id;
        CLOSE c_id;
      ELSIF pi_uk = 19 THEN
        v_id := 'EXTERNAL';        
      ELSIF pi_uk = 1 THEN
        v_id := 'SYSTEM';
      ELSIF pi_uk > 0 THEN
        v_id := 'UNKNOWN';        
      END IF;
    END IF;
    --
    RETURN v_id;
    --
  END fn_get_rpt_nm;
  --   
  FUNCTION fn_usr_typ_dsc (pi_usr_dm VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    RETURN pkwf_99_dmv.fn_usr_typ_dsc (pi_k => gv_k, pi_usr_dm => pi_usr_dm);
  END fn_usr_typ_dsc;
  --    
  FUNCTION fn_usr_sta_dsc (pi_sta_dm VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    RETURN pkwf_99_dmv.fn_usr_sta_dsc (pi_k => gv_k, pi_sta_dm => pi_sta_dm);
  END fn_usr_sta_dsc;
  --   
  FUNCTION fn_is_uma (pi_k IN VARCHAR2) RETURN BOOLEAN IS
    v_yn   PLS_INTEGER;
  BEGIN
    --
    v_yn := 0; 
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      IF gv_tmp_adm_yn = 1 THEN
        v_yn := 1;
      ELSIF pkwf_99_sss.fn_is_adm_usr (gv_k) THEN
        v_yn := 1;
      END IF;
    END IF;
    --    
    IF v_yn = 1 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --    
  END fn_is_uma;
  --   
  FUNCTION fn_get_full_nm (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2 IS
    v_id    VARCHAR2(500);
    CURSOR c_id IS
    SELECT SUBSTR((UPPER(lst_nm)||' '||INITCAP(fir_nm)),1,100)
    FROM t_99_10_ssu
    WHERE r_k = pi_uk;
  BEGIN
    --
    pr_load_gvs;
    v_id := NULL;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      IF pi_uk > 20 THEN
        OPEN c_id;
        FETCH c_id INTO v_id;
        CLOSE c_id;
      ELSIF pi_uk = 19 THEN
        v_id := 'EXTERNAL';        
      ELSIF pi_uk = 1 THEN
        v_id := 'SYSTEM';
      ELSIF pi_uk > 0 THEN
        v_id := 'UNKNOWN';  
      END IF;        
    END IF;
    --
    RETURN v_id;
    --
  END fn_get_full_nm;
  --  
  FUNCTION fn_get_usr_k (pi_k IN VARCHAR2, pi_id IN VARCHAR2) RETURN NUMBER IS
    v_key  NUMBER := NULL;
    CURSOR cur_acs IS
    SELECT r_k
    FROM t_99_10_ssu a
    WHERE UPPER(a.lgn_id) = UPPER(pi_id)
    AND   r_s = 1;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN  
      OPEN cur_acs;
      FETCH cur_acs INTO v_key;
      CLOSE cur_acs;
    END IF;
    --
    RETURN v_key;
    --
  END fn_get_usr_k;
  --  
  FUNCTION fn_get_eml_adr (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN VARCHAR2 IS
    v_txt  VARCHAR2(500) := NULL;
    CURSOR cur_eml_adr IS
    SELECT eml_adr
    FROM t_99_10_ssu a
    WHERE r_k = pi_uk
    AND   r_k <> 100
    AND   r_s = 1
    AND   eml_yn = 1
    AND   sta_dm IN ('N','L');
  BEGIN
    --
    v_txt := NULL;
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN      
      OPEN cur_eml_adr;
      FETCH cur_eml_adr INTO v_txt;
      CLOSE cur_eml_adr;
    END IF;
    --
    RETURN v_txt;
  END fn_get_eml_adr;
  --  
END pkwf_99_uma;
/

