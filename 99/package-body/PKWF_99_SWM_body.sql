CREATE OR REPLACE PACKAGE BODY pkwf_99_swm AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: System Wallet Management
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
  gc_key    RAW(32) := SYS.UTL_I18N.STRING_TO_RAW('Qx[Rz[~9{_+1768*$H2pL}Z35kIs0^E-');
  --
  gv_k            VARCHAR2(100);
  gv_sep          VARCHAR2(5) := chr(27); -- '~'; 
  --
  v_is_valid_session  BOOLEAN;
  --
  /* Private Routines */
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
  END pr_load_gvs;
  --  
  FUNCTION fn_get_hshr (pi_p1 IN VARCHAR2, pi_p2 IN VARCHAR2) RETURN RAW IS
    vtxt  VARCHAR2(500);
  BEGIN
    vtxt := 'a'||pi_p2||'x0y'||pi_p1||'Z';
    RETURN SYS.DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(vtxt, 'AL32UTF8'),SYS.DBMS_CRYPTO.HASH_SH1);
  END fn_get_hshr;
  --  
  FUNCTION fn_get_hshc (pi_p1 IN VARCHAR2, pi_p2 IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN RAWTOHEX(fn_get_hshr (pi_p1 => pi_p1, pi_p2 => pi_p2));
  END fn_get_hshc;
  --    
  FUNCTION fn_src_ky (pi_src_k NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (pi_src_k*17)+349979693;
  END fn_src_ky;
  --
  FUNCTION fn_src_ref (pi_src_r VARCHAR2, pi_scr_k NUMBER) RETURN VARCHAR2 IS
    v_ref  VARCHAR(500);
    v_txt  VARCHAR2(500);
    v_len  PLS_INTEGER;
  BEGIN
    --
    pr_load_gvs;
    v_ref := UPPER(pi_src_r);
    v_len := LENGTH(v_ref);
    IF v_len > 30 THEN
      pkwf_99_err.pr_raise (pi_id => '990101',
                         pi_p1 => 'internal parameter data: ',
                         pi_p2 => 'it should not be longer than 30',
                         pi_p3 => 'characters'); 
    ELSIF v_len <= 5 THEN
      pkwf_99_err.pr_raise (pi_id => '990101',
                         pi_p1 => 'internal parameter ['||pi_src_r||']: ',
                         pi_p2 => 'it should be longer than 5',
                         pi_p3 => 'characters');                          
    END IF;
    --
    SELECT REVERSE(v_ref) INTO v_txt FROM DUAL;
    --
    RETURN fn_get_hshc (pi_p1 => v_txt, pi_p2 => pi_scr_k);
    --
  END fn_src_ref;
  --     
  FUNCTION fn_encr_src_data (pi_scr_k NUMBER, pi_d VARCHAR2) RETURN VARCHAR2 IS
    v_d  VARCHAR2(2000) := NULL;
  BEGIN
    pr_load_gvs;
    IF LENGTH(pi_d) > 250 THEN
      pkwf_99_err.pr_raise (pi_id => '990101',
                         pi_p1 => 'internal parameter data: ',
                         pi_p2 => 'it should not be longer than 250',
                         pi_p3 => 'characters');                         
    END IF;  
    v_d := pi_scr_k||gv_sep||pi_d;
    RETURN RAWTOHEX(pkwf_99_ncr.fn_encr_k (pi_k => gv_k, pi_d => v_d, pi_dk => gc_key));
  END fn_encr_src_data;
  --  
  FUNCTION fn_decr_src_data (pi_d VARCHAR2) RETURN VARCHAR2 IS
    v_d     VARCHAR2(32000) := NULL;
    v_pos   PLS_INTEGER := 0;
  BEGIN
    pr_load_gvs;
    v_d := pkwf_99_ncr.fn_decr_k (pi_k => gv_k, pi_d => HEXTORAW(pi_d), pi_dk => gc_key);
    IF v_d IS NOT NULL THEN
      v_pos := INSTR(v_d,gv_sep);
      IF v_pos > 0 THEN
        v_d := SUBSTR(v_d,v_pos+1);
      END IF;
    END IF;
    RETURN v_d;
  END fn_decr_src_data;
  --   
  --
  /* Public Routines */
  --
  --  
  PROCEDURE pr_mnt (pi_pk   IN VARCHAR2,
                    pi_sk   IN VARCHAR2,
                    pi_sr   IN VARCHAR2,
                    pi_sd   IN VARCHAR2,
                    pi_pg   IN VARCHAR2 DEFAULT '0') IS
    v_r  t_99_00_swk%ROWTYPE;   
    v_n  NUMBER := 0;    
  BEGIN
    pr_load_gvs;
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      v_r := NULL;
      BEGIN
        v_n := TO_NUMBER(pi_sk);
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
      IF v_n > 0 AND pi_sr IS NOT NULL AND pi_sd IS NOT NULL THEN
        --
        v_r.src_k := fn_src_ky (pi_src_k => v_n);
        v_r.src_r := fn_src_ref (pi_src_r => pi_sr, pi_scr_k => v_n);
        --
        pkwf_99_trg.pr_set_smnt (pi_k => gv_k);  
        DELETE FROM t_99_00_swk WHERE src_k = v_r.src_k AND src_r = v_r.src_r;
        --
        IF pi_pg <> '1' THEN
          v_r.src_d := fn_encr_src_data (pi_scr_k => v_n, pi_d => pi_sd);
          pkwf_99_trg.pr_set_smnt (pi_k => gv_k);  
          INSERT INTO t_99_00_swk VALUES v_r;
        END IF;
        --
        pkwf_99_trg.pr_reset_sdml;
        --
      END IF;
      -- 
    END IF;
  END pr_mnt;
  --  
  FUNCTION fn_datc (pi_pk   IN VARCHAR2,
                    pi_sk   IN VARCHAR2,
                    pi_sr   IN VARCHAR2) RETURN VARCHAR2 IS
    --                    
    v_r  t_99_00_swk%ROWTYPE;   
    v_d  VARCHAR2(32000) := NULL;
    v_n  NUMBER := 0;    
    --
    CURSOR cur_rec IS
    SELECT src_d
    FROM t_99_00_swk
    WHERE src_k = v_r.src_k 
    AND   src_r = v_r.src_r;
    --
  BEGIN
    pr_load_gvs;
    v_r := NULL;
    v_d := NULL;
    IF 1 = 1 THEN -- pi_k = gv_k THEN       
      BEGIN
        v_n := TO_NUMBER(pi_sk);
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
      IF v_n > 0 AND pi_sr IS NOT NULL THEN
        v_r.src_k := fn_src_ky (pi_src_k => v_n);
        v_r.src_r := fn_src_ref (pi_src_r => pi_sr, pi_scr_k => v_n);
        OPEN cur_rec;
        FETCH cur_rec INTO v_r.src_d;
        CLOSE cur_rec;
        IF v_r.src_d IS NOT NULL THEN
          v_d := fn_decr_src_data (pi_d => v_r.src_d);
        END IF;
      END IF;
      -- 
    END IF;
    RETURN v_d;
  END fn_datc;
  --    
END pkwf_99_swm;
/

