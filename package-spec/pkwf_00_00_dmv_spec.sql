CREATE OR REPLACE PACKAGE pkwf_00_00_dmv AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : System Domains Description <br/>
  *  SCHEMA: SYMPLUS <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 21-DEC-2011 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  --
  /**
    * Return description for Yes Or No
    * @param pi_cdv_id Code ID
  */  
  FUNCTION fn_00_yes_no_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2;
  --
  /**
    * Return description for Record Approval Status
    * @param pi_cdv_id Code ID
  */  
  FUNCTION fn_00_appr_stat_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2;
  --
  /**
    * Return description for Day of the Week
    * @param pi_cdv_id Code ID
  */  
  FUNCTION fn_00_week_day_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2;
  --
  /**
    * Return description for Gender
    * @param pi_cdv_id Code ID
  */  
  FUNCTION  fn_cs_gdr_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2;
  PROCEDURE pr_val_cs_gdr (pi_dm IN VARCHAR2);
  --
  /**
    * Return description for Marital Status
    * @param pi_cdv_id Code ID
  */  
  FUNCTION  fn_cs_mar_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2;
  PROCEDURE pr_val_cs_mar (pi_dm IN VARCHAR2);
  --  
  --
END pkwf_00_00_dmv; 
/
