CREATE OR REPLACE PACKAGE BODY pkwf_99_eml AS
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
  gv_k          VARCHAR2(100);
  gv_pvm        pkwf_99_eml.r_pv2;
  gv_pv         pkwf_99_eml.r_pv;
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
  PROCEDURE pr_assign_pvm IS
  BEGIN
    gv_pvm       := NULL;
    gv_pvm.ID    := gv_pv.pi_msg_id;
    gv_pvm.ps1   := gv_pv.pi_sbj1;
    gv_pvm.ps2   := gv_pv.pi_sbj2;
    gv_pvm.ps3   := gv_pv.pi_sbj3;
    gv_pvm.pb1   := gv_pv.pi_bdy1;
    gv_pvm.pb2   := gv_pv.pi_bdy2;
    gv_pvm.pb3   := gv_pv.pi_bdy3;
    gv_pvm.pb4   := gv_pv.pi_bdy4;
    gv_pvm.pb5   := gv_pv.pi_bdy5;
    gv_pvm.pb6   := gv_pv.pi_bdy6;
    gv_pvm.pb7   := gv_pv.pi_bdy7;
    gv_pvm.pb8   := gv_pv.pi_bdy8;
    gv_pvm.pb9   := gv_pv.pi_bdy9;
    gv_pvm.pb10  := gv_pv.pi_bdy10;
    gv_pvm.pb11  := gv_pv.pi_bdy11;
    gv_pvm.pb12  := gv_pv.pi_bdy12;
    gv_pvm.pb13  := gv_pv.pi_bdy13;
    gv_pvm.pb14  := gv_pv.pi_bdy14;
    gv_pvm.pb15  := gv_pv.pi_bdy15;
    gv_pvm.sref  := gv_pv.pi_src_ref;
    gv_pvm.sky   := gv_pv.pi_src_key;  
    gv_pvm.flx1  := gv_pv.pi_flx1;
    gv_pvm.flx2  := gv_pv.pi_flx2; 
    gv_pvm.flx3  := gv_pv.pi_flx3;    
  END pr_assign_pvm;
  --  
  --  
  /* Public Routines */
  --
  PROCEDURE pr_snd (pi_rcpt_adr  VARCHAR2, 
                    pi_msg_sbj   VARCHAR2, 
                    pi_msg_bdy   CLOB,    
                    pi_sndr_adr  VARCHAR2 DEFAULT NULL,                     
                    pi_src_app   VARCHAR2 DEFAULT NULL,
                    pi_src_ref   VARCHAR2 DEFAULT NULL,
                    pi_src_key   NUMBER DEFAULT NULL,
                    pi_now_yn    VARCHAR2 DEFAULT '0') IS
  BEGIN
    pr_load_gvs;
    pkwf_99_eml_snd.pr_send_msg1 ( pi_k         => gv_k,
                                pi_msg_sbj   => pi_msg_sbj, 
                                pi_rcp_adr   => pi_rcpt_adr, 
                                pi_sndr_adr  => pi_sndr_adr,
                                pi_msg_bdy   => pi_msg_bdy,
                                pi_src_app   => pi_src_app,
                                pi_src_ref   => pi_src_ref,
                                pi_src_key   => pi_src_key,
                                pi_send_now  => pi_now_yn);   
  END pr_snd;
  --
  PROCEDURE pr_snd_att_blb (pi_rcpt_adr       IN VARCHAR2,                
                            pi_msg_sbj        IN VARCHAR2,                             
                            pi_pv             IN r_pv DEFAULT NULL,                           
                            pi_msg_bdy        IN CLOB,
                            pi_att_blb        IN BLOB,
                            pi_att_filename   IN VARCHAR2,                                 
                            pi_att_inline_yn  IN VARCHAR2 DEFAULT '1',
                            pi_att_mime_type  IN VARCHAR2 DEFAULT 'application/octet-stream',                           
                            pi_sndr_adr       IN VARCHAR2 DEFAULT NULL,                           
                            pi_src_app        IN VARCHAR2 DEFAULT NULL,
                            pi_src_ref        IN VARCHAR2 DEFAULT NULL,
                            pi_src_key        IN NUMBER DEFAULT NULL,
                            pi_now_yn         IN VARCHAR2 DEFAULT '0') IS
    v_mdl   VARCHAR2(500) := NULL;
    v_sbj   VARCHAR2(4000) := NULL;
    v_bdy   CLOB := NULL;
  BEGIN
    pr_load_gvs;
    IF pi_pv.pi_msg_id IS NOT NULL THEN
      pr_assign_pvm;
     -- pk99_malp.pr_mdtl (pi_pv     => gv_pvm,
     --                    po_mdl    => v_mdl,
     --                    po_sbj    => v_sbj,
     --                   po_bdy    => v_bdy);
    END IF;
    --
    pkwf_99_eml_snd.pr_send_msg_att (pi_k              => gv_k,                        
                                  pi_msg_sbj        => pi_msg_sbj,
                                  pi_rcp_adr        => pi_rcpt_adr, 
                                  pi_msg_bdy        => NVL(v_bdy, pi_msg_bdy),
                                  pi_att_blb        => pi_att_blb,
                                  pi_att_filename   => pi_att_filename,                              
                                  pi_att_inline_yn  => pi_att_inline_yn,
                                  pi_att_mime_type  => pi_att_mime_type,                       
                                  pi_sndr_adr       => pi_sndr_adr,                        
                                  pi_src_app        => pi_src_app,
                                  pi_src_ref        => pi_src_ref,
                                  pi_src_key        => pi_src_key,
                                  pi_send_now       => pi_now_yn);
  END pr_snd_att_blb;
  --
  FUNCTION fn_is_valid_adr (pi_adr VARCHAR2) RETURN BOOLEAN IS
    -- MODIFIED TO ALLOW MULTIPLE EMAILS SEPARATED BY COMMAS - FEMI, NOV 2016
    v_adr VARCHAR2(1000) := pi_adr;
    v_eml VARCHAR2(1000);
    v_cnt NUMBER := 0;
    v_pos NUMBER := 0;
  BEGIN
    v_adr := TRIM(v_adr);
    v_pos := INSTR(v_adr,',');
    IF v_pos = 0 THEN
      v_pos := 9999;
    END IF;
    --     
    WHILE v_pos > 0 
    LOOP
      v_cnt := v_cnt + 1;
      v_eml := SUBSTR(v_adr,1,v_pos -1);
      IF pkwf_99_gu1.fn_is_valid_email (pi_addr => v_eml) THEN
        RETURN TRUE;
      ELSE
        RETURN FALSE;
      END IF;
      v_adr := SUBSTR(v_adr,v_pos+1);
      v_pos := INSTR(v_adr,',');
      IF v_pos = 0 THEN
        IF INSTR(v_adr,'@') = 0 THEN
          NULL;
        ELSE
          v_pos := 9999;
        END IF;
      END IF;
    END LOOP;
    --
 --
