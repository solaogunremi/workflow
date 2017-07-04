CREATE OR REPLACE PACKAGE pkwf_99_gu1 AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : General Utility Programs 1<br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Returns Percentage Variation Of Actual Value from the Base Value. Both values MUST BE > 0 otherwise OUTPUT = 0.
    * @param pi_val     Actual Number
    * @param pi_base    Base Value
    * @param pi_rnd     Rounding decimal places
  */
  FUNCTION fn_pct_var (pi_val   IN NUMBER,
                       pi_base  IN NUMBER,
                       pi_rnd   IN NUMBER DEFAULT 2) RETURN NUMBER;
  --
  /**
    * Returns Percentage Ratio Of Actual Value relative to the Base Value. Both values MUST BE > 0 otherwise OUTPUT = 0.
    * @param pi_val     Actual Number
    * @param pi_base    Base Value
    * @param pi_rnd     Rounding decimal places
  */
  FUNCTION fn_pct_ratio (pi_val   IN NUMBER,
                         pi_base  IN NUMBER,
                         pi_rnd   IN NUMBER DEFAULT 2) RETURN NUMBER;
  --
  /**
    * Converts Integer to Word (No maximum limit). Input is truncated to strip off decimals.
    * @param pi_num     Number to convert
  */
  FUNCTION fn_int_to_word (pi_num IN NUMBER) RETURN VARCHAR2;
  --
  /**
    * Converts Integer to Word (Maximum 1 trillion). Input is truncated to strip off decimals.
    * @param pi_num     Number to convert
  */
  FUNCTION fn_int_to_word1 (pi_num IN NUMBER) RETURN VARCHAR2;
  --
  /**
    * Converts Amount to words (Maximum 1 trillion).
    * @param pi_amt           Amount
    * @param pi_unt_dsc       Currency Unit Name e.g. DOLLARS
    * @param pi_sub_unt_dsc   Currency Sub-Unit Name e.g. CENTS
  */
  FUNCTION fn_amt_to_word1 (pi_amt         IN NUMBER,
                            pi_unt_dsc     IN VARCHAR2 DEFAULT '***',
                            pi_sub_unt_dsc IN VARCHAR2 DEFAULT '***') RETURN VARCHAR2;
  --
  /**
    * Converts Amount to words (No mamimum limit).
    * @param pi_amt           Amount
    * @param pi_unt_dsc       Currency Unit Name e.g. DOLLARS
    * @param pi_sub_unt_dsc   Currency Sub-Unit Name e.g. CENTS
  */
  FUNCTION fn_amt_to_word (pi_amt         IN NUMBER,
                           pi_unt_dsc     IN VARCHAR2 DEFAULT '***',
                           pi_sub_unt_dsc IN VARCHAR2 DEFAULT '***') RETURN VARCHAR2;
  --
  /**
    * Returns number of days in the year of the input date
  */
  FUNCTION fn_dys_in_yr (pi_dt IN DATE) RETURN NUMBER;
  --
  /**
    * Returns the number of seconds between two date-time values
  */
  FUNCTION fn_tm_btw_ss (pi_dt1 IN DATE, pi_dt2 IN DATE) RETURN NUMBER;
  --
  /**
    * Checks if input Email address is valid
    * @param pi_addr  Email address
  */
  FUNCTION fn_is_valid_email (pi_addr IN VARCHAR2) RETURN BOOLEAN;
  --
  /**
    * Returns Input Text formatted with a Bullet sign and a space preceding the text
  */
  FUNCTION fmt_b (pi_txt IN VARCHAR2) RETURN VARCHAR2;
  --
  /**
    * Returns concatenation of TEXT1 and TEXT2
    * TEXT2 starts on a new line 
  */
  FUNCTION fmt_cc (pi_txt1 IN VARCHAR2, pi_txt2 IN VARCHAR2) RETURN VARCHAR2;
  --  
  /**
    * Returns concatenation of TEXT1 and TEXT2
    * TEXT2 starts on a new line and is preceded by a Bullet sign and a space
  */
  FUNCTION fmt_ccb (pi_txt1 IN VARCHAR2, pi_txt2 IN VARCHAR2) RETURN VARCHAR2;
  --    
END pkwf_99_gu1;
/

