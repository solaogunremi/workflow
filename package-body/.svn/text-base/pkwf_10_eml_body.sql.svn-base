CREATE OR REPLACE   PACKAGE BODY pkwf_10_eml AS
  --
  /* Author : Aderemi Alabi, 02-MAY-2013
  **
  ** Purpose  : WB -  Email Processing Routines
  **
  ** Modification History :
  **
  ** Copyright :  ProGenics Corp. Ltd, 2013
  **
  */
  --
  --
  -- Package Variables
  pv_00_eml       wf_v_00_00_eml%ROWTYPE;  -- Email Config
  --
  /* Private Routines */
  -- 
  FUNCTION fn_init RETURN BOOLEAN IS 
    v_return BOOLEAN := TRUE;
    CURSOR c_00_eml IS
      SELECT * 
      FROM   wf_v_00_00_eml;
  BEGIN
    --
    OPEN  c_00_eml;
    FETCH c_00_eml INTO pv_00_eml;
    CLOSE c_00_eml;
    pv_00_eml.max_rtry_no := NVL(pv_00_eml.max_rtry_no,99);
    IF pv_00_eml.max_rtry_no < 1 THEN
      pv_00_eml.max_rtry_no := 99;
    END IF;    
    --
    IF TRIM(pv_00_eml.smtp_hst) IS NULL THEN 
      raise_application_error(-20055, 'SMTP Host Address has not been specified');
    ELSIF TRIM(pv_00_eml.smtp_prt) IS NULL THEN 
      raise_application_error(-20055, 'SMTP Port number has not been specified');
    ELSIF TRIM(pv_00_eml.frm_eml) IS NULL THEN 
      raise_application_error(-20055, 'Sender email addresss has not been specified');
    ELSIF TRIM(pv_00_eml.auth_act) IS NULL AND NVL(pv_00_eml.smtp_auth_yn, '0') = '1' THEN 
      raise_application_error(-20055, 'SMTP Authentication Account has not been specified');
    ELSIF TRIM(pv_00_eml.auth_pwd) IS NULL AND NVL(pv_00_eml.smtp_auth_yn, '0') = '1' THEN 
      raise_application_error(-20055, 'SMTP Authentication Password has not been specified');
    END IF;
    --
    RETURN v_return;
    --
  END fn_init;
  --
  FUNCTION fn_smtp_conn RETURN UTL_SMTP.CONNECTION IS
    v_conn   UTL_SMTP.CONNECTION;
  BEGIN
    IF NVL(pv_00_eml.tls_yn, '0') = '1' THEN
      v_conn := UTL_SMTP.OPEN_CONNECTION(host => pv_00_eml.smtp_hst,
                                         port => pv_00_eml.smtp_prt
                                         );--wallet_path => 'file:'||pv_00_eml.wlt_pth,
                                        -- wallet_password => pv_00_eml.wlt_pwd,
                                        -- secure_connection_before_smtp => FALSE);
      IF NVL(pv_00_eml.ehlo_yn, '0') = '1' THEN
        UTL_SMTP.EHLO(v_conn, pv_00_eml.smtp_hst);
      ELSE
        UTL_SMTP.HELO(v_conn, pv_00_eml.smtp_hst);
      END IF;
      --UTL_SMTP.STARTTLS(v_conn);
    ELSE  
      v_conn := UTL_SMTP.OPEN_CONNECTION(pv_00_eml.smtp_hst, pv_00_eml.smtp_prt, 60);
      IF NVL(pv_00_eml.ehlo_yn, '0') = '1' THEN
        UTL_SMTP.EHLO(v_conn, pv_00_eml.smtp_hst);
      ELSE
        UTL_SMTP.HELO(v_conn, pv_00_eml.smtp_hst);
      END IF;
    END IF;
    
    IF NVL(pv_00_eml.smtp_auth_yn, '0') = '1' THEN
      UTL_SMTP.COMMAND(v_conn, 'AUTH LOGIN');
      UTL_SMTP.COMMAND(v_conn, utl_raw.cast_to_varchar2( utl_encode.base64_encode( utl_raw.cast_to_raw( pv_00_eml.auth_act ))) );
      UTL_SMTP.COMMAND(v_conn, utl_raw.cast_to_varchar2( utl_encode.base64_encode( utl_raw.cast_to_raw( pv_00_eml.auth_pwd ))) );                 
    END IF;
    RETURN v_conn;
  EXCEPTION
    WHEN OTHERS THEN
      UTL_SMTP.QUIT(v_conn);
      raise_application_error(-20055, SQLERRM);        
  END fn_smtp_conn;
  --
  PROCEDURE pr_prc_send (pi_rk NUMBER DEFAULT NULL) IS
    --
    v_conn   UTL_SMTP.CONNECTION;
    v_err    VARCHAR2(4000);
    v_crlf   VARCHAR2(2) := CHR(13) || CHR(10);
    v_cnt    PLS_INTEGER := 0;
    --
    CURSOR c_eml IS
      SELECT r_k, to_eml, eml_sbj, eml_bdy_html
      FROM   wf_10_eml
      WHERE  (r_k = pi_rk OR pi_rk IS NULL)
      AND    to_eml IS NOT NULL
      AND    NVL(snd_cnt,0) <= NVL(pv_00_eml.max_rtry_no,99);
    --
    PROCEDURE pr_close_conn IS
    BEGIN
      UTL_SMTP.QUIT(v_conn);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    --    
  BEGIN
    -- 
    v_cnt := 0;
    --    
    IF fn_init THEN
      --   
      FOR cr IN c_eml LOOP
        --
        IF v_cnt > 999 THEN -- don't swamp the Mail server! 
          EXIT;
        ELSE
          BEGIN
            -- establish the connection to the smtp server and perform a handshake with the smtp server
            v_conn := fn_smtp_conn;
            -- set the 'from' address of the message
            UTL_SMTP.MAIL(v_conn, pv_00_eml.frm_eml);
            -- add the recipient to the message          
            UTL_SMTP.RCPT(v_conn, cr.to_eml);
            -- write and send message
            UTL_SMTP.DATA(v_conn,
                         'MIME-version: 1.0' || v_crlf ||
                         'Content-Type: text/html; charset=ISO-8859-15' || v_crlf ||
                         'Content-Transfer-Encoding: 8bit' || v_crlf ||
                         'Date: '   || to_char(sysdate, 'Dy, DD Mon YYYY hh24:mi:ss') || v_crlf ||
                         'From: '   || pv_00_eml.frm_eml || v_crlf ||
                         'Subject: '|| cr.eml_sbj || v_crlf ||
                         'To: '     || cr.to_eml || v_crlf ||
                         v_crlf ||
                         cr.eml_bdy_html|| v_crlf);
            -- delete from queue          
            DELETE FROM wf_10_eml WHERE r_k = cr.r_k;
            --
            v_cnt := v_cnt + 1;
            pr_close_conn; 
            --
          EXCEPTION
            WHEN OTHERS THEN
              v_err := SQLERRM;
              UPDATE wf_10_eml
              SET    snd_cnt = NVL(snd_cnt, 0) + 1,
                     lst_snd_dt = SYSDATE,
                     snd_upd = SUBSTR(v_err,1,500)
              WHERE r_k = cr.r_k;
              pr_close_conn;  
          END;
          --
        END IF;
        --
      END LOOP;
      -- 
      -- end the connection to the smtp server                       
      pr_close_conn;
      --
      COMMIT;
      --      
    END IF;
    -- 
    IF pi_rk > 0 THEN
      NULL;
    ELSE
      DELETE FROM wf_10_eml WHERE snd_cnt >= pv_00_eml.max_rtry_no;
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      logger.log(sqlerrm); 
  END pr_prc_send;
  --   
  --
  /* Public Routines */
  -- 
  PROCEDURE pr_send IS  
  BEGIN
    pr_prc_send (pi_rk => NULL);
  END pr_send;
  --  
  PROCEDURE pr_send_now (pi_key NUMBER) IS  
  BEGIN
    IF pi_key > 0 THEN
      pr_prc_send (pi_rk => pi_key);
    END IF;
  END pr_send_now;
  --    
  PROCEDURE pr_send_test_mail(pi_rcpt IN VARCHAR2 DEFAULT NULL, pi_msg CLOB DEFAULT NULL) IS
    v_conn   UTL_SMTP.CONNECTION;
    v_err    VARCHAR2(500);
    v_crlf   VARCHAR2(10) := CHR(13) || CHR(10);
    v_to_adr VARCHAR2(500) := NULL;
    v_msg    CLOB;
  BEGIN
    -- 
    v_to_adr := pi_rcpt;
    IF v_to_adr IS NULL THEN
      raise_application_error(-20055, 'Recipient Address has not been defined');
    END IF;
    --
    IF fn_init THEN
      -- 
      v_conn := fn_smtp_conn;
      -- 
      UTL_SMTP.MAIL (v_conn, pv_00_eml.frm_eml);
      --
      v_msg := 
      'MIME-version: 1.0' || v_crlf ||
                     'Content-Type: text/html; charset=ISO-8859-15' || v_crlf ||
                     'Content-Transfer-Encoding: 8bit' || v_crlf ||
                     'Date: '   || to_char(sysdate, 'Dy, DD Mon YYYY hh24:mi:ss') || v_crlf ||
                     'From: '   || pv_00_eml.frm_eml || v_crlf ||
                     'Subject: Test Message' || v_crlf ||
                     'To: '     || v_to_adr || v_crlf || v_crlf ||
                     NVL(pi_msg,'This is a test message from the Customer Portal. Please ignore.')|| v_crlf;
      BEGIN
        UTL_SMTP.RCPT(v_conn, v_to_adr);
        UTL_SMTP.DATA(v_conn, v_msg);
      EXCEPTION
        WHEN OTHERS THEN
          v_err := SQLERRM;
          raise_application_error(-20055, 'TEST EMAIL Error: '||v_err);
      END;
      --
      UTL_SMTP.QUIT(v_conn);
      --
    END IF;
    -- 
  END pr_send_test_mail;
  --  
  PROCEDURE pr_val_stp IS
    v_bool BOOLEAN;
  BEGIN
    v_bool := fn_init;
  END pr_val_stp;
  --
  FUNCTION fn_max_rtry_no RETURN NUMBER IS
    v_bool BOOLEAN;
  BEGIN
    v_bool := fn_init;
    RETURN pv_00_eml.max_rtry_no;
  END;
  --
  PROCEDURE pr_job_restart IS
  BEGIN
    dbms_scheduler.disable('J_WF_10_EML_JOB');
    dbms_scheduler.enable('J_WF_10_EML_JOB');
  END pr_job_restart;
  --
  PROCEDURE pr_send_mail(pi_rcpt IN VARCHAR2,
                         pi_sbj  IN VARCHAR2,
                         pi_msg  IN CLOB) IS
    v_body CLOB;
    v_email wf_10_eml%ROWTYPE;
  BEGIN
    --Customer Copy
    v_email.r_k     := wf_seq_00_key.NEXTVAL;
    v_email.to_eml  := pi_rcpt;
    v_email.eml_sbj := pi_sbj;
    v_email.eml_bdy_html := pi_msg;
    v_email.snd_cnt := 0;
    v_email.int_snd_dt := SYSDATE;
    v_email.cus_id := NULL;--pv_usr.fl_01;
    v_email.cus_nme := NULL; --pv_usr.fir_nm;
    INSERT INTO wf_10_eml VALUES v_email;
    --
  END pr_send_mail;
  --
END pkwf_10_eml;
/
