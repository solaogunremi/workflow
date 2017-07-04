CREATE OR REPLACE PACKAGE BODY pkwf_99_cur AS
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 23-JAN-2012
  ** Release Version  : 2.0
  **
  ** PURPOSE: Currency Definition
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
  --    
  pv_rec          v_99_vt_cur%ROWTYPE;
  pv_rec_e        v_99_vt_cur_e%ROWTYPE;
  --
  -- Data records
  pv_tbl          t_99_00_cur%ROWTYPE;  
  pv_tbl_i        t_99_00_cur%ROWTYPE;
  --
  --
  /* Private Routines */
  --
  -- Set Global Variables
  PROCEDURE pr_load_gvs IS
  BEGIN
    --
    gv_valid_admin := FALSE;
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    gv_valid_admin := pk99_atc.fn_sadm; 
    --
  END pr_load_gvs;
  --  
  -- Validate Edit privilege
  PROCEDURE pr_auth IS
  BEGIN
    pk99_prv.pr_curdfn_e;
  END pr_auth;
  --
  -- Clear package variables
  PROCEDURE pr_clear_recs IS
  BEGIN
    pv_tbl     := NULL;
    pv_rec     := NULL;
    pv_rec_e   := NULL;
  END pr_clear_recs;
  -- 
  -- Format edit record
  PROCEDURE pr_fmt_pv_rec_e IS
  BEGIN
    pv_rec_e.cur_id      := UPPER(pv_rec_e.cur_id); 
    pv_rec_e.cur_dsc     := pv_rec_e.cur_dsc; 
    pv_rec_e.unt_dsc     := pv_rec_e.unt_dsc; 
    pv_rec_e.sunt_dsc    := pv_rec_e.sunt_dsc; 
  END pr_fmt_pv_rec_e;
  --
  -- Load edit record from database record
  PROCEDURE pr_load_edit_rec IS
  BEGIN
    --
    pv_rec_e := NULL;
    --
    pv_rec_e.cur_ky        :=  pv_tbl.r_k;
    pv_rec_e.cur_id        :=  pv_tbl.cur_id; 
    pv_rec_e.cur_dsc       :=  pv_tbl.cur_dsc;
    pv_rec_e.unt_dsc       :=  pv_tbl.unt_dsc;
    pv_rec_e.sunt_dsc      :=  pv_tbl.sub_unt_dsc;
    pv_rec_e.lcc_yn        :=  pv_tbl.lcc_yn; 
    pv_rec_e.ius_yn        :=  pv_tbl.ius_yn; 
    pv_rec_e.remarks       :=  pv_tbl.rmk;
   
  END pr_load_edit_rec;
  --  
  PROCEDURE pr_load_tbl_rec (pi_rk IN NUMBER DEFAULT NULL, pi_id IN VARCHAR2 DEFAULT NULL) IS
    CURSOR c_tbl_rec IS
      SELECT *
        FROM t_99_00_cur
       WHERE (r_k = pi_rk OR cur_id = pi_id);
  BEGIN
    --
    pv_tbl := NULL;
    --
    OPEN c_tbl_rec;
    FETCH c_tbl_rec INTO pv_tbl;
    CLOSE c_tbl_rec;
    --
  END pr_load_tbl_rec;
  --  
  PROCEDURE pr_load_dsp_rec (pi_rk IN NUMBER) IS
  BEGIN
    --
    pr_clear_recs;
    --
    pr_load_tbl_rec (pi_rk => pi_rk);
    --
    IF pv_tbl.r_k = pi_rk THEN
      --
      pv_rec.cur_ky          :=  pv_tbl.r_k;
      pv_rec.cur_id          :=  pv_tbl.cur_id;
      pv_rec.cur_dsc         :=  pv_tbl.cur_dsc; 
      pv_rec.unt_dsc         :=  pv_tbl.unt_dsc;
      pv_rec.sunt_dsc        :=  pv_tbl.sub_unt_dsc;          
      pv_rec.remarks         :=  pv_tbl.rmk;
      --
      IF pv_tbl.ius_yn = 1 THEN
        pv_rec.use_yn_dsc :=  'Yes';
      ELSE
        pv_rec.use_yn_dsc :=  'No';
      END IF;
      IF pv_tbl.lcc_yn = 1 THEN
        pv_rec.lcc_yn_dsc :=  'Yes';
      ELSE
        pv_rec.lcc_yn_dsc :=  'No';
      END IF;      
      --
    END IF;
    --
  END pr_load_dsp_rec;
  --  
  --
  PROCEDURE pr_val_pv_rec_e IS
    v_yn    VARCHAR2(1);
    v_dsc   VARCHAR2(500);
    CURSOR c_cur_id IS
      SELECT '1'
        FROM t_99_00_cur
       WHERE UPPER(cur_id) = UPPER(pv_rec_e.cur_id)
         AND r_k <> NVL(pv_rec_e.cur_ky,0); 
  BEGIN
    -- 
    pk99_vld.pr_reqd (pi_d => pv_rec_e.cur_id, pi_dsc =>  'Currency ID');
    pk99_vld.pr_reqd (pi_d => pv_rec_e.cur_dsc, pi_dsc => 'Currency Description'); 
    pk99_vld.pr_reqd (pi_d => pv_rec_e.unt_dsc, pi_dsc =>  'Currency Unit Description');
    pk99_vld.pr_reqd (pi_d => pv_rec_e.sunt_dsc, pi_dsc => 'Currency Sub-Unit Description');     
    --    
    -- Check Currency ID is not already in use - Duplicates Not Allowed
    v_yn := NULL;
    OPEN  c_cur_id;
    FETCH c_cur_id INTO v_yn;
    CLOSE c_cur_id;
    IF v_yn = '1' THEN
      pk99_xcp.pr_raise_is_in_use (pi_dsc => 'Currency ID "'||pv_rec_e.cur_id||'"'); 
    END IF;
    -- 
    -- Local Currency
    IF pv_rec_e.cur_ky > 0 THEN
      IF fn_local_cur_id = pv_rec_e.cur_id THEN
        pv_rec_e.lcc_yn := 1;
        pv_rec_e.ius_yn := 1;
      ELSE
        pv_rec_e.lcc_yn := 0;
      END IF;
    ELSE
      IF fn_local_cur_id IS NULL THEN
        IF pv_rec_e.lcc_yn = 1 THEN
          pv_rec_e.ius_yn := 1;
        ELSE
          v_dsc := 'Local Currency Code has not yet been setup; it must be defined first before any other currency. Processing';
          pk99_xcp.pr_not_allowed (pi_dsc => v_dsc);           
        END IF;
      ELSIF pv_rec_e.lcc_yn = 1 THEN
        v_dsc := 'Another Currency Code has already been defined as the Local Currency. Duplicates';
        pk99_xcp.pr_not_allowed (pi_dsc => v_dsc);          
      ELSE
        pv_rec_e.lcc_yn := 0;
      END IF;
    END IF;
    --
    IF pv_rec_e.ius_yn = 1 THEN
      NULL;
    ELSE
      pv_rec_e.ius_yn := 0;
    END IF;
    -- 
    pv_tbl_i := NULL;
    --
    pv_tbl_i.cur_id       :=  pv_rec_e.cur_id; 
    pv_tbl_i.cur_dsc      :=  pv_rec_e.cur_dsc; 
    pv_tbl_i.unt_dsc      :=  pv_rec_e.unt_dsc; 
    pv_tbl_i.sub_unt_dsc  :=  pv_rec_e.sunt_dsc; 
    pv_tbl_i.lcc_yn       :=  pv_rec_e.lcc_yn; 
    pv_tbl_i.ius_yn       :=  pv_rec_e.ius_yn; 
    pv_tbl_i.rmk          :=  pv_rec_e.remarks;
    --    
  END pr_val_pv_rec_e;
  --  
  --
  /* Public Routines */
  --  
  PROCEDURE pr_prc (pi_rec IN OUT v_99_vt_cur_e%ROWTYPE) IS
    v_dsc  VARCHAR2(100) := 'Currency record';
  BEGIN
    --    
    pr_load_gvs;
    --
    -- 1. Check Edit Priviledge
    IF pi_rec.pi_k = gv_k AND gv_valid_admin THEN  
      pr_auth;
    ELSE
      pk99_xcp.pr_no_execute_prv;
    END IF;
    --
    -- 2. Clear Package variables
    pr_clear_recs;
    --  
    -- 3. Assign input record to package variable
    pv_rec_e := pi_rec;
    --
    pv_rec_e.cur_ky := NVL(pv_rec_e.cur_ky,0);
    --
    IF pv_rec_e.cur_ky = 0 THEN -- NEW
      NULL;
    ELSE  -- UPDATE
      --
      pr_load_tbl_rec (pi_rk => pv_rec_e.cur_ky);
      --
      IF pv_tbl.r_k = pv_rec_e.cur_ky THEN -- record found
        pv_rec_e.cur_id   := pv_tbl.cur_id;
        pv_rec_e.lcc_yn   := pv_tbl.lcc_yn;
        pv_rec_e.cur_dsc  := NVL(pv_rec_e.cur_dsc,pv_tbl.cur_dsc);
        pv_rec_e.unt_dsc  := NVL(pv_rec_e.unt_dsc,pv_tbl.unt_dsc);
        pv_rec_e.sunt_dsc := NVL(pv_rec_e.sunt_dsc,pv_tbl.sub_unt_dsc);
      ELSE
        pk99_xcp.pr_not_found (pi_dsc => v_dsc);
      END IF;
      --
    END IF;
    --
    pr_fmt_pv_rec_e;
    pr_val_pv_rec_e;
    --  
    --
     IF pv_rec_e.cur_ky = 0 THEN -- INSERT
      --  
      pv_tbl_i.r_k := pk99_glb.fn_get_cor_rk (pi_k => gv_k);
      --
      pk99_trg.pr_set_smnt (gv_k);     
      INSERT INTO t_99_00_cur VALUES pv_tbl_i;
      pk99_trg.pr_reset_sdml; 
      --
      pv_rec_e.cur_ky := pv_tbl_i.r_k;
      --
    ELSE -- UPDATE
      --
      pk99_trg.pr_set_smnt (gv_k);  
      UPDATE t_99_00_cur
         SET cur_dsc      =  pv_tbl_i.cur_dsc, 
             unt_dsc      =  pv_tbl_i.unt_dsc, 
             sub_unt_dsc  =  pv_tbl_i.sub_unt_dsc,       
             lcc_yn       =  pv_tbl_i.lcc_yn,              
             ius_yn       =  pv_tbl_i.ius_yn, 
             rmk          =  pv_tbl_i.rmk 
       WHERE r_k =  pv_rec_e.cur_ky;  
       pk99_trg.pr_reset_sdml;        
    END IF;
    --
    --  Sync with Old SA
    IF pk99_pmr.fn_oldsa_intrf THEN
      pk99$$sym_sa_mnt.pr_curr (pi_k => gv_k);
    END IF;
    --      
    pi_rec := pv_rec_e; 
    --
  END pr_prc;
  --
  --
  FUNCTION fn_edt_prv (pi_k IN VARCHAR2) RETURN BOOLEAN IS
    v_yn VARCHAR2(1) := '0'; 
  BEGIN
    --
    pr_load_gvs;
    --
    IF pi_k = gv_k AND gv_valid_admin AND pk99_prv.fn_curdfn_e THEN  
      v_yn := '1';
    END IF;
    --  
    IF v_yn = '1' THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
    --
  END fn_edt_prv;
  --
  --
  FUNCTION fn_dtl (pi_rk IN NUMBER) RETURN v_99_vt_cur%ROWTYPE IS
  BEGIN
    pr_clear_recs;
    pr_load_dsp_rec (pi_rk => pi_rk);
    IF pv_tbl.r_k = pi_rk THEN -- record found
      NULL;
    ELSE
      pr_clear_recs;
    END IF;
    RETURN pv_rec;
  END fn_dtl;
  --
  FUNCTION fn_dtl_e (pi_rk IN NUMBER) RETURN v_99_vt_cur_e%ROWTYPE IS
  BEGIN
    pr_clear_recs;
    pr_load_tbl_rec (pi_rk => pi_rk);
    IF pv_tbl.r_k = pi_rk THEN
      pr_load_edit_rec;
    END IF;
    RETURN pv_rec_e;
  END fn_dtl_e;
  --   
  PROCEDURE pr_val (pi_id IN VARCHAR2) IS
    v_dsc   VARCHAR2(100) := 'Currency ID "'||pi_id||'"';    
  BEGIN
    --
    pr_clear_recs;
    pr_load_tbl_rec (pi_id => pi_id);    
    --
    IF pv_tbl.cur_id = pi_id THEN
      IF NOT (pv_tbl.ius_yn = 1) THEN
        v_dsc := v_dsc||' definition in SYSTEM SECURITY is not in use. Further processing';
        pk99_xcp.pr_not_allowed (pi_dsc => v_dsc); 
      END IF;
      IF pv_tbl.lcc_yn = 1 THEN
        NULL;
      ELSIF fn_local_cur_id IS NULL THEN
        v_dsc := 'Local Currency Code has not yet been defined in the SYSTEM SECURITY module. Further Processing';
        pk99_xcp.pr_not_allowed (pi_dsc => v_dsc);        
      END IF;
    ELSE
      v_dsc := v_dsc||' definition does not exist in the SYSTEM SECURITY module. Further processing';
      pk99_xcp.pr_not_allowed (pi_dsc => v_dsc);
    END IF;
    --
  END pr_val;
  --    
  FUNCTION fn_dsc (pi_id IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_clear_recs;
    pr_load_tbl_rec (pi_id => pi_id);    
    RETURN pv_tbl.cur_dsc;
  END fn_dsc;
  -- 
  FUNCTION fn_unt_dsc (pi_id IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_clear_recs;
    pr_load_tbl_rec (pi_id => pi_id);    
    RETURN pv_tbl.unt_dsc;
  END fn_unt_dsc;
  --
  FUNCTION fn_sub_unt_dsc (pi_id IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_clear_recs;
    pr_load_tbl_rec (pi_id => pi_id);    
    RETURN pv_tbl.sub_unt_dsc;
  END fn_sub_unt_dsc;
  -- 
  FUNCTION fn_local_cur_id RETURN VARCHAR2 IS
    v_out  VARCHAR2(100) := NULL;
    CURSOR c_tbl_rec IS
      SELECT cur_id
        FROM t_99_00_cur
       WHERE lcc_yn = 1;
  BEGIN
    OPEN c_tbl_rec;
    FETCH c_tbl_rec INTO v_out;
    CLOSE c_tbl_rec;
    RETURN v_out;
  END fn_local_cur_id;
  --  
  FUNCTION fn_lov RETURN OT$_99_LOV_ID_TB PIPELINED IS
    --
    t_lv        OT$_99_LOV_ID_TB := OT$_99_LOV_ID_TB();  
    v_cr        OT$_99_LOV_ID := OT$_99_LOV_ID();
    --
    CURSOR cur_rec IS
    SELECT *
    FROM t_99_00_cur
    WHERE ius_yn = 1
    ORDER BY DECODE(lcc_yn,1,2), cur_dsc;
    --
  BEGIN
    --
    t_lv.DELETE;
    --
    FOR cr IN cur_rec LOOP
      v_cr     := OT$_99_LOV_ID();
      v_cr.id  := cr.cur_id;
      v_cr.dsc := cr.cur_dsc;         
      PIPE ROW (v_cr);
    END LOOP;
    --
    RETURN;
    --
  END fn_lov;
  --  
  FUNCTION fn_lst RETURN OT$_99_LOV_CUR_LST_TB PIPELINED IS
    --
    t_lv        OT$_99_LOV_CUR_LST_TB := OT$_99_LOV_CUR_LST_TB();  
    v_cr        OT$_99_LOV_CUR_LST := OT$_99_LOV_CUR_LST ();
    --
    CURSOR cur_rec IS
    SELECT *
    FROM t_99_00_cur;
    --
  BEGIN
    --
    t_lv.DELETE;
    --
    FOR cr IN cur_rec LOOP
      v_cr          := OT$_99_LOV_CUR_LST ();
      v_cr.id       := cr.cur_id;
      v_cr.dsc      := cr.cur_dsc;    
      v_cr.lcc_yn   := cr.lcc_yn;
      v_cr.ius_yn   := cr.ius_yn;        
      v_cr.unt_dsc  := cr.unt_dsc;
      v_cr.sunt_dsc := cr.sub_unt_dsc;       
      PIPE ROW (v_cr);
    END LOOP;
    --
    RETURN;
    --
  END fn_lst;
  --   
END pkwf_99_cur;
/
