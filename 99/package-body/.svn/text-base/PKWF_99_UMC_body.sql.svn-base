CREATE OR REPLACE PACKAGE BODY pkwf_99_umc AS
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 23-JAN-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: User Maintenance Extension
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
  /* Package Variables */
  --
  gv_k            VARCHAR2(100);
  gv_valid_admin  BOOLEAN := FALSE;
  gv_prc_new_usr  BOOLEAN;
  gv_prc_usrpw    VARCHAR2(500) := NULL;
  gv_prc_usrky    NUMBER := NULL;
  gv_99_apl       VARCHAR2(5) := '99';
  gv_setup_uid    VARCHAR2(30) := 'SETUP';
  gv_setup_key    NUMBER := 100;
  gv_setup_usr    BOOLEAN := FALSE;
  --    
  pv_rec        v_99_99_umr%ROWTYPE;
  pv_rec_e      v_99_99_umr_e%ROWTYPE;
  gr_u          v_99_99_usr%ROWTYPE;
  --
  gr_ssu        t_99_10_ssu%ROWTYPE;
  gr_tbl        t_99_10_ssu%ROWTYPE;
  --
  /* Private Routines */
  --
  -- Set Global Variables
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    gv_valid_admin := FALSE;
    gv_prc_usrpw   := NULL;
    gv_prc_usrky   := NULL;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    gv_valid_admin := pkwf_99_atc.fn_sadm; 
    --
  END pr_load_gvs;
  --
  PROCEDURE pr_lic IS
    v_mdl  VARCHAR2(10)   := '99';
    v_k1   VARCHAR2(500)  := NULL;
    v_k2   VARCHAR2(500)  := NULL;
    v_x    VARCHAR2(500)  := NULL;
  BEGIN
    NULL;
  END pr_lic;
  --    
  PROCEDURE pr_usr_lic IS
    v_dsc   VARCHAR2(1000);
    v_ac    NUMBER(10) := 0;
    v_lc    NUMBER(10) := 0;
  BEGIN
    NULL;        
  END pr_usr_lic;
  --
  FUNCTION fn_auth RETURN BOOLEAN IS
  BEGIN
    RETURN TRUE;
  END fn_auth;
  --
  PROCEDURE pr_auth IS
  BEGIN
    NULL;
  END pr_auth;
  --
  PROCEDURE pr_clear_recs IS
  BEGIN
    gr_ssu := NULL;
    gr_u   := NULL;
  END pr_clear_recs;
  --  
  PROCEDURE pr_load_edit_rec IS
  BEGIN
    --
    pv_rec_e := NULL;
    --
    pv_rec_e.r_s      := gr_ssu.r_s;
    pv_rec_e.usr_ky   := gr_ssu.r_k;
    pv_rec_e.usr_id   := gr_ssu.lgn_id;
    pv_rec_e.fir_nm   := gr_ssu.fir_nm;
    pv_rec_e.lst_nm   := gr_ssu.lst_nm;
    pv_rec_e.rpt_nm   := gr_ssu.sht_nm;
    pv_rec_e.gdr_dm   := gr_ssu.gdr_dm;
    pv_rec_e.ttl_dsc  := gr_ssu.ttl_dsc;
    pv_rec_e.eml_adr  := gr_ssu.eml_adr;
    pv_rec_e.prm_phn  := gr_ssu.prm_phn;
    pv_rec_e.usr_dm   := gr_ssu.usr_dm;
    pv_rec_e.edt_yn   := gr_ssu.edt_yn;
    pv_rec_e.vrf_yn   := gr_ssu.vrf_yn;
    pv_rec_e.apr_yn   := gr_ssu.apr_yn;
    pv_rec_e.lgp_ky   := gr_ssu.lgp_ky;
    pv_rec_e.oth_rmk  := gr_ssu.oth_rmk; 
    --    
  END pr_load_edit_rec;
  --
  PROCEDURE pr_load_rec (pi_key IN NUMBER) IS
    CURSOR c_cf_rec IS
      SELECT *
        FROM t_99_10_ssu
       WHERE r_k = pi_key
       AND   r_k > 20; -- reserved
  BEGIN
    --
    gr_ssu       := NULL;
    gv_setup_usr := FALSE;
    --
    IF pi_key > 20 THEN
      --
      OPEN c_cf_rec;
      FETCH c_cf_rec INTO gr_ssu;
      CLOSE c_cf_rec;
      --
      IF gr_ssu.r_k = pi_key THEN
        NULL;
      ELSE
        gr_ssu := NULL;
      END IF;
      --
      IF UPPER(gr_ssu.lgn_id) = gv_setup_uid OR gr_ssu.r_k = gv_setup_key THEN   
        gv_setup_usr := TRUE;
      END IF;
      --
      IF gv_setup_usr THEN
        gr_ssu.usr_dm := 'ADM';
      END IF;
      --       
    END IF;
    --
  END pr_load_rec;
  --  
  PROCEDURE pr_val_ssu (pi_key IN NUMBER) IS
    v_dsc  VARCHAR2(500) := 'User record';
  BEGIN
    --
    pr_lic;
    pr_load_rec (pi_key => pi_key);
    --
    IF gr_ssu.r_k = pi_key THEN
      --
      v_dsc := '"'||gr_ssu.sht_nm||'" [Login ID = '||gr_ssu.lgn_id||'] user record';
      --
      IF pkwf_99_gen.fn_approved_rec (gr_ssu.r_s) AND gr_ssu.sta_dm IN ('N','L') THEN
        NULL;
      ELSIF gr_ssu.sta_dm = 'D' OR gr_ssu.r_s = 2 THEN
        pkwf_99_err.pr_raise (pi_id => '990094'); -- User does not exist or has been removed
      ELSIF pkwf_99_gen.fn_pending_rec (gr_ssu.r_s) OR gr_ssu.sta_dm = 'P' THEN
        pkwf_99_err.pr_raise (pi_id => '990027', pi_p1 => v_dsc, pi_p2 => 'Processing not allowed.');
      ELSE
        pkwf_99_xcp.pr_not_valid (pi_dsc => v_dsc);
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_not_found (pi_dsc => v_dsc);
    END IF;
    --
  END pr_val_ssu;
  --   
  PROCEDURE pr_load_usr_rec (pi_key IN NUMBER) IS
  BEGIN
    --
    gr_u := NULL;
    --
    IF pi_key > 0 THEN
      pr_load_gvs;
      IF gv_valid_admin THEN
        gr_u := pkwf_99_acs.fn_usr_dtl (pi_k => gv_k, pi_uk => pi_key);
      END IF;
    END IF;
    --
  END pr_load_usr_rec;
  --      
  PROCEDURE pr_load_dsp_rec (pi_key IN NUMBER) IS
  BEGIN
    --
    pr_clear_recs;
    --
    pr_load_usr_rec (pi_key => pi_key);
    --
    IF gr_u.usr_ky = pi_key THEN
      --
      pv_rec.usr_ky   := gr_u.usr_ky;
      pv_rec.usr_id   := gr_u.usr_id;
      pv_rec.fir_nm   := gr_u.fir_nm;
      pv_rec.lst_nm   := gr_u.lst_nm;
      pv_rec.rpt_nm   := gr_u.sht_nm;
      pv_rec.gdr_dm   := gr_u.gdr_dm;
      pv_rec.ttl_dsc  := gr_u.ttl_dsc;
      pv_rec.eml_adr  := gr_u.eml_adr;
      pv_rec.prm_phn  := gr_u.prm_phn;
      pv_rec.usr_dm   := gr_u.usr_dm;
      pv_rec.edt_yn   := gr_u.edt_yn;
      pv_rec.vrf_yn   := gr_u.vrf_yn;
      pv_rec.apr_yn   := gr_u.apr_yn;
      pv_rec.lgp_ky   := gr_u.lgp_ky;
      pv_rec.oth_rmk  := gr_u.oth_rmk;
      --
      pv_rec.gdr_dsc    := gr_u.gdr_dsc;
      pv_rec.usr_dsc    := gr_u.usr_dsc;
      pv_rec.lgp_dsc    := gr_u.lgp_dsc;
      pv_rec.sta_dsc    := gr_u.sta_dsc;
      pv_rec.lin_dt_dsc := gr_u.lin_dt_dsc;
      pv_rec.lin_cnt    := gr_u.lin_cnt;
      pv_rec.cpw_dt_dsc := gr_u.cpw_dt_dsc;
      pv_rec.cpw_cnt    := gr_u.cpw_cnt;      
      --
      --
      /* AUDIT INFO */
      --
      pr_load_rec (pi_key => pi_key);
      --
      pv_rec.r_s := gr_ssu.r_s;
      -- Insert 
      pv_rec.au_ins_tmd   := pkwf_99_dtm.fn_tmm_dsc(gr_ssu.i_tm);
      IF gr_ssu.i_ky > 0 THEN
        pv_rec.au_ins_unm := pkwf_99_uma.fn_get_rpt_nm (pi_k => gv_k, pi_uk => gr_ssu.i_ky);
      END IF;
      -- Approval 
      pv_rec.au_apr_tmd   := pkwf_99_dtm.fn_tmm_dsc(gr_ssu.a_tm);
      IF gr_ssu.a_ky > 0 THEN
        pv_rec.au_apr_unm := pkwf_99_uma.fn_get_rpt_nm (pi_k => gv_k, pi_uk => gr_ssu.a_ky);
      END IF;
      -- Last Update 
      pv_rec.au_upd_tmd   := pkwf_99_dtm.fn_tmm_dsc(gr_ssu.u_tm);
      IF gr_ssu.u_ky > 0 THEN
        pv_rec.au_upd_unm := pkwf_99_uma.fn_get_rpt_nm (pi_k => gv_k, pi_uk => gr_ssu.u_ky);
      END IF;       
      --
    END IF;
    --
  END pr_load_dsp_rec;
  --    
  PROCEDURE pr_val_pv_rec_e IS
    v_n  NUMBER;
    CURSOR cur_blk_eml IS
    SELECT 1
    FROM t_99_10_pea
    WHERE UPPER(eml_adr) = UPPER(pv_rec_e.eml_adr);    
  BEGIN
    -- 
    pr_lic;
    --
    -- Mandatory fields validations
    pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.usr_id, pi_dsc => 'User Login ID', pi_pgm => 'VALIDATE_USER');
    pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.rpt_nm, pi_dsc => 'Reporting ID', pi_pgm => 'VALIDATE_USER');
    pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.usr_dm, pi_dsc => 'User Type', pi_pgm => 'VALIDATE_USER');
    pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.fir_nm, pi_dsc => 'First Name', pi_pgm => 'VALIDATE_USER');
    pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.lst_nm, pi_dsc => 'Last Name', pi_pgm => 'VALIDATE_USER');
    -- Now required b/c of system emails e.g. password notifications etc. Chiedu 27-DEC-2012
    pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.eml_adr, pi_dsc => 'Email Address', pi_pgm => 'VALIDATE_USER'); 
    --
    IF pv_rec_e.gdr_dm IS NOT NULL THEN
      pkwf_99_dmv.pr_gdr_vld (pi_k => gv_k, pi_d => pv_rec_e.gdr_dm);
    END IF;  
    --         
    IF LOWER(gr_ssu.lgn_id) = LOWER(pv_rec_e.usr_id) THEN
      NULL;
    ELSE
      -- Check User ID is not in use
      IF pkwf_99_uma.fn_usr_id_exists (pi_k => gv_k, pi_usr => pv_rec_e.usr_id) THEN
        pkwf_99_err.pr_raise (pi_id => '990040', pi_p1 => '"'||pv_rec_e.usr_id||'"');
      END IF;    
    END IF;
    --
    IF gv_prc_new_usr THEN
      -- Check User ID is not allowed
      IF pkwf_99_glb.fn_is_invalid_usr_id (pi_k => gv_k, pi_id => pv_rec_e.usr_id) THEN
        pkwf_99_err.pr_raise (pi_id => '990053', pi_p1 => '"'||pv_rec_e.usr_id||'"');
      END IF;
      -- Check for the minimum/maximum length of the Login ID
      v_n := pkwf_99_pmr.fn_min_nme_len (gv_k);
      IF LENGTH(pv_rec_e.usr_id) < v_n THEN
        pkwf_99_err.pr_raise (pi_id => '990041', pi_p1 => v_n); 
      END IF;
      --         
    END IF;
    --
    -- Email Address
    IF pv_rec_e.eml_adr IS NOT NULL THEN
      --
      IF UPPER(gr_ssu.eml_adr) = UPPER(pv_rec_e.eml_adr) THEN
        NULL;    
      ELSE
        -- Validate Email address string
        IF NOT pkwf_99_gu1.fn_is_valid_email (pi_addr => pv_rec_e.eml_adr) THEN
          pkwf_99_err.pr_raise (pi_id => '990056', pi_p1 => '"'||pv_rec_e.eml_adr||'"'); 
        END IF;     
        -- Email sharing/duplicates not allowed. Chiedu 27-DEC-2012
        IF pkwf_99_uma.fn_eml_adr_exists (pi_k => gv_k, pi_adr => pv_rec_e.eml_adr) THEN
          pkwf_99_err.pr_raise (pi_id => '990055', pi_p1 => '"'||pv_rec_e.eml_adr||'"');
        END IF;
        --
      END IF;
      --
      -- Validate Email address is not prohibited 
      v_n := 0;
      OPEN cur_blk_eml;
      FETCH cur_blk_eml INTO v_n;
      CLOSE cur_blk_eml;
      IF v_n = 1 THEN
        pkwf_99_err.pr_raise (pi_id => '990120', pi_p1 => 'Email address "'||pv_rec_e.eml_adr||'" is blacklisted and therefore'); 
      END IF;
      --      
    END IF;
    --  
    -- User Type
    IF gv_prc_new_usr THEN
      IF NOT pkwf_99_dmv.fn_vld_usr_typ (pi_k => gv_k, pi_usr_dm => pv_rec_e.usr_dm) THEN
        pkwf_99_err.pr_raise (pi_id => '990057'); 
      END IF;
    END IF;
    --
    --
    IF pv_rec_e.edt_yn = 1 THEN 
      NULL; 
    ELSE    
      pv_rec_e.edt_yn := 0;
    END IF;
    IF pv_rec_e.vrf_yn = 1 THEN 
      NULL; 
    ELSE    
      pv_rec_e.vrf_yn := 0;
    END IF; 
    IF pv_rec_e.apr_yn = 1 THEN 
      NULL; 
    ELSE    
      pv_rec_e.apr_yn := 0;
    END IF; 
    --    
    -- 
    gr_tbl := NULL;
    --
    gr_tbl.cng_pw_yn := 1; -- force password change
    gr_tbl.rst_lgn_yn := 0;
    --    
    gr_tbl.lgn_id := LOWER(pv_rec_e.usr_id);
    gr_tbl.fir_nm := UPPER(pv_rec_e.fir_nm);
    gr_tbl.lst_nm := UPPER(pv_rec_e.lst_nm);
    gr_tbl.sht_nm := UPPER(pv_rec_e.rpt_nm);
    --
    gr_tbl.usr_dm := pv_rec_e.usr_dm;    
    gr_tbl.lgg_dm := pkwf_99_pmr.fn_itl_lang (gv_k);
    IF gr_tbl.lgg_dm IS NULL THEN
      gr_tbl.lgg_dm := 'EN';
    END IF;
    gr_tbl.gdr_dm := pv_rec_e.gdr_dm;
    gr_tbl.edt_yn := pv_rec_e.edt_yn;
    gr_tbl.vrf_yn := pv_rec_e.vrf_yn;
    gr_tbl.apr_yn := pv_rec_e.apr_yn;
    gr_tbl.lgp_ky := pv_rec_e.lgp_ky;
    gr_tbl.prm_phn := pv_rec_e.prm_phn;
    gr_tbl.eml_adr := pv_rec_e.eml_adr;
    gr_tbl.ttl_dsc := pv_rec_e.ttl_dsc;
    gr_tbl.oth_rmk := pv_rec_e.oth_rmk;
    --
    IF gr_tbl.eml_adr IS NOT NULL THEN      
      gr_tbl.eml_yn := 1;    
    ELSE  
      gr_tbl.eml_yn := 0;   
    END IF; 
    --       
  END pr_val_pv_rec_e;
  --  
  -- Approve  
  PROCEDURE pr_apr_ssu (pi_key NUMBER) IS
    v_dsc  VARCHAR2(100) := 'User record';  
  BEGIN
    -- 
    pr_load_rec (pi_key => pi_key);    
    gv_prc_usrpw := NULL;
    --
    IF gr_ssu.r_k = pi_key THEN
      --
      IF pkwf_99_gen.fn_pending_rec(gr_ssu.r_s) THEN
        --
        -- Authorization check
        IF gr_ssu.usr_dm = 'ADM' THEN
          pr_auth;
        ELSE
          --
          pr_usr_lic; -- Validate Users license
          pr_auth;
          --
        END IF;
        --      
        pr_load_edit_rec;
        pr_val_pv_rec_e;
        --
        -- Store wallet details
        pkwf_99_swm.pr_mnt ( pi_pk   => gv_k,
                          pi_sk   => pi_key,
                          pi_sr   => 'T_99_10_SSU$ID',
                          pi_sd   => UPPER(gr_ssu.lgn_id));
        --                          
        pkwf_99_trg.pr_set_sdml (gv_k);          
        UPDATE t_99_10_ssu SET
          r_s       = 1,
          sta_dm    = 'N',
          sta_dt    = pkwf_99_dtm.fn_sys_dtm,
          cng_pw_yn = 1
        WHERE r_k = pi_key;
        --
        --
        pkwf_99_trg.pr_reset_sdml; 
        --        
        pkwf_99_pwm.pr_reset_upw (pi_k => gv_k, pi_un => gr_ssu.lgn_id, pi_un_yn => '0', po_pw => gv_prc_usrpw);
        --     
        -- Send Email
        logger.log('Email Address => '||gr_ssu.eml_adr);
        pkwf_01_eml. pr_new_usr(pi_usr_nme  => UPPER(gr_ssu.lst_nm)||', '||INITCAP(gr_ssu.fir_nm),
                                pi_lgn_id   => gr_ssu.lgn_id,
                                pi_lgn_pwd  => gv_prc_usrpw,
                                pi_eml_adr  => gr_ssu.eml_adr);
        /*  over to workflow
        pkwf_99_eml_msg.pr_usr_crt (pi_k   => gv_k,
                                    pi_ky  => pi_key,
                                    pi_pw  => gv_prc_usrpw);
        */                            
        --                                     
        gv_prc_usrky := pi_key;
        --       
        IF 1 = 2 THEN -- pkwf_99_pmr.fn_dsp_upw (gv_k) THEN
          NULL;
        ELSE
          gv_prc_usrpw := NULL;
        END IF; 
        --        
      ELSIF pkwf_99_gen.fn_approved_rec (gr_ssu.r_s) THEN
        pkwf_99_xcp.pr_already_approved (pi_dsc => v_dsc);
      ELSE
        pkwf_99_xcp.pr_not_valid (pi_dsc => v_dsc);
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_not_found (pi_dsc => v_dsc);
    END IF;
    --
  END pr_apr_ssu;
  --  
  --
  /* Public Routines */
  -- 
  -- Create/edit new record
  PROCEDURE pr_prc (pi_rec IN OUT v_99_99_umr_e%ROWTYPE) IS
    v_dsc       VARCHAR2(50) := 'User record';
    v_eml_upd   BOOLEAN := FALSE;
  BEGIN
    --  
    pr_clear_recs;
    pr_load_gvs;
    v_eml_upd := FALSE;
    --   
    IF pi_rec.p_k = gv_k THEN
      --
      pv_rec_e := pi_rec;
      pr_auth;
      --
      gv_prc_new_usr  := TRUE;
      pv_rec_e.usr_ky := NVL(pv_rec_e.usr_ky,0);
      --
      IF pv_rec_e.usr_ky = 0 THEN -- NEW
        --
        pv_rec_e.r_s := -1;
        --
        pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.usr_id, pi_dsc => 'Login ID', pi_pgm => 'PKWF_99_UMC.PR_PRC');
        pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.fir_nm, pi_dsc => 'First Name', pi_pgm => 'PKWF_99_UMC.PR_PRC');
        pkwf_99_vld.pr_reqd (pi_d => pv_rec_e.lst_nm, pi_dsc => 'Last Name',  pi_pgm => 'PKWF_99_UMC.PR_PRC');
        -- 
        IF pv_rec_e.rpt_nm IS NULL THEN        
          pv_rec_e.rpt_nm := UPPER(pv_rec_e.usr_id);
        END IF;
        --         
        --
      ELSE  -- UPDATE
        --
        IF pv_rec_e.usr_ky > 20 THEN
          --
          pr_load_rec (pi_key => pv_rec_e.usr_ky);
          --
          IF gr_ssu.r_k = pv_rec_e.usr_ky THEN -- record found
            --
            IF pkwf_99_gen.fn_pending_rec (gr_ssu.r_s) THEN
              NULL;
            ELSIF pkwf_99_gen.fn_approved_rec (gr_ssu.r_s) THEN 
              --
              IF gv_setup_usr THEN
                IF pkwf_99_atc.fn_iadm OR pkwf_99_atc.fn_ispt THEN
                  NULL;
                ELSE
                  pkwf_99_err.pr_raise (pi_id => '990144');      
                END IF;
              END IF;
              --              
              pv_rec_e.r_s      := gr_ssu.r_s;
              pv_rec_e.usr_id   := gr_ssu.lgn_id;
              pv_rec_e.usr_dm   := gr_ssu.usr_dm;
              --
              v_eml_upd := FALSE;
              IF UPPER(pv_rec_e.eml_adr) = UPPER(gr_ssu.eml_adr) THEN
                NULL;
              ELSIF pv_rec_e.eml_adr IS NULL THEN
                NULL;
              ELSIF gr_ssu.usr_dm = 'ADM' AND fn_auth THEN
                v_eml_upd := TRUE;
              ELSIF gr_ssu.usr_dm <> 'ADM' AND fn_auth THEN
                v_eml_upd := TRUE;       
              ELSE
                pkwf_99_err.pr_raise (pi_id => '990145', pi_p1 => 'to alter the EMAIL ADDRESS data. Processing not allowed');     
              END IF;
              -- 
              IF NOT v_eml_upd THEN
                pv_rec_e.eml_adr := gr_ssu.eml_adr;
              END IF;
              --              
              pr_auth;
              gv_prc_new_usr := FALSE;
              --            
            ELSE
              pkwf_99_xcp.pr_not_valid (pi_dsc => v_dsc||' Status');
            END IF;
            --
          ELSE
            pkwf_99_xcp.pr_not_found (pi_dsc => v_dsc);
          END IF;
          --
          pv_rec_e.r_s := gr_ssu.r_s;
          --
        ELSE
          pkwf_99_xcp.pr_no_execute_prv;
        END IF;
        --        
      END IF;
      --
      pr_val_pv_rec_e;
      --        
      IF pv_rec_e.usr_ky = 0 THEN -- INSERT
        --  
        gr_tbl.r_s    := -1;
        gr_tbl.sta_dm := 'P';
        gr_tbl.sta_dt := pkwf_99_dtm.fn_sys_dtm;
        --
        gr_tbl.r_k := 0;
        WHILE gr_tbl.r_k <= 100 LOOP -- Skip Reserved User Keys
          gr_tbl.r_k := pkwf_99_glb.fn_get_rk (pi_k => gv_k);
        END LOOP;
        --
        pkwf_99_trg.pr_set_sdml (gv_k);          
        INSERT INTO t_99_10_ssu VALUES gr_tbl;
        pkwf_99_trg.pr_reset_sdml; 
        --
        pv_rec_e.usr_ky := gr_tbl.r_k;
        pv_rec_e.r_s    := gr_tbl.r_s;
        --
        -- Auto-approve
        pr_apr_ssu (pi_key => pv_rec_e.usr_ky);
        --
        --
      ELSE 
        -- UPDATE
        IF pkwf_99_gen.fn_approved_rec (gr_ssu.r_s) THEN
          --
          gr_tbl.rst_lgn_yn := 1; -- force user to logout and login again
          --
          pkwf_99_trg.pr_set_sdml (gv_k);  
          UPDATE t_99_10_ssu
          SET fir_nm    = gr_tbl.fir_nm,
              lst_nm    = gr_tbl.lst_nm,
              sht_nm    = gr_tbl.sht_nm,
              lgg_dm    = gr_tbl.lgg_dm,
              gdr_dm    = gr_tbl.gdr_dm,
              edt_yn    = gr_tbl.edt_yn,
              vrf_yn    = gr_tbl.vrf_yn,
              apr_yn    = gr_tbl.apr_yn,              
              prm_phn   = gr_tbl.prm_phn,
              ttl_dsc   = gr_tbl.ttl_dsc,
              oth_rmk   = gr_tbl.oth_rmk,
              rst_lgn_yn = gr_tbl.rst_lgn_yn
          WHERE r_k = pv_rec_e.usr_ky;
          --
          IF v_eml_upd THEN
            -- Send Email first before updating
            pkwf_99_eml_msg.pr_eml_chng ( pi_k   => gv_k,
                                       pi_ky  => pv_rec_e.usr_ky,
                                       pi_ov  => gr_ssu.eml_adr,
                                       pi_nv  => gr_tbl.eml_adr);
            --             
            pkwf_99_trg.pr_set_sdml (gv_k);  
            UPDATE t_99_10_ssu
            SET eml_yn  = gr_tbl.eml_yn,
                eml_adr = gr_tbl.eml_adr
            WHERE r_k = pv_rec_e.usr_ky;  
            --            
          END IF;
          --
          pkwf_99_trg.pr_reset_sdml; 
          --
        ELSE
          --
          gr_tbl.sta_dm := 'P';
          --
          IF gr_tbl.usr_dm <> 'ADM' THEN
            pr_usr_lic; -- Validate Users license
          END IF;
          --          
          pkwf_99_trg.pr_set_sdml (gv_k);  
          UPDATE t_99_10_ssu
          SET lgn_id    = gr_tbl.lgn_id,
              usr_dm    = gr_tbl.usr_dm,
              sta_dm    = gr_tbl.sta_dm,
              fir_nm    = gr_tbl.fir_nm,
              lst_nm    = gr_tbl.lst_nm,
              sht_nm    = gr_tbl.sht_nm,
              lgg_dm    = gr_tbl.lgg_dm,
              eml_yn    = gr_tbl.eml_yn,
              gdr_dm    = gr_tbl.gdr_dm,
              edt_yn    = gr_tbl.edt_yn,
              vrf_yn    = gr_tbl.vrf_yn,
              apr_yn    = gr_tbl.apr_yn,
              lgp_ky    = gr_tbl.lgp_ky,
              cng_pw_yn = gr_tbl.cng_pw_yn,
              rst_lgn_yn = gr_tbl.rst_lgn_yn,
              prm_phn   = gr_tbl.prm_phn,
              eml_adr   = gr_tbl.eml_adr,
              ttl_dsc   = gr_tbl.ttl_dsc,
              oth_rmk   = gr_tbl.oth_rmk
          WHERE r_k = pv_rec_e.usr_ky;
          pkwf_99_trg.pr_reset_sdml;           
          --          
        END IF;
         --        
      END IF;
      --
      pi_rec := pv_rec_e;
      --
    ELSE
      pkwf_99_xcp.pr_raise_ivl_pgm (pi_pg => 'PKWF_99_UMC.PR_PRC');
    END IF;
    --
  END pr_prc;
  --
  --
  FUNCTION fn_dtl (pi_k IN VARCHAR2, pi_key IN NUMBER) RETURN v_99_99_umr%ROWTYPE IS
  BEGIN
    pr_clear_recs;
    pr_load_gvs;
    IF pi_k = gv_k THEN
      pr_load_dsp_rec (pi_key => pi_key);
      IF gr_ssu.r_k = pi_key THEN
        NULL;
      ELSE
        pr_clear_recs;
      END IF;
    END IF;
    RETURN pv_rec;
  END fn_dtl;
  --  
  FUNCTION fn_dtl_e (pi_k IN VARCHAR2, pi_key IN NUMBER) RETURN v_99_99_umr_e%ROWTYPE IS
  BEGIN
    pr_clear_recs;
    pr_load_gvs;
    IF  pi_key > 20 THEN    
      pr_load_rec (pi_key => pi_key);
      IF gr_ssu.r_k = pi_key THEN
        pr_load_edit_rec;
      END IF;
    END IF;
    RETURN pv_rec_e;
  END fn_dtl_e;
  --   
  PROCEDURE pr_del (pi_k IN VARCHAR2, pi_key NUMBER) IS
    v_dsc  VARCHAR2(100) := 'User record';
  BEGIN
    --
    pr_clear_recs;
    pr_load_gvs;
    IF  pi_key > 20 THEN
      --
      pr_load_rec (pi_key => pi_key);    
      --    
      IF gr_ssu.r_k = pi_key THEN
        --
        IF pkwf_99_gen.fn_pending_rec (gr_ssu.r_s) THEN -- Status of record
          --
          pr_auth;  
          --
          pkwf_99_trg.pr_set_sdml (gv_k);        
          DELETE FROM t_99_10_ssu WHERE r_k = pi_key AND r_s IN (-1,0);
          pkwf_99_trg.pr_reset_sdml;       
          --
        ELSIF pkwf_99_gen.fn_approved_rec (gr_ssu.r_s) THEN
          pkwf_99_xcp.pr_already_approved (pi_dsc => v_dsc);
        ELSE
          pkwf_99_xcp.pr_not_valid (pi_dsc => v_dsc);
        END IF;
        --
      ELSE
        pkwf_99_xcp.pr_not_found (pi_dsc => v_dsc);
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;      
    --
    pr_clear_recs;
    --
  END pr_del;
  --  
  PROCEDURE pr_apr (pi_k IN VARCHAR2, pi_key IN NUMBER) IS
  BEGIN
    pr_clear_recs;
    pr_load_gvs;
    IF  pi_key > 20 THEN    
      pr_apr_ssu (pi_key => pi_key);
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;      
    pr_clear_recs;
  END pr_apr;
  -- 
  PROCEDURE pr_lck (pi_k IN VARCHAR2, pi_key IN NUMBER) IS
    v_dt    DATE;
  BEGIN
    --
    pkwf_99_glb.pr_vld_conn;
    pr_load_gvs;
    --
    IF  pi_key > 20 THEN
      --
      pr_val_ssu (pi_key => pi_key); 
      IF gv_setup_usr THEN
        IF pkwf_99_atc.fn_iadm OR pkwf_99_atc.fn_ispt THEN
          NULL;
        ELSE
          pkwf_99_err.pr_raise (pi_id => '990144');      
        END IF;
      END IF;
      --
      IF pi_key = pkwf_99_glb.fn_usr_key (gv_k) THEN 
        pkwf_99_err.pr_raise (pi_id => '990097'); -- User cannot alter own status
      ELSIF gr_ssu.sta_dm = 'L' THEN
        pkwf_99_err.pr_raise (pi_id => '990095'); -- already locked          
      ELSIF gr_ssu.sta_dm = 'N' THEN 
        -- Update User Status  
        v_dt := pkwf_99_dtm.fn_sys_dt;          
        pkwf_99_trg.pr_set_sdml (pi_k => gv_k);
        UPDATE t_99_10_ssu SET
          sta_dm  = 'L',
          sta_dt  = v_dt
        WHERE r_k = pi_key;
        pkwf_99_trg.pr_reset_sdml; 
        --        
        -- Send Email
        pkwf_99_eml_msg.pr_usr_lck ( pi_k => gv_k, pi_ky => pi_key);
        --          
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --       
  END pr_lck;
  --  
  -- Unlock User
  PROCEDURE pr_ulck (pi_k IN VARCHAR2, pi_key IN NUMBER) IS
    v_dt    DATE;
  BEGIN
    --
    pkwf_99_glb.pr_vld_conn;
    pr_load_gvs;
    --  
    IF  pi_key > 20 THEN
      --
      pr_val_ssu (pi_key => pi_key);      
      --
      IF pi_key = pkwf_99_glb.fn_usr_key (gv_k) THEN 
        pkwf_99_err.pr_raise (pi_id => '990097'); -- User cannot alter own status
      ELSIF gr_ssu.sta_dm = 'N' THEN
        pkwf_99_err.pr_raise (pi_id => '990096'); -- already active          
      ELSIF gr_ssu.sta_dm = 'L' THEN 
        -- Update User Status  
        v_dt := pkwf_99_dtm.fn_sys_dt;          
        pkwf_99_trg.pr_set_sdml (pi_k => gv_k);
        UPDATE t_99_10_ssu SET
          sta_dm    = 'N',
          sta_dt    = v_dt,
          cng_pw_yn = 1 -- Must change password
        WHERE r_k = pi_key;
        pkwf_99_trg.pr_reset_sdml; 
        --  
        -- Refresh wallet details
        pkwf_99_swm.pr_mnt ( pi_pk   => gv_k,
                          pi_sk   => gr_ssu.r_k,
                          pi_sr   => 'T_99_10_SSU$ID',
                          pi_sd   => UPPER(gr_ssu.lgn_id));
        --                
        -- Send Email
        pkwf_99_eml_msg.pr_usr_ulck ( pi_k => gv_k, pi_ky => pi_key);
        --         
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --    
  END pr_ulck;
  --    
  PROCEDURE pr_rmv (pi_k IN VARCHAR2, pi_key IN NUMBER) IS
    v_dt      DATE;
    v_pw      VARCHAR2(100);
    v_yn      PLS_INTEGER;
    v_old_id  VARCHAR2(500) := NULL;
  BEGIN
    --
    pkwf_99_glb.pr_vld_conn;
    pr_load_gvs;
    --
    IF  pi_key > 20 THEN
      --
      pr_val_ssu (pi_key => pi_key); 
      IF gv_setup_usr THEN
        IF pkwf_99_atc.fn_iadm OR pkwf_99_atc.fn_ispt THEN
          NULL;
        ELSE
          pkwf_99_err.pr_raise (pi_id => '990144');      
        END IF;
      END IF;
      --      
      IF pi_key = pkwf_99_glb.fn_usr_key (gv_k) THEN
        pkwf_99_err.pr_raise (pi_id => '990097'); -- User cannot alter own status
      ELSIF gr_ssu.sta_dm = 'D' THEN -- Already deleted. 
        pkwf_99_err.pr_raise (pi_id => '990094');
      ELSIF pkwf_99_gen.fn_pending_rec (gr_ssu.r_s) THEN         
        -- Purge record
        pkwf_99_trg.pr_set_sdml (pi_k => gv_k);
        DELETE FROM t_99_10_ssu WHERE r_k = pi_key;          
        pkwf_99_trg.pr_reset_sdml; 
        --
      ELSIF pkwf_99_gen.fn_approved_rec (gr_ssu.r_s) THEN
        -- Account should first be locked before final (and irreversible) removal to prevent unintentional actions
        IF gr_ssu.sta_dm = 'N' THEN
          pkwf_99_err.pr_raise (pi_id => '990135');
        END IF;
        -- Reset Password
        pkwf_99_pwm.pr_reset_upw (pi_k => gv_k, pi_un => gr_ssu.lgn_id, pi_un_yn => 0, po_pw => v_pw);  
        --        
        v_old_id := gr_ssu.lgn_id;
        --
        -- Generate a new random 12-character Login ID 
        v_yn := 1;
        WHILE (v_yn = 1) LOOP
          gr_ssu.lgn_id := pkwf_99_ncr.fn_rans (pi_k => gv_k, pi_len => 12, pi_opt => 'a');
          BEGIN
            SELECT 1
            INTO v_yn
            FROM t_99_10_ssu
            WHERE UPPER(lgn_id) = UPPER(gr_ssu.lgn_id);
          EXCEPTION
            WHEN no_data_found THEN
              v_yn := 0;
            WHEN too_many_rows THEN
              v_yn := 1;
          END;
        END LOOP;          
        --
        -- Update User Status  
        v_dt := pkwf_99_dtm.fn_sys_dt;           
        pkwf_99_trg.pr_set_sdml (pi_k => gv_k);
        UPDATE t_99_10_ssu SET
          lgn_id = gr_ssu.lgn_id,
          sta_dm = 'D',
          sta_dt = v_dt
        WHERE r_k = pi_key;
        pkwf_99_trg.pr_reset_sdml; 
        --
        -- Remove wallet details
        pkwf_99_swm.pr_mnt ( pi_pk   => gv_k,
                          pi_sk   => pi_key,
                          pi_sr   => 'T_99_10_SSU$ID',
                          pi_sd   => UPPER(v_old_id),
                          pi_pg   => '1');        
        --                          
        --        
      ELSE
        -- Invalid Record
        pkwf_99_err.pr_raise (pi_id => '990069');
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --    
  END pr_rmv;
  -- 
  --
  FUNCTION fn_upw (pi_k VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    --
    IF pi_k = TO_CHAR(gv_prc_usrky) THEN
      RETURN gv_prc_usrpw;
    ELSE
      RETURN NULL;
    END IF; 
    --  
  END fn_upw;
  --  
  -- Reset Password
  PROCEDURE pr_rst_upw (pi_k IN VARCHAR2, pi_key IN NUMBER) IS
  BEGIN
    --
    pkwf_99_glb.pr_vld_conn;
    pr_load_gvs;
    --
    IF pi_key > 20 THEN
      --
      pr_val_ssu (pi_key => pi_key); 
      IF gv_setup_usr THEN
        IF pkwf_99_atc.fn_iadm OR pkwf_99_atc.fn_ispt THEN
          NULL;
        ELSE
          pkwf_99_err.pr_raise (pi_id => '990144');      
        END IF;
      END IF;
      --      
      IF gr_ssu.usr_dm = 'ADM' THEN
        pr_auth;
      ELSE
        pr_auth;
      END IF;      
      --
      IF pi_key = pkwf_99_glb.fn_usr_key (gv_k) THEN 
        pkwf_99_err.pr_raise (pi_id => '990097'); -- User cannot alter own status
      ELSIF gr_ssu.sta_dm = 'D' THEN -- Already deleted. 
        pkwf_99_err.pr_raise (pi_id => '990094');     
      ELSIF gr_ssu.sta_dm = 'L' THEN
        pkwf_99_err.pr_raise (pi_id => '990095'); -- locked          
      ELSIF gr_ssu.sta_dm = 'N' THEN
        -- 
        pkwf_99_pwm.pr_reset_upw (pi_k => gv_k, pi_un => gr_ssu.lgn_id, pi_un_yn => '0', po_pw => gv_prc_usrpw);
        --
        -- Remove wallet details
        pkwf_99_swm.pr_mnt ( pi_pk   => gv_k,
                          pi_sk   => gr_ssu.r_k,
                          pi_sr   => 'T_99_10_SSU$ID',
                          pi_sd   => UPPER(gr_ssu.lgn_id));        
        --            
        -- Refresh wallet details
        pkwf_99_swm.pr_mnt ( pi_pk   => gv_k,
                          pi_sk   => gr_ssu.r_k,
                          pi_sr   => 'T_99_10_SSU$ID',
                          pi_sd   => UPPER(gr_ssu.lgn_id));
        --         
        -- Send Email
        pkwf_99_eml_msg.pr_usr_cpw ( pi_k   => gv_k,
                                  pi_ky  => pi_key,
                                  pi_pw  => gv_prc_usrpw);
        --                                     
        gv_prc_usrky := pi_key;
        --       
        IF 1 = 2 THEN -- pkwf_99_pmr.fn_dsp_upw (gv_k) THEN
          NULL;
        ELSE
          gv_prc_usrpw := NULL;
        END IF; 
        --                         
      END IF;
      --
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --    
  END pr_rst_upw;
  --  
  PROCEDURE pr_val (pi_k IN VARCHAR2, pi_key IN NUMBER) IS
  BEGIN
    --
    pr_load_gvs;
    --
    IF pi_k = gv_k THEN
      pr_val_ssu (pi_key => pi_key); 
    ELSE
      pkwf_99_xcp.pr_no_execute_prv;
    END IF;
    --    
  END pr_val;
  -- 
END pkwf_99_umc;
/

