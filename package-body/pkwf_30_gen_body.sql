CREATE OR REPLACE PACKAGE BODY pkwf_30_gen AS
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
  --
  /* Public Routines */
  -- 
  -- Get Document Id
  FUNCTION fn_g_doc_id RETURN VARCHAR2 IS
    v_c     NUMBER(38);
  BEGIN
    --
    v_c := MOD(pkwf_00_00.fn_doc,100000);
    RETURN TO_CHAR(SYSDATE,'YYYYMMDD')||LPAD(v_c, 6, '0');
  END fn_g_doc_id;
  --
  --
  FUNCTION fn_set_fld (pi_dat IN VARCHAR2) RETURN VARCHAR2 IS
    v_d  VARCHAR2(250);
  BEGIN
    v_d := TRIM(pi_dat);
    v_d := REPLACE(v_d,'<','');
    v_d := REPLACE(v_d,'>','');
    RETURN v_d;
  END fn_set_fld;
  --
  --
  PROCEDURE pr_set_dc_dtl(pi_d_id   IN VARCHAR2,
                          pi_dc_id  IN VARCHAR2,
                          pi_dc_dsc IN VARCHAR2) IS
      -- Configure workflow document link
    v_dc    wf_20_dc%ROWTYPE;
    v_dk    wf_20_dc_tk%ROWTYPE;
    v_tp    wf_10_tp%ROWTYPE;
    v_c     NUMBER(38);
  BEGIN
    --
    BEGIN
      SELECT B.*
        INTO v_tp
        FROM wf_10_tp_lk A, wf_10_tp B
       WHERE A.d_id = pi_d_id
         AND A.tp_k = B.row_key;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Unable to locate the configuration of this workflow type. Please contact administrator ['||pi_d_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Configuration of this workflow type is duplicated. Please contact administrator ['||pi_d_id||']');
    END;
    --
    UPDATE wf_30_dc
       SET dc_tp_k = v_tp.row_key
     WHERE dc_id = pi_dc_id;
    --
    v_c := MOD(pkwf_00_00.fn_doc,100000);
    --
    v_dc.row_key   := pkwf_00_00.fn_rk; 
    v_dc.bus_dt    := TRUNC(SYSDATE);
    v_dc.sys_dtt   := SYSDATE;
    v_dc.tp_k      := v_tp.row_key;
    v_dc.dc_id     := pi_dc_id;
    v_dc.dc_dsc    := pi_dc_dsc;
    v_dc.st_dtt    := SYSDATE;
    v_dc.ed_dtt    := NULL;
    v_dc.dc_st_dm  := '0';
    v_dc.cr_sq_no  := 1;
    v_dc.tk_no     := 0;
    --
    INSERT
      INTO wf_20_dc
    VALUES v_dc;
    --
    FOR c1 IN (SELECT *
                 FROM wf_10_tp_tk
                WHERE tp_k = v_tp.row_key
                ORDER BY seq_no ASC)
    LOOP
      --
      v_dk.row_key  := pkwf_00_00.fn_rk;
      v_dk.bus_dt   := TRUNC(SYSDATE); 
      v_dk.sys_dtt  := SYSDATE;
      v_dk.dc_k     := v_dc.row_key;
      v_dk.tk_k     := c1.row_key; 
      v_dk.mb_k     := NULL;
      v_dk.st_dtt   := NULL;
      v_dk.ed_dtt   := NULL;
      v_dk.ac_rmk   := NULL;
      v_dk.dn_yn    := '0';
      v_dk.tk_sq_no := c1.seq_no;
      --
      INSERT 
        INTO wf_20_dc_tk
      VALUES v_dk;
      --
    END LOOP;
    --
  END;
  --
  --  
END pkwf_30_gen; 
/
