CREATE OR REPLACE PACKAGE BODY pkwf_00_vld AS 
  --
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 11-FEB-2016
  ** Release Version  : 3.0
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
  ** Copyright:  Neulogic Solutions Ltd, 2016
  **
  */
  --
  -- Package variables
  gv_k          VARCHAR2(100);
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    SELECT SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||           
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT')     
    INTO gv_k
    FROM dual;
  END pr_load_gvs;
  --
  --
  FUNCTION fn_is_valid_adr (pi_adr VARCHAR2) RETURN BOOLEAN IS
   
/*   -- MODIFIED TO ALLOW MULTIPLE EMAILS SEPARATED BY COMMAS - FEMI, NOV 2016
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
      IF pk99_gu1.fn_is_valid_email (pi_addr => v_eml) THEN
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
    */
 --
  BEGIN
    IF pkwf_99_gu1.fn_is_valid_email (pi_addr => pi_adr) THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_is_valid_adr;
  --
  --
  /* Public Routines */
  --
  --
  PROCEDURE pr_reqd (pi_d IN VARCHAR2, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF pi_d IS NULL THEN
      pkwf_00_00_err.pr_raise (pi_id => '000010', pi_p1 => NVL(pi_dsc,'Value'));
    END IF;
  END pr_reqd;
  --
  PROCEDURE pr_reqd (pi_d IN NUMBER, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF pi_d IS NULL THEN
      pkwf_00_00_err.pr_raise (pi_id => '000010', pi_p1 => NVL(pi_dsc,'Number'));
    END IF;
  END pr_reqd;
  --
  PROCEDURE pr_reqd (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF pi_d IS NULL THEN
      pkwf_00_00_err.pr_raise (pi_id => '000010', pi_p1 => NVL(pi_dsc,'Date'));
    END IF;
  END pr_reqd;
  --
  PROCEDURE pr_above_zero (pi_d NUMBER, pi_dsc VARCHAR2) IS
  BEGIN
    IF NVL(pi_d,0) <= 0 THEN 
      pkwf_00_00_err.pr_raise (pi_id => '000012', pi_p1 => NVL(pi_dsc,'Number')||' ['||pi_d||']');
    END IF;
  END pr_above_zero;
  --
  PROCEDURE pr_not_above_zero (pi_d NUMBER, pi_dsc VARCHAR2) IS
  BEGIN
    IF pi_d > 0 THEN 
      pkwf_00_00_err.pr_raise (pi_id => '000015', pi_p1 => NVL(pi_dsc,'Number')||' ['||pi_d||']');
    END IF;
  END pr_not_above_zero;
  --  
  PROCEDURE pr_below_zero (pi_d NUMBER, pi_dsc VARCHAR2) IS
  BEGIN
    IF NVL(pi_d,0) >= 0 THEN 
      pkwf_00_00_err.pr_raise (pi_id => '000013', pi_p1 => NVL(pi_dsc,'Number')||' ['||pi_d||']');
    END IF;
  END pr_below_zero;
  --  
  PROCEDURE pr_not_below_zero (pi_d NUMBER, pi_dsc VARCHAR2) IS
  BEGIN
    IF pi_d < 0 THEN 
      pkwf_00_00_err.pr_raise (pi_id => '000016', pi_p1 => NVL(pi_dsc,'Number')||' ['||pi_d||']');
    END IF;
  END pr_not_below_zero;
  --  
  PROCEDURE pr_equal_zero (pi_d NUMBER, pi_dsc VARCHAR2) IS
  BEGIN
    IF NVL(pi_d,0) <> 0 THEN 
      pkwf_00_00_err.pr_raise (pi_id => '000014', pi_p1 => NVL(pi_dsc,'Number')||' ['||pi_d||']');    
    END IF;
  END pr_equal_zero;
  --   
  -- Validate that Input Value is greater than Limit Number
  PROCEDURE pr_above_num (pi_d   IN NUMBER, 
                          pi_lim IN NUMBER DEFAULT 0, 
                          pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                          pi_ci IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NOT (pi_d > pi_lim) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000017', pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_above_num;
  --
  -- Validate that Input Value is not greater than Limit Number
  PROCEDURE pr_not_above_num (pi_d   IN NUMBER, 
                              pi_lim IN NUMBER DEFAULT 0, 
                              pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                              pi_ci IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d > pi_lim THEN
      pkwf_00_00_err.pr_raise (pi_id => '000020', pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_not_above_num;
  --  
  -- Validate that Input Value is less than Limit Number
  PROCEDURE pr_below_num (pi_d   IN NUMBER, 
                          pi_lim IN NUMBER DEFAULT 0, 
                          pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                          pi_ci IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NOT (pi_d < pi_lim) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000018', pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_below_num;
  -- 
  -- Validate that Input Value equals Limit Number
  PROCEDURE pr_equal_num (pi_d   IN NUMBER, 
                          pi_lim IN NUMBER DEFAULT 0, 
                          pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                          pi_ci IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF NOT (pi_d = pi_lim) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000019', pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_equal_num;
  --    
  -- Validate that Input Value is not less than Limit Number
  PROCEDURE pr_not_below_num (pi_d   IN NUMBER, 
                              pi_lim IN NUMBER DEFAULT 0, 
                              pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                              pi_ci IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    IF pi_d < pi_lim THEN
      pkwf_00_00_err.pr_raise (pi_id => '000021', pi_p1 => pi_dsc, pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_not_below_num;
  --  
  -- Checks that 1ST NUMBER is not greater than 2ND NUMBER
  PROCEDURE pr_n1_not_above_n2 (pi_n1 IN NUMBER, pi_dsc1 IN VARCHAR2, pi_n2 IN NUMBER, pi_dsc2 IN VARCHAR2) IS
  BEGIN
    IF pi_n1 > pi_n2 THEN
      pkwf_00_00_err.pr_raise (pi_id => '000020', pi_p1 => NVL(pi_dsc1,'Number 1'), pi_p2 => NVL(pi_dsc2,'Number 2'));    
    END IF;
  END pr_n1_not_above_n2;
  --
  PROCEDURE pr_rate_below_100pct (pi_d NUMBER, pi_dsc VARCHAR2 DEFAULT 'Rate') IS
  BEGIN
    IF NVL(pi_d,0) >= 100 THEN 
      pkwf_00_00_err.pr_raise (pi_id => '000018', pi_p1 => pi_dsc, pi_p2 => '100%');
    END IF;
  END pr_rate_below_100pct;
  --    
  -- Checks that Date Input is earlier than Current Business Date
  PROCEDURE pr_bef_bus_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d) >= TRUNC(pkwf_00.fn_bus_dt) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000030', pi_p1 => NVL(pi_dsc,'Date'), pi_p2 => 'Current Business Date');
    END IF;
  END pr_bef_bus_dt;
  --
  -- Checks that Date Input is not earlier than Current Business Date
  PROCEDURE pr_not_bef_bus_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d) < TRUNC(pkwf_00.fn_bus_dt) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000033', pi_p1 => NVL(pi_dsc,'Date'), pi_p2 => 'Current Business Date');
    END IF;
  END pr_not_bef_bus_dt;
  --  
  -- Checks that Date Input is later than Current Business Date
  PROCEDURE pr_aft_bus_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d) <= TRUNC(pkwf_00.fn_bus_dt) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000029', pi_p1 => NVL(pi_dsc,'Date'), pi_p2 => 'Current Business Date');
    END IF;
  END pr_aft_bus_dt;
  --
  -- Checks that Date Input is not later than Current Business Date
  PROCEDURE pr_not_aft_bus_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN  
    IF TRUNC(pi_d) > TRUNC(pkwf_00.fn_bus_dt) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000032', pi_p1 => NVL(pi_dsc,'Date'), pi_p2 => 'Current Business Date');
    END IF;
  END pr_not_aft_bus_dt;
  --    
  -- Checks that Date Input is earlier than Current System Date
  PROCEDURE pr_bef_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d) >= TRUNC(pkwf_00.fn_now) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000025', pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_bef_sys_dt;
  --
  -- Checks that Date Input is not earlier than Current System Date
  PROCEDURE pr_not_bef_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d) < TRUNC(pkwf_00.fn_now) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000028', pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_not_bef_sys_dt;
  --  
  -- Checks that Date Input is later than Current System Date
  PROCEDURE pr_aft_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d) <= TRUNC(pkwf_00.fn_now) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000024', pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_aft_sys_dt;
  --
  -- Checks that Date Input is not later than Current System Date
  PROCEDURE pr_not_aft_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d) > TRUNC(pkwf_00.fn_now) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000027', pi_p1 => NVL(pi_dsc,'Date'));    
    END IF;
  END pr_not_aft_sys_dt;
  --     
  -- Checks that 1ST DATE is earlier than 2ND DATE
  PROCEDURE pr_d1_bef_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d1) >= TRUNC(pi_d2) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000030', pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;
  END pr_d1_bef_d2;
  --
  -- Checks that 1ST DATE is not earlier than 2ND DATE
  PROCEDURE pr_d1_not_bef_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d1) < TRUNC(pi_d2) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000033', pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;
  END pr_d1_not_bef_d2;
  --  
  -- Checks that 1ST DATE is later than 2ND DATE
  PROCEDURE pr_d1_aft_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d1) <= TRUNC(pi_d2) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000029', pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;  
  END pr_d1_aft_d2;
  --  
  -- Checks that 1ST DATE is not later than 2ND DATE
  PROCEDURE pr_d1_not_aft_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2) IS
  BEGIN
    IF TRUNC(pi_d1) > TRUNC(pi_d2) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000032', pi_p1 => NVL(pi_dsc1,'Date1'), pi_p2 => NVL(pi_dsc2,'Date2'));    
    END IF;
  END pr_d1_not_aft_d2;
  --     
  -- Check that Value is a whole number
  PROCEDURE pr_whole_num (pi_d NUMBER, pi_dsc VARCHAR2) IS
  BEGIN
    IF NVL(pi_d,0) = 0 THEN
      NULL;
    ELSIF MOD(pi_d,1) = 0 THEN
      NULL;
    ELSE
      pkwf_00_00_err.pr_raise (pi_id => '000023', pi_p1 => NVL(pi_dsc,'Number'));    
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
  PROCEDURE pr_money (pi_d IN NUMBER, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF NOT fn_is_valid_money (pi_d) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000034', pi_p1 => NVL(pi_dsc,'Value')||' ['||pi_d||']');    
    END IF; 
  END pr_money;  
  --
  -- Validate that record status is 'Pending'
  PROCEDURE pr_pending_rec (pi_d IN NUMBER) IS
  BEGIN
    IF pi_d IN (-1,0) THEN
      NULL;
    ELSE
      IF pi_d = 1 THEN
        pkwf_00_00_err.pr_raise (pi_id => '000038'); -- Already approved
      ELSIF pi_d = 2 THEN
        pkwf_00_00_err.pr_raise (pi_id => '000041'); -- Already rejected
      ELSE
        pkwf_00_00_err.pr_raise (pi_id => '000040'); -- Invalid status
      END IF;
    END IF;
    --
  END pr_pending_rec;
  --   
  -- Validate that record status is 'Approved'
  PROCEDURE pr_approved_rec (pi_d IN NUMBER) IS
  BEGIN
    IF pi_d = 1 THEN
      NULL;
    ELSE
      IF pi_d IN (-1,0) THEN
        pkwf_00_00_err.pr_raise (pi_id => '000039'); -- Pending
      ELSIF pi_d = 2 THEN
        pkwf_00_00_err.pr_raise (pi_id => '000041'); -- Already rejected
      ELSE
        pkwf_00_00_err.pr_raise (pi_id => '000040'); -- Invalid status
      END IF;
    END IF;
    --
  END pr_approved_rec;
  --  
  -- Validate that Data length is not greater than specified value
  PROCEDURE pr_dat_len_max (pi_d IN VARCHAR2, pi_len IN NUMBER DEFAULT 50, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF LENGTH(pi_d) > pi_len THEN
      pkwf_00_00_err.pr_raise (pi_id => '000035', pi_p1 => NVL(pi_dsc,'Data'), pi_p2 => TO_CHAR(pi_len));
    END IF;  
  END pr_dat_len_max;
  --
  -- Validate that Data length is not less than specified value
  PROCEDURE pr_dat_len_min (pi_d IN VARCHAR2, pi_len IN NUMBER DEFAULT 10, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF LENGTH(pi_d) < pi_len THEN
      pkwf_00_00_err.pr_raise (pi_id => '000036', pi_p1 => NVL(pi_dsc,'Data'), pi_p2 => TO_CHAR(pi_len));
    END IF;  
  END pr_dat_len_min;
  --   
  -- Validate that Data length equals specified value
  PROCEDURE pr_dat_len_equal (pi_d IN VARCHAR2, pi_len IN NUMBER DEFAULT 10, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF NOT (LENGTH(pi_d) = pi_len) THEN
      pkwf_00_00_err.pr_raise (pi_id => '000037', pi_p1 => NVL(pi_dsc,'Data'), pi_p2 => TO_CHAR(pi_len));
    END IF;  
  END pr_dat_len_equal;
  --   
  -- Validate that Number Value is not greater than specified value
  PROCEDURE pr_num_val_max (pi_d IN NUMBER, pi_lim IN NUMBER DEFAULT 99999999999, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF pi_d > pi_lim THEN
      pkwf_00_00_err.pr_raise (pi_id => '000020', pi_p1 => NVL(pi_dsc,'Value'), pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_num_val_max;
  --
  -- Validate that Number Value is not less than specified value
  PROCEDURE pr_num_val_min (pi_d IN NUMBER, pi_lim IN NUMBER DEFAULT 0, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF pi_d < pi_lim THEN
      pkwf_00_00_err.pr_raise (pi_id => '000021', pi_p1 => NVL(pi_dsc,'Value'), pi_p2 => TO_CHAR(pi_lim));
    END IF;  
  END pr_num_val_min;
  --
  PROCEDURE pr_valid_eml (pi_d VARCHAR2, pi_dsc IN VARCHAR2) IS
    v_r  BOOLEAN;
  BEGIN
    IF NOT fn_is_valid_adr (pi_adr => pi_d) THEN
      pkwf_00_00_err.pr_raise(pi_msg => pi_dsc||' is not a valid email address');
    END IF;
  END pr_valid_eml;
  --
  PROCEDURE pr_valid_phn (pi_d VARCHAR2, pi_dsc IN VARCHAR2) IS
  BEGIN
    IF REGEXP_LIKE(pi_d,'^\+([0-9]){7,15}$|^([0-9]){7,15}$') THEN 
      NULL;
    ELSE
      pkwf_00_00_err.pr_raise(pi_msg => pi_dsc||' is not a valid phone number');
    END IF;
  END pr_valid_phn;
  --
  --      
END pkwf_00_vld;
/
