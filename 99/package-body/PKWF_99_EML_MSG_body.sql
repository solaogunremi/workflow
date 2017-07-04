CREATE OR REPLACE PACKAGE BODY pkwf_99_eml_msg AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 27-dec-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Message processing
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
  gv_k          VARCHAR2(100);  
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
  --
  /* Public Routines */
  --  
  FUNCTION fn_bdy  ( pi_id IN VARCHAR2,
                     pi_p1 IN VARCHAR2 DEFAULT NULL,
                     pi_p2 IN VARCHAR2 DEFAULT NULL,
                     pi_p3 IN VARCHAR2 DEFAULT NULL,
                     pi_p4 IN VARCHAR2 DEFAULT NULL,
                     pi_p5 IN VARCHAR2 DEFAULT NULL,
                     pi_p6 IN VARCHAR2 DEFAULT NULL,
                     pi_p7 IN VARCHAR2 DEFAULT NULL,
                     pi_p8 IN VARCHAR2 DEFAULT NULL,
                     pi_p9 IN VARCHAR2 DEFAULT NULL,
                     pi_p10 IN VARCHAR2 DEFAULT NULL) RETURN CLOB IS
    --                     
    v_msg_bdy      t_99_00_msg.msg_bdy%TYPE;
    v_cnt          t_99_00_msg.plh_cnt%TYPE;
    --                           
  BEGIN
    --
    v_msg_bdy := NULL;
    v_cnt := 0;
    --        
    BEGIN
      SELECT msg_bdy, plh_cnt
      INTO v_msg_bdy, v_cnt
      FROM t_99_00_msg
      WHERE msg_id = pi_id
      AND   ius_yn = 1;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
    END;
    -- 
    IF v_msg_bdy IS NOT NULL THEN
      IF v_cnt >= 1 THEN
        v_msg_bdy := REPLACE (v_msg_bdy, '%p1%', pi_p1);
      END IF;
      IF v_cnt >= 2 THEN
        v_msg_bdy := REPLACE (v_msg_bdy, '%p2%', pi_p2);
      END IF;
      IF v_cnt >= 3 THEN
        v_msg_bdy := REPLACE (v_msg_bdy, '%p3%', pi_p3);
      END IF;
      IF v_cnt >= 4 THEN
        v_msg_bdy := REPLACE (v_msg_bdy, '%p4%', pi_p4);
      END IF;
      IF v_cnt >= 5 THEN
        v_msg_bdy := REPLACE (v_msg_bdy, '%p5%', pi_p5);
      END IF;      
      IF v_cnt > 5 THEN
        v_msg_bdy := REPLACE (v_msg_bdy, '%p6%', pi_p6);
        v_msg_bdy := REPLACE (v_msg_bdy, '%p7%', pi_p7);
        v_msg_bdy := REPLACE (v_msg_bdy, '%p8%', pi_p8);
        v_msg_bdy := REPLACE (v_msg_bdy, '%p9%', pi_p9);     
        v_msg_bdy := REPLACE (v_msg_bdy, '%p10%', pi_p10);             
      END IF;
    END IF;
    --    
    RETURN v_msg_bdy;
    --
  END fn_bdy;
  --  
  PROCEDURE pr_pmr  ( pi_id    IN VARCHAR2,
                      po_sbj   OUT VARCHAR2,
                      po_sndr  OUT VARCHAR2) IS
    --                     
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;
    --                           
  BEGIN
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    --        
    BEGIN
      SELECT msg_sbj, sndr_adr
      INTO v_sbj, v_sndr
      FROM t_99_00_msg
      WHERE msg_id = pi_id
      AND   ius_yn = 1;
    EXCEPTION
      WHEN no_data_found THEN
        NULL;
    END;
    -- 
    po_sbj  := v_sbj;
    po_sndr := v_sndr;
    --
  END pr_pmr;
  -- 
  PROCEDURE pr_test (pi_k IN VARCHAR2) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_rcp      t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-000';  
    -- 
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    v_rcp  := NULL;
    --     
    IF 1 = 1 THEN -- pi_k = gv_k THEN 
      --
      pr_pmr  ( pi_id    => v_id,
                po_sbj   => v_sbj,
                po_sndr  => v_sndr);
      IF v_sbj IS NULL THEN
        pkwf_99_xcp.pr_not_defined (pi_dsc => 'Test Email Message ['||v_id||']');
      END IF;
      --
      v_bdy := fn_bdy ( pi_id => v_id);
      IF v_bdy IS NULL THEN
        pkwf_99_xcp.pr_not_defined (pi_dsc => 'Test Email Message Body ['||v_id||']');
      END IF;
      --   
      v_rcp := pkwf_99_eml_pmr.fn_eml_test_rcp;
      IF v_rcp IS NULL THEN
        pkwf_99_xcp.pr_not_defined (pi_dsc => 'Test Email Message Recipient Address');
      END IF;
      --
      v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                          pi_msg_sbj  => v_sbj, 
                                          pi_rcp_key  => 1, 
                                          pi_rcp_adr  => v_rcp, 
                                          pi_sndr_adr => v_sndr,
                                          pi_msg_bdy  => v_bdy,
                                          pi_src_app  => '99',
                                          pi_src_ref  => 'TEST-MAIL');  
      --   
      IF v_key > 0 THEN
        pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
        COMMIT;          
        IF pkwf_99_eml_snd.fn_snt ( pi_k => gv_k, pi_msg_ky => v_key) THEN
          NULL;
        ELSE
          pkwf_99_err.pr_raise (pi_id => '990133', pi_p1 => 'test');
        END IF;        
      ELSE
        pkwf_99_err.pr_raise (pi_id => '990132', pi_p1 => 'test');
      END IF;
      --  
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --
  END pr_test;
  --  
  --
  PROCEDURE pr_usr_crt (pi_k   IN VARCHAR2,
                        pi_ky  IN NUMBER,
                        pi_pw  IN VARCHAR2) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-001';  -- Account Login credentials
    -- 
    CURSOR c_usr IS
    SELECT r_k, lgn_id, eml_adr
    FROM  t_99_10_ssu
    WHERE r_k = pi_ky
    AND   r_s = 1
    AND   sta_dm IN ('N','L');
    --
    cr   c_usr%ROWTYPE;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    cr     := NULL;
    --     
    IF pi_ky > 0 THEN
      --
      OPEN c_usr;
      FETCH c_usr INTO cr;
      CLOSE c_usr;
      --
      IF cr.r_k = pi_ky AND cr.eml_adr IS NOT NULL THEN
        --
        pr_pmr  ( pi_id    => v_id,
                  po_sbj   => v_sbj,
                  po_sndr  => v_sndr);
        -- 
        v_bdy := fn_bdy ( pi_id => v_id,
                          pi_p1 => cr.lgn_id,
                          pi_p2 => pi_pw);
        --   
        v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k     => gv_k,
                                            pi_msg_sbj  => v_sbj, 
                                            pi_rcp_key  => pi_ky, 
                                            pi_rcp_adr  => cr.eml_adr, 
                                            pi_sndr_adr => v_sndr,
                                            pi_msg_bdy  => v_bdy);  
        --   
        IF v_key > 0 THEN
          pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
        END IF;
        --        
      END IF;
      --
    END IF;
    --
  END pr_usr_crt;
  --  
  --
  PROCEDURE pr_usr_cpw (pi_k   IN VARCHAR2,
                        pi_ky  IN NUMBER,
                        pi_pw  IN VARCHAR2) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-002';  -- Password Reset
    -- 
    CURSOR c_usr IS
    SELECT r_k, lgn_id, eml_adr
    FROM  t_99_10_ssu
    WHERE r_k = pi_ky
    AND   r_s = 1
    AND   sta_dm IN ('N','L');
    --
    cr   c_usr%ROWTYPE;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    cr     := NULL;
    --     
    IF pi_ky > 0 THEN
      --
      OPEN c_usr;
      FETCH c_usr INTO cr;
      CLOSE c_usr;
      --
      IF cr.r_k = pi_ky AND cr.eml_adr IS NOT NULL THEN
        --
        pr_pmr  ( pi_id    => v_id,
                  po_sbj   => v_sbj,
                  po_sndr  => v_sndr);
        -- 
        v_bdy := fn_bdy ( pi_id => v_id, pi_p1 => pi_pw);
        --   
        v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                            pi_msg_sbj  => v_sbj, 
                                            pi_rcp_key  => pi_ky, 
                                            pi_rcp_adr  => cr.eml_adr, 
                                            pi_sndr_adr => v_sndr,
                                            pi_msg_bdy  => v_bdy);  
        --   
        IF v_key > 0 THEN
          pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
        END IF;
        --        
      END IF;
      --
    END IF;
    --
  END pr_usr_cpw;
  --
  PROCEDURE pr_usr_lck (pi_k IN VARCHAR2, pi_ky  IN NUMBER) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-003';  -- Account Lock
    -- 
    CURSOR c_usr IS
    SELECT r_k, lgn_id, eml_adr
    FROM  t_99_10_ssu
    WHERE r_k = pi_ky
    AND   r_s = 1
    AND   sta_dm = 'L';
    --
    cr   c_usr%ROWTYPE;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    cr     := NULL;
    --     
    IF pi_ky > 0 THEN
      --
      OPEN c_usr;
      FETCH c_usr INTO cr;
      CLOSE c_usr;
      --
      IF cr.r_k = pi_ky AND cr.eml_adr IS NOT NULL THEN
        --
        pr_pmr  ( pi_id    => v_id,
                  po_sbj   => v_sbj,
                  po_sndr  => v_sndr);
        -- 
        v_bdy := fn_bdy ( pi_id => v_id);
        --   
        v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                            pi_msg_sbj  => v_sbj, 
                                            pi_rcp_key  => pi_ky, 
                                            pi_rcp_adr  => cr.eml_adr, 
                                            pi_sndr_adr => v_sndr,
                                            pi_msg_bdy  => v_bdy);  
        --   
        IF v_key > 0 THEN
          pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
        END IF;
        --        
      END IF;
      --
    END IF;
    --
  END pr_usr_lck;
  --  
  PROCEDURE pr_usr_ulck (pi_k IN VARCHAR2, pi_ky  IN NUMBER) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-004';  -- Account unlock
    -- 
    CURSOR c_usr IS
    SELECT r_k, lgn_id, eml_adr
    FROM  t_99_10_ssu
    WHERE r_k = pi_ky
    AND   r_s = 1
    AND   sta_dm = 'N';
    --
    cr   c_usr%ROWTYPE;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    cr     := NULL;
    --     
    IF pi_ky > 0 THEN
      --
      OPEN c_usr;
      FETCH c_usr INTO cr;
      CLOSE c_usr;
      --
      IF cr.r_k = pi_ky AND cr.eml_adr IS NOT NULL THEN
        --
        pr_pmr  ( pi_id    => v_id,
                  po_sbj   => v_sbj,
                  po_sndr  => v_sndr);
        -- 
        v_bdy := fn_bdy ( pi_id => v_id);
        --   
        v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                            pi_msg_sbj  => v_sbj, 
                                            pi_rcp_key  => pi_ky, 
                                            pi_rcp_adr  => cr.eml_adr, 
                                            pi_sndr_adr => v_sndr,
                                            pi_msg_bdy  => v_bdy);  
        --   
        IF v_key > 0 THEN
          pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
        END IF;
        --        
      END IF;
      --
    END IF;
    --
  END pr_usr_ulck;
  --   
  PROCEDURE pr_ob_rcv(pi_appcnt IN VARCHAR2,
                      pi_eml_adr IN VARCHAR2) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --                   
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := '[CORDROS] Thank you for your Account Opening Application';
    v_sndr := 'customerservices@cordros.com';
    v_bdy  := 'Dear ' || pi_appcnt ||', '||chr(13)||chr(10)||
              'Thank you for your interest in opening a Cordros Account. 
               We review your application and revert back you'||chr(13)||chr(10)||
               'Best Regards';
    -- 
    v_key := pkwf_99_eml_snd.fn_send_msg (pi_k        => gv_k,
                                          pi_msg_sbj  => v_sbj, 
                                          pi_rcp_key  => NULL, 
                                          pi_rcp_adr  => pi_eml_adr, 
                                          pi_sndr_adr => v_sndr,
                                          pi_msg_bdy  => v_bdy);  
    --   
    IF v_key > 0 THEN
      pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
    END IF;
    --
  END pr_ob_rcv;
  --
  PROCEDURE pr_pw_chng (pi_k IN VARCHAR2, pi_ky  IN NUMBER) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-005';  -- Password change
    -- 
    CURSOR c_usr IS
    SELECT r_k, lgn_id, eml_adr
    FROM  t_99_10_ssu
    WHERE r_k = pi_ky
    AND   r_s = 1
    AND   sta_dm IN ('N','L');
    --
    cr   c_usr%ROWTYPE;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    cr     := NULL;
    --     
    IF pi_ky > 0 THEN
      --
      OPEN c_usr;
      FETCH c_usr INTO cr;
      CLOSE c_usr;
      --
      IF cr.r_k = pi_ky AND cr.eml_adr IS NOT NULL THEN
        --
        pr_pmr  ( pi_id    => v_id,
                  po_sbj   => v_sbj,
                  po_sndr  => v_sndr);
        -- 
        v_bdy := fn_bdy ( pi_id => v_id);
        --   
        v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                            pi_msg_sbj  => v_sbj, 
                                            pi_rcp_key  => pi_ky, 
                                            pi_rcp_adr  => cr.eml_adr, 
                                            pi_sndr_adr => v_sndr,
                                            pi_msg_bdy  => v_bdy);  
        --   
        IF v_key > 0 THEN
          pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
        END IF;
        --        
      END IF;
      --
    END IF;
    --
  END pr_pw_chng;
  --    
  PROCEDURE pr_uid_chng (pi_k IN VARCHAR2, pi_ky IN NUMBER, pi_ov IN VARCHAR2, pi_nv IN VARCHAR2) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-006';  -- Login ID change
    -- 
    CURSOR c_usr IS
    SELECT r_k, lgn_id, eml_adr
    FROM  t_99_10_ssu
    WHERE r_k = pi_ky
    AND   r_s = 1
    AND   sta_dm IN ('N','L');
    --
    cr   c_usr%ROWTYPE;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    cr     := NULL;
    --     
    IF pi_ky > 0 THEN
      --
      OPEN c_usr;
      FETCH c_usr INTO cr;
      CLOSE c_usr;
      --
      IF cr.r_k = pi_ky AND cr.eml_adr IS NOT NULL THEN
        --
        pr_pmr  ( pi_id    => v_id,
                  po_sbj   => v_sbj,
                  po_sndr  => v_sndr);
        -- 
        v_bdy := fn_bdy ( pi_id => v_id,
                          pi_p1 => pi_ov,
                          pi_p2 => pi_nv);
        --   
        v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                            pi_msg_sbj  => v_sbj, 
                                            pi_rcp_key  => pi_ky, 
                                            pi_rcp_adr  => cr.eml_adr, 
                                            pi_sndr_adr => v_sndr,
                                            pi_msg_bdy  => v_bdy);  
        --   
        IF v_key > 0 THEN
          pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
        END IF;
        --        
      END IF;
      --
    END IF;
    --
  END pr_uid_chng;
  --    
  PROCEDURE pr_eml_chng (pi_k IN VARCHAR2, pi_ky IN NUMBER, pi_ov IN VARCHAR2, pi_nv IN VARCHAR2) IS
    --                       
    v_sbj      t_99_00_msg.msg_sbj%TYPE;
    v_sndr     t_99_00_msg.sndr_adr%TYPE;   
    v_bdy      CLOB; 
    v_key      NUMBER;
    --    
    v_id       VARCHAR2(10) := '99-007';  -- Email Change
    -- 
    CURSOR c_usr IS
    SELECT r_k, lgn_id, eml_adr
    FROM  t_99_10_ssu
    WHERE r_k = pi_ky
    AND   r_s = 1
    AND   sta_dm IN ('N','L');
    --
    cr   c_usr%ROWTYPE;
    --
  BEGIN
    --
    pr_load_gvs;
    --
    v_sbj  := NULL;
    v_sndr := NULL;
    v_bdy  := NULL;
    cr     := NULL;
    --     
    IF pi_ky > 0 THEN
      --
      OPEN c_usr;
      FETCH c_usr INTO cr;
      CLOSE c_usr;
      --
      IF cr.r_k = pi_ky AND cr.eml_adr IS NOT NULL THEN
        --
        pr_pmr  ( pi_id    => v_id,
                  po_sbj   => v_sbj,
                  po_sndr  => v_sndr);
        -- 
        v_bdy := fn_bdy ( pi_id => v_id,
                          pi_p1 => pi_ov,
                          pi_p2 => pi_nv);
        --  
        -- Send to old address        
        IF pi_ov IS NOT NULL THEN
          --
          v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                              pi_msg_sbj  => v_sbj, 
                                              pi_rcp_key  => pi_ky, 
                                              pi_rcp_adr  => pi_ov, 
                                              pi_sndr_adr => v_sndr,
                                              pi_msg_bdy  => v_bdy);  
          --   
          IF v_key > 0 THEN
            pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
          END IF;
          --
        END IF;
        --  
        -- Send to new address        
        IF pi_nv IS NOT NULL THEN
          --
          v_key := pkwf_99_eml_snd.fn_send_msg ( pi_k        => gv_k,
                                              pi_msg_sbj  => v_sbj, 
                                              pi_rcp_key  => pi_ky, 
                                              pi_rcp_adr  => pi_nv, 
                                              pi_sndr_adr => v_sndr,
                                              pi_msg_bdy  => v_bdy);  
          --   
          IF v_key > 0 THEN
            pkwf_99_eml_snd.pr_prc_msg ( pi_k => gv_k, pi_msg_ky => v_key);
          END IF;
          --
        END IF;
        --                
      END IF;
      --
    END IF;
    --
  END pr_eml_chng;
  --         
END pkwf_99_eml_msg; 
/

