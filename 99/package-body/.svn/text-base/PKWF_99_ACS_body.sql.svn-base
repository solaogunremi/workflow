CREATE OR REPLACE PACKAGE BODY pkwf_99_acs AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: Access Security Routines
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
  gv_k            VARCHAR2(100);
  gv_setup_usr    VARCHAR2(30) := 'SETUP';
  gv_setup_key    NUMBER := 100;  
  gv_valid_usr    BOOLEAN := FALSE;
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
  FUNCTION fn_get_user_dtl (pi_uk NUMBER) RETURN v_99_99_usr%ROWTYPE IS
    --
    v_n         PLS_INTEGER;
    v_lgn_id    VARCHAR2(4000);
    v_r         v_99_99_usr%ROWTYPE;
    --
    CURSOR cur_lgp IS
    SELECT lgp_dsc
    FROM t_99_11_lgp
    WHERE r_k = v_r.lgp_ky
    AND   r_s = 1;
    --
  BEGIN
    --
    v_r := NULL;
    gv_valid_usr := FALSE;
    --    
    FOR cr IN (SELECT * 
               FROM t_99_10_ssu
               WHERE r_k = pi_uk
               AND   r_k > 20) LOOP -- reserved
      --
      v_r := NULL;
      gv_valid_usr := FALSE;
      --
      IF UPPER(cr.lgn_id) = gv_setup_usr OR cr.r_k = gv_setup_key THEN
        gv_valid_usr := TRUE;
      ELSE
        v_lgn_id := pkwf_99_swm.fn_datc (pi_pk   => gv_k,
                                      pi_sk   => cr.r_k,
                                      pi_sr   => 'T_99_10_SSU$ID');
        IF UPPER(v_lgn_id) = UPPER(cr.lgn_id) THEN
          gv_valid_usr := TRUE;
        END IF;
      END IF;
      --
      --
      v_r.usr_ky := cr.r_k;
      v_r.usr_id := cr.lgn_id;
      IF cr.sta_dm = 'D' THEN -- Deleted
        v_r.usr_id := 'Deleted-User';
      END IF;
      v_r.fir_nm := cr.fir_nm;
      v_r.lst_nm := cr.lst_nm;
      v_r.sht_nm := cr.sht_nm;
      v_r.ful_nm := SUBSTR((UPPER(cr.lst_nm)||' '||INITCAP(cr.fir_nm)),1,100);
      --
      v_r.gdr_dm := cr.gdr_dm;
      IF cr.gdr_dm IS NOT NULL THEN
        v_r.gdr_dsc := pkwf_99_dmv.fn_gdr_dsc (pi_k => gv_k, pi_d => cr.gdr_dm);
      END IF;
      --
      v_r.usr_dm := cr.usr_dm;
      v_r.usr_dsc := pkwf_99_dmv.fn_usr_typ_dsc (pi_k => gv_k, pi_usr_dm => cr.usr_dm);
      IF v_r.usr_dsc IS NULL THEN 
        v_r.usr_dsc := 'INVALID';
      END IF;
      --    
      v_r.sta_dm := cr.sta_dm;
      v_r.sta_dsc := pkwf_99_dmv.fn_usr_sta_dsc (pi_k => gv_k, pi_sta_dm => cr.sta_dm);
      IF v_r.sta_dsc IS NULL THEN 
        v_r.sta_dsc := 'INVALID';
      END IF;
      --
      v_r.sta_dt := cr.sta_dt;
      v_r.ttl_dsc := cr.ttl_dsc;      
      --
      v_r.acs_yn := 0;     
      --   
      IF UPPER(cr.lgn_id) = gv_setup_usr OR cr.r_k = gv_setup_key THEN
        v_r.usr_dm := 'ADM';
        v_r.acs_yn := 1;
      END IF;   
      --        
      IF pkwf_99_pmr.fn_restrict_usr_acs (pi_k => gv_k, pi_usr_typ => cr.usr_dm) THEN
        NULL;
      ELSE
        IF cr.sta_dm = 'N' AND cr.usr_dm IN ('GST','EXT','EXE','MGR','USR','DEU') THEN
          v_r.acs_yn := 1;
        END IF; 
      END IF;
      --
      v_r.adm_yn := 0;
      IF cr.usr_dm = 'ADM' THEN 
        v_r.adm_yn := 1;
      END IF;
      --
      IF cr.usr_dm = 'GST' THEN 
        v_r.edt_yn := 0;
        v_r.vrf_yn := 0;
        v_r.apr_yn := 0;      
      ELSE
        v_r.edt_yn := cr.edt_yn;
        v_r.vrf_yn := cr.vrf_yn;
        v_r.apr_yn := cr.apr_yn;
      END IF;
      --
      -- Change Password
      IF cr.cng_pw_yn = 0 THEN 
        IF pkwf_99_pwm.fn_is_exp (pi_k => gv_k, pi_uk => cr.r_k) THEN -- Expired
          v_r.cpw_yn := 1;
        ELSE
          v_r.cpw_yn := 0;
        END IF;
      ELSE
        v_r.cpw_yn := 1;
      END IF;
      --
      -- Reset Login
      IF cr.rst_lgn_yn = 1 THEN 
        v_r.rlgn_yn := 1;
      ELSE
        v_r.rlgn_yn := 0;
      END IF;  
      --
      v_r.lgp_ky := cr.lgp_ky;
      IF cr.lgp_ky > 0 THEN
        OPEN cur_lgp;
        FETCH cur_lgp INTO v_r.lgp_dsc;
        CLOSE cur_lgp;
      END IF;
      --
      --
      v_r.lin_dt      := CAST(cr.lst_lgn_dt AS DATE);
      v_r.lin_dt_dsc  := pkwf_99_dtm.fn_dtm_dsc(cr.lst_lgn_dt);
      v_r.lin_cnt     := NVL(cr.lgn_cnt,0);
      v_r.cpw_dt      := CAST(cr.lst_pw_dt AS DATE);
      v_r.cpw_dt_dsc  := pkwf_99_dtm.fn_dtm_dsc(cr.lst_pw_dt);
      v_r.cpw_cnt     := NVL(cr.pw_cnt,0);
      --        
      v_r.lgg_dm      := cr.lgg_dm;
      v_r.eml_adr     := cr.eml_adr;
      v_r.adr_l1      := cr.adr_l1;
      v_r.adr_l2      := cr.adr_l2;
      v_r.adr_cty     := cr.adr_cty;
      v_r.prm_phn     := cr.prm_phn;
      v_r.sms_phn     := cr.sms_phn;
      v_r.oth_rmk     := cr.oth_rmk;
      --    
      v_r.flx1 := cr.fl_01;
      v_r.flx2 := cr.fl_02;
      v_r.flx3 := cr.fl_03;
      v_r.flx4 := cr.fl_04;
      v_r.flx5 := cr.fl_05;
      --         
      --      
    END LOOP;
    --
    IF pi_uk BETWEEN 1 AND 20 THEN
      --
      /*
      pkwf_99_ssi.pr_ssi_dtl ( pi_k      => gv_k,
                            pi_uk     => pi_uk,
                            po_itl    => v_lgn_id,
                            po_id     => v_r.usr_id,
                            po_dsc    => v_r.sht_nm,
                            po_nme    => v_r.ful_nm,
                            po_dm     => v_r.usr_dm); 
      */                            
      --   
      IF v_r.usr_id IS NULL OR v_r.usr_dm IS NULL THEN
        v_r := NULL;
      ELSE
        --
        gv_valid_usr := TRUE;
        v_r.usr_ky := pi_uk;
        --
        v_n := INSTR(v_r.ful_nm,'');
        IF v_n > 0 THEN
          v_r.fir_nm := SUBSTR(v_r.ful_nm,1,v_n);
          v_r.lst_nm := SUBSTR(v_r.ful_nm,v_n+1,50);
        ELSE
          v_r.lst_nm := SUBSTR(v_r.ful_nm,1,50);
        END IF;
        --
        v_r.sht_nm := NULL;
        --
        IF v_r.usr_dm = 'ADM' THEN
          v_r.adm_yn := 1;
        ELSE
          v_r.adm_yn := 0;
        END IF;
        --
        v_r.cpw_yn  := 0; 
        v_r.rlgn_yn := 0; 
        v_r.sta_dm := 'N';
        v_r.acs_yn := 1;
        -- 
        v_r.usr_dsc := 'Internal'; -- pkwf_99_dmv.fn_usr_typ_dsc (pi_k => gv_k, pi_usr_dm => v_r.usr_dm);        
        v_r.sta_dsc := pkwf_99_dmv.fn_usr_sta_dsc (pi_k => gv_k, pi_sta_dm => v_r.sta_dm);
        --
      END IF;
      --
    END IF;
    --
    -- 
    IF gv_valid_usr THEN
      NULL;
    ELSE
      v_r.acs_yn := 0; -- No Access 
    END IF;
    --
    --
    RETURN v_r;    
    --
  END fn_get_user_dtl;
  --  
  --       
  /* Public Routines */
  --  
  FUNCTION fn_usr_dtl (pi_k VARCHAR2, pi_uk NUMBER) RETURN v_99_99_usr%ROWTYPE IS
    r_u     v_99_99_usr%ROWTYPE;
  BEGIN
    r_u := NULL;
    pr_load_gvs;
    IF pi_uk > 0 THEN
      r_u := fn_get_user_dtl (pi_uk => pi_uk);
    END IF;
    RETURN r_u;
  END fn_usr_dtl;
  --
  FUNCTION fn_usr_dtl1 (pi_k VARCHAR2, pi_id VARCHAR2) RETURN v_99_99_usr%ROWTYPE IS
    --
    v_k  NUMBER;
    v_n  VARCHAR2(500);
    --
    r_u     v_99_99_usr%ROWTYPE;
    --    
    CURSOR c_usrs IS
    SELECT r_k
    FROM t_99_10_ssu
    WHERE r_s = 1
    AND   r_k > 20 -- reserved
    AND   UPPER(lgn_id) = v_n;
    --
  BEGIN
    --
    r_u := NULL;
    --
    v_n := UPPER(SUBSTR(pi_id,1,100));
    v_k := 0;
    --
    pr_load_gvs;
    --
    IF v_n IS NOT NULL THEN
      --
      OPEN c_usrs;
      FETCH c_usrs INTO v_k;
      CLOSE c_usrs;
      --
      IF v_k > 20 THEN
        NULL;
      ELSE -- Check if INTERNAL
        v_k := pkwf_99_ssi.fn_ssi_ky (pi_k => gv_k, pi_d => v_n);
      END IF;
      --
      IF v_k > 0 THEN
        r_u := fn_get_user_dtl (pi_uk => v_k);
      END IF;
      --
    END IF;
    --
    RETURN r_u;
    --
  END fn_usr_dtl1;
  --  
END pkwf_99_acs;
/

