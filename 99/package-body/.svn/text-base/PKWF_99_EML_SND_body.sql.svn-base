CREATE OR REPLACE PACKAGE BODY pkwf_99_eml_snd AS
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 27-DEC-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Email Message Sending 
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
  ** Copyright:  ProGenics Corp. Ltd, 2012
  **
  */
  --
  /* Package Vairables  */
  --
  gv_k              VARCHAR2(100);
  --
  --
  pv_eml_yn         BOOLEAN;        -- Send Email ?
  pv_eml_raise      BOOLEAN;        -- Raise Error ?
  pv_smtp_auth      BOOLEAN;        -- SMTP Authetication
  pv_smtp_domain    VARCHAR2(500);  -- SMTP Domain
  pv_smtp_host_ip   VARCHAR2(500);  -- SMTP Server IP
  pv_smtp_host_port VARCHAR2(500);  -- SMTP Server Port: DEFAULT 25
  pv_smtp_tout      NUMBER;         -- SMTP Server Timeout in seconds
  pv_smtp_usr       VARCHAR2(500);  -- SMTP Authentication Username
  pv_smtp_pwd       VARCHAR2(500);  -- SMTP Authentication Password
  pv_sndr_nme       VARCHAR2(500);  -- Email Sender Name
  pv_sndr_eml       VARCHAR2(500);  -- Email Sender Address
  pv_all_to_test    BOOLEAN;        -- Send ALL mails to test recipient ?
  pv_test_eml       VARCHAR2(500);  -- Email Test Recipient Address
  pv_img_url        VARCHAR2(500);  -- Email Link - Images Directory URL 
  pv_apx_url        VARCHAR2(500);  -- Email Link - APEX Application URL    
  pv_lnk_apx        BOOLEAN := FALSE;
  pv_lnk_img        BOOLEAN := FALSE;  
  --
  pv_eml_hdr        VARCHAR2(4000);   -- Email Header Text
  pv_eml_ftr        VARCHAR2(4000);   -- Email Footer Text
  pv_eml_to         VARCHAR2(32000);  -- Email Recipient(s)
  pv_eml_cc         VARCHAR2(32000);  -- Email Copy recipient(s)
  pv_eml_bcc        VARCHAR2(32000);  -- Email Blind Copy recipient(s)
  pv_eml_prty       VARCHAR2(100) := 'HIGH'; -- Mail Queue Priority
  --
  pv_err_msg        VARCHAR2(2000);
  --
  --
  /* Private Routines */
  --
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
  -- Set default SMTP Parameters
  PROCEDURE pr_set_smtp_params IS
    v_dflt_ip         VARCHAR2(100) := '127.0.0.1';
    v_dflt_port       VARCHAR2(100) := '25';
    v_dflt_tout       NUMBER        := 60;
    v_dflt_sndr_nme   VARCHAR2(100) := 'Symbols Administrator';
    v_dflt_sndr_eml   VARCHAR2(200) := 'admin@'||v_dflt_ip;
  BEGIN
    --
    pv_eml_yn         := NVL(pkwf_99_eml_pmr.fn_eml_yn,FALSE);
    pv_eml_raise      := NVL(pkwf_99_eml_pmr.fn_eml_raise,FALSE);
    pv_smtp_auth      := NVL(pkwf_99_eml_pmr.fn_eml_smtp_auth,FALSE);
    pv_smtp_domain    := pkwf_99_eml_pmr.fn_eml_smtp_dm;
    pv_smtp_host_ip   := NVL(pkwf_99_eml_pmr.fn_eml_smtp_ip,v_dflt_ip);
    pv_smtp_host_port := NVL(pkwf_99_eml_pmr.fn_eml_smtp_prt,v_dflt_port);
    pv_smtp_tout      := NVL(pkwf_99_eml_pmr.fn_eml_smtp_tout,v_dflt_tout);
    pv_smtp_usr       := pkwf_99_eml_pmr.fn_eml_smtp_usr;
    pv_smtp_pwd       := pkwf_99_eml_pmr.fn_eml_smtp_pwd;
    pv_sndr_nme       := NVL(pkwf_99_eml_pmr.fn_eml_sndr_nme,v_dflt_sndr_nme);
    pv_sndr_eml       := NVL(pkwf_99_eml_pmr.fn_eml_sndr_eml,v_dflt_sndr_eml);
    pv_eml_hdr        := pkwf_99_eml_pmr.fn_eml_hdr_txt;
    pv_all_to_test    := NVL(pkwf_99_eml_pmr.fn_eml_all_to_test,FALSE);
    pv_test_eml       := NVL(pkwf_99_eml_pmr.fn_eml_test_rcp,v_dflt_sndr_eml);
    pv_eml_ftr        := pkwf_99_eml_pmr.fn_eml_ftr_txt;
    pv_eml_bcc        := NULL;
    pv_eml_cc         := NULL;
    --    
  END pr_set_smtp_params;
  --
  FUNCTION fn_que_msg ( pi_k         VARCHAR2,
                        pi_msg_sbj   VARCHAR2, 
                        pi_rcp_key   NUMBER DEFAULT NULL, 
                        pi_rcp_adr   VARCHAR2, 
                        pi_sndr_adr  VARCHAR2 DEFAULT NULL,
                        pi_msg_bdy   CLOB,
                        pi_src_app   VARCHAR2 DEFAULT NULL,
                        pi_src_ref   VARCHAR2 DEFAULT NULL,
                        pi_src_key   NUMBER DEFAULT NULL,
                        pi_att_yn    NUMBER DEFAULT 0) RETURN NUMBER IS
    --
    v_send      BOOLEAN;
    vr          t_99_20_msg%ROWTYPE;
    --
  BEGIN
    --
    pr_set_smtp_params;
    pr_load_gvs;
    --
    vr := NULL;
    v_send := FALSE;
    --
    IF pv_eml_yn THEN
      -- 
      vr.sndr_adr := SUBSTR(pi_sndr_adr,1,250);
      IF vr.sndr_adr IS NULL THEN
        vr.sndr_adr := pv_sndr_eml;
      END IF;
      --
      vr.msg_sbj := pi_msg_sbj;
      IF vr.msg_sbj IS NULL THEN
        vr.msg_sbj := '-';
      END IF;
      --  
      v_send := TRUE;
      --      
      IF pv_all_to_test THEN
        vr.rcp_adr := pv_test_eml;
      ELSE
        vr.rcp_adr := pi_rcp_adr;     
      END IF;
      --
      IF vr.rcp_adr IS NULL THEN
        IF pv_eml_raise THEN
          pkwf_99_vld.pr_reqd (pi_d => vr.rcp_adr, pi_dsc  => 'Recipient Email Address');
        END IF;
        v_send := FALSE;
      END IF;
      --  
      vr.msg_bdy := pi_msg_bdy;
      IF vr.msg_bdy IS NULL THEN
        IF pv_eml_raise THEN
          pkwf_99_vld.pr_reqd (pi_d => vr.msg_bdy, pi_dsc  => 'Email Message Details');
        END IF;
        v_send := FALSE;
      END IF;
      --       
      IF v_send THEN
        --
        IF pi_rcp_key > 0 THEN
          vr.rcp_ky := pi_rcp_key;
        END IF;
        --
        IF pi_src_key > 0 THEN
          vr.sce_ky := pi_src_key;
        END IF;
        --        
        IF pi_src_app IS NOT NULL THEN
          vr.sce_mdl := SUBSTR(UPPER(pi_src_app),1,10);
        END IF;
        --
        IF pi_src_ref IS NOT NULL THEN
          vr.sce_ref := SUBSTR(pi_src_ref,1,100);
        END IF;
        --        
        BEGIN          
          --
          vr.r_k          := pkwf_99_glb.fn_get_au_rk (pi_k => gv_k);
          vr.que_tm       := pkwf_99_dtm.fn_sys_tmm;
          vr.prc_stat_dm  := 'U';
          vr.att_yn       := pi_att_yn;
          --
          pkwf_99_trg.pr_set_sdml (gv_k);    
          INSERT INTO t_99_20_msg VALUES vr;
          pkwf_99_trg.pr_reset_sdml;  
          --          
        EXCEPTION
          WHEN OTHERS THEN
            vr := NULL;
            IF pv_eml_raise THEN
              pkwf_99_err.pr_raise_t (pi_txt => SQLERRM);
            END IF;
        END;
        --
      END IF;
      --
    END IF;
    --
    RETURN vr.r_k;
    --
  END fn_que_msg;
  --    
  -- 
  /* Public Routines */
  --
  -- Queue Message for Sending
  FUNCTION fn_send_msg (pi_k         VARCHAR2,
                        pi_msg_sbj   VARCHAR2, 
                        pi_rcp_key   NUMBER DEFAULT NULL, 
                        pi_rcp_adr   VARCHAR2, 
                        pi_sndr_adr  VARCHAR2 DEFAULT NULL,
                        pi_msg_bdy   CLOB,
                        pi_src_app   VARCHAR2 DEFAULT NULL,
                        pi_src_ref   VARCHAR2 DEFAULT NULL,
                        pi_src_key   NUMBER DEFAULT NULL) RETURN NUMBER IS
    v_key  NUMBER;
  BEGIN
    v_key := fn_que_msg ( pi_k         => pi_k,
                          pi_msg_sbj   => pi_msg_sbj, 
                          pi_rcp_key   => pi_rcp_key, 
                          pi_rcp_adr   => pi_rcp_adr, 
                          pi_sndr_adr  => pi_sndr_adr,
                          pi_msg_bdy   => pi_msg_bdy,
                          pi_src_app   => pi_src_app,
                          pi_src_ref   => pi_src_ref,
                          pi_src_key   => pi_src_key,
                          pi_att_yn    => 0);    
    RETURN v_key;
  END fn_send_msg;
  --  
  PROCEDURE pr_send_msg (pi_k         VARCHAR2,
                         pi_msg_sbj   VARCHAR2, 
                         pi_rcp_key   NUMBER, 
                         pi_rcp_adr   VARCHAR2, 
                         pi_sndr_adr  VARCHAR2 DEFAULT NULL,
                         pi_msg_bdy   CLOB) IS
    v_key  NUMBER;
  BEGIN
    v_key := fn_que_msg (pi_k         => pi_k,
                         pi_msg_sbj   => pi_msg_sbj, 
                         pi_rcp_key   => pi_rcp_key, 
                         pi_rcp_adr   => pi_rcp_adr, 
                         pi_sndr_adr  => pi_sndr_adr,
                         pi_msg_bdy   => pi_msg_bdy,
                         pi_att_yn    => 0);
  END pr_send_msg;
  --
  PROCEDURE pr_send_msg1 (pi_k         VARCHAR2,                         
                          pi_msg_sbj   VARCHAR2, 
                          pi_rcp_adr   VARCHAR2, 
                          pi_msg_bdy   CLOB,
                          pi_sndr_adr  VARCHAR2 DEFAULT NULL,                           
                          pi_src_app   VARCHAR2 DEFAULT NULL,
                          pi_src_ref   VARCHAR2 DEFAULT NULL,
                          pi_src_key   NUMBER DEFAULT NULL,
                          pi_send_now  VARCHAR2 DEFAULT '0') IS
    v_key  NUMBER;
  BEGIN
    v_key := fn_que_msg (pi_k         => pi_k,
                          pi_msg_sbj   => pi_msg_sbj, 
                          pi_rcp_key   => NULL, 
                          pi_rcp_adr   => pi_rcp_adr, 
                          pi_sndr_adr  => pi_sndr_adr,
                          pi_msg_bdy   => pi_msg_bdy,
                          pi_src_app   => pi_src_app,
                          pi_src_ref   => pi_src_ref,
                          pi_src_key   => pi_src_key,
                          pi_att_yn    => 0);
    IF v_key > 0 AND pi_send_now = '1' THEN
      pr_prc_msg (pi_k => gv_k, pi_msg_ky => v_key);
    END IF;    
  END pr_send_msg1;
  --
  PROCEDURE pr_send_msg2 (pi_k         VARCHAR2,                         
                          pi_msg_sbj   VARCHAR2, 
                          pi_rcp_adr   VARCHAR2, 
                          pi_msg_bdy   CLOB,                        
                          pi_src_app   VARCHAR2 DEFAULT NULL,
                          pi_src_ref   VARCHAR2 DEFAULT NULL,
                          pi_src_key   NUMBER DEFAULT NULL,
                          pi_send_now  VARCHAR2 DEFAULT '0') IS
    v_key  NUMBER;
  BEGIN
    v_key := fn_que_msg (pi_k         => pi_k,
                          pi_msg_sbj   => pi_msg_sbj, 
                          pi_rcp_key   => NULL, 
                          pi_rcp_adr   => pi_rcp_adr, 
                          pi_sndr_adr  => NULL,
                          pi_msg_bdy   => pi_msg_bdy,
                          pi_src_app   => pi_src_app,
                          pi_src_ref   => pi_src_ref,
                          pi_src_key   => pi_src_key,
                          pi_att_yn    => 0);
    IF v_key > 0 AND pi_send_now = '1' THEN
      pr_prc_msg (pi_k => gv_k, pi_msg_ky => v_key);
    END IF;                           
  END pr_send_msg2;
  --    
  -- Process Message Queue
  PROCEDURE pr_prc_msg (pi_k VARCHAR2, pi_msg_ky NUMBER DEFAULT NULL) IS
    --
    v_lob_len         PLS_INTEGER := 0;
    v_lob_pos         PLS_INTEGER := 1;
    v_read_bytes      PLS_INTEGER;
    v_cr              VARCHAR2(1) := CHR(13); -- Carriage Return 
    v_lf              VARCHAR2(1) := CHR(10); -- Line Feed
    v_lf_pos          PLS_INTEGER;
    v_text            VARCHAR2(32767); 
    v_adr             VARCHAR2(1000);
    v_sep             VARCHAR2(2) := ',';
    v_snd_cnt         PLS_INTEGER := 0;
    va                t_99_20_msg_att%ROWTYPE;
    v_bool            BOOLEAN;
    --
    v_arr             APEX_APPLICATION_GLOBAL.VC_ARR2; 
    --
    CURSOR c_msg IS
      SELECT r_k msg_ky, msg_sbj, msg_bdy, rcp_adr, att_yn,
             sce_mdl, sce_ref
      FROM   t_99_20_msg
      WHERE  prc_stat_dm IN ('U','F')
      AND    NVL(pi_msg_ky,r_k) = r_k
      AND    rcp_adr IS NOT NULL
      FOR UPDATE OF prc_stat_dm, prc_tm, prc_cnt, prc_msg;
    --
    CURSOR c_att (pii_msg_ky NUMBER) IS
    SELECT *
    FROM t_99_20_msg_att
    WHERE msg_ky = pii_msg_ky;
    --
  BEGIN
    --
    pr_set_smtp_params;
    pr_load_gvs;
    v_arr.DELETE;
    va := NULL;
    --
    IF pv_eml_yn THEN
      --    
      pkwf_99_eml_itf.set_smtp_server_params(
        p_host      =>  pv_smtp_host_ip,
        p_port      =>  pv_smtp_host_port,
        p_auth      =>  pv_smtp_auth,
        p_usr       =>  pv_smtp_usr,
        p_pwd       =>  pv_smtp_pwd,
        p_raise_err => pv_eml_raise);  
      --
      FOR cr IN c_msg LOOP
        --
        BEGIN
          --
          v_text    := NULL; 
          pv_eml_to := NULL;
          v_snd_cnt := 0;
          --
          -- Handles multiple Recipients
          v_arr := APEX_UTIL.STRING_TO_TABLE(cr.rcp_adr,v_sep);
          FOR i IN 1..v_arr.COUNT LOOP     
            v_adr := v_arr(i);            
            IF v_adr IS NOT NULL THEN  
              IF pv_eml_to IS NULL THEN
                pv_eml_to := v_adr;
              ELSE
                pv_eml_to := pv_eml_to||', '||v_adr;
              END IF;
              v_snd_cnt := v_snd_cnt + 1;
            END IF;
          END LOOP;
          --
          IF v_snd_cnt > 0 THEN
            --
            va := NULL;
            --
            IF cr.att_yn = 1 THEN
              OPEN c_att (cr.msg_ky);
              FETCH c_att INTO va;
              CLOSE c_att;
              IF va.msg_ky = cr.msg_ky AND va.mim_tp IS NOT NULL AND va.fil_nme IS NOT NULL THEN
                NULL; -- valid attachment
              ELSE
                va := NULL;
              END IF;
            END IF;
            --
            IF va.msg_ky = cr.msg_ky THEN
              IF va.inl_yn = 1 THEN
                v_bool := TRUE;
              ELSE
                v_bool := FALSE;
              END IF;
              pkwf_99_eml_itf.send_attach_blob (
                p_sender        => pv_sndr_eml,
                p_recipients    => pv_eml_to,
                p_subject       => cr.msg_sbj,
                p_message       => cr.msg_bdy,
                p_mime_type     => 'text/html',
                p_attachment    => va.blb_ctt,
                p_att_inline    => v_bool,
                p_att_mime_type => va.mim_tp,
                p_att_filename  => va.fil_nme);                         
            ELSE
              pkwf_99_eml_itf.send (
                p_sender        => pv_sndr_eml,
                p_recipients    => pv_eml_to,
                p_subject       => cr.msg_sbj,
                p_message       => cr.msg_bdy,
                p_mime_type     => 'text/html');
            END IF;
            --
            pkwf_99_trg.pr_set_sdml (gv_k);    
            UPDATE t_99_20_msg
            SET    prc_stat_dm = 'S',
                   prc_tm      = pkwf_99_dtm.fn_sys_tmm,
                   prc_cnt     = v_snd_cnt,
                   prc_msg     = 'Sent'
            WHERE CURRENT OF c_msg;   
            pkwf_99_trg.pr_reset_sdml; 
            --
          ELSE
            --
            pkwf_99_trg.pr_set_sdml (gv_k);    
            UPDATE t_99_20_msg
            SET    prc_stat_dm = 'F',
                   prc_tm      = pkwf_99_dtm.fn_sys_tmm,
                   prc_cnt     = NVL(prc_cnt,0) + 1,
                   prc_msg     = v_text
            WHERE CURRENT OF c_msg;
            pkwf_99_trg.pr_reset_sdml; 
            --
          END IF;
          --
        EXCEPTION
          WHEN OTHERS THEN
            v_text := SUBSTR(SQLERRM,1,4000);
            IF v_text IS NULL THEN
              v_text := SUBSTR(dbms_utility.format_error_backtrace,1,4000);
            END IF;
            pkwf_99_trg.pr_set_sdml (gv_k);    
            UPDATE t_99_20_msg
            SET    prc_stat_dm = 'F',
                   prc_tm      = pkwf_99_dtm.fn_sys_tmm,
                   prc_cnt     = NVL(prc_cnt,0) + 1,
                   prc_msg     = v_text
            WHERE CURRENT OF c_msg;
            pkwf_99_trg.pr_reset_sdml; 
            --
            IF pi_msg_ky > 0 AND cr.sce_mdl = '99' AND cr.sce_ref = 'TEST-MAIL' THEN
              commit;     
              pkwf_99_err.pr_raise_t(pi_txt => v_text);
            END IF;
            --
        END;
      END LOOP;
      --
    END IF;
    --
    v_arr.DELETE;
    --
  END pr_prc_msg;
  --
  PROCEDURE pr_del_msg (pi_k VARCHAR2, pi_msg_ky NUMBER DEFAULT NULL) IS
  BEGIN
    --
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      IF pi_msg_ky > 0 THEN
        pkwf_99_trg.pr_set_sdml (gv_k); 
        DELETE FROM t_99_20_msg
        WHERE  r_k = pi_msg_ky
        AND    prc_stat_dm <> 'S';
        pkwf_99_trg.pr_reset_sdml;       
      ELSE
        pkwf_99_trg.pr_set_sdml (gv_k); 
        DELETE FROM t_99_20_msg
        WHERE  prc_stat_dm <> 'S';
        pkwf_99_trg.pr_reset_sdml; 
      END IF;
      --
    END IF;
    --
  END pr_del_msg;
  --  
  PROCEDURE pr_clr_snt (pi_k VARCHAR2) IS
  BEGIN
    --
    pr_load_gvs;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      pkwf_99_trg.pr_set_sdml (gv_k); 
      DELETE FROM t_99_20_msg
      WHERE  prc_stat_dm = 'S'
      AND    ((CAST(prc_tm AS DATE)+730) < SYSDATE); -- keep for at least 2 years
      pkwf_99_trg.pr_reset_sdml; 
    END IF;
    --
  END pr_clr_snt;
  --
  FUNCTION fn_snt (pi_k VARCHAR2, pi_msg_ky NUMBER) RETURN BOOLEAN IS
    v_yn  PLS_INTEGER;
  BEGIN
    --
    pr_load_gvs;
    v_yn := 0;
    --
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      BEGIN
        SELECT 1
        INTO v_yn
        FROM t_99_20_msg
        WHERE r_k = pi_msg_ky
        AND   prc_stat_dm = 'S';
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          NULL;
        WHEN TOO_MANY_ROWS THEN
          v_yn := 1;
      END;
    END IF;
    --
    IF v_yn = 1 THEN
      RETURN TRUE;
     ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_snt;
  --  
  FUNCTION fn_tmm (pi_d IN "TIMESTAMP WITH TIME ZONE") RETURN VARCHAR2 IS
  BEGIN
    IF pi_d IS NOT NULL THEN
      RETURN TO_CHAR(pi_d,'DD-MON-YY HH24:MI:SS AM');
      -- RETURN TO_CHAR(pi_d,'DD-MON-YY HH24:MI:SS AM (TZR)');
    ELSE
      RETURN NULL;
    END IF;
  END fn_tmm;
  --   
  PROCEDURE pr_send_msg_att ( pi_k              IN VARCHAR2,                         
                              pi_msg_sbj        IN VARCHAR2, 
                              pi_rcp_adr        IN VARCHAR2, 
                              pi_msg_bdy        IN CLOB,
                              pi_att_blb        IN BLOB,
                              pi_att_filename   IN VARCHAR2,                                 
                              pi_att_inline_yn  IN VARCHAR2 DEFAULT '1',
                              pi_att_mime_type  IN VARCHAR2 DEFAULT 'application/octet-stream',                           
                              pi_sndr_adr       IN VARCHAR2 DEFAULT NULL,                           
                              pi_src_app        IN VARCHAR2 DEFAULT NULL,
                              pi_src_ref        IN VARCHAR2 DEFAULT NULL,
                              pi_src_key        IN NUMBER DEFAULT NULL,
                              pi_send_now       IN VARCHAR2 DEFAULT '0') IS
    va     t_99_20_msg_att%ROWTYPE;
    vbdy   CLOB := pi_msg_bdy;
  BEGIN
    va := NULL;
    va.msg_ky := fn_que_msg ( pi_k         => pi_k,
                              pi_msg_sbj   => pi_msg_sbj, 
                              pi_rcp_key   => NULL, 
                              pi_rcp_adr   => pi_rcp_adr, 
                              pi_sndr_adr  => pi_sndr_adr,
                              pi_msg_bdy   => vbdy,
                              pi_src_app   => pi_src_app,
                              pi_src_ref   => pi_src_ref,
                              pi_src_key   => pi_src_key,
                              pi_att_yn    => 1);
    --
    IF va.msg_ky > 0 THEN
      --
      va.mim_tp := pi_att_mime_type;
      va.fil_nme := pi_att_filename;
      va.blb_ctt := pi_att_blb;
      IF pi_att_inline_yn = '1' THEN
        va.inl_yn := 1;
      ELSE
        va.inl_yn := 0;
      END IF;
      va.r_k := pkwf_99_glb.fn_get_au_rk (pi_k => gv_k);
      --
      pkwf_99_trg.pr_set_sdml (gv_k); 
      INSERT INTO t_99_20_msg_att VALUES va;
      pkwf_99_trg.pr_reset_sdml;
      --
      IF pi_send_now = '1' THEN
        pr_prc_msg (pi_k => gv_k, pi_msg_ky => va.msg_ky);
      END IF;  
      --
    END IF;      
    --
  END pr_send_msg_att;
  --  
  PROCEDURE pr_prc_que IS
  BEGIN
    pr_load_gvs;
    pr_prc_msg (pi_k => gv_k, pi_msg_ky => NULL);
    commit;     
  END pr_prc_que;
  --
END pkwf_99_eml_snd; 
/
  
  
  