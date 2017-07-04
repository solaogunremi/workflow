CREATE OR REPLACE PACKAGE pkwf_99_swm AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : System Wallet Management <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Insert or Update Wallet entry
    * @param pi_pk          Signature
    * @param pi_sk          Source Record Key
    * @param pi_sr          Source Record Reference (Max 30 characters)
    * @param pi_sd          Actual Data (Max 250 characters)
    * @param pi_pg          Set to '1' to purge wallet entry
  */  
  PROCEDURE pr_mnt (pi_pk   IN VARCHAR2,
                    pi_sk   IN VARCHAR2,
                    pi_sr   IN VARCHAR2,
                    pi_sd   IN VARCHAR2,
                    pi_pg   IN VARCHAR2 DEFAULT '0');
  --
  /**
    * Returns Data
    * @param pi_pk          Signature
    * @param pi_sk          Source Record Key
    * @param pi_sr          Source Record Reference
  */  
  FUNCTION fn_datc (pi_pk   IN VARCHAR2,
                    pi_sk   IN VARCHAR2,
                    pi_sr   IN VARCHAR2) RETURN VARCHAR2;
  --                    
END pkwf_99_swm;
/

