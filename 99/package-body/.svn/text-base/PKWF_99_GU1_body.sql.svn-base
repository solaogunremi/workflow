CREATE OR REPLACE PACKAGE BODY pkwf_99_gu1 AS
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 30-APR-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: General Utility Programs 1
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
  ** Copyright:  ProGenics Corp. Ltd, 2009
  **
  */
  --
  gv_k          VARCHAR2(100);
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
  --
  /* Public Routines */
  --
  -- Determines Percentage Variation Of Actual Value from the Base Value.
  -- Both values MUST BE > 0 otherwise OUTPUT = 0.
  FUNCTION fn_pct_var (pi_val IN NUMBER, pi_base IN NUMBER, pi_rnd IN NUMBER DEFAULT 2) RETURN NUMBER IS
    v_out   NUMBER;
    v_rnd   PLS_INTEGER;
  BEGIN
    v_rnd := CEIL(pi_rnd);
    IF NVL(pi_val,0) <= 0 OR NVL(pi_base,0) <= 0 THEN
      v_out := 0;
    ELSIF pi_val = pi_base THEN
      v_out := 0;
    ELSE
      v_out := (pi_val - pi_base)*100/pi_base;
    END IF;
    RETURN ROUND(v_out,v_rnd);
  END fn_pct_var;
  --
  -- Determines Percentage Ratio Of Actual Value relative to the Base Value.
  -- Both values MUST BE > 0 otherwise OUTPUT = 0.
  FUNCTION fn_pct_ratio (pi_val IN NUMBER, pi_base IN NUMBER, pi_rnd IN NUMBER DEFAULT 2) RETURN NUMBER IS
    v_out   NUMBER;
    v_rnd   PLS_INTEGER;
  BEGIN
    v_rnd := CEIL(pi_rnd);
    IF NVL(pi_val,-1) < 0 OR NVL(pi_base,0) <= 0 THEN
      v_out := 0;
    ELSE
      v_out := pi_val*100/pi_base;
    END IF;
    RETURN ROUND(v_out,v_rnd);
  END fn_pct_ratio;
  --
  -- Converts Integer to Word. Input is truncated to strip off decimals.
  FUNCTION fn_int_to_word (pi_num IN NUMBER) RETURN VARCHAR2 IS
    -- original by Tom Kyte
    type myArray is table of varchar2(255);
    l_str     myArray := myArray( '',
                          ' thousand ', ' million ',
                           ' billion ', ' trillion ',
                           ' quadrillion ', ' quintillion ',
                           ' sextillion ', ' septillion ',
                           ' octillion ', ' nonillion ',
                           ' decillion ', ' undecillion ',
                           ' duodecillion ' );
    l_num     varchar2(50);
    l_return  varchar2(4000);
  BEGIN
    --
    l_return := NULL;
    --
    IF pi_num IS NOT NULL THEN
      --
      l_num := ABS(trunc(pi_num));
      --
      IF l_num = '0' THEN
        l_return := 'ZERO';
      ELSE
        for i in 1 .. l_str.count
        loop
            exit when l_num is null;
            if ( substr(l_num, length(l_num)-2, 3) <> 0 )
            then
                l_return := to_char(
                                to_date(
                                 substr(l_num, length(l_num)-2, 3),
                                   'J' ),
                            'Jsp' ) || l_str(i) || l_return;
            end if;
            l_num := substr( l_num, 1, length(l_num)-3 );
        end loop;
        IF pi_num < 0 THEN
          l_return := 'MINUS '||l_return;
        END IF;
      END IF;
    END IF;
    --
    RETURN UPPER(l_return);
    --
  END fn_int_to_word;
  --
  -- Converts Integer to Word (Maximum 1 trillion)
  FUNCTION fn_int_to_word1 (pi_num IN NUMBER) RETURN VARCHAR2 IS
    v_desc VARCHAR2(1000);
    v_int  NUMBER := ABS(TRUNC(NVL(pi_num,0)));
  BEGIN
    IF v_int > 1000000000000 THEN -- MUST NOT BE GREATER THAN ONE TRILLION
      v_desc := 'Cannot Convert Value Exceeding 1,000,000,000,000';
    ELSIF v_int = 0 THEN
      v_desc := 'ZERO';
    ELSE
      IF v_int = 1000000000000 THEN
        v_desc := 'ONE TRILLION';
      ELSE
        SELECT
          decode(v_int, 0, '',
          decode(trunc(v_int/1000000000),0,'',
          decode(greatest(trunc(v_int/1000000000),99),
          99,to_char(to_date(trunc(v_int/1000000000),'J'),'JSP'),
          to_char(to_date(trunc(trunc(v_int/1000000000)/100),'J'),'JSP')||
          decode(mod(trunc(v_int/1000000000),100),0,' HUNDRED',' HUNDRED AND '||
          to_char(to_date(mod(trunc(v_int/1000000000),100),'J'),'JSP') ) )||
          decode( mod(v_int,1000000000),0,' BILLION',
          decode( greatest(mod(v_int,1000000000),99),99,' BILLION AND ',' BILLION, ') ) )||
          decode( trunc(mod(v_int,1000000000)/1000000),0,'',
          decode( greatest(trunc(mod(v_int,1000000000)/1000000),99),
          99,to_char(to_date(trunc(mod(v_int,1000000000)/1000000),'J'),'JSP'),
          to_char(to_date(trunc(trunc(mod(v_int,1000000000)/1000000)/100),'J'),'JSP')||
          decode( mod(trunc(mod(v_int,1000000000)/1000000),100),0,' HUNDRED',' HUNDRED AND '||
          to_char(to_date(mod(trunc(mod(v_int,1000000000)/1000000),100),'J'),'JSP') ) )||
          decode( trunc(mod(mod(v_int,1000000000),1000000)),0,' MILLION',
          decode( greatest(trunc(mod(mod(v_int,1000000000),1000000)),99),
          99,' MILLION AND ',' MILLION, ' ) ) )||
          decode( trunc(mod(v_int,1000000)/1000),0,'',
          decode( greatest(trunc(mod(v_int,1000000)/1000),99),
          99,to_char(to_date(trunc(mod(v_int,1000000)/1000),'J'),'JSP'),
          to_char(to_date(trunc(trunc(mod(v_int,1000000)/1000)/100),'J'),'JSP')||
          decode( mod(trunc(mod(v_int,1000000)/1000),100),0,' HUNDRED',' HUNDRED AND '||
          to_char(to_date(mod(trunc(mod(v_int,1000000)/1000),100),'J'),'JSP') ) )||
          decode( trunc(mod(mod(v_int,1000000),1000)),0,' THOUSAND',
          decode( greatest(trunc(mod(mod(v_int,1000000),1000)),99),
          99,' THOUSAND AND ',' THOUSAND, ' ) ) )||
          decode( greatest(trunc(mod(v_int,1000)),99),
          99,decode( trunc(mod(v_int,1000)),0,'',
          to_char(to_date(trunc(mod(v_int,1000)),'J'),'JSP') ),
          decode( trunc(trunc(mod(v_int,1000))/100),0,'',
          decode( greatest(trunc(mod(v_int,1000)),99),
          99,to_char(to_date(trunc(mod(v_int,1000)),'J'),'JSP'),
          to_char(to_date(trunc(trunc(mod(v_int,1000))/100),'J'),'JSP')||
          decode( trunc(mod(trunc(mod(v_int,1000)),100)),0,' HUNDRED ',' HUNDRED AND '||
          to_char(to_date(mod(trunc(mod(v_int,1000)),100),'J'),'JSP') ) ) ) ) )
        INTO v_desc
        FROM DUAL;
      END IF;
      --
      IF pi_num < 0 THEN
        v_desc := 'MINUS '||v_desc;
      END IF;
      --
    END IF;
    --
    RETURN v_desc;
    --
  END fn_int_to_word1;
  --
  -- Converts Amount to words
  FUNCTION fn_amt_to_word (pi_amt         IN NUMBER,
                           pi_unt_dsc     IN VARCHAR2 DEFAULT '***',
                           pi_sub_unt_dsc IN VARCHAR2 DEFAULT '***') RETURN VARCHAR2 IS
    --
    v_desc  VARCHAR2(2000);
    v_amt   NUMBER;
    v_num   NUMBER;
    --
  BEGIN
    --
    v_desc := NULL;
    --
    IF pi_amt IS NOT NULL THEN
      --
      v_amt := NVL(pi_amt,0);
      --
      IF v_amt = 0 THEN
        v_desc := 'ZERO '||pi_unt_dsc||' ONLY';
      ELSE
        -- Quotient
        v_num := ABS(TRUNC(v_amt));
        IF v_num > 0 THEN
          v_desc := fn_int_to_word(v_num);
        ELSE
          v_desc := 'ZERO';
        END IF;
        v_desc := v_desc||' '||pi_unt_dsc;
        -- Mantissa
        v_num := ABS(v_amt) - ABS(TRUNC(v_amt));
        IF v_num = 0 THEN
          v_desc := v_desc||' ONLY';
        ELSE
          v_desc := v_desc||' '||fn_int_to_word(v_num)||' '||pi_sub_unt_dsc||' ONLY';
        END IF;
      END IF;
      --
      IF v_amt < 0 THEN
        v_desc := 'MINUS '||v_desc;
      END IF;
      --
    END IF;
    --
    RETURN v_desc;
    --
  END fn_amt_to_word;
  --
  -- Converts Amount to words (Maximum 1 trillion)
  FUNCTION fn_amt_to_word1 (pi_amt         IN NUMBER,
                            pi_unt_dsc     IN VARCHAR2 DEFAULT '***',
                            pi_sub_unt_dsc IN VARCHAR2 DEFAULT '***') RETURN VARCHAR2 IS
    --
    v_desc  VARCHAR2(2000);
    v_amt   NUMBER;
    v_num   NUMBER;
    --
  BEGIN
    --
    v_desc := NULL;
    --
    IF pi_amt IS NOT NULL THEN
      --
      v_amt := NVL(pi_amt,0);
      --
      IF ABS(v_amt) > 1000000000000 THEN -- MUST NOT BE GREATER THAN ONE TRILLION
        v_desc := 'Cannot Convert Amount Exceeding 1,000,000,000,000.00';
      ELSIF v_amt = 0 THEN
        v_desc := 'ZERO '||pi_unt_dsc||' ONLY';
      ELSE
        -- Quotient
        v_num := ABS(TRUNC(v_amt));
        IF v_num > 0 THEN
          v_desc := fn_int_to_word1(v_num);
        ELSE
          v_desc := 'ZERO';
        END IF;
        v_desc := v_desc||' '||pi_unt_dsc;
        -- Mantissa
        v_num := ABS(v_amt) - ABS(TRUNC(v_amt));
        IF v_num = 0 THEN
          v_desc := v_desc||' ONLY';
        ELSE
          v_desc := v_desc||' '||fn_int_to_word1(v_num)||' '||pi_sub_unt_dsc||' ONLY';
        END IF;
      END IF;
      --
      IF v_amt < 0 THEN
        v_desc := 'MINUS '||v_desc;
      END IF;
      --
    END IF;
    --
    RETURN v_desc;
    --
  END fn_amt_to_word1;
  --
  -- Returns number of days in the year of the input date
  FUNCTION fn_dys_in_yr (pi_dt IN DATE) RETURN NUMBER IS
    v_days  NUMBER(3) := NULL;
  BEGIN
    IF pi_dt IS NOT NULL THEN
      v_days := TRUNC(ADD_MONTHS(pi_dt,12),'YEAR') - TRUNC(pi_dt,'YEAR');
    ELSE
      v_days := NULL;
    END IF;
    RETURN v_days;
  END fn_dys_in_yr;
  --
  -- Calculates the number of seconds between two date-time values
  FUNCTION fn_tm_btw_ss (pi_dt1 IN DATE, pi_dt2 IN DATE) RETURN NUMBER IS
    --
    v_dt1     NUMBER;
    v_dt2     NUMBER;
    v_secs1   NUMBER(5,0);
    v_secs2   NUMBER(5,0);
    --
  BEGIN
    --
    IF pi_dt1 IS NOT NULL AND pi_dt2 IS NOT NULL THEN
      --
      -- Get Julian date number from first date (pi_dt1)
      v_dt1 := TO_NUMBER(TO_CHAR(pi_dt1, 'J'));

      -- Get Julian date number from second date (pi_dt2)
      v_dt2 := TO_NUMBER(TO_CHAR(pi_dt2, 'J'));

      -- Get seconds since midnight from first date (pi_dt1)
      v_secs1 := TO_NUMBER(TO_CHAR(pi_dt1, 'SSSSS'));

      -- Get seconds since midnight from second date (pi_dt2)
      v_secs2 := TO_NUMBER(TO_CHAR(pi_dt2, 'SSSSS'));
      --
      RETURN (((v_dt2 - v_dt1) * 86400)+(v_secs2 - v_secs1));
      --
    ELSE
      RETURN NULL;
    END IF;
    --
  END fn_tm_btw_ss;
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
  FUNCTION fmt_b (pi_txt IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN chr(149)||' '||pi_txt;
  END fmt_b;
  --    
  FUNCTION fmt_cc (pi_txt1 IN VARCHAR2, pi_txt2 IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF pi_txt2 IS NULL THEN
      RETURN pi_txt1;
    ELSIF pi_txt1 IS NULL THEN
      RETURN pi_txt2;
    ELSE
      RETURN pi_txt1||chr(10)||pi_txt2;
    END IF;
  END fmt_cc;
  --
  FUNCTION fmt_ccb (pi_txt1 IN VARCHAR2, pi_txt2 IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    IF pi_txt2 IS NULL THEN
      RETURN pi_txt1;
    ELSIF pi_txt1 IS NULL THEN
      RETURN chr(149)||' '||pi_txt2;
    ELSE
      RETURN pi_txt1||chr(10)||chr(149)||' '||pi_txt2;
    END IF;
  END fmt_ccb;
  --  
END pkwf_99_gu1;
/

