CREATE OR REPLACE PACKAGE BODY pkwf_30_ch_wdr AS
  --
  /* Created By       : Femi Akintoye 
  ** Date Created     : 11-MAR-2016
  **
  ** PURPOSE: WF Routines for Preship Objects
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
  ** Copyright:  Neulogic Solutions Ltd, 2016
  **
  */
  --
  /* Private Routines */
  --
  /* Public Routines */
  --
  -- Insert/Validation of document
  FUNCTION fn_ins(pi_rec IN wf_vi_30_ch_wdr%ROWTYPE) RETURN pkwf_90_gen.r_ret IS
    v_r     wf_vi_30_ch_wdr%ROWTYPE := pi_rec;
    v_k     wf_00_00_dtd.n38%TYPE;
    v_ret   pkwf_90_gen.r_ret;
  BEGIN
    --
    v_ret.ret_cd := 0;
    --
    BEGIN
      --
      v_r.d_id := 'WFVI30CHWDR';
--      pkwf_00_vld.pr_reqd (pi_d => v_r.dc_tp_k, pi_dsc => 'Document Type');
      v_r.dc_tp_k := 0;
      v_r.dc_st_dm := '0';
      v_r.dc_jsn   := NULL;
      --
      v_r.ac_id    := pkwf_30_gen.fn_set_fld(v_r.ac_id);
      pkwf_00_vld.pr_reqd (pi_d => v_r.ac_id, pi_dsc => 'Account Number');
      pkwf_00_vld.pr_reqd (pi_d => v_r.wdr_amt, pi_dsc => 'Amount to Withdraw');
      --
      v_r.row_key := pkwf_00_00.fn_rk; 
      v_r.dc_id := pkwf_30_gen.fn_g_doc_id;
      v_r.dc_dtt   := SYSDATE;
      --
      -- Create record in object
      INSERT
        INTO wf_vi_30_ch_wdr
      VALUES v_r;
      --
      v_ret.po_dc_k := v_r.row_key;
      --
      pkwf_30_gen.pr_set_dc_dtl(pi_d_id   => v_r.d_id,
                                pi_dc_id  => v_r.dc_id,
                                pi_dc_dsc => 'WITHDRAWAL REQUEST '||v_r.ac_id||' ('||v_r.wdr_amt||')');
--      -- Configure workflow document link
--      DECLARE
--        v_dc    wf_20_dc%ROWTYPE;
--        v_dk    wf_20_dc_tk%ROWTYPE;
--        v_tp    wf_10_tp%ROWTYPE;
--        v_c     NUMBER(38);
--      BEGIN
--        --
--        BEGIN
--          SELECT *
--            INTO v_tp
--            FROM wf_10_tp
--           WHERE row_key = v_r.dc_tp_k;
--        EXCEPTION
--          WHEN NO_DATA_FOUND THEN
--            pkwf_00_00_err.pr_raise(pi_msg => 'Unable to locate the configuration of this workflow type. Please contact administrator ['||v_r.dc_tp_k||']');
--          WHEN TOO_MANY_ROWS THEN
--            pkwf_00_00_err.pr_raise(pi_msg => 'Configuration of this workflow type is duplicated. Please contact administrator ['||v_r.dc_tp_k||']');
--        END;
--        --
--        v_c := MOD(pkwf_00_00.fn_doc,100000);
--        --
--        v_dc.row_key   := pkwf_00_00.fn_rk; 
--        v_dc.bus_dt    := TRUNC(SYSDATE);
--        v_dc.sys_dtt   := SYSDATE;
--        v_dc.tp_k      := v_r.dc_tp_k;
--        v_dc.dc_id     := v_r.dc_id;
--        v_dc.dc_dsc    := 'WITHDRAWAL REQUEST '||v_r.ac_id||' ('||v_r.wdr_amt||')';
--        v_dc.st_dtt    := SYSDATE;
--        v_dc.ed_dtt    := NULL;
--        v_dc.dc_st_dm  := '0';
--        v_dc.cr_sq_no  := 1;
--        v_dc.tk_no     := 0;
--        --
--        --
--        INSERT
--          INTO wf_20_dc
--        VALUES v_dc;
--        --
--        FOR c1 IN (SELECT *
--                     FROM wf_10_tp_tk
--                    WHERE tp_k = v_r.dc_tp_k
--                    ORDER BY seq_no ASC)
--        LOOP
--          --
--          v_dk.row_key  := pkwf_00_00.fn_rk;
--          v_dk.bus_dt   := TRUNC(SYSDATE); 
--          v_dk.sys_dtt  := SYSDATE;
--          v_dk.dc_k     := v_dc.row_key;
--          v_dk.tk_k     := c1.row_key; 
--          v_dk.mb_k     := NULL;
--          v_dk.st_dtt   := NULL;
--          v_dk.ed_dtt   := NULL;
--          v_dk.ac_rmk   := NULL;
--          v_dk.dn_yn    := '0';
--          v_dk.tk_sq_no := c1.seq_no;
--          --
--          INSERT 
--            INTO wf_20_dc_tk
--          VALUES v_dk;
--          --
--        END LOOP;
--        --
--        -- Send Alert to default mail group for this document
--        IF (v_tp.acc_alt_id IS NOT NULL) AND (v_tp.acc_eml IS NOT NULL) THEN
--          DECLARE
--            v_al   pkwf_90_alt.v_alt;
--          BEGIN
--            v_al := NULL;
--            v_al.pi_msg_id := 'WF-0101';
--            --
--            v_al.pi_rcpt_adr := v_tp.acc_eml;
--            -- Generate Alert
--            v_al.pi_src_key   := v_dc.row_key;     
--            v_al.pi_src_ref   := v_dc.dc_id;
--            v_al.pi_sbj1      := '';
--            v_al.pi_sbj2      := pkwf_90_alt.fn_fmt_qty(pi_qty => 0);
--            v_al.pi_sbj3      := ''; 
--            v_al.pi_bdy1      := '';
--            v_al.pi_bdy2      := '';
--            v_al.pi_bdy3      := '';
--            v_al.pi_bdy4      := '';
--            v_al.pi_bdy5      := '';
--            v_al.pi_bdy6      := '';
--            v_al.pi_bdy7      := pkwf_90_alt.fn_fmt_qty(pi_qty => 0);
--            --
--            pkwf_90_alt.pr_crt_msg (pi_rec => v_al);
--          END;
--        END IF;
--        --
--      END;
      --
    EXCEPTION
      WHEN OTHERS THEN
      v_ret.ret_cd  := SQLCODE;
      --v_ret.rt_id  := 'ON20';
      v_ret.err_dsc := dbms_utility.format_error_stack;
      v_ret.err_sta := dbms_utility.format_error_backtrace;
    END;
    --
