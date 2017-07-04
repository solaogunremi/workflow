CREATE OR REPLACE PACKAGE pkwf_00_dsp AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Message Display Formatting <br/>
  *  SCHEMA: SYMPLUS <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 03-DEC-2011 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  -- Return new line
  FUNCTION fn_new_line RETURN VARCHAR;
  --
  -- Format the Quantity Input (Output Format: 999,999,999,990 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_qty (pi_qty NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2;
  --
  -- Format the Amount Input (Output Format: 999,999,999,990.99 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_amt (pi_amt NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2;
  --
  -- Format the Rate Input (Output Format: 999,999.99999% to input decimal places, trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_rt (pi_rt NUMBER, pi_dcml_pls NUMBER DEFAULT 2, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2;
  --
  -- Format the Rate Input (Output Format: 999,999.99999% to input decimal places, trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_no (pi_no NUMBER, pi_dcml_pls NUMBER DEFAULT 2, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2;
  --
  -- Format the Date Input (Output Format: DD-MONTH-YYYY)
  FUNCTION fn_fmt_dt1 (pi_dt DATE) RETURN VARCHAR2;
  --
  -- Format the Date Input (Output Format: DD-MON-YYYY)
  FUNCTION fn_fmt_dt2 (pi_dt DATE) RETURN VARCHAR2;
  --  
  -- Format the Date Input (Output Format: DD/MM/YYYY)
  FUNCTION fn_fmt_dt3 (pi_dt DATE) RETURN VARCHAR2;
  --
  -- Unformat Amount
  FUNCTION fn_unfmt_amt (pi_val IN VARCHAR2) RETURN NUMBER;
  --
  -- Unformat Quantity
  FUNCTION fn_unfmt_qty (pi_val IN VARCHAR2) RETURN NUMBER;
  --
  -- Unformat Rate
  FUNCTION fn_unfmt_rt(pi_val IN VARCHAR2) RETURN NUMBER;
  --
  -- Unformat Number
  FUNCTION fn_unfmt_no(pi_val IN VARCHAR2) RETURN NUMBER;
  --  
  -- Format the Price Input (Output Format: 999,999,999,990.000000 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_prc (pi_prc NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2;
  -- 
  -- Unformat Price
  FUNCTION fn_unfmt_prc (pi_val IN VARCHAR2) RETURN NUMBER;
  --  
  -- Format the Units Input (Output Format: 999,999,999,990.0000 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_unt (pi_unt NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2;
  -- 
  -- Unformat Units
  FUNCTION fn_unfmt_unt (pi_val IN VARCHAR2) RETURN NUMBER;
  --    
  -- Format the Bond Units Input (Output Format: 999,999,999,990.00000000 trimming Leading Blanks if so specified)
  FUNCTION fn_fmt_untbnd (pi_unt NUMBER, pi_trim_yn VARCHAR2 DEFAULT '1') RETURN VARCHAR2;
  -- 
  -- Unformat Bond Units
  FUNCTION fn_unfmt_untbnd (pi_val IN VARCHAR2) RETURN NUMBER;
  --
  -- Converts Amount to Word
  FUNCTION fn_amt_in_word (pi_amt IN NUMBER, pi_curr_id IN VARCHAR2) RETURN VARCHAR2;
  --      
  --
END pkwf_00_dsp;
/
