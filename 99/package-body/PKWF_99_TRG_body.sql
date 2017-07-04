CREATE OR REPLACE PACKAGE BODY pkwf_99_trg AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 30-APR-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: INTERNAL Tables Triggers processing
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
  gv_k          VARCHAR2(100);    -- Checks for validity of calling programs
  gv_sys_dml    PLS_INTEGER;      -- SYSTEM DML flag
  gv_ext_usr_ky NUMBER := 19;     -- EXTERNAL USER
  --
  --
  /* Private Routines */
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    gv_k := NULL;
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
  END pr_load_gvs;
  --    
  PROCEDURE pr_no_dml (pi_trg_name VARCHAR2 DEFAULT NULL) IS
  BEGIN
    gv_sys_dml := 0;
    RAISE_APPLICATION_ERROR (-20000, 'Record may not be inserted, modified or deleted [Ref: '||pi_trg_name||'].');
  END pr_no_dml;
  --
  PROCEDURE pr_no_core_dml (pi_trg_name VARCHAR2 DEFAULT NULL) IS
  BEGIN
    gv_sys_dml := 0;
    RAISE_APPLICATION_ERROR (-20000, 'System data may not be modified or removed.');
  END pr_no_core_dml;
  -- 
  PROCEDURE pr_no_core_lgg_dml (pi_trg_name VARCHAR2 DEFAULT NULL) IS
  BEGIN
    gv_sys_dml := 0;
    RAISE_APPLICATION_ERROR (-20000, 'Language data processing not applicable.');
  END pr_no_core_lgg_dml;
  --
  PROCEDURE pr_no_core_lgg_del IS
  BEGIN
    gv_sys_dml := 0;
    RAISE_APPLICATION_ERROR (-20000, 'Record already defined in one or more languages which should be deleted first.');
  END pr_no_core_lgg_del;  
  -- 
  FUNCTION fn_block_demo_update (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF pi_tbl_nme IN ('T_99_00_DMV','T_99_00_SSI','T_99_00_PMV','T_99_00_ROL') THEN 
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;    
  END fn_block_demo_update;    
  --  
  FUNCTION fn_allow_external_usr (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF pi_tbl_nme IN ('T_99_22_MSG_APR','T_99_22_MSG_APR_ARC','T_99_30_BLB','T_99_20_JRXML','Z') THEN 
      RETURN TRUE; 
    ELSE
      RETURN FALSE;
    END IF;    
  END fn_allow_external_usr;    
  --    
  --  
  /* Public Routines */
  --  
  -- SECURITY TABLES trigger processing
  PROCEDURE pr_trg10 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
    --
    v1      v_99_99_trg%ROWTYPE;   
    --
    v_x     PLS_INTEGER;
    v_t     VARCHAR2(100);
    --
    FUNCTION fn_never_allow_delete (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('T_99_10_PWR') THEN -- Password Rules
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_never_allow_delete;    
    --   
    FUNCTION fn_never_allow_insert (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('T_99_10_PWR') THEN -- Password Rules
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_never_allow_insert;    
    --       
    PROCEDURE pr_allow_sys_mnt_applic IS
    BEGIN
      IF v_t IN ('T_99_10_PWR','T_99_10_SSU') THEN -- Password Rules, Users
        NULL;
      ELSE
        pr_reset_sdml;
        pr_no_core_dml (pi_trg_name => v1.t_n); -- DML is prohibited
      END IF;
    END pr_allow_sys_mnt_applic;
    -- 
    FUNCTION fn_allow_auto_approve (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('T_99_11_AGR','T_99_11_AGS','T_99_11_AGU','T_99_11_MDU','T_99_11_CPU') THEN 
        RETURN TRUE;
      ELSIF pi_tbl_nme IN ('T_99_50_CUM','T_99_50_OFR','T_99_50_LOC','T_99_50_TRN','T_99_50_CPM','T_99_50_HDY') THEN 
        RETURN TRUE;         
      ELSIF pi_tbl_nme LIKE 'T_99_2%' THEN
        RETURN TRUE;        
      ELSIF pi_tbl_nme LIKE 'T_99_1%' THEN
        RETURN FALSE;
      ELSIF pi_tbl_nme LIKE 'T_99_5%' THEN
        RETURN TRUE;           
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_allow_auto_approve;    
    --        
  BEGIN
    --
    pr_load_gvs;
    --
    v1 := p1;
    v1.t_n := UPPER(v1.t_n);
    -- Table Name
    v_x := LENGTH(v1.t_n) - 3; -- strip off the "_TB" part of the trigger name
    v_t := SUBSTR(v1.t_n,1,v_x); 
    --  
    -- Set flag for tables that could be updated from SYSTEM MAINTENANCE application
    IF gv_sys_dml = 9 THEN
      pr_allow_sys_mnt_applic;
    END IF;
    --
    -- Validate Session Connection
    IF gv_sys_dml = 1 THEN -- DML is initiated by another Procedure.
      NULL;
    ELSIF gv_sys_dml = 9 THEN -- SYSTEM Maintenance
      NULL;
    ELSE
      pkwf_99_glb.pr_vld_conn;
    END IF;
    --
    IF v1.p_a = 0 THEN -- PROCESSING ACTION=0 : DML is prohibited
      pr_no_dml (pi_trg_name => v1.t_n);
    ELSIF v1.p_a IN (1,9) AND v1.t_a IN (1, 2, 3) THEN
      --
      IF v1.p_a = 9 THEN -- allow direct DML
        gv_sys_dml := 0;
      ELSE -- DML only through procedures/functions OR System Maintenance
        IF (gv_sys_dml = 1) OR (gv_sys_dml = 9) THEN  
          NULL;
        ELSE
          pr_no_dml (pi_trg_name => v1.t_n);
        END IF;
      END IF;
      --
      IF v1.o_rs = 2 THEN -- Rejected record: OLD RECORD STATUS=2
        IF NOT (gv_sys_dml = 1) THEN  
          pr_no_dml (pi_trg_name => v1.t_n);
        END IF;
      END IF;
      --
      v1.s_dtm := pkwf_99_dtm.fn_sys_dtm;
      v1.s_tmm := pkwf_99_dtm.fn_sys_tmm;
      --
      IF gv_sys_dml = 9 THEN
        v1.s_ky := NULL; -- Not applicable
      ELSE
        v1.s_ky := pkwf_99_glb.fn_usr_key (pi_k => gv_k);
        IF v1.s_ky IS NULL AND fn_allow_external_usr (v_t) THEN
          v1.s_ky := gv_ext_usr_ky;
        END IF;
      END IF;
      --
      IF v1.t_a = 1 THEN -- INSERTING
        --
        IF fn_never_allow_insert (v_t) THEN
          pr_no_dml (pi_trg_name => v1.t_n);      
        END IF;
        --        
        v1.i_tm := v1.s_tmm;
        v1.i_ky := v1.s_ky;
        --
        IF v1.r_k = -9 THEN
          NULL; -- Table does not have Record Key column
        ELSIF NVL(v1.r_k,0) = 0 THEN -- Record Key
          IF (gv_sys_dml = 9) THEN
            v1.r_k := pkwf_99_glb.fn_get_cor_rk (pi_k => gv_k);
          ELSE
            v1.r_k := pkwf_99_glb.fn_get_rk (pi_k => gv_k);
          END IF;
        END IF;
        --
        IF v1.n_rs = 1 AND fn_allow_auto_approve(v_t) THEN -- Auto-approve
          v1.a_tm := v1.s_tmm;
          v1.a_ky := v1.s_ky;    
        ELSIF v1.n_rs IN (-1,0) THEN -- Record Status
          NULL;
        ELSE
          v1.n_rs := 0; 
        END IF;
        --
      ELSIF v1.t_a = 2 THEN 
        --
        IF v1.o_rs IN (-1,0) AND v1.n_rs IN (-1,0) THEN -- AMENDING a Pending record
          v1.t_a := 6;
          v1.i_tm := v1.s_tmm;
          v1.i_ky := v1.s_ky;    
        ELSIF v1.o_rs IN (-1,0) AND v1.n_rs IN (1,2) THEN -- APPROVING/REJECTING a Pending record
          v1.t_a := 7;
          v1.a_tm := v1.s_tmm;
          v1.a_ky := v1.s_ky;    
        ELSIF v1.o_rs = 1 THEN -- UPDATING an approved record
          v1.t_a := 8;        
          v1.u_tm := v1.s_tmm;
          v1.u_ky := v1.s_ky;      
        END IF;
        --
      ELSIF v1.t_a = 3 THEN -- DELETING
        IF fn_never_allow_delete (v_t) THEN
          pr_no_dml (pi_trg_name => v1.t_n);      
        END IF;
      END IF;
      --
    ELSE
      pr_no_dml (pi_trg_name => v1.t_n);
    END IF;
    --
    IF gv_sys_dml = 9 THEN
      pr_reset_sdml;
    END IF; 
    --    
    p1 := v1;
    --
  END pr_trg10;
  -- 
  -- LOG TABLES trigger processing
  PROCEDURE pr_trg20 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
    v1      v_99_99_trg%ROWTYPE; 
    v_x     PLS_INTEGER   := 3;    
    v_t     VARCHAR2(100) := NULL;
    FUNCTION fn_skip_prc RETURN BOOLEAN IS
    BEGIN
      IF v_t IN ('T_99_20_UPD') THEN 
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_skip_prc;     
  BEGIN
    --
    pr_load_gvs;
    --
    v1 := p1;
    v1.t_n := UPPER(v1.t_n);    
    -- Table Name
    v_x := LENGTH(v1.t_n) - 3; -- strip off the "_TB" part of the trigger name
    v_t := SUBSTR(v1.t_n,1,v_x); 
    --      
    -- Validate Session Connection
    IF fn_skip_prc THEN
      NULL;
    ELSIF gv_sys_dml = 9 THEN 
      NULL;     
    ELSIF gv_sys_dml = 1 THEN 
      NULL; -- pkwf_99_glb.pr_vld_conn;
    ELSE
      pr_no_dml (pi_trg_name => v1.t_n); -- DIRECT DML not allowed
    END IF;
    --
    --
    IF fn_skip_prc THEN
      NULL;    
    ELSIF v1.p_a = 0 THEN -- PROCESSING ACTION=0 : DML is prohibited
      pr_no_dml (pi_trg_name => v1.t_n);
    ELSIF v1.t_a = 2 THEN -- UPDATES allowed
      NULL;
    ELSIF v1.t_a = 3 THEN -- DELETES only allowed when LOG PURGE is switched on
      /* IF NOT pkwf_99_pmr.fn_purge_log (gv_k) THEN
        pr_no_dml (pi_trg_name => v1.t_n);
      END IF; */
      NULL; -- DELETES allowed
    ELSIF v1.p_a = 1 AND v1.t_a = 1 THEN -- INSERTING 
      --
      v1.s_dtm := pkwf_99_dtm.fn_sys_dtm;
      v1.s_tmm := pkwf_99_dtm.fn_sys_tmm;
      v1.s_ky := pkwf_99_glb.fn_usr_key (pi_k => gv_k);
      v1.i_tm := v1.s_tmm;
      v1.i_ky := v1.s_ky;      
      --
      IF NVL(v1.r_k,0) <= 0 THEN 
        v1.r_k := pkwf_99_glb.fn_get_au_rk (pi_k => gv_k);
      END IF;
      --
    ELSE
      pr_no_dml (pi_trg_name => v1.t_n);
    END IF;
    --
    p1 := v1;
    --
  END pr_trg20;
  -- 
  -- GENERAL TABLES trigger processing
  PROCEDURE pr_trg30 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
    --
    v1      v_99_99_trg%ROWTYPE;   
    --
    v_x     PLS_INTEGER;
    v_t     VARCHAR2(100);
    --
    FUNCTION fn_never_allow_delete (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('XYZ') THEN -- Password Rules
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_never_allow_delete;    
    --   
    FUNCTION fn_never_allow_insert (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('XYZ') THEN -- Password Rules
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_never_allow_insert;    
    --       
    FUNCTION fn_allow_auto_approve (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('XYZ') THEN 
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_allow_auto_approve;    
    --       
  BEGIN
    --
    pr_load_gvs;
    --
    v1 := p1;
    v1.t_n := UPPER(v1.t_n);
    -- Table Name
    v_x := LENGTH(v1.t_n) - 3; -- strip off the "_TB" part of the trigger name
    v_t := SUBSTR(v1.t_n,1,v_x); 
    --  
    -- Validate Session Connection
    IF gv_sys_dml = 1 THEN -- DML is initiated by another Procedure.
      NULL;
    ELSE
      pkwf_99_glb.pr_vld_conn;
    END IF;
    --
    IF v_t = 'T_99_30_VPD' THEN
      IF v1.t_a = 1 THEN -- INSERTING
        v1.r_k := pkwf_99_vpd.fn_vpd_ky;
        v1.t_n := pkwf_99_vpd.fn_vpd_id;
        v1.i_tm := pkwf_99_dtm.fn_sys_dtm;
      END IF;
      GOTO end_trg30;
    END IF;
    --
    IF v1.p_a = 0 THEN -- PROCESSING ACTION=0 : DML is prohibited
      pr_no_dml (pi_trg_name => v1.t_n);
    ELSIF v1.p_a IN (1,9) AND v1.t_a IN (1, 2, 3) THEN
      --
      IF v1.p_a = 9 THEN -- allow direct DML
        gv_sys_dml := 0;
      ELSE -- DML only through procedures/functions OR System Maintenance
        IF gv_sys_dml = 1 THEN  
          NULL;
        ELSE
          pr_no_dml (pi_trg_name => v1.t_n);
        END IF;
      END IF;
      --
      IF v1.o_rs = 2 THEN -- Rejected record: OLD RECORD STATUS=2
        IF NOT (gv_sys_dml = 1) THEN  
          pr_no_dml (pi_trg_name => v1.t_n);
        END IF;
      END IF;
      --
      v1.s_dtm := pkwf_99_dtm.fn_sys_dtm;
      v1.s_tmm := pkwf_99_dtm.fn_sys_tmm;
      --
      v1.s_ky := pkwf_99_glb.fn_usr_key (pi_k => gv_k);
      IF v1.s_ky IS NULL AND fn_allow_external_usr (v_t) THEN
        v1.s_ky := gv_ext_usr_ky;
      END IF;      
      --
      IF v1.t_a = 1 THEN -- INSERTING
        --
        IF fn_never_allow_insert (v_t) THEN
          pr_no_dml (pi_trg_name => v1.t_n);      
        END IF;
        --        
        v1.i_tm := v1.s_tmm;
        v1.i_ky := v1.s_ky;
        --
        IF v1.r_k = -9 THEN
          NULL; -- Table does not have Record Key column
        ELSIF NVL(v1.r_k,0) = 0 THEN -- Record Key
          v1.r_k := pkwf_99_glb.fn_get_rk (pi_k => gv_k);
        END IF;
        --
        IF v1.n_rs = 1 AND fn_allow_auto_approve(v_t) THEN -- Auto-approve
          v1.a_tm := v1.s_tmm;
          v1.a_ky := v1.s_ky;    
        ELSIF v1.n_rs IN (-1,0) THEN -- Record Status
          NULL;
        ELSE
          v1.n_rs := 0; 
        END IF;
        --
      ELSIF v1.t_a = 2 THEN 
        --
        IF v1.o_rs IN (-1,0) AND v1.n_rs IN (-1,0) THEN -- AMENDING a Pending record
          v1.t_a := 6;
          v1.i_tm := v1.s_tmm;
          v1.i_ky := v1.s_ky;    
        ELSIF v1.o_rs IN (-1,0) AND v1.n_rs IN (1,2) THEN -- APPROVING/REJECTING a Pending record
          v1.t_a := 7;
          v1.a_tm := v1.s_tmm;
          v1.a_ky := v1.s_ky;    
        ELSIF v1.o_rs = 1 THEN -- UPDATING an approved record
          v1.t_a := 8;        
          v1.u_tm := v1.s_tmm;
          v1.u_ky := v1.s_ky;      
        END IF;
        --
      ELSIF v1.t_a = 3 THEN -- DELETING
        IF fn_never_allow_delete (v_t) THEN
          pr_no_dml (pi_trg_name => v1.t_n);      
        END IF;
      END IF;
      --
    ELSE
      pr_no_dml (pi_trg_name => v1.t_n);
    END IF;
    --
    IF gv_sys_dml = 1 THEN
      pr_reset_sdml;
    END IF; 
    --    
    <<end_trg30>>
    --
    p1 := v1;
    --
  END pr_trg30;
  --   
  -- CORE TABLES trigger processing
  PROCEDURE pr_trg00 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
    --
    v1      v_99_99_trg%ROWTYPE;   
    v_x     PLS_INTEGER;
    v_t     VARCHAR2(100);
    --
    FUNCTION fn_never_allow_delete (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('T_99_00_MDL','T_99_00_DMM','T_99_00_DMV','T_99_00_ERR','T_99_00_PMD','T_99_00_PMV') THEN 
        RETURN TRUE;
      ELSIF pi_tbl_nme IN ('T_99_00_SMDL','T_99_00_ROL','T_99_00_SSI') THEN         
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_never_allow_delete;
    --     
  BEGIN
    --
    pr_load_gvs;
    --
    v1 := p1;
    v1.t_n := UPPER(v1.t_n);
    v_x := LENGTH(v1.t_n) - 3; -- strip off the "_TB" part of the trigger name
    v_t := SUBSTR(v1.t_n,1,v_x); -- TABLENAME    
    --   
    -- Validate that editing of CORE data is allowed
    IF v_t = 'T_99_00_PMV' THEN -- SYSTEM PARAMETERS VALUES TABLE
      NULL; -- Table can also be processed by APPLICATION SYSTEM SECURITY
    ELSE
      -- 
      IF gv_sys_dml = 9 THEN
        NULL;    
      ELSE
        pr_no_core_dml (pi_trg_name => v1.t_n); 
      END IF;
      --       
    END IF;
    -- 
    --    
    IF v1.p_a = 0 THEN -- PROCESSING ACTION=0 : DML is prohibited
      IF gv_sys_dml = 9 THEN 
        NULL;
      ELSE  
        pr_no_core_dml (pi_trg_name => v1.t_n);
      END IF;
    ELSIF v1.t_a = 3 THEN -- DELETE NOT ALLOWED. 
      -- Better be safe than sorry. Don't want any crazy fellow zapping CORE DEFINITION data.
      -- Unless specifically allowed by the SYSTEM MAINTENANCE screen being processed which must have called PR_SET_SMNT
      IF gv_sys_dml = 9 THEN 
        NULL;
      ELSE
        pr_no_core_dml (pi_trg_name => v1.t_n);   
        -- Additional check
        IF fn_never_allow_delete (v_t) THEN
          pr_no_core_dml (pi_trg_name => v1.t_n);      
        END IF;
        --        
      END IF;
      --
      gv_sys_dml := 0;
      --
    ELSIF (v1.p_a = 9 AND v1.t_a IN (1, 2)) OR  -- DIRECT INSERT/UPDATE only 
          (v1.p_a = 1 AND v1.t_a IN (1,2) AND gv_sys_dml = 9) THEN -- PROCEDURE INSERT/UPDATE only 
      --
      v1.s_ky := 0; -- USER KEY not applicable to CORE tables
      --      
      -- Special processing for SYSTEM PARAMETER VALUES table
      IF v1.t_n LIKE 'T_99_00_PMV%' THEN 
        --
        IF gv_sys_dml = 9 THEN -- SYSTEM MAINTENANCE 
          NULL;
        ELSE
          IF v1.t_a = 1 THEN -- INSERT not allowed if not from SYSTEM MAINTENANCE
            pr_no_core_dml (pi_trg_name => v1.t_n); 
          ELSIF NOT v1.o_rs = 1 THEN -- UPDATE only allowed if CHANGES_ALLOWED_YN flag is Yes
            pr_no_core_dml (pi_trg_name => v1.t_n); 
          END IF;
          v1.s_ky := pkwf_99_glb.fn_usr_key (pi_k => gv_k);
        END IF;
        --
        gv_sys_dml := 0;
        --
        -- Avoid Mutating Trigger Error
        v1.s_dtm := SYSDATE;
        v1.s_tmm := CURRENT_TIMESTAMP;
        --
      ELSE
        v1.s_dtm := pkwf_99_dtm.fn_sys_dtm;
        v1.s_tmm := pkwf_99_dtm.fn_sys_tmm;      
      END IF;
      --
      --
      IF v1.t_a = 1 THEN -- INSERTING
        v1.i_tm := v1.s_tmm;
        v1.i_ky := v1.s_ky;
        IF v_t IN ('T_99_00_SSI') THEN
          NULL; -- Retain Input Row Key
        ELSE
          v1.r_k := pkwf_99_glb.fn_get_cor_rk (pi_k => gv_k);
        END IF;
        v1.n_rs := 1;
      ELSIF v1.t_a = 2 THEN 
        v1.u_tm := v1.s_tmm;
        v1.u_ky := v1.s_ky;            
      END IF;
      --
    ELSE
      pr_no_core_dml (pi_trg_name => v1.t_n);
    END IF;
    --
    p1 := v1;
    --
  END pr_trg00;
  --
  -- CORE LANGUAGE TABLES maintenance processing
  PROCEDURE pr_trg00l (p1 IN OUT v_99_99_lgg%ROWTYPE) IS
    v1      v_99_99_lgg%ROWTYPE;
    v_x     PLS_INTEGER;    
    v_t     VARCHAR2(100);
    v_lgg   VARCHAR2(5) := 'EN';
    --
    FUNCTION fn_lgg_tab (pi_tbl_nme VARCHAR2) RETURN BOOLEAN IS
    BEGIN
      IF pi_tbl_nme IN ('T_99_00_ERR') THEN 
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;    
    END fn_lgg_tab;
    -- 
  BEGIN
    --
    pr_load_gvs;
    --
    v1 := p1;
    --    
    pr_no_core_dml (pi_trg_name => v1.t_n); 
    --
    p1 := v1;
    --
  END pr_trg00l;
  --    
  -- AUDIT TABLES trigger processing
  PROCEDURE pr_trg90 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
    v1      v_99_99_trg%ROWTYPE;   
    v_x     PLS_INTEGER;    
    v_t     VARCHAR2(100);      
  BEGIN
    --
    v1 := p1;
    v1.t_n := UPPER(v1.t_n);
    v_x := LENGTH(v1.t_n) - 3; -- strip off the "_TA" part of the trigger name
    v_t := SUBSTR(v1.t_n,1,v_x);     
    --        
    IF gv_sys_dml = 1 THEN 
      NULL;
    ELSE
      pr_no_dml (pi_trg_name => v1.t_n); -- DIRECT DML not allowed
    END IF;
    -- 
    IF v1.p_a = 1 AND v1.t_a IN (1,2,3) THEN 
      NULL;
    ELSE 
      pr_no_dml (pi_trg_name => v1.t_n);
    END IF;
    --
    IF v1.r_k = -9 THEN
      NULL; -- Table does not have Record Key column
    ELSIF NVL(v1.r_k,0) = 0 THEN -- Record Key
      pr_load_gvs;
      v1.r_k := pkwf_99_glb.fn_get_au_rk (pi_k => gv_k);
    END IF;
    --    
    p1 := v1;
    --
  END pr_trg90;
  --     
  PROCEDURE pr_trg99 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
    v1      v_99_99_trg%ROWTYPE;   
  BEGIN
    --
    pr_load_gvs;
    --
    v1 := p1;
    v1.t_n := UPPER(v1.t_n);
    --        
    -- Validate Session Connection
    IF gv_sys_dml = 1 THEN 
      pkwf_99_glb.pr_vld_conn;
    ELSE
      pr_no_dml (pi_trg_name => v1.t_n); -- DIRECT DML not allowed
    END IF;
    --
    IF v1.p_a = 0 THEN -- PROCESSING ACTION=0 : DML is prohibited
      pr_no_dml (pi_trg_name => v1.t_n);
    ELSIF v1.t_a = 2 THEN -- UPDATES not allowed
      pr_no_dml (pi_trg_name => v1.t_n);
    ELSIF v1.t_a = 3 THEN -- DELETES not allowed
      pr_no_dml (pi_trg_name => v1.t_n);
    ELSIF v1.p_a = 1 AND v1.t_a = 1 THEN -- INSERTING 
      --
      v1.s_dtm := pkwf_99_dtm.fn_sys_dtm;
      v1.s_tmm := pkwf_99_dtm.fn_sys_tmm;
      v1.s_ky := pkwf_99_glb.fn_usr_key (pi_k => gv_k);
      v1.r_k := pkwf_99_glb.fn_get_au_rk (pi_k => gv_k);
      v1.i_tm := v1.s_tmm;
      v1.i_ky := v1.s_ky;      
      --
    ELSE
      pr_no_dml (pi_trg_name => v1.t_n);
    END IF;
    --
    p1 := v1;
    --
  END pr_trg99;
  --   
  --  Set System DML flag 
  PROCEDURE pr_set_sdml (pi_k IN VARCHAR2) IS
  BEGIN
    gv_sys_dml := 0;
    pr_load_gvs;
    IF pi_k = gv_k THEN
      gv_sys_dml := 1;
    END IF;
  END pr_set_sdml;
  --
  --  Set System MAINTENANCE flag
  PROCEDURE pr_set_smnt (pi_k IN VARCHAR2) IS
  BEGIN
    gv_sys_dml := 0;
    pr_load_gvs;
    IF pi_k = gv_k THEN
      gv_sys_dml := 9;
    END IF;
  END pr_set_smnt;
  --  
  --  Reset System DML flag
  PROCEDURE pr_reset_sdml IS
  BEGIN
    gv_sys_dml := 0;
  END pr_reset_sdml;
  -- 
END pkwf_99_trg;
/

