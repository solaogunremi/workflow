CREATE OR REPLACE PACKAGE BODY pkwf_99_vld AS 
--
 --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 23-JULY-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: General Validation routines
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
  -- Package variables
  gv_k          VARCHAR2(100);
  gv_get_pgm    BOOLEAN;
  gv_err_pgm    VARCHAR2(500); 
  --
  PROCEDURE pr_load_gvs (pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
    --
    gv_err_pgm := pi_pgm;
    gv_get_pgm := FALSE;
    --
    IF gv_err_pgm IS NULL THEN
      gv_get_pgm := pkwf_99_glb.fn_log_err(gv_k);
    END IF;
    --
  END pr_load_gvs;
  --
  FUNCTION fn_who_called_me RETURN VARCHAR2 IS
    --                              
    v_owner         VARCHAR2(100);
    v_name          VARCHAR2(100);
    v_lineno        NUMBER;
    v_type          VARCHAR2(100);
    --
  BEGIN
    --
    OWA_UTIL.WHO_CALLED_ME ( owner      => v_owner,
                             name       => v_name,
                             lineno     => v_lineno,
                             caller_t   => v_type);
    --
    IF v_owner IS NOT NULL AND v_name IS NOT NULL THEN
      v_name := v_owner ||'.'||v_name;
    END IF;
    --
    IF v_name IS NOT NULL AND v_lineno > 0 THEN
      v_name := v_name||' : Line '||TO_CHAR(v_lineno);
    END IF;
    --
    RETURN UPPER(v_name);
    --
  END fn_who_called_me;  
  --          
  --
  /* Public Routines */
  --
  --
  PROCEDURE pr_reqd (pi_d IN VARCHAR2, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d IS NULL THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990066', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Data'));
    END IF;
  END pr_reqd;
  --
  PROCEDURE pr_reqd (pi_d IN NUMBER, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d IS NULL THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990066', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Number'));
    END IF;
  END pr_reqd;
  --
  PROCEDURE pr_reqd (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d IS NULL THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990066', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Date'));
    END IF;
  END pr_reqd;
  --
  PROCEDURE pr_above_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NVL(pi_d,0) <= 0 THEN 
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990073', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Number'));
    END IF;
  END pr_above_zero;
  --
  PROCEDURE pr_not_above_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d > 0 THEN 
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990087', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Number'));
    END IF;
  END pr_not_above_zero;
  --  
  PROCEDURE pr_below_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NVL(pi_d,0) >= 0 THEN 
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990074', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Number'));
    END IF;
  END pr_below_zero;
  --  
  PROCEDURE pr_not_below_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d < 0 THEN 
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990086', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Number'));
    END IF;
  END pr_not_below_zero;
  --  
  PROCEDURE pr_equal_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NVL(pi_d,0) <> 0 THEN 
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990075', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Number'));    
    END IF;
  END pr_equal_zero;
  --   
  -- Validate that Input Value is greater than Limit Number
  PROCEDURE pr_above_num (pi_d   IN NUMBER, 
                          pi_lim IN NUMBER DEFAULT 0, 
                          pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                          pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NOT (pi_d > pi_lim) THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990077', pi_pg => gv_err_pgm, pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_above_num;
  --
  -- Validate that Input Value is not greater than Limit Number
  PROCEDURE pr_not_above_num (pi_d   IN NUMBER, 
                              pi_lim IN NUMBER DEFAULT 0, 
                              pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                              pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d > pi_lim THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990102', pi_pg => gv_err_pgm, pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_not_above_num;
  --  
  -- Validate that Input Value is less than Limit Number
  PROCEDURE pr_below_num (pi_d   IN NUMBER, 
                          pi_lim IN NUMBER DEFAULT 0, 
                          pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                          pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NOT (pi_d < pi_lim) THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990078', pi_pg => gv_err_pgm, pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_below_num;
  --  
  -- Validate that Input Value is not less than Limit Number
  PROCEDURE pr_not_below_num (pi_d   IN NUMBER, 
                              pi_lim IN NUMBER DEFAULT 0, 
                              pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                              pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d < pi_lim THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990103', pi_pg => gv_err_pgm, pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_not_below_num;
  --    
  -- Checks that Date Input is earlier than Current System Date
  PROCEDURE pr_bef_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d) >= pkwf_99_dtm.fn_sys_dt THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990080', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_bef_sys_dt;
  --
  -- Checks that Date Input is not earlier than Current System Date
  PROCEDURE pr_not_bef_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d) < pkwf_99_dtm.fn_sys_dt THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990088', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_not_bef_sys_dt;
  --  
  -- Checks that Date Input is later than Current System Date
  PROCEDURE pr_aft_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d) <= pkwf_99_dtm.fn_sys_dt THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990081', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_aft_sys_dt;
  --
  -- Checks that Date Input is not later than Current System Date
  PROCEDURE pr_not_aft_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d) > pkwf_99_dtm.fn_sys_dt THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990089', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_not_aft_sys_dt;
  --  
  -- Checks that 1ST DATE is earlier than 2ND DATE
  PROCEDURE pr_d1_bef_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d1) >= TRUNC(pi_d2) THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990083', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;
  END pr_d1_bef_d2;
  --
  -- Checks that 1ST DATE is not earlier than 2ND DATE
  PROCEDURE pr_d1_not_bef_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d1) < TRUNC(pi_d2) THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990090', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;
  END pr_d1_not_bef_d2;
  --  
  -- Checks that 1ST DATE is later than 2ND DATE
  PROCEDURE pr_d1_aft_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d1) <= TRUNC(pi_d2) THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990084', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;  
  END pr_d1_aft_d2;
  --  
  -- Checks that 1ST DATE is not later than 2ND DATE
  PROCEDURE pr_d1_not_aft_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF TRUNC(pi_d1) > TRUNC(pi_d2) THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990091', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;
  END pr_d1_not_aft_d2;
  --     
  -- Check that Value is a whole number
  PROCEDURE pr_whole_num (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NVL(pi_d,0) = 0 THEN
      NULL;
    ELSIF MOD(pi_d,1) = 0 THEN
      NULL;
    ELSE
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990076', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Number'));    
    END IF;
  END pr_whole_num;
  --
  -- Check Valid Money: Max 2 decimal places and not < 0
  FUNCTION fn_is_valid_money (pi_d IN NUMBER) RETURN BOOLEAN IS
  BEGIN
    IF pi_d < 0 THEN
      RETURN FALSE;
    ELSIF NVL(pi_d,0) = 0 THEN
      RETURN TRUE;
    ELSIF MOD(pi_d*100,1) = 0 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_is_valid_money;
  --
  -- 
  PROCEDURE pr_money (pi_d IN NUMBER, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NOT fn_is_valid_money (pi_d) THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990092', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Amount'));    
    END IF; 
  END pr_money;  
  --
  -- Validate that record status is 'Pending'
  PROCEDURE pr_pending_rec (pi_d IN NUMBER, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d IN (-1,0) THEN
      NULL;
    ELSE
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      IF pi_d = 1 THEN
        pkwf_99_err.pr_raise (pi_id => '990018', pi_pg => gv_err_pgm); -- Already approved
      ELSIF pi_d = 2 THEN
        pkwf_99_err.pr_raise (pi_id => '990026', pi_pg => gv_err_pgm); -- Already rejected
      ELSE
        pkwf_99_err.pr_raise (pi_id => '990028', pi_pg => gv_err_pgm); -- Invalid status
      END IF;
    END IF;
    --
  END pr_pending_rec;
  --   
  -- Validate that record status is 'Approved'
  PROCEDURE pr_approved_rec (pi_d IN NUMBER, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d = 1 THEN
      NULL;
    ELSE
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      IF pi_d IN (-1,0) THEN
        pkwf_99_err.pr_raise (pi_id => '990027', pi_pg => gv_err_pgm); -- Pending
      ELSIF pi_d = 2 THEN
        pkwf_99_err.pr_raise (pi_id => '990026', pi_pg => gv_err_pgm); -- Already rejected
      ELSE
        pkwf_99_err.pr_raise (pi_id => '990028', pi_pg => gv_err_pgm); -- Invalid status
      END IF;
    END IF;
    --
  END pr_approved_rec;
  --  
  -- Validate that Data length is not greater than specified value
  PROCEDURE pr_dat_len_max (pi_d IN VARCHAR2, pi_len IN NUMBER DEFAULT 50, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF LENGTH(pi_d) > pi_len THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990102', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Data')||' length', pi_p2 => TO_CHAR(pi_len));
    END IF;  
  END pr_dat_len_max;
  --
  -- Validate that Data length is not less than specified value
  PROCEDURE pr_dat_len_min (pi_d IN VARCHAR2, pi_len IN NUMBER DEFAULT 10, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF LENGTH(pi_d) < pi_len THEN
      pr_load_gvs (pi_pgm);
      IF gv_get_pgm THEN
        gv_err_pgm := fn_who_called_me;
      END IF;
      pkwf_99_err.pr_raise (pi_id => '990103', pi_pg => gv_err_pgm, pi_p1 => NVL(pi_dsc,'Data')||' length', pi_p2 => TO_CHAR(pi_len));
    END IF;  
  END pr_dat_len_min;
  --    
END pkwf_99_vld;
/

