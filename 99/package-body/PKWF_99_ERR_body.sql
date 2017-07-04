CREATE OR REPLACE PACKAGE BODY pkwf_99_err AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 30-APR-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: Application Error Processing 
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
  ** Copyright:  ProGenics Corp. Ltd, 2009
  **
  */
  --
  gv_k          VARCHAR2(100);  -- Checks for validity of calling programs  
  --
  gv_errid_ss   VARCHAR2(30) := 'SSE_ID';
  gv_errdsc_ss  VARCHAR2(30) := 'SSE_DESC';  
  gv_err_msg    VARCHAR2(2000); -- Error Message set by PR_GEN_ERR_MSG
  gv_err_pgm    VARCHAR2(500); -- Program that generated Error
  --
  gv_usr_key    NUMBER;
  gv_lgn_key    NUMBER;
  gv_log_err    BOOLEAN;
  gv_usr_lang   VARCHAR2(30);
  gv_err_ref    VARCHAR2(30);
  --
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
  -- Generate error reference
  PROCEDURE pr_set_err_ref IS
  BEGIN
    pr_load_gvs;
    gv_err_ref := pkwf_99_ncr.fn_rans (pi_k => gv_k, pi_len => 7, pi_opt => 'U');
  END pr_set_err_ref;
  --  
  PROCEDURE pr_load_usr_gvs IS
  BEGIN
    pr_load_gvs;
    gv_log_err := FALSE; 
  END pr_load_usr_gvs;
  --    
  FUNCTION fn_who_called_me RETURN VARCHAR2 IS
    --                              
    v_owner         VARCHAR2(100);
    v_name          VARCHAR2(100);
    v_lineno        NUMBER;
    v_type          VARCHAR2(100);
    --
  BEGIN
    --
    OWA_UTIL.WHO_CALLED_ME ( owner      => v_owner,
                             NAME       => v_name,
                             lineno     => v_lineno,
                             caller_t   => v_type);
    --
    IF v_owner IS NOT NULL AND v_name IS NOT NULL THEN
      v_name := v_owner ||'.'||v_name;
    END IF;
    --
    IF v_name IS NOT NULL AND v_lineno > 0 THEN
      v_name := v_name||' : Line '||TO_CHAR(v_lineno);
    END IF;
    --
    RETURN UPPER(v_name);
    --
  END fn_who_called_me;  
  --          
  PROCEDURE pr_gen_err_msg ( pi_id IN VARCHAR2,
                             pi_lg IN VARCHAR2,
                             pi_p1 IN VARCHAR2 DEFAULT NULL,
                             pi_p2 IN VARCHAR2 DEFAULT NULL,
                             pi_p3 IN VARCHAR2 DEFAULT NULL,
                             pi_p4 IN VARCHAR2 DEFAULT NULL,
                             pi_p5 IN VARCHAR2 DEFAULT NULL,
                             pi_p6 IN VARCHAR2 DEFAULT NULL,
                             pi_p7 IN VARCHAR2 DEFAULT NULL,
                             pi_p8 IN VARCHAR2 DEFAULT NULL,
                             pi_p9 IN VARCHAR2 DEFAULT NULL) IS
    --
    v_cnt           PLS_INTEGER;
    v_dflt_msg      t_99_00_err.err_msg%TYPE;
    --
    CURSOR c_err_msg_lang IS
    SELECT A.err_msg, b.err_msg, A.plh_cnt
    FROM t_99_00_err A, t_99_00_errl b
    WHERE A.err_id = pi_id
    AND   b.r_p (+) = A.r_k
    AND   b.lgg_dm (+) = pi_lg;
    --    
    CURSOR c_err_msg IS
    SELECT A.err_msg, A.plh_cnt
    FROM t_99_00_err A
    WHERE A.err_id = pi_id;
    --    
  BEGIN
    --
    gv_err_msg := NULL;
    v_dflt_msg := NULL;
    v_cnt := 0;
    --
    IF pi_id IS NULL THEN
      gv_err_msg := 'Database Error: Error Procedure Requires Error ID';
    ELSE
      --
      IF pi_lg IS NOT NULL THEN
        --
        OPEN c_err_msg_lang;
        FETCH c_err_msg_lang INTO v_dflt_msg, gv_err_msg, v_cnt;
        CLOSE c_err_msg_lang;
        --
        IF gv_err_msg IS NULL THEN
          gv_err_msg := v_dflt_msg;
        END IF;
        --
      END IF;
      --
      IF gv_err_msg IS NULL THEN
        OPEN c_err_msg;
        FETCH c_err_msg INTO gv_err_msg, v_cnt;
        CLOSE c_err_msg;
      END IF;
      --      
      IF gv_err_msg IS NOT NULL THEN
        -- Colon is a special character in ORACLE APEX 
        gv_err_msg := REPLACE (gv_err_msg, ':', '~');
        --
        --
        IF v_cnt > 0 THEN
          --
          gv_err_msg := REPLACE (gv_err_msg, '%p1%', pi_p1);
          gv_err_msg := REPLACE (gv_err_msg, '%p2%', pi_p2);
          gv_err_msg := REPLACE (gv_err_msg, '%p3%', pi_p3);
          gv_err_msg := REPLACE (gv_err_msg, '%p4%', pi_p4);
          gv_err_msg := REPLACE (gv_err_msg, '%p5%', pi_p5);
          gv_err_msg := REPLACE (gv_err_msg, '%p6%', pi_p6);
          gv_err_msg := REPLACE (gv_err_msg, '%p7%', pi_p7);
          gv_err_msg := REPLACE (gv_err_msg, '%p8%', pi_p8);
          gv_err_msg := REPLACE (gv_err_msg, '%p9%', pi_p9);
          --
          gv_err_msg := LTRIM(gv_err_msg);
          --
        END IF;
        --
      ELSE
        gv_err_msg := 'Error Message not found [ '||pi_id||' ].';
      END IF;
      --
    END IF;
    --
  END pr_gen_err_msg;
  --
  PROCEDURE pr_log_err (pi_id VARCHAR2) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_tm  t_99_20_lge.i_tm%TYPE;
    v_k   NUMBER;
  BEGIN
    --
    v_tm := pkwf_99_dtm.fn_sys_tmm;
    v_k := pkwf_99_glb.fn_get_au_rk (gv_k);
    --
    pkwf_99_trg.pr_set_sdml (gv_k);
    INSERT INTO t_99_20_lge
    (r_k, lgn_ky, i_tm, err_id, 
     err_msg, pgm_nm)
    VALUES
    (v_k, gv_lgn_key, v_tm, pi_id, 
     SUBSTR(gv_err_msg,1,500), SUBSTR(gv_err_pgm,1,100));
     pkwf_99_trg.pr_reset_sdml;
    --
    gv_err_pgm := NULL;
    --
    COMMIT;
    --
  END pr_log_err;
  --
  --
  /* Public Routines */
  --    
  FUNCTION fn_log_apx_error (p_error IN apex_error.t_error) RETURN NUMBER IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_r       t_99_20_lae%ROWTYPE;
  BEGIN
    --
    v_r := NULL;
    --
    v_r.dsp_loc     := p_error.display_location;
    v_r.assoc_typ   := p_error.association_type;
    v_r.pg_itm_nm   := p_error.page_item_name;
    v_r.rgn_id      := p_error.region_id;
    v_r.col_alias   := p_error.column_alias;
    v_r.row_num     := p_error.row_num;
    v_r.apx_err_cd  := p_error.apex_error_code;
    v_r.ora_sqlcode := p_error.ora_sqlcode;
    v_r.cmpnt_typ   := p_error.component.TYPE;
    v_r.cmpnt_id    := p_error.component.ID;
    v_r.cmpnt_nm    := p_error.component.NAME;
    v_r.app_id      := v('APP_ID');
    v_r.app_page_id := v('APP_PAGE_ID');
    v_r.apl_usr     := v('APP_USER');
    v_r.bwsr_lang   := v('BROWSER_LANGUAGE');
    v_r.err_msg     := p_error.message;
    v_r.ora_sqlerrm := p_error.ora_sqlerrm;
    v_r.add_info    := p_error.additional_info;
    v_r.err_btrc    := p_error.error_backtrace;
    --
    IF p_error.is_internal_error THEN
      v_r.int_err_yn := 1;
    ELSE
      v_r.int_err_yn := 0;
    END IF;
    --
    pr_load_usr_gvs;
    v_r.lgn_ky      := gv_lgn_key;
    --
    v_r.ins_dtt     := SYSDATE;
    -- 
    SELECT S_99_RK.NEXTVAL INTO v_r.r_k FROM DUAL;
    --  
    pkwf_99_trg.pr_set_sdml (gv_k);
    INSERT INTO t_99_20_lae VALUES v_r;
    pkwf_99_trg.pr_reset_sdml;
    --
    COMMIT;
    --
    RETURN v_r.r_k;
    --
  END fn_log_apx_error;  
  --
  PROCEDURE pr_del_apx_log (pi_key IN NUMBER DEFAULT NULL, pi_all_yn IN VARCHAR2 DEFAULT '0') IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    pr_load_gvs;
    IF pi_key > 0 THEN
      pkwf_99_trg.pr_set_sdml (gv_k);
      DELETE FROM t_99_20_lae WHERE r_k = pi_key;
      pkwf_99_trg.pr_reset_sdml;
    ELSIF pi_all_yn = '1' THEN
      pkwf_99_trg.pr_set_sdml (gv_k);
      DELETE FROM t_99_20_lae;
      pkwf_99_trg.pr_reset_sdml;    
    END IF;
    COMMIT;
  END pr_del_apx_log;
  --
  -- Raises database application error
  PROCEDURE pr_raise ( pi_id IN VARCHAR2,
                       pi_pg IN VARCHAR2 DEFAULT NULL, 
                       pi_p1 IN VARCHAR2 DEFAULT NULL,
                       pi_p2 IN VARCHAR2 DEFAULT NULL,
                       pi_p3 IN VARCHAR2 DEFAULT NULL,
                       pi_p4 IN VARCHAR2 DEFAULT NULL,
                       pi_p5 IN VARCHAR2 DEFAULT NULL,
                       pi_p6 IN VARCHAR2 DEFAULT NULL,
                       pi_p7 IN VARCHAR2 DEFAULT NULL,
                       pi_p8 IN VARCHAR2 DEFAULT NULL,
                       pi_p9 IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    gv_err_pgm := NULL;
    gv_err_msg := NULL;
    gv_log_err := FALSE;    
    --        
    pr_load_usr_gvs;
    --
    IF gv_log_err THEN
      IF pi_pg IS NOT NULL THEN
        gv_err_pgm := pi_pg;
      ELSIF gv_err_pgm IS NULL THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
    END IF;
    --    
    pr_gen_err_msg ( pi_id => pi_id,
                     pi_lg => gv_usr_lang, -- Use the User's Default Language
                     pi_p1 => pi_p1,
                     pi_p2 => pi_p2,
                     pi_p3 => pi_p3,
                     pi_p4 => pi_p4,
                     pi_p5 => pi_p5,
                     pi_p6 => pi_p6,
                     pi_p7 => pi_p7,
                     pi_p8 => pi_p8,
                     pi_p9 => pi_p9);    
    --  
    gv_err_msg := '{'||pi_id||'} '||gv_err_msg;
    --    
    IF gv_log_err THEN
      pr_log_err (pi_id => pi_id);
      gv_err_pgm := NULL; 
    END IF;
    --
    pr_set (pi_k => gv_k, pi_id => pi_id, pi_dsc => gv_err_msg);
    --  
    -- apex_error.add_error(p_message => gv_err_msg,
    --                     p_display_location => apex_error.c_inline_in_notification) ;
    --                         
    logger.log(gv_err_msg, '99ERR1');
    logger.log_error(gv_err_msg, '99ERR1');
    RAISE_APPLICATION_ERROR (-20000, gv_err_msg);
    --
  END pr_raise;
  --
  -- Raise FRONT-END INTERFACE error. Does not log errors or reference Session States.
  PROCEDURE pr_raise_f ( pi_id IN VARCHAR2,
                         pi_lg IN VARCHAR2 DEFAULT NULL, -- Error Language
                         pi_p1 IN VARCHAR2 DEFAULT NULL,
                         pi_p2 IN VARCHAR2 DEFAULT NULL,
                         pi_p3 IN VARCHAR2 DEFAULT NULL,
                         pi_p4 IN VARCHAR2 DEFAULT NULL,
                         pi_p5 IN VARCHAR2 DEFAULT NULL,
                         pi_p6 IN VARCHAR2 DEFAULT NULL,
                         pi_p7 IN VARCHAR2 DEFAULT NULL,
                         pi_p8 IN VARCHAR2 DEFAULT NULL,
                         pi_p9 IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    gv_err_msg := NULL;
    --        
    pr_gen_err_msg ( pi_id => pi_id,
                     pi_lg => pi_lg, 
                     pi_p1 => pi_p1,
                     pi_p2 => pi_p2,
                     pi_p3 => pi_p3,
                     pi_p4 => pi_p4,
                     pi_p5 => pi_p5,
                     pi_p6 => pi_p6,
                     pi_p7 => pi_p7,
                     pi_p8 => pi_p8,
                     pi_p9 => pi_p9);    
    --  
    gv_err_msg := '{'||pi_id||'} '||gv_err_msg;
    --
    apex_error.add_error(p_message => gv_err_msg,
                         p_display_location => apex_error.c_inline_in_notification) ;  
    --                         
    logger.log(gv_err_msg, '99ERR2');
    logger.log_error(gv_err_msg, '99ERR2');
    RAISE_APPLICATION_ERROR (-20000, gv_err_msg);
    --
  END pr_raise_f;
  --  
  -- Reset Error Session States
  PROCEDURE pr_reset (pi_k  VARCHAR2) IS
  BEGIN
    -- pr_load_gvs;  
    -- IF pi_k = gv_k THEN
      apex_util.set_session_state(gv_errid_ss,NULL);  
      apex_util.set_session_state(gv_errdsc_ss,NULL); 
      gv_err_msg := NULL;
    -- END IF;
  END pr_reset;
  -- 
  -- Set Error Session States
  PROCEDURE pr_set (pi_k VARCHAR2, pi_id VARCHAR2, pi_dsc VARCHAR2) IS
  BEGIN
    pr_load_gvs;  
    IF pi_k = gv_k THEN
      apex_util.set_session_state(gv_errid_ss, pi_id);  
      apex_util.set_session_state(gv_errdsc_ss, pi_dsc); 
      gv_err_msg := pi_dsc;
    END IF;
  END pr_set;
  -- 
  -- Return Error Message
  FUNCTION fn_err_msg  ( pi_id IN VARCHAR2,
                         pi_lg IN VARCHAR2 DEFAULT NULL, -- Error Language
                         pi_p1 IN VARCHAR2 DEFAULT NULL,
                         pi_p2 IN VARCHAR2 DEFAULT NULL,
                         pi_p3 IN VARCHAR2 DEFAULT NULL,
                         pi_p4 IN VARCHAR2 DEFAULT NULL,
                         pi_p5 IN VARCHAR2 DEFAULT NULL,
                         pi_p6 IN VARCHAR2 DEFAULT NULL,
                         pi_p7 IN VARCHAR2 DEFAULT NULL,
                         pi_p8 IN VARCHAR2 DEFAULT NULL,
                         pi_p9 IN VARCHAR2 DEFAULT NULL) RETURN VARCHAR2 IS
  BEGIN
    --
    gv_err_msg := NULL;
    --        
    pr_gen_err_msg ( pi_id => pi_id,
                     pi_lg => pi_lg, 
                     pi_p1 => pi_p1,
                     pi_p2 => pi_p2,
                     pi_p3 => pi_p3,
                     pi_p4 => pi_p4,
                     pi_p5 => pi_p5,
                     pi_p6 => pi_p6,
                     pi_p7 => pi_p7,
                     pi_p8 => pi_p8,
                     pi_p9 => pi_p9);    
    --  
    RETURN gv_err_msg;
    --
  END fn_err_msg;
  --  
  -- Read Latest Error Message
  FUNCTION fn_lst_msg (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    IF pi_k = gv_k THEN
      RETURN gv_err_msg;
    ELSE
      RETURN NULL;
    END IF;
  END fn_lst_msg;
  --     
  -- Raise Error using Input text
  PROCEDURE pr_raise_t (pi_txt IN VARCHAR2) IS
  BEGIN
    gv_err_msg := pi_txt;
    apex_error.add_error(p_message => gv_err_msg,
                         p_display_location => apex_error.c_inline_in_notification) ;
    --
    logger.log(gv_err_msg, '99ERR3');
    logger.log_error(gv_err_msg, '99ERR3');
    RAISE_APPLICATION_ERROR (-20000, gv_err_msg);
    --
  END pr_raise_t;
  --
  FUNCTION fn_apex_error ( p_error IN apex_error.t_error ) RETURN apex_error.t_error_result IS
    v_result    apex_error.t_error_result;
    v_ref_no    NUMBER;
    v_cnstr_nm  VARCHAR2(255);
  BEGIN
    --
    v_result := apex_error.init_error_result (p_error => p_error );
    --
    IF p_error.is_internal_error THEN
      IF p_error.apex_error_code <> 'APEX.AUTHORIZATION.ACCESS_DENIED' THEN
          v_ref_no := fn_log_apx_error (p_error => p_error);
          v_result.message := 'An unexpected internal application error has occurred. '||
                              'Please inform the System Administrator and provide '||
                              'reference# '||to_char(v_ref_no, '999G999G999G990')||
                              ' for further investigation.';
          v_result.additional_info := NULL;
      END IF;
    ELSE
      --
      v_result.display_location := apex_error.c_inline_in_notification;
      --
      IF p_error.ora_sqlcode IN (-1, -2091, -2290, -2291, -2292) THEN
          v_cnstr_nm := apex_error.extract_constraint_name ( p_error => p_error );
          v_result.message := 'Data validation failed [CONSTRAINT: '||v_cnstr_nm||']';
      END IF;
      --
      IF p_error.ora_sqlcode IS NOT NULL AND v_result.message = p_error.message THEN
          v_result.message := apex_error.get_first_ora_error_text (p_error => p_error );
      END IF;
      --
      IF v_result.page_item_name IS NULL AND v_result.column_alias IS NULL THEN
          apex_error.auto_set_associated_item (
              p_error        => p_error,
              p_error_result => v_result );
      END IF;
    END IF;     
    RETURN v_result;
  END fn_apex_error;  
  --
END pkwf_99_err; 
/

