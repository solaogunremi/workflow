CREATE OR REPLACE PACKAGE BODY pkwb_01_vld AS
  --
  /* Author : Aderemi Alabi, 14-APR-2016
  **
  ** Purpose  : WB -  Validations
  **
  ** Modification History :
  **
  ** Copyright :  Neulogic Solutions, 201
  **
  */
  --
  --
  /* Package Variable */
  --
  
  --
  --
  /* Private Routine */
  --
  
  /* Public Routine */
  --
  FUNCTION fn_is_valid_email (pi_addr IN VARCHAR2) RETURN BOOLEAN IS
    v_dot_posn  PLS_INTEGER;
    v_at_posn   PLS_INTEGER;
    v_len       PLS_INTEGER;
    v_chr       VARCHAR2(1);
    v_valid     BOOLEAN;
    v_string    VARCHAR2(500);
  BEGIN
    --
    v_dot_posn := INSTR(pi_addr,'.');
    v_at_posn  := INSTR(pi_addr,'@');
    v_len      := LENGTH(TRIM(pi_addr));
    v_string   := '#*!$%&()+{}[]<>?/,:;|=~^';
    --
    v_valid := TRUE;
    --
    IF v_len = 0 OR v_dot_posn = 0 OR v_at_posn = 0 THEN
      v_valid := FALSE;
    END IF;
    --
    IF v_valid THEN
      --  Check for 'SPACE'
      FOR i IN 1..v_len LOOP
        v_chr := SUBSTR(pi_addr,i,1);
        IF (v_chr IS NULL) OR (v_chr = '') OR (v_chr = '''') THEN
          v_valid := FALSE;
          EXIT;
        END IF;
      END LOOP;
      --
    END IF;
    --
    IF v_valid THEN
      --  Check for special characters
      FOR i IN 1..LENGTH(v_string) LOOP
        FOR j IN 1..v_len LOOP
          v_chr := SUBSTR(pi_addr, j, 1);
          IF (v_chr = SUBSTR(v_string, i, 1)) OR (v_chr = '') OR (v_chr = '''') THEN
            v_valid := FALSE;
            EXIT;
          END IF;
        END LOOP;
      END LOOP;
      --
    END IF;
    --
    IF v_valid THEN
      -- Check for 2 or more occurences of '@'
      v_at_posn := INSTR(pi_addr,'@',1,2);
      IF v_at_posn > 1 then
        v_valid := FALSE;
      END IF;
      --
    END IF;
    --
    IF v_valid THEN
      -- Check for Occurences of '..'
      v_at_posn := INSTR(pi_addr,'..',1,1);
      IF v_at_posn > 1 then
        v_valid := FALSE;
      END IF;
      --
    END IF;
    --
    IF v_valid THEN
      -- Check for Occurences of '@.'
      v_at_posn := INSTR(pi_addr,'@.',1,1);
      IF v_at_posn > 1 then
        v_valid := FALSE;
      END IF;
      --
    END IF;
    --
    IF v_valid THEN
      -- Check for Occurences of '.@'
      v_at_posn := INSTR(pi_addr,'.@',1,1);
      IF v_at_posn > 1 then
        v_valid := FALSE;
      END IF;
      --
    END IF;
    --
    IF v_valid THEN
      -- Check that '@' character is present and is not the first or last character
      v_at_posn := INSTR(pi_addr,'@',1) ;
      IF v_at_posn IN (0,1,v_len) THEN
        v_valid := FALSE;
      END IF;
      --
    END IF;
    --
    IF v_valid THEN
      -- Check that '.' character is present and is not the first or last character
      v_dot_posn := INSTR(pi_addr,'.',1) ;
      IF v_dot_posn IN (0,1,v_len) THEN
        v_valid := FALSE;
      END IF;
    END IF;
    --
    IF v_valid THEN
      -- Check that at least one character is present between @ and '.'
      v_at_posn := INSTR(pi_addr,'@',1);
      v_string := SUBSTR(pi_addr,v_at_posn+1,500);
      v_dot_posn := INSTR(v_string,'.',1) ;
      IF NVL(v_dot_posn,0) <= 1 THEN
        v_valid := FALSE;
      END IF;
    END IF;
    --
    RETURN v_valid;
    --
  END fn_is_valid_email;
  --
  FUNCTION fn_is_valid_phone (pi_no IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    IF REGEXP_LIKE(pi_no,'^\+([0-9]){7,15}$|^([0-9]){7,15}$') THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_is_valid_phone;
  --  
  --
  FUNCTION fn_is_valid_money (pi_amt IN NUMBER) RETURN BOOLEAN IS
  BEGIN
    IF pi_amt < 0 THEN
      RETURN FALSE;
    ELSIF NVL(pi_amt,0) = 0 THEN
      RETURN TRUE;
    ELSIF MOD(pi_amt*100,1) = 0 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END fn_is_valid_money;
--  
  FUNCTION fn_is_json (pi_string IN VARCHAR2)RETURN BOOLEAN IS
    v_return BOOLEAN := FALSE;
  BEGIN
    --
    IF SUBSTR(pi_string, 1, 1 ) = '{' AND
       SUBSTR(pi_string, LENGTH(pi_string), 1) = '}' THEN
      v_return := TRUE;
    END IF;
    --
    RETURN v_return;
    --
  END fn_is_json;
  --
END pkwb_01_vld;
/
  