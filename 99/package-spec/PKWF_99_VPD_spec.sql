CREATE OR REPLACE PACKAGE pkwf_99_vpd AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : Virtual Private Data Processing <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns VPD KEY
  */
  FUNCTION fn_vpd_ky RETURN NUMBER;
  --
  /** 
    * Returns VPD REFERENCE ID
  */
  FUNCTION fn_vpd_id RETURN VARCHAR2;
  -- 
  /** 
    * Set VPD REFERENCE ID
  */  
  PROCEDURE pr_set_vpd_id (pi_id VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Purge Logon User's VPD data
  */    
  PROCEDURE pr_purge;
  --
  /** 
    * Purge all VPD data
  */    
  PROCEDURE pr_purge_all;
  --  
  /** 
    * Clear Logon User's VPD REFERENCE data
  */      
  PROCEDURE pr_clr_data (pi_id VARCHAR2 DEFAULT NULL);
  --
END pkwf_99_vpd;
/

