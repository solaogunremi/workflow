CREATE OR REPLACE PACKAGE BODY pkwf_00_dsp AS
  --
  /* Created By       : Kunle Adebona
  ** Date Created     : 03-DEC-2011
  ** Release Version  : 3.0
  **
  ** PURPOSE: Message Display Formatting
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
  ** Copyright:  ProGenics Corp. Ltd, 2011
  **
  */
  --
  --
  /* Package Variables */
  --
  gv_amt_fmt       VARCHAR2(30) := '999,999,999,999,990.00';
  gv_amt_fmt2       VARCHAR2(30) := '999,999,999,999,990.0000';
  gv_prc_fmt        VARCHAR2(30) := '999,999,999,990.00000';
  gv_qty_fmt        VARCHAR2(30) := '999,999,999,999,990';
  gv_unt_fmt        VARCHAR2(30) := '999,999,999,990.0000';
  gv_untbnd_fmt     VARCHAR2(30) := '999,999,999,990.00000000';
  --
  /* Private Routines */
  --    
  FUNCTION fn_dflt_num (pi_val VARCHAR2) RETURN NUMBER IS
    v_out  NUMBER := NULL;
  BEGIN
    IF pi_val IS NOT NULL THEN
      BEGIN
        v_out := TO_NUMBER(pi_val);
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END IF;
    RETURN v_out;
  END fn_dflt_num;
  --
  --
  /* Public Routines */
  --   
  -- Return new line
  FUNCTION fn_new_line RETURN VARCHAR IS
  BEGIN
    RETURN CHR(13)||CHR(10);
  END fn_new_line;
  --
  -- Format the Quantity Input (Output Format: 999,999,999,999,990 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_qty (pi_qty NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2 IS
    v_out   VARCHAR2(100) := NULL;
  BEGIN
    --
    IF pi_qty IS NOT NULL THEN 
      IF pi_trim_yn = '1' THEN
        SELECT TO_CHAR(NVL(pi_qty,0),'FM'||gv_qty_fmt) INTO v_out FROM DUAL;
      ELSE
        SELECT TO_CHAR(NVL(pi_qty,0),gv_qty_fmt) INTO v_out FROM DUAL;
      END IF;
    END IF;
    --
    RETURN v_out;
    --
  END fn_fmt_qty;
  --
  -- Format the Amount Input (Output Format: 999,999,999,999,990.99 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_amt (pi_amt NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2 IS
    v_out   VARCHAR2(100) := NULL;
  BEGIN
    --
    IF pi_amt IS NOT NULL THEN 
      IF pi_trim_yn = '1' THEN
        SELECT TO_CHAR(NVL(pi_amt,0),'FM'||gv_amt_fmt) INTO v_out FROM DUAL;
      ELSE
        SELECT TO_CHAR(NVL(pi_amt,0),gv_amt_fmt) INTO v_out FROM DUAL;
      END IF;
    END IF;
    --
    RETURN v_out;
    --
  END fn_fmt_amt;
  --
  -- Format the Rate Input (Output Format: 999,999.99999% to input decimal places, trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_rt (pi_rt NUMBER, pi_dcml_pls NUMBER DEFAULT 2, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2 IS
    v_dp    PLS_INTEGER;
    v_rt    NUMBER;
    v_out   VARCHAR2(100) := NULL;
    v_fmt   VARCHAR2(30);
  BEGIN
    --
    IF pi_rt IS NOT NULL THEN
      --
      v_dp := ROUND(pi_dcml_pls);
      IF v_dp <= 0 THEN
        v_dp := 0;
      END IF;
      --
      v_rt := NVL(pi_rt,0);
      v_rt := ROUND(pi_rt,v_dp);
      --
      IF pi_trim_yn = '1' THEN
        v_fmt := 'FM999,990';
      ELSE
        v_fmt := '999,990';
      END IF;
      --
      IF v_dp > 0 THEN
        v_fmt := v_fmt||'.';
        FOR i IN 1..v_dp LOOP
          v_fmt := v_fmt||'0';
        END LOOP;
      END IF;
      --
      SELECT TO_CHAR(v_rt,v_fmt)||'%' INTO v_out FROM DUAL;    
      --
    END IF;
    --
    RETURN v_out;
    --
  END fn_fmt_rt;
  -- 
  --
  -- Format any number Input (Output Format: 999,999.99999 to input decimal places, trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_no (pi_no NUMBER, pi_dcml_pls NUMBER DEFAULT 2, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2 IS
    v_dp    PLS_INTEGER;
    v_no    NUMBER;
    v_out   VARCHAR2(100) := NULL;
    v_fmt   VARCHAR2(30);
  BEGIN
    --
    IF pi_no IS NOT NULL THEN
      --
      v_dp := ROUND(pi_dcml_pls);
      IF v_dp <= 0 THEN
        v_dp := 0;
      END IF;
      --
      v_no := NVL(pi_no,0);
      v_no := ROUND(pi_no,v_dp);
      --
      IF pi_trim_yn = '1' THEN
        v_fmt := 'FM999,990';
      ELSE
        v_fmt := '999,990';
      END IF;
      --
      IF v_dp > 0 THEN
        v_fmt := v_fmt||'.';
        FOR i IN 1..v_dp LOOP
          v_fmt := v_fmt||'0';
        END LOOP;
      END IF;
      --
      SELECT TO_CHAR(v_no,v_fmt) INTO v_out FROM DUAL;    
      --
    END IF;
    --
    RETURN v_out;
    --
  END fn_fmt_no;
  -- 
  -- Format the Date Input (Output Format: DD-MONTH-YYYY)
  FUNCTION fn_fmt_dt1 (pi_dt DATE) RETURN VARCHAR2 IS
  BEGIN
    IF pi_dt IS NULL THEN
      RETURN NULL;
    ELSE
      RETURN TO_CHAR(pi_dt,'FMDD-MONTH-YYYY');
    END IF;
  END fn_fmt_dt1;
  --
  -- Format the Date Input (Output Format: DD-MON-YYYY)
  FUNCTION fn_fmt_dt2 (pi_dt DATE) RETURN VARCHAR2 IS
  BEGIN
    IF pi_dt IS NULL THEN
      RETURN NULL;
    ELSE
      RETURN TO_CHAR(pi_dt,'DD-MON-YYYY');
    END IF;
  END fn_fmt_dt2;  
  --  
  -- Format the Date Input (Output Format: DD/MM/YYYY)
  FUNCTION fn_fmt_dt3 (pi_dt DATE) RETURN VARCHAR2 IS
  BEGIN
    IF pi_dt IS NULL THEN
      RETURN NULL;
    ELSE
      RETURN TO_CHAR(pi_dt,'DD/MM/YYYY');
    END IF;
  END fn_fmt_dt3;  
  --
  -- Unformat Amount
  FUNCTION fn_unfmt_amt (pi_val IN VARCHAR2) RETURN NUMBER IS
    v_out   NUMBER := NULL;
  BEGIN
    --
    IF pi_val IS NOT NULL THEN 
      SELECT TO_NUMBER(NVL(pi_val,'0'),gv_amt_fmt) INTO v_out FROM DUAL;
    END IF;
    --
    RETURN v_out;
    --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN fn_dflt_num (pi_val);
  END fn_unfmt_amt;
  --
  -- Unformat Quantity
  FUNCTION fn_unfmt_qty (pi_val IN VARCHAR2) RETURN NUMBER IS
    v_out   NUMBER := NULL;
  BEGIN
    --
    IF pi_val IS NOT NULL THEN 
      SELECT TO_NUMBER(NVL(pi_val,'0'),gv_qty_fmt) INTO v_out FROM DUAL;
    END IF;
    --
    RETURN v_out;
    --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN fn_dflt_num (pi_val);
  END fn_unfmt_qty;  
  --
  -- Unformat Rate
  FUNCTION fn_unfmt_rt (pi_val IN VARCHAR2) RETURN NUMBER IS
    v_val   VARCHAR2(100) := NULL;
    v_out   NUMBER := NULL;
  BEGIN
    --
    IF pi_val IS NOT NULL THEN 
      v_val := REPLACE(pi_val,'%');
      SELECT TO_NUMBER(NVL(v_val,'0'),'999,999,990.00000000') INTO v_out FROM DUAL;
    END IF;
    --
    RETURN v_out;
    --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN fn_dflt_num (pi_val);
  END fn_unfmt_rt;  
  --
  -- Unformat Number
  FUNCTION fn_unfmt_no (pi_val IN VARCHAR2) RETURN NUMBER IS
    v_out   NUMBER := NULL;
  BEGIN
    --
    IF pi_val IS NOT NULL THEN 
      SELECT TO_NUMBER(NVL(pi_val,'0'),'999,999,990.00000000') INTO v_out FROM DUAL;
    END IF;
    --
    RETURN v_out;
    --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN fn_dflt_num (pi_val);
  END fn_unfmt_no ;  
  --
  -- Format the Price Input (Output Format: 999,999,999,990.000000 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_prc (pi_prc NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2 IS
    v_out   VARCHAR2(100) := NULL;
  BEGIN
    --
    IF pi_prc IS NOT NULL THEN 
      IF pi_trim_yn = '1' THEN
        SELECT TO_CHAR(NVL(pi_prc,0),'FM'||gv_prc_fmt) INTO v_out FROM DUAL;
      ELSE
        SELECT TO_CHAR(NVL(pi_prc,0),gv_prc_fmt) INTO v_out FROM DUAL;
      END IF;
    END IF;
    --
    RETURN v_out;
    --
  END fn_fmt_prc;
  --
  -- Unformat Price
  FUNCTION fn_unfmt_prc (pi_val IN VARCHAR2) RETURN NUMBER IS
    v_out   NUMBER := NULL;
  BEGIN
    --
    IF pi_val IS NOT NULL THEN 
      SELECT TO_NUMBER(NVL(pi_val,'0'),gv_prc_fmt) INTO v_out FROM DUAL;
    END IF;
    --
    RETURN v_out;
    --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN fn_dflt_num (pi_val);
  END fn_unfmt_prc;
  --  
  -- Format the Units Input (Output Format: 999,999,999,990.0000 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_unt (pi_unt NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2 IS
    v_out   VARCHAR2(100) := NULL;
  BEGIN
    --
    IF pi_unt IS NOT NULL THEN 
      IF pi_trim_yn = '1' THEN
        SELECT TO_CHAR(NVL(pi_unt,0),'FM'||gv_unt_fmt) INTO v_out FROM DUAL;
      ELSE
        SELECT TO_CHAR(NVL(pi_unt,0),gv_unt_fmt) INTO v_out FROM DUAL;
      END IF;
    END IF;
    --
    RETURN v_out;
    --
  END fn_fmt_unt;
  --
  -- Unformat Units
  FUNCTION fn_unfmt_unt (pi_val IN VARCHAR2) RETURN NUMBER IS
    v_out   NUMBER := NULL;
  BEGIN
    --
    IF pi_val IS NOT NULL THEN 
      SELECT TO_NUMBER(NVL(pi_val,'0'),gv_unt_fmt) INTO v_out FROM DUAL;
    END IF;
    --
    RETURN v_out;
    --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN fn_dflt_num (pi_val);
  END fn_unfmt_unt;
  --    
  -- Format the Bonds Units Input (Output Format: 999,999,999,990.00000000 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_untbnd (pi_unt NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2 IS
    v_out   VARCHAR2(100) := NULL;
  BEGIN
    --
    IF pi_unt IS NOT NULL THEN 
      IF pi_trim_yn = '1' THEN
        SELECT TO_CHAR(NVL(pi_unt,0),'FM'||gv_untbnd_fmt) INTO v_out FROM DUAL;
      ELSE
        SELECT TO_CHAR(NVL(pi_unt,0),gv_untbnd_fmt) INTO v_out FROM DUAL;
      END IF;
    END IF;
    --
    RETURN v_out;
    --
  END fn_fmt_untbnd;
  --
  -- Unformat Units
  FUNCTION fn_unfmt_untbnd (pi_val IN VARCHAR2) RETURN NUMBER IS
    v_out   NUMBER := NULL;
  BEGIN
    --
    IF pi_val IS NOT NULL THEN 
      SELECT TO_NUMBER(NVL(pi_val,'0'),gv_untbnd_fmt) INTO v_out FROM DUAL;
    END IF;
    --
    RETURN v_out;
    --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN fn_dflt_num (pi_val);
  END fn_unfmt_untbnd;
  --  
  -- Converts Integer to Word
  FUNCTION fn_int_in_word (pi_int IN NUMBER) RETURN VARCHAR2 IS
    v_desc VARCHAR2(4000);
    v_int  NUMBER := ABS(TRUNC(NVL(pi_int,0)));
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
      IF pi_int < 0 THEN
        v_desc := 'MINUS '||v_desc;
      END IF;
      --
    END IF;
    --
    RETURN v_desc;
    --
  END fn_int_in_word;
  --    
  --  
  FUNCTION fn_amt_in_word (pi_amt IN NUMBER, pi_curr_id IN VARCHAR2) RETURN VARCHAR2 IS
    --
    v_desc              VARCHAR2(2000);
    v_basic_unit_name   VARCHAR2(100);
    v_subdivision_name  VARCHAR2(100);
    --
    v_amt   NUMBER := NVL(pi_amt,0);
    v_num   NUMBER;
    --
  BEGIN
    --          
    IF ABS(v_amt) > 1000000000000 THEN -- MUST NOT BE GREATER THAN ONE TRILLION
      v_desc := 'Cannot Convert Amount Exceeding 1,000,000,000,000.00';
    ELSE      
      --
      v_basic_unit_name := 'NAIRA';
      v_subdivision_name := 'KOBO';
      --
      IF pi_curr_id IS NOT NULL THEN
        BEGIN
          NULL;
          /*
          SELECT UPPER(NVL(unt_dsc,'*****')), UPPER(NVL(sunt_dsc,'*****'))
            INTO v_basic_unit_name, v_subdivision_name
            FROM v_99_$$_lst_cur
           WHERE UPPER(cur_id) = UPPER(pi_curr_id);
        EXCEPTION
          WHEN OTHERS THEN  
            v_basic_unit_name := '*****';
            v_subdivision_name := '*****';
         */   
        END;
      END IF;
      --
      IF v_amt = 0 THEN
        v_desc := 'ZERO '||v_basic_unit_name||' ONLY';
      ELSIF v_amt = 1000000000000 THEN
        v_desc := 'ONE TRILLION '||v_basic_unit_name||' ONLY';
      ELSE
        -- Quotient 
        v_num := ABS(TRUNC(v_amt));
        IF v_num > 0 THEN
          v_desc := fn_int_in_word(v_num);
        ELSE
          v_desc := 'ZERO';
        END IF;
        v_desc := v_desc||' '||v_basic_unit_name;
        -- Mantissa
        v_num := ABS(ROUND(MOD(v_amt,1),2)*100);
        IF v_num = 0 THEN
          v_desc := v_desc||' ONLY';
        ELSE
          v_desc := v_desc||' '||fn_int_in_word(v_num)||' '||v_subdivision_name||' ONLY';
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
  END fn_amt_in_word;  
  --
  --      
END pkwf_00_dsp;
/
