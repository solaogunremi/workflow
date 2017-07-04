CREATE OR REPLACE PACKAGE BODY pkwf_99_dmv AS
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: Domains Validation
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
  gv_k     VARCHAR2(100);
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
  FUNCTION fn_dmv_dsc (pi_dm_id VARCHAR2, pi_dmv_id VARCHAR2) RETURN VARCHAR2 IS
    v_dsc  t_99_00_dmv.dmv_dsc%TYPE;
    CURSOR cur_dmv IS
    SELECT a.dmv_dsc
    FROM t_99_00_dmv a, t_99_00_dmm b
    WHERE b.dm_id = pi_dm_id
    AND   b.r_k = a.r_p
    AND   a.dmv_id = pi_dmv_id
    AND   a.ius_yn = 1;
  BEGIN
    v_dsc := NULL;
    OPEN cur_dmv;
    FETCH cur_dmv INTO v_dsc;
    CLOSE cur_dmv;
    RETURN v_dsc;
  END fn_dmv_dsc;
  --
  --
  /* Public Routines */
  --
  -- Returns TRUE if input is a valid USER TYPE
  FUNCTION fn_vld_usr_typ (pi_k VARCHAR2, pi_usr_dm VARCHAR2) RETURN BOOLEAN IS
    v_bool    BOOLEAN;
  BEGIN
    v_bool := FALSE;
    pr_load_gvs;
    -- GUEST, EXTERNAL USER, MANAGER, EXECUTIVE, DATA ENTRY USER, USER, ADMINISTRATOR
    IF pi_usr_dm IN ('GST','EXT','MGR','EXE','DEU','USR','ADM') THEN
      v_bool := TRUE;
    END IF;
    RETURN v_bool;
  END fn_vld_usr_typ;
  --
  FUNCTION fn_usr_typ_dsc (pi_k VARCHAR2, pi_usr_dm VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF fn_vld_usr_typ (pi_k => pi_k, pi_usr_dm => pi_usr_dm) THEN
      RETURN fn_dmv_dsc (pi_dm_id => '99_USTYP', pi_dmv_id => pi_usr_dm);
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_typ_dsc;
  --
  -- Returns TRUE if input is a valid USER STATUS
  FUNCTION fn_vld_usr_sta (pi_k VARCHAR2, pi_sta_dm VARCHAR2) RETURN BOOLEAN IS
    v_bool    BOOLEAN;
  BEGIN
    v_bool := FALSE;
    pr_load_gvs;
    -- PENDING, NORMAL, LOCKED, DELETED
    IF pi_sta_dm IN ('P','N','L','D') THEN
      v_bool := TRUE;
    END IF;
    RETURN v_bool;
  END fn_vld_usr_sta;
  --
  FUNCTION fn_usr_sta_dsc (pi_k VARCHAR2, pi_sta_dm VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF fn_vld_usr_sta (pi_k => pi_k, pi_sta_dm => pi_sta_dm) THEN
      RETURN fn_dmv_dsc (pi_dm_id => '99_USSTA', pi_dmv_id => pi_sta_dm);
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_sta_dsc;
  --
  FUNCTION fn_usr_ctr_dsc (pi_k VARCHAR2, pi_ctr_dm VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_dmv_dsc (pi_dm_id => '99_ADCTR', pi_dmv_id => pi_ctr_dm);
    ELSE
      RETURN NULL;
    END IF;
  END fn_usr_ctr_dsc;
  --
  -- Returns TRUE if input is a valid ROLE TYPE
  FUNCTION fn_vld_rol_typ (pi_k VARCHAR2, pi_rol_dm VARCHAR2) RETURN BOOLEAN IS
    v_bool    BOOLEAN;
  BEGIN
    v_bool := FALSE;
    pr_load_gvs;
    -- GUEST, USER, ADMINISTRATOR
    IF pi_rol_dm IN ('GST','USR','ADM') THEN
      v_bool := TRUE;
    END IF;
    RETURN v_bool;
  END fn_vld_rol_typ;
  --
  FUNCTION fn_rol_typ_dsc (pi_k VARCHAR2, pi_rol_dm VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF fn_vld_rol_typ (pi_k => pi_k, pi_rol_dm => pi_rol_dm) THEN
      RETURN fn_dmv_dsc (pi_dm_id => '99_RLTYP', pi_dmv_id => pi_rol_dm);
    ELSE
      RETURN NULL;
    END IF;
  END fn_rol_typ_dsc;
  --
  -- Returns TRUE if input is a valid SYSTEM RESTRICTION FLAG
  FUNCTION fn_vld_sys_rst (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
    v_bool    BOOLEAN;
  BEGIN
    v_bool := FALSE;
    pr_load_gvs;
    IF pi_d IN ('0','1','2','3','4','5','9') THEN
      v_bool := TRUE;
    END IF;
    RETURN v_bool;
  END fn_vld_sys_rst;
  --
  FUNCTION fn_sys_rst_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF fn_vld_sys_rst (pi_k => pi_k, pi_d => pi_d) THEN
      RETURN fn_dmv_dsc (pi_dm_id => '99_SRST', pi_dmv_id => pi_d);
    ELSE
      RETURN NULL;
    END IF;
  END fn_sys_rst_dsc;
  --
  FUNCTION fn_lang_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_dmv_dsc (pi_dm_id => '99_LGG', pi_dmv_id => pi_d);
    ELSE
      RETURN NULL;
    END IF;
  END fn_lang_dsc;
  --
  FUNCTION fn_dmv_dsc (pi_k VARCHAR2, pi_d VARCHAR2, pi_v VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF pi_d IS NOT NULL AND pi_v IS NOT NULL THEN
      RETURN fn_dmv_dsc (pi_dm_id => pi_d, pi_dmv_id => pi_v);
    ELSE
      RETURN NULL;
    END IF;
  END fn_dmv_dsc;
  --
  -- Returns TRUE if input is a valid RECORD STATUS
  FUNCTION fn_vld_rec_sta (pi_k VARCHAR2, pi_d VARCHAR2) RETURN BOOLEAN IS
    v_bool    BOOLEAN;
  BEGIN
    v_bool := FALSE;
    pr_load_gvs;
    IF pi_d IN ('-1','0','1','2') THEN
      v_bool := TRUE;
    END IF;
    RETURN v_bool;
  END fn_vld_rec_sta;
  --
  FUNCTION fn_rec_sta_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2 IS
    v_id  VARCHAR2(100) := pi_d;
  BEGIN
    IF fn_vld_rec_sta (pi_k => pi_k, pi_d => pi_d) THEN
      IF pi_d = '-1' THEN -- NEW STATUS should be displayed as PENDING
        v_id := '0';
      END IF;
      RETURN fn_dmv_dsc (pi_dm_id => '99_RCSTA', pi_dmv_id => v_id);
    ELSE
      RETURN 'Unknown';
    END IF;
  END fn_rec_sta_dsc;
  --
  FUNCTION fn_gdr_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_dmv_dsc (pi_dm_id => '99_GDR', pi_dmv_id => pi_d);
    ELSE
      RETURN NULL;
    END IF;
  END fn_gdr_dsc;
  --
  PROCEDURE pr_gdr_vld (pi_k VARCHAR2, pi_d VARCHAR2) IS
  BEGIN
    IF fn_gdr_dsc (pi_k => pi_k, pi_d => pi_d) IS NOT NULL THEN
      NULL;
    ELSE
      NULL; --pk99_err.pr_raise (pi_id => '990104');
    END IF;
  END pr_gdr_vld;
  --
  FUNCTION fn_freq_dsc (pi_k VARCHAR2, pi_d VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      RETURN fn_dmv_dsc (pi_dm_id => '99_FQI', pi_dmv_id => pi_d);
    ELSE
      RETURN NULL;
    END IF;
  END fn_freq_dsc;
  --
  PROCEDURE pr_freq_vld (pi_k VARCHAR2, pi_d VARCHAR2) IS
  BEGIN
    IF fn_freq_dsc (pi_k => pi_k, pi_d => pi_d) IS NOT NULL THEN
      NULL;
    ELSE
      NULL; --pk99_err.pr_raise (pi_id => '990105');
    END IF;
  END pr_freq_vld;
  --
END pkwf_99_dmv;

/