logger.log(v_r.d_id||' RETURNED '||v_ret.ret_cd||' '||v_ret.err_dsc, 'ins', v_ret.err_sta);    
    RETURN v_ret;
    --
  END fn_ins;
  --
  -- General processing routine, new customer registration, 
  -- Verify customer record, if ok
  -- -- Create customer
  -- -- Create cash account
  -- -- Create portfolio
  PROCEDURE pr_prc_vrf(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
logger.log('CS NEW TASK - CONFIRM DATA VERIFIED AND CREATE CUSTOMER, ');    
    -- Create customer
    DECLARE
      v_cus  pkwf_90_gen.r_cs_new;
      v_ret  pkwf_90_gen.r_ret;
      v_dc_id wf_00_00_dtd.c50%TYPE;
    BEGIN
      --
      SELECT dc_id
        INTO v_dc_id
        FROM wf_20_dc
       WHERE row_key = pi_dc_k;
      --
      SELECT *
        INTO v_cus
        FROM wf_vi_30_cs_new
       WHERE dc_id = v_dc_id;
      --
      pkwf_89_cs.pr_prc_ctc(pi_rec => v_cus);
      --
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'The source document record found ['||pi_dc_k||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'The source document record is duplicated');
    END;
    --
    -- Create portfolio/cash account/market account
    --
  END pr_prc_vrf;
  --
  -- General processing routine, new customer registration
  -- -- Parameter - CSCS number
  -- -- Update / Create market account
  -- -- Register for WEB access
  -- -- Activate account
  PROCEDURE pr_prc_act(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    NULL;
  END pr_prc_act;
  --
  -- General processing routine, new customer registration
  -- -- Parameter - CSCS number
  -- -- Update / Create market account
  -- -- Register for WEB access
  -- -- Activate account
  PROCEDURE pr_set_pmt(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL) IS
    --
    v_dc wf_20_dc%ROWTYPE;
    --
  BEGIN
    --
    pkwf_00_vld.pr_reqd(pi_d => pi_p1, pi_dsc => 'Payment Number');
    --
    v_dc := pkwf_20_gen.fn_get_dc(pi_dc_k => pi_dc_k);
    --
    UPDATE wf_vi_30_ch_wdr
       SET pmt_no = pi_p1
     WHERE dc_id = v_dc.dc_id; 
    --
  END pr_set_pmt;
  --
  --
  --
  --
END pkwf_30_ch_wdr; 
/
