CREATE OR REPLACE PACKAGE BODY pkwf_99_pwm AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: Password Management
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
  --
  gv_vld_err_id   VARCHAR2(10);
  gv_vld_err_txt  VARCHAR2(1000);
  v_is_valid_session  BOOLEAN;
  gv_setup_uid    VARCHAR2(30) := 'SETUP';
  gv_setup_key    NUMBER := 100;  
  --
  gr_pwr          t_99_10_pwr%ROWTYPE; 
  --
  /* Private Routines */
  --
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
    v_is_valid_session := pkwf_99_glb.fn_vld_conn (gv_k);
    --
  END pr_load_gvs;
  --  
  -- Password Rules
  PROCEDURE pr_get_pwd_rules (pi_usr_dm VARCHAR2) IS
    v_usr_typ   VARCHAR2(50);
    pwr_null    t_99_10_pwr%ROWTYPE; 
    CURSOR c_pwr IS
    SELECT *
    FROM t_99_10_pwr
    WHERE u_dm = v_usr_typ;
  BEGIN
    --
    v_usr_typ := UPPER(pi_usr_dm);
    --
    gr_pwr := pwr_null;
    OPEN c_pwr;
    FETCH c_pwr INTO gr_pwr;
    CLOSE c_pwr;
    --
    gr_pwr.u_dm := NVL(gr_pwr.u_dm,'ADM'); 
    gr_pwr.mp_l := NVL(gr_pwr.mp_l,8); -- Minimum length
    gr_pwr.md_c := NVL(gr_pwr.md_c,1); -- Minimum digits
    gr_pwr.mp_c := NVL(gr_pwr.mp_c,1); -- Minimum Punctuations
    gr_pwr.mr_c := NVL(gr_pwr.mr_c,10); -- Maximum Reuse
    gr_pwr.pl_d := NVL(gr_pwr.pl_d,30); -- Password Lifetime days
    gr_pwr.fl_c := NVL(gr_pwr.fl_c,3); -- Login Attempts
    gr_pwr.fl_m := NVL(gr_pwr.fl_m,30); -- Lockout minutes after failed login
    --
  END pr_get_pwd_rules;
  --  
  FUNCTION fn_get_hsh (pi_nme IN VARCHAR2, pi_pwd IN VARCHAR2) RETURN RAW IS
    vtxt  VARCHAR2(500);
  BEGIN
    vtxt := pi_pwd||'0a_9Z'||UPPER(pi_nme);
    RETURN SYS.DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(vtxt, 'AL32UTF8'),SYS.DBMS_CRYPTO.HASH_SH1);
  END fn_get_hsh;
  --  
  -- User keys stored in Password tables
  FUNCTION fn_pwd_usr_ky (pi_usr_ky NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (pi_usr_ky*7)+49979693;
  END fn_pwd_usr_ky;
  --
  PROCEDURE pr_purge_pwd_hist (pi_usr_ky IN NUMBER, pi_keep_cnt NUMBER DEFAULT 5) IS
    v_usr_ky       NUMBER;
    v_del_tm       t_99_10_pwh.i_tm%TYPE;
  BEGIN
    --
    pr_load_gvs;
    v_usr_ky := fn_pwd_usr_ky (pi_usr_ky);
    --
    IF pi_keep_cnt <= 0 THEN
      pkwf_99_trg.pr_set_sdml (pi_k => gv_k);
      DELETE FROM t_99_10_pwh
      WHERE s_ky = v_usr_ky;
    ELSE
      --
      v_del_tm := NULL;
      BEGIN
        SELECT MIN(i_tm) 
        INTO v_del_tm
        FROM (SELECT i_tm 
              FROM t_99_10_pwh
              WHERE s_ky = v_usr_ky              
              ORDER BY i_tm DESC)
        WHERE ROWNUM < (pi_keep_cnt+1);    
      END;
      --
      IF v_del_tm IS NOT NULL THEN
        pkwf_99_trg.pr_set_sdml (pi_k => gv_k);
        DELETE FROM t_99_10_pwh
        WHERE s_ky = v_usr_ky
        AND   i_tm < v_del_tm;      
      END IF;
      --
    END IF;
    --
    pkwf_99_trg.pr_reset_sdml;
    --
  END pr_purge_pwd_hist;
  --  
  -- Returns TRUE if text cannot be used as USER PASSWORD
  FUNCTION fn_is_blk_pw (pi_txt VARCHAR2) RETURN BOOLEAN IS
    v_yn  PLS_INTEGER;
    CURSOR cur_prohibited_pw IS
    SELECT 1
    FROM t_99_10_ppw
    WHERE UPPER(pw_txt) = UPPER(pi_txt);
  BEGIN
    --
    v_yn := 0;
    --
    OPEN cur_prohibited_pw;
    FETCH cur_prohibited_pw INTO v_yn;
    CLOSE cur_prohibited_pw;
    --
    IF NVL(v_yn,0) = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
    --
  END fn_is_blk_pw;
  --   
  --
  /* Public Routines */
  --  
  PROCEDURE pr_reset_upw (pi_k VARCHAR2, pi_un VARCHAR2, pi_un_yn NUMBER DEFAULT 0, po_pw OUT VARCHAR2) IS
    v_un  VARCHAR2(200);
    v_pw  VARCHAR2(200);
    v_uk   NUMBER;
    CURSOR cur_uk IS
    SELECT r_k
    FROM t_99_10_ssu
    WHERE r_s = 1
    AND   sta_dm IN ('N','L')
    AND   UPPER(lgn_id) = v_un;
    --    
  BEGIN
    --
    pr_load_gvs;
    v_uk := NULL;
    v_pw := NULL;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      -- Get User Key and Update Password
      v_un := UPPER(pi_un);
      v_uk := pkwf_99_glb.fn_rsv_usr_ky (pi_k => gv_k, pi_d => v_un);
      --
      IF (v_uk BETWEEN 1 AND 20) THEN
        IF pkwf_99_ssi.fn_is_apl_adm (gv_k) THEN -- Only INSTALLATION ADMIN allowed 
          v_pw := pkwf_99_ssi.fn_dflt_ipw (pi_k => gv_k); -- Default Password for INTERNAL Users
        ELSE
          pkwf_99_err.pr_raise (pi_id => '990099'); 
        END IF;      
      ELSE
        pkwf_99_glb.pr_vld_conn;
        IF pkwf_99_glb.fn_vld_conn (gv_k) THEN
          OPEN cur_uk;
          FETCH cur_uk INTO v_uk;
          CLOSE cur_uk;
        END IF;
      END IF;
      -- 
      IF v_uk > 0 THEN
        --
        IF v_pw IS NULL THEN
          IF pi_un_yn = 1 THEN
            v_pw := pi_un;
          ELSE
            v_pw := pkwf_99_ncr.fn_rans (pi_k => gv_k, pi_len => 4, pi_opt => 'a');              -- mixed-case alpha
            v_pw := v_pw||LOWER(pkwf_99_ncr.fn_rans (pi_k => gv_k, pi_len => 4, pi_opt => 'x')); -- alpha-numeric
          END IF;
        END IF;
        --
        pr_upw_upd (pi_k => gv_k, pi_uk => v_uk, pi_un => pi_un, pi_up => v_pw);
        --
        -- Set the Force Password Change flag
        IF v_uk > 20 THEN
          pr_set_chg_cpw (pi_k => gv_k, pi_uk => v_uk);
        END IF;
        --      
        po_pw := v_pw;
        --
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_raise_ivl_pgm ('CHNG_PWD'); -- Invalid Program exception
    END IF;
    --
  END pr_reset_upw;
  --  
  PROCEDURE pr_chg_cpw (pi_k    VARCHAR2, 
                        pi_un   VARCHAR2, 
                        pi_pw   VARCHAR2, 
                        pi_pwc  VARCHAR2, 
                        pi_opw  VARCHAR2) IS
    v_txt       VARCHAR2(1000);
    v_uk        NUMBER;
    v_sys_tmm   t_99_10_ssu.lst_pw_dt%TYPE;
    CURSOR cur_uk IS
    SELECT r_k
    FROM t_99_10_ssu
    WHERE r_s = 1
    AND   sta_dm IN ('N','L')
    AND   UPPER(lgn_id) = v_txt;
    --    
  BEGIN
    --
    pkwf_99_glb.pr_vld_conn;
    pr_load_gvs;
    v_uk := NULL;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      -- Validate User Passwords. This updates GV_VLD_ERR_TXT, GV_VLD_ERR_ID and GR_PWR
      v_txt := fn_vld_npw ( pi_k    => gv_k, 
                            pi_un   => pi_un, 
                            pi_pw   => pi_pw, 
                            pi_pwc  => pi_pwc, 
                            pi_opw  => pi_opw);
      --
      IF gv_vld_err_txt IS NOT NULL OR gv_vld_err_id IS NOT NULL THEN
        pkwf_99_err.pr_raise_t (pi_txt => NVL(gv_vld_err_txt,gv_vld_err_id));
      ELSE
        --
        -- Get User Key and Update Password
        v_txt := UPPER(pi_un);
        v_uk := pkwf_99_glb.fn_rsv_usr_ky (pi_k => gv_k, pi_d => v_txt);
        --
        IF (v_uk BETWEEN 1 AND 20) THEN
          IF NOT pkwf_99_ssi.fn_is_ssi_lgn_usr (gv_k) THEN
            pkwf_99_err.pr_raise (pi_id => '990099'); -- Only INTERNAL Users allowed 
          END IF;
        ELSE
          OPEN cur_uk;
          FETCH cur_uk INTO v_uk;
          CLOSE cur_uk;
        END IF;
        -- 
        IF v_uk > 0 THEN
          --
          -- Change password
          pr_upw_upd (pi_k => gv_k, pi_uk => v_uk, pi_un => pi_un, pi_up => pi_pw);
          --
          -- Purge Password History, based on the Password reuse policy
          -- Note that GR_PWR was set by FN_VLD_NPW
          pr_purge_pwd_hist (pi_usr_ky => v_uk, pi_keep_cnt => gr_pwr.mr_c); -- Max Reuse Count
          --
          -- Uncheck Password Change
          IF v_uk > 20 THEN
            --
            v_sys_tmm := pkwf_99_dtm.fn_sys_tmm;
            --
            pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
            UPDATE t_99_10_ssu SET
              cng_pw_yn = 0,
              pw_cnt = NVL(pw_cnt,0) + 1, -- password change count
              lst_pw_dt = v_sys_tmm -- last password change date
            WHERE r_k = v_uk;
            pkwf_99_trg.pr_reset_sdml;
            --            
            -- Send Email
            pkwf_99_eml_msg.pr_pw_chng ( pi_k => gv_k, pi_ky => v_uk);
            --                  
          END IF;
          --
        END IF;
        --
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_raise_ivl_pgm ('CHNG_PWD'); -- Invalid Program exception
    END IF;
    --
  END pr_chg_cpw;
  --
  -- Validate Login password
  FUNCTION fn_vld_lpw ( pi_k  VARCHAR2, 
                        pi_lu VARCHAR2, 
                        pi_lp VARCHAR2) RETURN BOOLEAN IS
    --
    v_yes          PLS_INTEGER;
    v_hsh          t_99_10_pwu.pw_hsh%TYPE;
    v_itl_adm      VARCHAR2(50);
    v_itl_usr      VARCHAR2(50);     
    v_usr_ky       NUMBER;
    v_pusr_ky      NUMBER;
    v_nme          VARCHAR2(500);
    v_valid        BOOLEAN;
    --
    CURSOR cur_ky IS
    SELECT r_k
    FROM t_99_10_ssu
    WHERE r_s = 1
    AND   sta_dm IN ('N','L')
    AND   UPPER(lgn_id) = UPPER(v_nme);
    --
    CURSOR c_pwd IS
    SELECT 1
    FROM t_99_10_pwu
    WHERE s_ky = v_pusr_ky
    AND   pw_hsh = v_hsh;
    --
  BEGIN
    --
    v_yes := 0;
    v_usr_ky := NULL;
    v_pusr_ky := NULL;
    v_hsh := NULL;
    v_valid := FALSE;
    --
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      v_nme := pi_lu;
      v_usr_ky := pkwf_99_glb.fn_rsv_usr_ky (pi_k => gv_k, pi_d => v_nme);
      --
      IF (v_usr_ky BETWEEN 1 AND 20) THEN
        NULL;
      ELSE
        OPEN cur_ky;
        FETCH cur_ky INTO v_usr_ky;
        CLOSE cur_ky;
      END IF;
      --
      IF v_usr_ky > 0 THEN
        --
        v_pusr_ky := fn_pwd_usr_ky (v_usr_ky);
        v_hsh := fn_get_hsh (pi_nme => v_nme, pi_pwd => pi_lp);
        --
        OPEN c_pwd;
        FETCH c_pwd INTO v_yes;
        CLOSE c_pwd;
        --
      END IF;
      --
    END IF;
    --
    IF v_yes = 1 THEN
      v_valid := TRUE;
    ELSIF v_usr_ky = 1 THEN -- INSTALLATION ADMIN
      -- Check if new installation
      SELECT COUNT(*) INTO v_yes FROM t_99_10_pwu;
      IF NVL(v_yes,0) = 0 THEN -- No Passwords 
        -- New Installation default for INSTALLATION ADMIN
        IF pi_lp = 'Neulogic_'||TO_CHAR(SYSDATE,'YYYY') THEN
          v_valid := TRUE;
        END IF;  
      END IF;
      --
    END IF;
    --    
    RETURN v_valid;
    --
  END fn_vld_lpw;  
  -- 
  -- Validate new password.
  FUNCTION fn_vld_npw ( pi_k    VARCHAR2, 
                        pi_un   VARCHAR2, 
                        pi_pw   VARCHAR2, 
                        pi_pwc  VARCHAR2, 
                        pi_opw  VARCHAR2) RETURN VARCHAR2 IS
    v_len                   PLS_INTEGER;
    v_n                     PLS_INTEGER;
    v_diff                  PLS_INTEGER;
    is_valid                BOOLEAN;
    digitarray              VARCHAR2(20);
    punctarray              VARCHAR2(50);
    chararray               VARCHAR2(52);
    validarray              VARCHAR2(500);
    i_char                  VARCHAR2(30);
    v_reverse               VARCHAR2(500);
    --
    v_pw                    VARCHAR2(500);
    v_un                    VARCHAR2(500);
    v_db                    VARCHAR2(500);
    v_strong_pwd_policy     BOOLEAN;
    v_hsh                   t_99_10_pwu.pw_hsh%TYPE;
    v_usr_ky                NUMBER;
    v_uk                    NUMBER;
    v_usr_dm                t_99_10_ssu.usr_dm%TYPE;
    --
    TYPE tbl_char IS TABLE OF VARCHAR2(30) INDEX BY PLS_INTEGER;
    t_s tbl_char;
    i_s PLS_INTEGER;
    --
    CURSOR cur_uk IS
    SELECT r_k, usr_dm
    FROM t_99_10_ssu
    WHERE r_s = 1
    AND   sta_dm IN ('N','L')
    AND   UPPER(lgn_id) = UPPER(pi_un);
    --    
    CURSOR c_hist_pwd IS
    SELECT pw_hsh
    FROM t_99_10_pwh
    WHERE s_ky = v_usr_ky
    ORDER BY i_tm DESC;
    --    
    FUNCTION fn_is_same_or_similar (pi_base VARCHAR2, pi_passwd VARCHAR2) RETURN BOOLEAN IS
      v_t      NUMBER;
      v_base   VARCHAR2(500) := UPPER(pi_base);
      v_pwd    VARCHAR2(500) := UPPER(pi_passwd);      
    BEGIN
      --
      v_t := NULL;
      --
      IF v_base = v_pwd THEN -- Same
        v_t := 1;
      ELSIF NOT v_strong_pwd_policy THEN -- Enough for those with MINIMAL CHECKS
        NULL;
      ELSE
        --
        BEGIN
          v_t := INSTR(v_pwd,v_base); 
        EXCEPTION
        WHEN OTHERS THEN
          NULL;
        END; 
        --
      END IF;
      --
      IF v_t >= 1 THEN
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;
      --
    END fn_is_same_or_similar;
    --
  BEGIN
    --
    pr_load_gvs;
    gv_vld_err_txt := NULL;
    gv_vld_err_id := NULL;
    --
    v_uk := NULL;
    v_usr_ky := NULL;
    v_hsh := NULL;
    t_s.DELETE;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      -- Check Mandatory Inputs
      IF pi_un IS NULL THEN
        gv_vld_err_id := '990066';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => 'Username');
        GOTO end_validation;            
      END IF;
      --
      IF pi_opw IS NULL THEN
        gv_vld_err_id := '990066';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => 'Current Password');
        GOTO end_validation;            
      END IF;
      --       
      IF pi_pw IS NULL THEN
        gv_vld_err_id := '990066';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => 'New Password');
        GOTO end_validation;            
      END IF;
      -- 
      IF pi_pwc IS NULL THEN
        gv_vld_err_id := '990066';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => 'Confirm New Password');
        GOTO end_validation;            
      END IF;
      --            
      -- Check that New Password and its Confirmation are same
      IF NOT (pi_pw = pi_pwc) THEN
        gv_vld_err_id := '990038';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);
        GOTO end_validation;      
      END IF;
      --
      -- Check that New Password differs from Current Password
      IF UPPER(pi_pw) = UPPER(pi_opw) THEN
        gv_vld_err_id := '990039';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);
        GOTO end_validation;      
      END IF;
      --
      -- Validate Username and Current Password
      IF fn_vld_lpw (pi_k => gv_k, pi_lu => pi_un, pi_lp => pi_opw) THEN
        NULL;
      ELSE
        gv_vld_err_id := '990005';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);
        GOTO end_validation;      
      END IF;
      --    
      -- Get User Key
      v_uk := pkwf_99_ssi.fn_ssi_ky (pi_k => gv_k, pi_d => UPPER(pi_un));
      IF v_uk BETWEEN 1 AND 20 THEN
        NULL; -- INTERNAL USER
      ELSE
        OPEN cur_uk;
        FETCH cur_uk INTO v_uk, v_usr_dm;
        CLOSE cur_uk;
      END IF;
      -- 
      IF NVL(v_uk,0) <= 0 THEN
        gv_vld_err_id := '990005';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);
        GOTO end_validation;      
      END IF;
      --
      --      
      digitarray := '0123456789';
      chararray := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      punctarray := '#$_*'; -- Oracle Standards
      punctarray := punctarray ||'+-()>%<^=[]{}?@!~'; -- Why not? Since managed internally
      validarray := digitarray || chararray || punctarray;
      --
      -- Load password rules
      IF v_uk <= 20 THEN -- Internal users must use ADMIN rules
        v_usr_dm := 'ADM';
      END IF;
      --
      pr_get_pwd_rules (pi_usr_dm => v_usr_dm);
      --
      v_strong_pwd_policy := FALSE;      
      IF v_usr_dm = 'ADM' THEN -- ADMINs always enforce Strong Password Policy
        v_strong_pwd_policy := TRUE;
        IF NVL(gr_pwr.mp_l,0) <= 7 THEN -- password length
          gr_pwr.mp_l := 7;
        END IF;    
        IF NVL(gr_pwr.mr_c,0) <= 3 THEN -- password reuse count
          gr_pwr.mr_c := 3;      
        END IF;
        IF NVL(gr_pwr.md_c,0) <= 1 THEN -- number of digits
          gr_pwr.md_c := 1;      
        END IF;        
      ELSIF NVL(gr_pwr.sp_yn,0) <> 0 THEN
        v_strong_pwd_policy := TRUE;
      END IF;
      --
      -- Check for the minimum/maximum length of the password
      IF NVL(gr_pwr.mp_l,0) <= 4 THEN
        gr_pwr.mp_l := 5;
      END IF;
      IF LENGTH(pi_pw) < gr_pwr.mp_l THEN
        gv_vld_err_id := '990042';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => gr_pwr.mp_l);
        GOTO end_validation;
      END IF;
      --
      v_un := NLS_LOWER(pi_un) ;
      v_pw := NLS_LOWER(pi_pw) ;
      --
      -- Check if the password is same as (or similar to) the username
      IF fn_is_same_or_similar(pi_base => v_un, pi_passwd => v_pw) THEN
        gv_vld_err_id := '990044';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
        GOTO end_validation;
      END IF;
      --
      -- Check if the password is same as the username reversed
      IF v_strong_pwd_policy THEN
        SELECT REVERSE(v_un) INTO v_reverse FROM DUAL;
        IF v_pw = v_reverse THEN
          gv_vld_err_id := '990045';
          gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
          GOTO end_validation;
        END IF;
      END IF;
      --
      -- Check if the password is too simple.
      IF v_strong_pwd_policy THEN
        -- Load simple words
        t_s(1) := 'oracle';
        t_s(2) := 'database';
        t_s(3) := 'user';
        t_s(4) := 'system';
        t_s(5) := 'sys';
        t_s(6) := 'admin';
        t_s(7) := 'administrator';
        t_s(8) := 'manager';
        t_s(9) := 'change_on_install';
        t_s(10) := 'internal';
        t_s(11) := 'computer';
        t_s(12) := 'apex';
        t_s(13) := 'abc';
        t_s(14) := 'master';
        t_s(15) := 'qwerty';
        t_s(16) := 'asdf';
        t_s(17) := 'password';
        t_s(18) := 'pass';
        t_s(19) := 'test';
        t_s(20) := 'hello';
        t_s(21) := 'welcome';
        t_s(22) := 'jesus';
        t_s(23) := 'christ';
        t_s(24) := 'love';
        t_s(25) := 'testing';
        t_s(26) := 'secret';
        t_s(27) := 'letmein';
        t_s(28) := 'football';
        t_s(29) := 'iloveyou';
        t_s(30) := 'pastor';
        t_s(31) := 'princess';
        --
        is_valid := TRUE;
        FOR j IN t_s.FIRST..t_s.LAST
        LOOP
          v_db := t_s(j) ;
          IF fn_is_same_or_similar(pi_base => v_db, pi_passwd => v_pw) THEN
            is_valid := FALSE;
            GOTO endsimpletest;
          END IF;
        END LOOP;
        << endsimpletest >>
        IF is_valid = FALSE THEN
          gv_vld_err_id := '990047';
          gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
          GOTO end_validation;
        END IF;
        --
      END IF;
      --
      -- Check that first character is an alphabet
      is_valid := FALSE;
      FOR i IN 1..length(chararray)
      LOOP
        IF SUBSTR(pi_pw, 1, 1) = SUBSTR(chararray, i, 1) THEN
          is_valid := TRUE;
          GOTO endfirstcharacter;
        END IF;
      END LOOP;
      << endfirstcharacter >>
      IF is_valid = FALSE THEN
        gv_vld_err_id := '990048';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
        GOTO end_validation;
      END IF;
      --
      -- Check if password is prohibited
      IF fn_is_blk_pw (pi_txt => v_pw) THEN
        gv_vld_err_id := '990049';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
        GOTO end_validation;
      END IF;
      --
      v_len := LENGTH(pi_pw);
      --
      -- 1. Check for number of digits
      IF gr_pwr.md_c > 0 THEN 
        v_n := 0;
        FOR i IN 1..10 LOOP
          FOR j IN 1..v_len LOOP
            IF SUBSTR(pi_pw, j, 1) = SUBSTR(digitarray, i, 1) THEN
              v_n := v_n + 1;
              IF v_n >= gr_pwr.md_c THEN
                GOTO enddigits;
              END IF;
            END IF;
          END LOOP;
        END LOOP;
        IF v_n < gr_pwr.md_c THEN
          gv_vld_err_id := '990043';
          gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => gr_pwr.md_c);
          GOTO end_validation;
        END IF;
        <<enddigits>>
        NULL;
      END IF;
      --
      -- Check for number of punctuations
      IF gr_pwr.mp_c > 0 THEN 
        v_n := 0;
        FOR i IN 1..LENGTH(punctarray) LOOP
          FOR j IN 1..v_len LOOP
            IF SUBSTR(pi_pw, j, 1) = SUBSTR(punctarray, i, 1) THEN
              v_n := v_n + 1;
              IF v_n >= gr_pwr.mp_c THEN
                GOTO endpunct;
              END IF;
            END IF;
          END LOOP;
        END LOOP;
        IF v_n < gr_pwr.mp_c THEN
          gv_vld_err_id := '990050';
          gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => gr_pwr.mp_c);
          GOTO end_validation;
        END IF;
        <<endpunct>>
        NULL;
      END IF;
      --
      -- Check if password contains invalid characters
      is_valid := TRUE;
      FOR i IN 1..v_len LOOP
        i_char := SUBSTR(pi_pw, i, 1) ;
        is_valid := FALSE;
        FOR j IN 1..length(validarray) LOOP
          IF i_char = SUBSTR(validarray, j, 1) THEN
            is_valid := TRUE;
            EXIT;
          END IF;
        END LOOP;
        IF is_valid = FALSE THEN
          GOTO endinvalidchar;
        END IF;
      END LOOP;
      <<endinvalidchar>>
      IF is_valid = FALSE THEN
        gv_vld_err_id := '990051';
        gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id, pi_p1 => '"' || i_char || '"');
        GOTO end_validation;
      END IF;
      --
      -- Check if the password differs from the previous password by at least 3 letters
      IF v_strong_pwd_policy THEN
        IF pi_opw IS NOT NULL THEN
          v_diff := LENGTH(pi_opw) - LENGTH(pi_pw) ;
          v_diff := ABS(v_diff) ;
          IF v_diff < 3 THEN
            IF LENGTH(pi_pw) < LENGTH(pi_opw) THEN
              v_len := LENGTH(pi_pw) ;
            ELSE
              v_len := LENGTH(pi_opw) ;
            END IF;
            FOR i IN 1..v_len LOOP
              IF SUBSTR(pi_pw, i, 1) != SUBSTR(pi_opw, i, 1) THEN
                v_diff := v_diff + 1;
              END IF;
            END LOOP;
            IF v_diff < 3 THEN
              gv_vld_err_id := '990052';
              gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
              GOTO end_validation;
            END IF;
          END IF;
        END IF;
      END IF;
      --
      -- Check Password Reuse
      IF v_uk > 0 AND gr_pwr.mr_c > 0 THEN 
        --
        v_usr_ky := fn_pwd_usr_ky (v_uk);
        v_hsh := fn_get_hsh (pi_nme => pi_un, pi_pwd => pi_pw);
        --
        v_n := 0;
        FOR cr IN c_hist_pwd LOOP
          IF v_n >= gr_pwr.mr_c THEN
            EXIT;
          ELSIF cr.pw_hsh = v_hsh THEN
            gv_vld_err_id := '990037';
            gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
            GOTO end_validation;
          END IF;
          v_n := v_n + 1;
        END LOOP;
        --
      END IF;
      --
      --
    ELSE
      gv_vld_err_id := '990002';
      gv_vld_err_txt := pkwf_99_err.fn_err_msg (pi_id => gv_vld_err_id);      
    END IF;
    --
    <<end_validation>>
    --
    v_uk := NULL;
    v_usr_ky := NULL;
    v_hsh := NULL;
    t_s.DELETE;
    --    
    RETURN gv_vld_err_txt;
    --
  END fn_vld_npw;
  --
  PROCEDURE pr_set_chg_cpw (pi_k VARCHAR2, pi_uk VARCHAR2) IS
  BEGIN
    --
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      IF pi_uk > 20 THEN
        pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
        UPDATE t_99_10_ssu SET
          cng_pw_yn = 1
        WHERE r_k = pi_uk;
        pkwf_99_trg.pr_reset_sdml;
      END IF;
      --
    END IF;
    --
  END pr_set_chg_cpw;
  --  
  FUNCTION fn_req_pw_chng RETURN BOOLEAN IS
    v_b           PLS_INTEGER;
    v_usr_ky      NUMBER;
    CURSOR c_usr IS
    SELECT 0
    FROM t_99_10_ssu
    WHERE r_k = v_usr_ky
    AND   r_s = 1 
    AND   cng_pw_yn = 0
    AND   sta_dm = 'N';
  BEGIN
    v_b := 1;
    pr_load_gvs;
    v_usr_ky := pkwf_99_glb.fn_usr_key (gv_k);
    IF v_usr_ky > 0 THEN
      IF v_usr_ky <= 20 THEN -- Reserved
        v_b := 0;
      ELSE
        OPEN c_usr;
        FETCH c_usr INTO v_b;
        CLOSE c_usr;
      END IF;
    END IF;
    IF v_b = 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  END fn_req_pw_chng;
  --   
  PROCEDURE pr_upw_upd (pi_k IN VARCHAR2, pi_uk IN NUMBER, pi_un IN VARCHAR2, pi_up IN VARCHAR2) IS
    v_hsh          t_99_10_pwu.pw_hsh%TYPE;
    v_usr_ky       NUMBER; 
  BEGIN
    --
    pr_load_gvs;
    --
    IF pi_uk > 0 AND pi_un IS NOT NULL AND pi_up IS NOT NULL THEN
      --
      IF pi_uk BETWEEN 1 AND 20 THEN
        IF NOT pkwf_99_ssi.fn_is_ssi_lgn_usr (gv_k) THEN
          pkwf_99_err.pr_raise (pi_id => '990099'); -- Only INTERNAL Users allowed 
        END IF;    
      END IF;
      --            
      v_usr_ky := fn_pwd_usr_ky (pi_uk);
      v_hsh := fn_get_hsh (pi_nme => pi_un, pi_pwd => pi_up);
      --
      -- Store Current Passord in History
      pkwf_99_trg.pr_set_sdml (pi_k => gv_k);
      INSERT INTO t_99_10_pwh (i_tm, s_ky, pw_hsh)
      SELECT a.i_tm, a.s_ky, a.pw_hsh
      FROM t_99_10_pwu a
      WHERE a.s_ky = v_usr_ky;
      --
      -- Replace Current Password 
      pkwf_99_trg.pr_set_sdml (pi_k => gv_k);    
      UPDATE t_99_10_pwu SET 
        pw_hsh = v_hsh
      WHERE s_ky = v_usr_ky;
      IF SQL%NOTFOUND THEN
        pkwf_99_trg.pr_set_sdml (pi_k => gv_k); 
        INSERT INTO t_99_10_pwu (s_ky, pw_hsh) 
        VALUES (v_usr_ky, v_hsh);
      END IF;
      pkwf_99_trg.pr_reset_sdml;
      --
    ELSE
      pkwf_99_err.pr_raise (pi_id => '990099');
    END IF;
    --    
  END pr_upw_upd;
  --  
  --  
  FUNCTION fn_is_exp (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN BOOLEAN IS
    v_expired BOOLEAN := TRUE;
    vu        t_99_10_ssu%ROWTYPE;
    vd        NUMBER;
    CURSOR cur_usr IS
    SELECT *
    FROM t_99_10_ssu
    WHERE r_k = pi_uk
    AND r_s = 1
    AND sta_dm <> 'D';
  BEGIN
    pr_load_gvs;
    IF pi_uk > 0 THEN
      IF pi_uk <= 20 OR pi_uk = gv_setup_key THEN
        v_expired := FALSE;
      ELSE
        vu := NULL;
        OPEN cur_usr;
        FETCH cur_usr INTO vu;
        CLOSE cur_usr;
        IF vu.r_k = pi_uk THEN
          IF vu.lst_pw_dt IS NULL THEN
            NULL; -- Password has never been changed
          ELSE
            vu.lst_lgn_dt := SYSDATE; --pk99$$00.fn_sys_tmstz; -- Today's Date
            vd := CAST(vu.lst_lgn_dt AS DATE) - CAST(vu.lst_pw_dt AS DATE); -- Days Difference 
            vd := CEIL(vd);
            IF vd <= 3 THEN -- reasonable assumption
              v_expired := FALSE;
            ELSE
              pr_get_pwd_rules (pi_usr_dm => vu.usr_dm);
              IF vd <= gr_pwr.pl_d THEN
                v_expired := FALSE;
              END IF;
            END IF;
          END IF;
        END IF;
      END IF;    
    END IF;
    RETURN v_expired;
  END fn_is_exp;
  --
  FUNCTION fn_exp_dys (pi_k IN VARCHAR2, pi_uk IN NUMBER) RETURN NUMBER IS
    vu        t_99_10_ssu%ROWTYPE;
    vd        NUMBER := 0;
    CURSOR cur_usr IS
    SELECT *
    FROM t_99_10_ssu
    WHERE r_k = pi_uk
    AND r_s = 1
    AND sta_dm <> 'D';
  BEGIN
    pr_load_gvs;
    IF pi_uk > 0 THEN
      IF pi_uk <= 20 OR pi_uk = gv_setup_key THEN
        vd := 999;
      ELSE
        vu := NULL;
        OPEN cur_usr;
        FETCH cur_usr INTO vu;
        CLOSE cur_usr;
        IF vu.r_k = pi_uk THEN
          IF vu.lst_pw_dt IS NULL THEN
            NULL; -- Password has never been changed
          ELSE
            vu.lst_lgn_dt := SYSDATE; --pk99$$00.fn_sys_tmstz; -- Today's Date
            vd := CAST(vu.lst_lgn_dt AS DATE) - CAST(vu.lst_pw_dt AS DATE); -- Days Difference 
            vd := CEIL(NVL(vd,9999));
            pr_get_pwd_rules (pi_usr_dm => vu.usr_dm);
            IF vd > NVL(gr_pwr.pl_d,0) THEN
              vd := 0;
            ELSE 
              vd := gr_pwr.pl_d - vd + 1;
              IF vd < 0 THEN
                vd := 0;
              END IF;
            END IF;
          END IF;
        END IF;
      END IF;    
    END IF;
    RETURN vd;
  END fn_exp_dys;
  --  
END pkwf_99_pwm;
/

