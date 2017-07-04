create or replace PACKAGE BODY "PKWF_01_EML" AS
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
  -- Packkage Variables
  gv_k                  VARCHAR2(100);
  gv_s                  VARCHAR2(100);
  v_is_valid_session    BOOLEAN := FALSE;
  gv_err_msg            VARCHAR2(1000);
  gv_err_id             VARCHAR2(30);
  pv_link_name          VARCHAR2(50);
  pv_eml_id             VARCHAR2(30);
  pv_usr                t_99_10_ssu%ROWTYPE;
  pv_eml                wf_00_eml%ROWTYPE;
  pv_s_eml_adr          VARCHAR2(200);  -- Sending email address
  pv_ful_nm             VARCHAR2(500);  -- Customer full name
  --
  CURSOR pc_eml_ctt IS
    SELECT eml_ctt
    FROM   wf_v_00_eml
    WHERE  eml_k = pv_eml_id;
  --
  /* Private Routines */
  --  
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    gv_s := NULL;
    gv_err_msg := NULL;
    gv_err_id := NULL;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT')
    INTO gv_k
    FROM dual;
    --
    pkwf_99_glb.pr_vld_conn;
    --
    v_is_valid_session := pkwf_99_glb.fn_vld_conn (gv_k);
    IF v_is_valid_session THEN
      gv_s := TO_CHAR(APEX_CUSTOM_AUTH.GET_SESSION_ID)||APEX_APPLICATION.G_FLOW_ID;
    END IF;
    --
  END pr_load_gvs;
  --
  --
  PROCEDURE pr_init IS
    --
    CURSOR c_usr IS
      SELECT *
      FROM   t_99_10_ssu
      WHERE  lgn_id = v('APP_USER');
    --
    CURSOR c_s_eml IS
      SELECT frm_eml
      FROM   wf_00_00_eml;
    --
    CURSOR c_eml IS
      SELECT *
      FROM   wf_00_eml
      WHERE  eml_id = pv_eml_id;
    --
  BEGIN
    --
    OPEN  c_s_eml;
    FETCH c_s_eml INTO pv_s_eml_adr;
    CLOSE c_s_eml;
    --
    IF pv_s_eml_adr IS NULL THEN
      raise_application_error(-20055, 'Sender Email Address not setup');
    ELSE
      OPEN  c_usr;
      FETCH c_usr INTO pv_usr;
      CLOSE c_usr;
      pv_ful_nm := UPPER(pv_usr.lst_nm)||','||INITCAP(pv_usr.fir_nm);
      --
      OPEN  c_eml;
      FETCH c_eml INTO pv_eml;
      CLOSE c_eml;
      --
    END IF;   
    --    
  END pr_init;
  --
  PROCEDURE pr_send(pi_to IN VARCHAR2 DEFAULT NULL) IS
    v_body CLOB;
    v_email wf_10_eml%ROWTYPE;
  BEGIN
    --Customer Copy
    v_email.r_k     := wf_seq_00_key.NEXTVAL;
    v_email.to_eml  := NVL(pi_to,pv_usr.eml_adr);
    v_email.eml_sbj := pv_eml.eml_sbj;
    v_email.eml_bdy_html := pv_eml.eml_ctt;
    v_email.snd_cnt := 0;
    v_email.int_snd_dt := SYSDATE;
    v_email.cus_id := pv_usr.fl_01;
    v_email.cus_nme := pv_usr.fir_nm;
    INSERT INTO wf_10_eml VALUES v_email;
    --
    -- Internal Copy
    IF pv_eml.cc_1 IS NOT NULL THEN
      v_email.r_k     := wf_seq_00_key.NEXTVAL;
      v_email.to_eml  := pv_eml.cc_1;
      v_email.eml_sbj := pv_eml.eml_dsc;
      v_email.eml_bdy_html := pv_eml.eml_itr;
      v_email.snd_cnt := 0;
      v_email.int_snd_dt := SYSDATE;
      INSERT INTO wf_10_eml VALUES v_email;
    END IF;  
    --
  END pr_send;
  --
  /* Public Routines */
  --
  -- Process Email template
  PROCEDURE pr_prc(pi_rec IN wf_v_00_eml%ROWTYPE) IS
    --
    v_rec     wf_00_eml%ROWTYPE;
    --
    CURSOR c_rec IS
      SELECT *
      FROM   wf_00_eml
      WHERE  eml_id = pi_rec.eml_id;
  BEGIN
    --
    IF pi_rec.eml_id IS NULL THEN      
     NULL;--Not Implemented
    ELSE
      OPEN  c_rec;
      FETCH c_rec INTO v_rec;
      CLOSE c_rec;
      --
      v_rec.eml_id  := pi_rec.eml_id;
      v_rec.eml_sbj := pi_rec.eml_sbj;
      v_rec.rpy_adr := pi_rec.rpy_adr;
      v_rec.ius_yn  := pi_rec.ius_yn;
      v_rec.eml_ctt := pi_rec.eml_ctt;
      v_rec.eml_itr := pi_rec.eml_itr;
      v_rec.cc_1    := pi_rec.cc_1;
      --
      UPDATE wf_00_eml
      SET ROW = v_rec
      WHERE eml_id = v_rec.eml_id;
      --
    END IF;    
    --
    COMMIT;
    --
  END pr_prc;  
  --
  -- Password Reset
  PROCEDURE pr_pwd_rst(pi_cus_nm    IN VARCHAR2, 
                       pi_eml_adr   IN VARCHAR2,
                       pi_pwd       IN VARCHAR2) IS
  BEGIN
    --
    pv_eml_id := 'PWD-RST';
    pr_init;
    --
    IF pi_eml_adr IS NOT NULL THEN -- recipient email address not set
      --
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#USER#', pi_cus_nm);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#EMAILADDRESS#', pi_eml_adr);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#PASSWORD#', pi_pwd);
      pr_send(pi_to => pi_eml_adr);
      --
    END IF;
    --
  END pr_pwd_rst;
  --
  -- New Portal User
  PROCEDURE pr_new_usr(pi_usr_nme   IN VARCHAR2, 
                       pi_lgn_id    IN VARCHAR2,
                       pi_lgn_pwd   IN VARCHAR2,
                       pi_eml_adr   IN VARCHAR2) IS
  BEGIN
    --
    pv_eml_id := 'NEW-USR';
    pr_init;
    --
    IF pi_eml_adr IS NOT NULL THEN -- recipient email address not set
      --
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#USER#', pi_usr_nme);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#LOGINID#', pi_lgn_id);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#PASSWORD#', pi_lgn_pwd);
      pr_send(pi_to => pi_eml_adr);
      --
    END IF;
    --
  END pr_new_usr;
  --
  PROCEDURE pr_onb_rcpt(pi_app_name IN VARCHAR2,
                        pi_type     IN VARCHAR2,
                        pi_product  IN VARCHAR2,
                        pi_eml_adr  IN VARCHAR2) IS
  BEGIN
    --
    pv_eml_id := 'OB-RCPT';
    pr_init;
    --
    IF pi_eml_adr IS NOT NULL THEN -- recipient email address not set
      --
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#APPLICANT#', pi_app_name);
      pv_eml.eml_itr := REPLACE(pv_eml.eml_itr, '#APPLICANT#', pi_app_name);
      pv_eml.eml_itr := REPLACE(pv_eml.eml_itr, '#PRODUCT#', pi_product);
      pv_eml.eml_itr := REPLACE(pv_eml.eml_itr, '#TYPE#', pi_type);
      pr_send(pi_to => pi_eml_adr);
      --
    END IF;
    --
  END pr_onb_rcpt; 
  --
  PROCEDURE pr_app_rej(pi_tp_id  IN VARCHAR2,
                       pi_app_id IN VARCHAR2,
                       pi_app_nm IN VARCHAR2,
                       pi_product IN VARCHAR2,
                       pi_reason IN VARCHAR2) IS
    --
    v_eml_adr VARCHAR2(200) := NULL;
    --
    CURSOR c_eml IS
      SELECT rej_eml 
      FROM   wf_10_tp
      WHERE  tp_id = pi_tp_id; 
    --      
  BEGIN
    --
    pv_eml_id := 'APP-REJ';
    pr_init;
    OPEN  c_eml;
    FETCH c_eml INTO v_eml_adr;
    CLOSE c_eml;
    --
    IF v_eml_adr IS NOT NULL THEN -- recipient email address not set
      --
      pv_eml.eml_sbj := REPLACE(pv_eml.eml_sbj, '#APPLICATION#', pi_app_id);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#APPLICATION#', pi_app_id);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#APPLICANT#', pi_app_nm);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#PRODUCT#', pi_product);
      pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#REASONS#', pi_reason);
      pr_send(pi_to => v_eml_adr);
      --
    END IF;
    --
  END pr_app_rej;  
  --
  PROCEDURE pr_new_tsk(pi_tk_k   IN NUMBER,
                       pi_app_id IN VARCHAR2,
                       pi_product IN VARCHAR2,
                       pi_app_nm IN VARCHAR2) IS
    --
    v_eml_adr VARCHAR2(200) := NULL;
    --
    CURSOR c_eml IS
      SELECT a.eml_adr, d.tk_dsc
      FROM  t_99_10_ssu a,
            wf_10_rl b,
            wf_10_rl_mb c,
            wf_10_tp_tk d
      WHERE b.row_key = c.rl_k
      AND   a.r_k = c.mb_k
      AND   b.row_key = d.ac_rl_k
      AND   d.row_key = pi_tk_k; 
    --      
  BEGIN
    --
    pv_eml_id := 'NEW-TSK';
    pr_init;
    pv_eml.eml_sbj := REPLACE(pv_eml.eml_sbj, '#APPLICATION#', pi_app_id);
    pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#APPLICATION#', pi_app_id);    
    pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#APPLICANT#', pi_app_nm);  
    pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#PRODUCT#', pi_product);    
    --
    FOR c IN c_eml LOOP
      IF c.eml_adr IS NOT NULL THEN -- recipient email address not set
        pv_eml.eml_ctt := REPLACE(pv_eml.eml_ctt, '#TASK#', c.tk_dsc);
        pr_send(pi_to => c.eml_adr);
      END IF;
    END LOOP;
    --
  END pr_new_tsk;  
  --                      
END pkwf_01_eml;
/