--  BEGIN
--    IF pk99_gu1.fn_is_valid_email (pi_addr => pi_adr) THEN
--      RETURN TRUE;
--    ELSE
--      RETURN FALSE;
--    END IF;
  END fn_is_valid_adr;
  --
  FUNCTION fn_get_usr_adr (pi_uk IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    RETURN pkwf_99_uma.fn_get_eml_adr (pi_k => gv_k, pi_uk => pi_uk);
  END fn_get_usr_adr;
  --
  FUNCTION fn_get_ofr_adr (pi_id IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    pr_load_gvs;
    RETURN '';--pk99_op_ofr.fn_get_eml_adr (pi_k => gv_k, pi_id => pi_id, pi_ius_only_yn => '1');
  END fn_get_ofr_adr;
  -- 
  PROCEDURE pr_snd2 (pi_pv IN OUT r_pv) IS
    v_mdl   VARCHAR2(500) := NULL;
    v_sbj   VARCHAR2(4000) := NULL;
    v_bdy   CLOB := NULL;
  BEGIN
    --
    gv_pv := pi_pv;
    gv_pv.po_snt_yn := '0';
    gv_pv.po_err_txt := NULL;
    --
    IF gv_pv.pi_src_app IS NULL THEN
      gv_pv.po_err_txt := 'Calling (Source) Module is required';
    ELSIF gv_pv.pi_msg_id IS NULL THEN
      gv_pv.po_err_txt := 'Message ID is required';
    ELSIF gv_pv.pi_rcpt_adr IS NULL THEN
      gv_pv.po_err_txt := 'Email recipient address is required';
    ELSE
      --
      gv_pv.pi_src_app := UPPER(gv_pv.pi_src_app);
      --
      pr_load_gvs;
      pr_assign_pvm;
      --pk99_malp.pr_mdtl (pi_pv     => gv_pvm,
      --                   po_mdl    => v_mdl,
      --                   po_sbj    => v_sbj,
      --                   po_bdy    => v_bdy);
      --                           
      IF v_mdl IS NULL THEN
        gv_pv.po_err_txt := 'Message ID "'||gv_pv.pi_msg_id||'" is not valid';
      ELSIF v_bdy IS NULL THEN
        gv_pv.po_err_txt := 'Message ID "'||gv_pv.pi_msg_id||'" Setup validation failed: Message body not defined';
      ELSIF v_sbj IS NULL THEN
        gv_pv.po_err_txt := 'Message ID "'||gv_pv.pi_msg_id||'" Setup validation failed: Message Subject not defined';
      ELSIF gv_pv.pi_src_app <> v_mdl THEN
        gv_pv.po_err_txt := 'Message ID "'||gv_pv.pi_msg_id||'" does not belong to Calling Module';
      ELSE
        pkwf_99_eml_snd.pr_send_msg1 ( pi_k         => gv_k,
                                    pi_msg_sbj   => v_sbj, 
                                    pi_rcp_adr   => gv_pv.pi_rcpt_adr, 
                                    pi_sndr_adr  => gv_pv.pi_sndr_adr,
                                    pi_msg_bdy   => v_bdy,
                                    pi_src_app   => gv_pv.pi_src_app,
                                    pi_src_ref   => gv_pv.pi_src_ref,
                                    pi_src_key   => gv_pv.pi_src_key,
                                    pi_send_now  => gv_pv.pi_now_yn); 
        gv_pv.po_snt_yn := '1';                                    
      END IF;
      --      
    END IF;
    --
    --    
    pi_pv := gv_pv;
    --
  END pr_snd2;
  --  
  PROCEDURE pr_prc_que IS
  BEGIN
    pr_load_gvs;
    pkwf_99_eml_snd.pr_prc_msg (pi_k => gv_k, pi_msg_ky => NULL);
    pk$990.pr_commit;     
  END pr_prc_que;
  --
END pkwf_99_eml; 
  
  
  