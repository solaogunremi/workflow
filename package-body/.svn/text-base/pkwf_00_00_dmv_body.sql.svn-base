CREATE OR REPLACE PACKAGE BODY pkwf_00_00_dmv AS
  --
  /* Created By       : Aderemi Alabi
  ** Date Created     : 21-DEC-2011
  ** Release Version  : 2.0
  **
  ** PURPOSE: System Domain Definition
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
  /* Package Variables */
  --
  --pv_rec    cs_vt_00_dmv%ROWTYPE;
  --
  --
  /* Private Routines */
  --
  FUNCTION fn_dmd (pi_dm IN VARCHAR2) RETURN VARCHAR2 IS
    v_dsc  wf_00_00_dmd.dmd_dsc%TYPE;
    CURSOR cur_dmd IS
    SELECT A.dmd_dsc
      FROM wf_00_00_dmd A;
  BEGIN
    v_dsc := NULL;
    OPEN cur_dmd;
    FETCH cur_dmd INTO v_dsc;
    CLOSE cur_dmd;
    RETURN v_dsc;
  END fn_dmd;
  --
  FUNCTION fn_dmv_dsc (pi_id VARCHAR2, pi_dm IN VARCHAR2) RETURN VARCHAR2 IS
    v_dsc  wf_00_00_dmv.dmv_dsc%TYPE;
    CURSOR cur_dmv IS
    SELECT A.dmv_dsc
      FROM wf_00_00_dmv A, wf_00_00_dmd b
     WHERE b.dmd_dm = pi_id
       AND b.row_key = A.dmd_k
       AND A.dmv_id = pi_dm;
  BEGIN
    v_dsc := NULL;
    OPEN cur_dmv;
    FETCH cur_dmv INTO v_dsc;
    CLOSE cur_dmv;
    RETURN v_dsc;
  END fn_dmv_dsc;
  --  
  --
  PROCEDURE pr_val_dm (pi_id IN VARCHAR2, pi_dm IN VARCHAR2) IS
    v_dsc  VARCHAR2(100);
  BEGIN
    --
    --v_dsc:= fn_dmd (pi_dm => pi_dm);
    --
    pkwf_00_vld.pr_reqd (pi_d => pi_dm, pi_dsc =>  'Domain Type');
    pkwf_00_vld.pr_reqd (pi_d => pi_id, pi_dsc =>  'Domain Data');
    --
    BEGIN
      SELECT 'a'
        INTO v_dsc
        FROM wf_00_00_dmv A, wf_00_00_dmd b
       WHERE b.dmd_dm = pi_id
         AND b.row_key = A.dmd_k
         AND A.dmv_id = pi_dm;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => '"'||pi_id||'"  is an invalid '||'value '||'. Further operation');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => '"'||pi_id||'"  is duplicated '||' '||'. Further operation');
    END;
    --
  END pr_val_dm;
  --
  /* Public Routines */
  --  
  FUNCTION fn_00_yes_no_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2 IS
    v_id  CONSTANT VARCHAR2(20) := '00_YES_NO';
    v_dsc VARCHAR2(100);
  BEGIN
    v_dsc := NULL;
    IF pi_dm IS NOT NULL THEN
      v_dsc := fn_dmv_dsc(pi_id => v_id, pi_dm => pi_dm);
    END IF;
    RETURN v_dsc;
  END fn_00_yes_no_dsc;
  --
  FUNCTION fn_00_appr_stat_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2 IS
    v_id  CONSTANT VARCHAR2(20) := '00_APPR_STAT';
    v_dsc VARCHAR2(100);
  BEGIN
    v_dsc := NULL;
    IF pi_dm IS NOT NULL THEN
      v_dsc := fn_dmv_dsc(pi_id => v_id, pi_dm => pi_dm);
    END IF;
    RETURN v_dsc;
  END fn_00_appr_stat_dsc;
  --
  FUNCTION fn_00_week_day_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2 IS
    v_id  CONSTANT VARCHAR2(20) := '00_WEEK_DAY';
    v_dsc VARCHAR2(100);
  BEGIN
    v_dsc := NULL;
    IF pi_dm IS NOT NULL THEN
      v_dsc := fn_dmv_dsc(pi_id => v_id, pi_dm => pi_dm);
    END IF;
    RETURN v_dsc;
  END fn_00_week_day_dsc;
  --
  --
  FUNCTION fn_cs_gdr_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2 IS
    v_id  CONSTANT VARCHAR2(20) := '00_GENDER';
    v_dsc VARCHAR2(100);
  BEGIN
    v_dsc := NULL;
    IF pi_dm IS NOT NULL THEN
      v_dsc := fn_dmv_dsc(pi_id => v_id, pi_dm => pi_dm);
    END IF;
    RETURN v_dsc;
  END fn_cs_gdr_dsc;
  --
  PROCEDURE pr_val_cs_gdr (pi_dm IN VARCHAR2) IS
  BEGIN
    pr_val_dm (pi_id => '00_GENDER', pi_dm => pi_dm);
  END;
  --
  --
  FUNCTION fn_cs_mar_dsc (pi_dm IN VARCHAR2) RETURN VARCHAR2 IS
    v_id  CONSTANT VARCHAR2(20) := '00_MARITAL';
    v_dsc VARCHAR2(100);
  BEGIN
    v_dsc := NULL;
    IF pi_dm IS NOT NULL THEN
      v_dsc := fn_dmv_dsc(pi_id => v_id, pi_dm => pi_dm);
    END IF;
    RETURN v_dsc;
  END fn_cs_mar_dsc;
  --
  PROCEDURE pr_val_cs_mar (pi_dm IN VARCHAR2) IS
  BEGIN
    pr_val_dm (pi_id => '00_MARITAL', pi_dm => pi_dm);
  END;
  --
  --  
END pkwf_00_00_dmv; 
/
