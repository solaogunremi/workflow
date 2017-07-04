CREATE OR REPLACE PACKAGE BODY pkwf_11_mb AS
  --
  /* Created By       : Aderemi Alabi
  ** Date Created     : 02-JUN-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: Workflow User Management
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
  --
  gv_k                  VARCHAR2(100);
  r_gv_k                VARCHAR2(100);
  v_is_valid_session    BOOLEAN := FALSE;
  r_v_is_valid_session  BOOLEAN := FALSE;
  --
  pv_rec      wf_vt_10_mb%ROWTYPE;
  pv_rec_e    wf_vt_10_mb%ROWTYPE;
  --
  pv_tbl      wf_10_mb%ROWTYPE;
  pv_tbl_i    wf_10_mb%ROWTYPE;
  --
  /* Private Routines */
  -- 
  -- global variables
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
    v_is_valid_session := TRUE; --pk99_glb.fn_vld_conn (gv_k);
    --
  END pr_load_gvs;
  --
  -- remote global variable
  PROCEDURE pr_load_r_gvs IS
  BEGIN
    --
    r_v_is_valid_session := FALSE;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO r_gv_k
    FROM dual@wf_sy;
    --
    --r_v_is_valid_session := pk99_glb.fn_vld_conn@wf_sy(r_gv_k);
    --
  END pr_load_r_gvs; 
  --
  --
  /* Public Routines */
  --      
  --
  PROCEDURE pr_clear_recs IS
  BEGIN
    pv_tbl          := NULL;
    pv_rec          := NULL;
    pv_rec_e        := NULL;
  END pr_clear_recs;
  --    
  /* Public Routines */
  --  
  --
  PROCEDURE pr_refresh IS
    --  
    CURSOR c_ssu IS -- new remote users
      SELECT A.*
      FROM   t_99_10_ssu@wf_sy A
      WHERE  usr_dm IN ('USR')
      AND    sta_dm IN ('N','L')
      AND    (r_k <> 100 OR r_k > 20)
      AND NOT EXISTS (SELECT 1
                      FROM   t_99_10_ssu b
                      WHERE  UPPER(A.lgn_id) = UPPER(b.lgn_id));
    --
    CURSOR c_not_mb IS -- removed users
      SELECT A.row_key
      FROM   wf_10_mb A
      WHERE NOT EXISTS (SELECT 1 
                        FROM   t_99_10_ssu b
                        WHERE  UPPER(A.mb_id) = UPPER(b.lgn_id));
    --  
    CURSOR c_mb IS -- new members
      SELECT A.lgn_id AS mb_id,
             UPPER(A.lst_nm )||' '||INITCAP(A.fir_nm) AS mb_dsc,
             A.r_k AS u_k
      FROM   t_99_10_ssu A
      WHERE  A.usr_dm IN ('USR')
      AND    A.sta_dm IN ('N','L')
      AND   (A.r_k <> 100 OR A.r_k > 20)
      AND NOT EXISTS (SELECT 1
                        FROM   wf_10_mb b
                        WHERE  UPPER(A.lgn_id) = UPPER(b.mb_id));
    --                    
    v_ssu t_99_10_ssu%ROWTYPE;
    v_mb  wf_10_mb%ROWTYPE;
    --    
  BEGIN
    --
    pr_load_gvs;
    pr_load_r_gvs;
    --
    -- manage remote users
    pk99_trg.pr_set_sdml (pi_k => gv_k);
    --
    DELETE FROM t_99_10_ssu A -- delete users that are no longer in use in symbols
    WHERE NVL(trc_yn,0) = 1  
    AND EXISTS (SELECT 1
                  FROM   t_99_10_ssu@wf_sy b
                  WHERE  b.sta_dm = 'D'
                  AND    UPPER(A.lgn_id) = UPPER(b.lgn_id));
    DELETE FROM t_99_10_ssu A -- delete users that are no longer in use in symbols
    WHERE NVL(trc_yn,0) = 1  
    AND NOT EXISTS (SELECT 1
                    FROM   t_99_10_ssu@wf_sy b
                    WHERE   UPPER(A.lgn_id) = UPPER(b.lgn_id));
    --
    FOR cr IN c_ssu LOOP -- bring in new users from symbols
      v_ssu := cr;
      v_ssu.i_ky := 1;
      v_ssu.trc_yn := '1';
      --INSERT INTO t_99_10_ssu VALUES v_ssu;
       INSERT INTO t_99_10_ssu 
      ( r_k, r_s, i_ky, sta_dm, sta_dt, lgn_id, usr_dm, 
        fir_nm, lst_nm, sht_nm, lgg_dm, eml_adr, eml_yn, 
        sms_yn, gdr_dm, ttl_dsc, adr_l1, adr_l2, adr_cty, 
        prm_phn, sms_phn, --dob_dt,
        err_yn, qry_yn, trc_yn, oth_rmk, cng_pw_yn,
        fl_01, fl_02, fl_03, fl_04, fl_05) 
      VALUES 
      ( cr.r_k, 0, 0,
     -- ( pk99_glb.fn_get_rk (pi_k => gv_k), 0, 0,
        cr.sta_dm, 
        cr.sta_dt, cr.lgn_id, cr.usr_dm, cr.fir_nm, 
        cr.lst_nm, cr.sht_nm, cr.lgg_dm, cr.eml_adr, 
        cr.eml_yn, cr.sms_yn, cr.gdr_dm, cr.ttl_dsc, 
        cr.adr_l1, cr.adr_l2, cr.adr_cty,
        cr.prm_phn, cr.sms_phn, --cr.dob_dt,
        0, 0, 1, cr.oth_rmk, cr.cng_pw_yn,
        cr.fl_01, cr.fl_02, cr.fl_03, cr.fl_04, '0');
    END LOOP;  
    --
    pk99_trg.pr_reset_sdml;
    --
    -- update WF member list
    FOR cr IN c_not_mb LOOP
      --
      DELETE FROM wf_10_rl_mb
      WHERE mb_k = cr.row_key;
      --
      DELETE FROM wf_10_mb
      WHERE row_key = cr.row_key;
      --
    END LOOP;    
    --
    FOR cr IN c_mb LOOP
      v_mb.row_key := pkwf_00.fn_nxt_key;
      v_mb.appr_stat_dm := '0';
      v_mb.c_n := 1;
      v_mb.mb_id  := cr.mb_id;
      v_mb.mb_dsc := cr.mb_dsc;
      v_mb.u_k    := cr.u_k;
      v_mb.iu_yn  := '0';
      INSERT INTO wf_10_mb VALUES v_mb;
    END LOOP;
    --
    UPDATE wf_10_mb A 
    SET    A.u_k = (SELECT b.r_k
                    FROM   t_99_10_ssu b
                    WHERE  UPPER(A.mb_id) = UPPER(b.lgn_id));
    --
  END pr_refresh;
  --
  FUNCTION fn_get_usr_l(pi_usr IN NUMBER) RETURN r_usr IS
    --
    CURSOR c_usr IS
      SELECT *
      FROM   wf_vl_11_mb_l
      WHERE  u_k = pi_usr;
    --
    v_r    r_usr;
    v_usr  wf_vl_11_mb_l%ROWTYPE;
    v_arr  apex_application_global.vc_arr2; 
  BEGIN
    --
    OPEN  c_usr;
    FETCH c_usr INTO v_usr;
    CLOSE c_usr;
    --
    IF NVL(v_usr.u_k,0) > 0 THEN
      v_r.u_k     := v_usr.u_k; 
      v_r.usr_id  := v_usr.mb_id; 
      v_r.usr_eml := v_usr.eml_adr;
      v_r.usr_dsc := v_usr.mb_dsc; 
      v_r.iu_yn   := v_usr.iu_yn;
      v_r.is_adm_yn := v_usr.is_adm_yn;
      --
      SELECT rl_k 
      BULK COLLECT 
      INTO   v_arr
      FROM   wf_10_rl_mb
      WHERE  mb_k = v_usr.u_k;
      --
      v_r.usr_rl := apex_util.table_to_string (v_arr);
      --
    END IF;
    --
    RETURN v_r;
    --
  END fn_get_usr_l;
  --
  FUNCTION fn_get_usr_r(pi_usr IN NUMBER) RETURN r_usr IS
    --
    CURSOR c_usr IS
      SELECT *
      FROM   wf_vl_11_mb_r
      WHERE  u_k = pi_usr;
    --
    v_r    r_usr;
    v_usr  wf_vl_11_mb_r%ROWTYPE;
    v_arr  apex_application_global.vc_arr2; 
  BEGIN
    --
    OPEN  c_usr;
    FETCH c_usr INTO v_usr;
    CLOSE c_usr;
    --
    IF NVL(v_usr.u_k,0) > 0 THEN
      v_r.u_k     := v_usr.u_k; 
      v_r.usr_id  := v_usr.mb_id;
      v_r.usr_dsc := v_usr.mb_dsc; 
      v_r.usr_eml := v_usr.eml_adr; 
      v_r.iu_yn   := v_usr.iu_yn;
      v_r.is_adm_yn := v_usr.is_adm_yn;
      --
      SELECT rl_k 
      BULK COLLECT 
      INTO   v_arr
      FROM   wf_10_rl_mb
      WHERE  mb_k = v_usr.u_k;
      --
      v_r.usr_rl := apex_util.table_to_string (v_arr);
      --
    END IF;
    --
    RETURN v_r;
    --
  END fn_get_usr_r;
  --
  --
  FUNCTION fn_get_usr_role(pi_usr IN NUMBER) RETURN VARCHAR2 IS
    --
    v_arr  apex_application_global.vc_arr2;
    v_r    VARCHAR2(200);
  BEGIN
    --
    SELECT INITCAP(b.rl_dsc) rl_dsc
    BULK COLLECT 
    INTO   v_arr
    FROM   wf_10_rl_mb A,
           wf_10_rl b
    WHERE  A.rl_k = b.row_key
    AND    mb_k = pi_usr;
    --
    v_r := apex_util.table_to_string (v_arr,', ');
    --
    RETURN v_r;
    --
  END fn_get_usr_role;
  --
  --
  PROCEDURE pr_new_usr_l(pi_rec IN r_usr) IS
    --
    v_arr  apex_application_global.vc_arr2; 
    v_usr  r_usr;
    v_rec  wf_10_rl_mb%ROWTYPE;
    --
  BEGIN
    -- 
    pr_load_gvs;
    --
    v_usr := pi_rec;
    --
    INSERT INTO wf_10_mb (row_key, mb_id, mb_dsc, u_k, iu_yn) 
    VALUES (wf_seq_00_key.NEXTVAL, v_usr.usr_id, v_usr.usr_dsc, v_usr.u_k, '1');
    --
    DELETE FROM wf_10_rl_mb
    WHERE mb_k = pi_rec.u_k;
    --
    v_arr := apex_util.string_to_table(pi_rec.usr_rl);
    FOR i IN 1..v_arr.COUNT LOOP
      v_rec.row_key := pkwf_00.fn_nxt_key;
      v_rec.appr_stat_dm := '0';
      v_rec.c_n := 1;
      --
      v_rec.rl_k  := v_arr(i);
      v_rec.mb_k  := pi_rec.u_k;
      v_rec.iu_yn := pi_rec.iu_yn;
      --
      INSERT INTO wf_10_rl_mb VALUES v_rec;
      --
    END LOOP;
    --
  END pr_new_usr_l;
  --
  PROCEDURE pr_upd_usr_l(pi_rec IN r_usr) IS
    --
    v_arr  apex_application_global.vc_arr2; 
    v_rec  wf_10_rl_mb%ROWTYPE;
    --
  BEGIN
    -- 
    pr_load_gvs;
    UPDATE wf_10_mb
    SET    mb_dsc = pi_rec.usr_id,
           iu_yn  = pi_rec.iu_yn
    WHERE  u_k = pi_rec.u_k;
    --
    pk99_trg.pr_set_sdml (pi_k => gv_k);
    UPDATE t_99_10_ssu
    SET    eml_adr = pi_rec.usr_eml,
           fl_05 = pi_rec.is_adm_yn
    WHERE  r_k = pi_rec.u_k;
    pk99_trg.pr_reset_sdml;
    --
    DELETE FROM wf_10_rl_mb
    WHERE mb_k = pi_rec.u_k;
    --
    v_arr := apex_util.string_to_table(pi_rec.usr_rl);
    FOR i IN 1..v_arr.COUNT LOOP
      v_rec.row_key := pkwf_00.fn_nxt_key;
      v_rec.appr_stat_dm := '0';
      v_rec.c_n := 1;
      --
      v_rec.rl_k  := v_arr(i);
      v_rec.mb_k  := pi_rec.u_k;
      v_rec.iu_yn := pi_rec.iu_yn;
      --
      INSERT INTO wf_10_rl_mb VALUES v_rec;
      --
    END LOOP;
    --
  END pr_upd_usr_l;
  --
  PROCEDURE pr_upd_usr_r(pi_rec IN r_usr) IS
    --
    v_arr  apex_application_global.vc_arr2; 
    v_rec  wf_10_rl_mb%ROWTYPE;
    --
  BEGIN
    -- 
    pr_load_gvs;
    UPDATE wf_10_mb
    SET    iu_yn  = pi_rec.iu_yn
    WHERE  u_k = pi_rec.u_k;
    --
    pk99_trg.pr_set_sdml (pi_k => gv_k);
    UPDATE t_99_10_ssu
    SET    fl_05 = pi_rec.is_adm_yn
    WHERE  r_k = pi_rec.u_k;
    pk99_trg.pr_reset_sdml;
    --
    DELETE FROM wf_10_rl_mb
    WHERE mb_k = pi_rec.u_k;
    --
    v_arr := apex_util.string_to_table(pi_rec.usr_rl);
    FOR i IN 1..v_arr.COUNT LOOP
      v_rec.row_key := pkwf_00.fn_nxt_key;
      v_rec.appr_stat_dm := '0';
      v_rec.c_n := 1;
      --
      v_rec.rl_k  := v_arr(i);
      v_rec.mb_k  := pi_rec.u_k;
      v_rec.iu_yn := pi_rec.iu_yn;
      --
      INSERT INTO wf_10_rl_mb VALUES v_rec;
      --
    END LOOP;
    --
  END pr_upd_usr_r;
  --
  FUNCTION fn_is_admin(pi_usr IN NUMBER) RETURN BOOLEAN IS
    --
    CURSOR c_adm IS
      SELECT usr_dm
      FROM   t_99_10_ssu
      WHERE  r_k = pi_usr;
    --
    v_adm_yn  VARCHAR2(1);
    v_return  BOOLEAN := FALSE;
    --
  BEGIN
    --
    OPEN  c_adm ;
    FETCH c_adm INTO v_adm_yn;
    CLOSE c_adm;
    --
    IF NVL(v_adm_yn,'USR') = 'ADM' THEN
      v_return := TRUE;
    END IF;
    --
    RETURN v_return;
    --
  END fn_is_admin; 
  -- 
  FUNCTION fn_is_admin(pi_usr IN VARCHAR2 DEFAULT NULL) RETURN BOOLEAN IS
    --
    v_k   NUMBER;
    v_usr VARCHAR2(30);
    --
    CURSOR c_usr IS
      SELECT r_k
      FROM   t_99_10_ssu
      WHERE  UPPER(lgn_id) = UPPER(v_usr);
    --
  BEGIN
    --
    v_usr := NVL(pi_usr,v('APP_USER'));
    --
    OPEN  c_usr;
    FETCH c_usr INTO v_k;
    CLOSE c_usr;
    --
    RETURN fn_is_admin(v_k);
    --
  END fn_is_admin;
  --
  FUNCTION fn_is_lcl_usr(pi_usr IN VARCHAR2 DEFAULT NULL) RETURN BOOLEAN IS
    --
    v_lcl VARCHAR2(30);
    v_usr VARCHAR2(30);
    v_return BOOLEAN := TRUE;
    --
    CURSOR c_usr IS
      SELECT trc_yn
      FROM   t_99_10_ssu
      WHERE  UPPER(lgn_id) = UPPER(v_usr);
    --
  BEGIN
    --
    v_usr := NVL(pi_usr,v('APP_USER'));
    --
    OPEN  c_usr;
    FETCH c_usr INTO v_lcl;
    CLOSE c_usr;
    --
    IF NVL(v_lcl,'0') = '1' THEN 
      v_return := FALSE;
    END IF;
    --    
    RETURN v_return;
    --
  END fn_is_lcl_usr;
  --
END pkwf_11_mb;
/
