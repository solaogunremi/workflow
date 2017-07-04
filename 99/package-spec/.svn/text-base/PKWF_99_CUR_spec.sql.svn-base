CREATE OR REPLACE PACKAGE pkwf_99_cur AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Currency Definition <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 13-DEC-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Returns TRUE if Current User has edit privilege
    * @param pi_ky         Record key 
  */   
  FUNCTION fn_edt_prv (pi_k IN VARCHAR2) RETURN BOOLEAN;
  --       
  /**
    * Create/Edit record
  */    
  PROCEDURE pr_prc (pi_rec IN OUT v_99_vt_cur_e%ROWTYPE);
  -- 
  /**
    * Record Details record
    * @param pi_rk       Record Key
  */  
  FUNCTION fn_dtl (pi_rk IN NUMBER) RETURN v_99_vt_cur%ROWTYPE;
  -- 
  /**
    * Edit Record Details record
    * @param pi_rk       Record Key
  */  
  FUNCTION fn_dtl_e (pi_rk IN NUMBER) RETURN v_99_vt_cur_e%ROWTYPE;
  -- 
  /**
    * Validate Currency
    * @param pi_id       Currency ID
  */    
  PROCEDURE pr_val (pi_id IN VARCHAR2);
  --  
  /**
    * Various Descriptions
    * @param pi_id       Currency ID
  */  
  FUNCTION fn_dsc (pi_id IN VARCHAR2) RETURN VARCHAR2;
  FUNCTION fn_unt_dsc (pi_id IN VARCHAR2) RETURN VARCHAR2;
  FUNCTION fn_sub_unt_dsc (pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  /**
    * Retrieve Local Currency
  */  
  FUNCTION fn_local_cur_id RETURN VARCHAR2;
  --
  /**
    * Returns List of Values
  */    
  FUNCTION fn_lov RETURN OT$_99_LOV_ID_TB PIPELINED;
  FUNCTION fn_lst RETURN OT$_99_LOV_CUR_LST_TB PIPELINED;
  --  
END pkwf_99_cur; 
/
