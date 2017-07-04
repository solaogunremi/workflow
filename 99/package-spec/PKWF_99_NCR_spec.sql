CREATE OR REPLACE PACKAGE pkwf_99_ncr AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Interface to Database Cryptographic programs <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  --
  /**
    * Returns Hash data.
    * @param pi_d Input Data
    * @param pi_t Type: SH1, MD5
  */
  FUNCTION fn_hsh (pi_k IN VARCHAR2, pi_d IN VARCHAR2, pi_t IN VARCHAR2) RETURN RAW;
  --
  /**
    * Returns Encrypted data.
    * @param pi_d Input Data
  */
  FUNCTION fn_encr (pi_k IN VARCHAR2, pi_d IN VARCHAR2) RETURN RAW;
  --
  /**
    * Returns Decrypted data.
    * @param pi_d Encrypted Input Data
  */
  FUNCTION fn_decr (pi_k IN VARCHAR2, pi_d IN RAW) RETURN VARCHAR2;
  --
  /**
    * Returns Encrypted data using supplied key.
    * @param pi_d Input Data
    * @param pi_dk Encryption Key
  */
  FUNCTION fn_encr_k (pi_k IN VARCHAR2, pi_d IN VARCHAR2, pi_dk RAW) RETURN RAW;
  --
  /**
    * Returns Decrypted data using supplied key.
    * @param pi_d Encrypted Input Data
    * @param pi_dk Decryption Key
  */
  FUNCTION fn_decr_k (pi_k IN VARCHAR2, pi_d IN RAW, pi_dk RAW) RETURN VARCHAR2;
  --
  /**
    * Generates Random Bytes
    * @param pi_n Number of Bytes to be generated
  */
  FUNCTION fn_ranb (pi_k IN VARCHAR2, pi_n IN NUMBER) RETURN RAW;
  --
  /**
    * Generates Random Integer
  */
  FUNCTION fn_rani (pi_k IN VARCHAR2) RETURN NUMBER;
  --
  /**
    * Generates Random Number
  */
  FUNCTION fn_rann (pi_k IN VARCHAR2) RETURN NUMBER;
  --
  /**
    * Generates Random String
    * @param pi_len   Length of string
    * @param pi_opt   String type: 
    *                 - 'u', 'U' - uppercase alpha characters
    *                 - 'l', 'L' - lowercase alpha characters
    *                 - 'a', 'A' - mixed case alpha characters
    *                 - 'x', 'X' - uppercase alpha-numeric characters
  */
  FUNCTION fn_rans (pi_k IN VARCHAR2, pi_len PLS_INTEGER DEFAULT 10, pi_opt VARCHAR2 DEFAULT 'A') RETURN VARCHAR2;
  --  
END pkwf_99_ncr;
/

