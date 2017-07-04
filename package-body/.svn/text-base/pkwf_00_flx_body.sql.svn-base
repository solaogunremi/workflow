CREATE OR REPLACE PACKAGE BODY pkwf_00_flx AS
  --
  /* Created By       : Femi Akintoye
  ** Date Created     : 08-MAR-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: Flex Field Management
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
  ** Copyright:  Neulogic Solutions Ltd, 2016
  **
  */
  /* Package Variables */
  --
  /* Public Routines */
  --
  --
  --
  FUNCTION fn_g_defn (pi_tk_k IN VARCHAR2,
                      pi_c_no IN NUMBER) RETURN r_flx IS
    --
    v_r    wf_10_tp_tk%ROWTYPE;
    r_rec  r_flx;
    --
  BEGIN
    BEGIN
      SELECT *
        INTO v_r
        FROM wf_10_tp_tk
       WHERE row_key = pi_tk_k;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN NULL;
      WHEN TOO_MANY_ROWS THEN NULL;
    END;
    --
    IF pi_c_no = 1 THEN
      r_rec.ius_yn  := v_r.p1_iu_yn;
      r_rec.mnd_yn  := NVL(v_r.p1_mnd_yn,'0');
      r_rec.col_nm  := v_r.p1_dsc;
      r_rec.col_tp  := v_r.p1_tp_dm;
    ELSIF pi_c_no = 2 THEN
      r_rec.ius_yn  := v_r.p2_iu_yn;
      r_rec.mnd_yn  := NVL(v_r.p2_mnd_yn,'0');
      r_rec.col_nm  := v_r.p2_dsc;
      r_rec.col_tp  := v_r.p2_tp_dm;
    ELSIF pi_c_no = 3 THEN
      r_rec.ius_yn  := v_r.p3_iu_yn;
      r_rec.mnd_yn  := NVL(v_r.p3_mnd_yn,'0');
      r_rec.col_nm  := v_r.p3_dsc;
      r_rec.col_tp  := v_r.p3_tp_dm;
    ELSIF pi_c_no = 4 THEN
      r_rec.ius_yn  := v_r.p4_iu_yn;
      r_rec.mnd_yn  := NVL(v_r.p4_mnd_yn,'0');
      r_rec.col_nm  := v_r.p4_dsc;
      r_rec.col_tp  := v_r.p4_tp_dm;
    ELSIF pi_c_no = 5 THEN
      r_rec.ius_yn  := v_r.p5_iu_yn;
      r_rec.mnd_yn  := NVL(v_r.p5_mnd_yn,'0');
      r_rec.col_nm  := v_r.p5_dsc;
      r_rec.col_tp  := v_r.p5_tp_dm;
    ELSE
      pkwf_00_00_err.pr_raise(pi_msg => 'Invalid X-Field Definition ['||pi_c_no||']');      
    END IF;
    --
    RETURN r_rec;
    --
  END fn_g_defn;
  --
  /**
    * Returns a boolean that determines if the task uses parameters or not
    * @param pi_tk_k Task Name
  */  
  FUNCTION fn_use_par (pi_tk_k IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN TRUE;
  END fn_use_par;
  --
  /**
    * Returns a boolean that determines if the field should be displayed or not
    * @param pi_tk_k Task Name
    * @param pi_c_no Column Number
  */  
  FUNCTION fn_is_vis (pi_tk_k IN VARCHAR2,
                      pi_c_no IN NUMBER) RETURN BOOLEAN IS
    --
    r_rec   r_flx;
    v_ret   BOOLEAN := FALSE;
    --
  BEGIN
    --
    r_rec := fn_g_defn(pi_tk_k => pi_tk_k,
                       pi_c_no => pi_c_no);
    --
    IF r_rec.ius_yn = '1' THEN
      v_ret := TRUE;
    END IF;
    --
    RETURN v_ret;
    --
  END fn_is_vis;
  /**
    * Returns Coloumn Description
    * @param pi_tk_k Table Name
    * @param pi_c_no Column Number
  */
  --
  FUNCTION fn_g_col_dsc (pi_tk_k IN VARCHAR2,
                         pi_c_no IN NUMBER) RETURN VARCHAR2 IS
    --
    r_rec   r_flx;
    v_nm    wf_00_00_dtd.c50%TYPE;
    --
  BEGIN
    --
    r_rec := fn_g_defn(pi_tk_k => pi_tk_k,
                       pi_c_no => pi_c_no);
    --
    IF r_rec.ius_yn = '1' THEN
      v_nm := NVL(r_rec.col_nm, 'Undefined');
    END IF;
    --
    RETURN v_nm;
    --
  END fn_g_col_dsc;
  --
  /**
    * Procedure to validate that the data passed in meets definition
    * @param pi_key Customer key
  */
  PROCEDURE pr_v_data (pi_tk_k IN VARCHAR2,
                       pi_c_no IN NUMBER,
                       pi_data IN VARCHAR2) IS
    --
    r_rec   r_flx;
    v_nm    wf_00_00_dtd.c50%TYPE;
    v_dt    wf_00_00_dtd.dt%TYPE;
    v_no    wf_00_00_dtd.n2812%TYPE;
    --
  BEGIN
    --
    r_rec := fn_g_defn(pi_tk_k => pi_tk_k,
                       pi_c_no => pi_c_no);
    --
    IF r_rec.ius_yn = '1' THEN
      IF r_rec.col_tp = 'D' THEN
        BEGIN
          v_dt := TO_DATE(pi_data);
        EXCEPTION
          WHEN OTHERS THEN
            pkwf_00_00_err.pr_raise(pi_msg => 'Invalid Date Data ['||pi_data||']');
        END;
      ELSIF r_rec.col_tp = 'N' THEN
        BEGIN
          v_no := TO_NUMBER(REPLACE(pi_data, ',', ''));
        EXCEPTION
          WHEN OTHERS THEN
            pkwf_00_00_err.pr_raise(pi_msg => 'Invalid Number Data ['||pi_data||']');
        END;
      END IF;
      --
      IF r_rec.mnd_yn = '1' THEN
        pkwf_00_vld.pr_reqd(pi_d => pi_data, pi_dsc => r_rec.col_nm);
      END IF;
      --
    END IF;
    --   
  END pr_v_data;
  --  
  --    
END pkwf_00_flx;
/
