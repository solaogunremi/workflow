  CREATE OR REPLACE PACKAGE pkwf_00_flx AUTHID DEFINER AS
   /**
    * ===========================================================<br/>
    *  PURPOSE : Flex Field Management <br/>
    *  SCHEMA: SYMPLUS <br/>
    *  Created By       : Femi Akintoye <br/>
    *  Date Created     : 08-MAR-2014 <br/>
    *  Release Version  : 2.0 <br/>
    * ===========================================================<br/>
    * @headcom
    */
    --
    TYPE r_flx IS RECORD (
          ius_yn     wf_00_00_dtd.c1%TYPE,
          mnd_yn     wf_00_00_dtd.c1%TYPE,
          col_nm     wf_00_00_dtd.c50%TYPE,
          col_tp     wf_00_00_dtd.c1%TYPE
        );
    --
    --
    FUNCTION fn_g_defn (pi_tk_k IN VARCHAR2,
                        pi_c_no IN NUMBER) RETURN r_flx;
    --
    /**
      * Returns a boolean that determines if the task uses parameters or not
      * @param pi_tk_k Task Name
    */  
    FUNCTION fn_use_par (pi_tk_k IN VARCHAR2) RETURN BOOLEAN;
    --
    /**
      * Returns a boolean that determines if the field should be displayed or not
      * @param pi_tk_k Task Name
      * @param pi_c_no Column Number
    */  
    FUNCTION fn_is_vis (pi_tk_k IN VARCHAR2,
                        pi_c_no IN NUMBER) RETURN BOOLEAN;
    /**
      * Returns Coloumn Description
      * @param pi_tk_k Table Name
      * @param pi_c_no Column Number
    */
    --
    FUNCTION fn_g_col_dsc (pi_tk_k IN VARCHAR2,
                           pi_c_no IN NUMBER) RETURN VARCHAR2;
    --
    /**
      * Procedure to validate that the data passed in meets definition
      * @param pi_key Customer key
    */
    PROCEDURE pr_v_data (pi_tk_k IN VARCHAR2,
                         pi_c_no IN NUMBER,
                         pi_data IN VARCHAR2);
    --
    --  
  END pkwf_00_flx;
  /
