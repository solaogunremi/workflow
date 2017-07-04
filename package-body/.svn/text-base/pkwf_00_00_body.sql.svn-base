CREATE OR REPLACE PACKAGE BODY pkwf_00_00 AS
  --
  /* Created By       : Femi Akintoye 
  ** Date Created     : 11-MAR-2016
  **
  ** PURPOSE: WF Routines for Preship Objects
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
  --
  /* Private Routines */
  --
  /* Public Routines */
  FUNCTION fn_rk RETURN NUMBER IS
  BEGIN
    RETURN wf_seq_00_key.NEXTVAL;
  END fn_rk;
  --
  FUNCTION fn_doc RETURN NUMBER IS
  BEGIN
    RETURN wf_seq_20_doc.NEXTVAL;
  END fn_doc;
  --
  FUNCTION fn_act RETURN NUMBER IS
  BEGIN
    RETURN wf_seq_20_act.NEXTVAL;
  END fn_act;
  --
  FUNCTION fn_get_ctr_k(pi_id IN VARCHAR2) RETURN NUMBER IS
    v_k wf_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT row_key
        INTO v_k
        FROM wf_vc_00_ctr
       WHERE ctr_cd = pi_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Invalid country code ['||pi_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Country code ['||pi_id||'] duplicated');
    END;
    --
    RETURN v_k;
    --
  END fn_get_ctr_k;
  --
  FUNCTION fn_get_ctr_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2 IS
    v_d wf_00_00_dtd.c255%TYPE;
  BEGIN
    --
    IF pi_id IS NOT NULL THEN
      BEGIN
        SELECT ctr_dsc
          INTO v_d
          FROM wf_vc_00_ctr
         WHERE ctr_cd = pi_id;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_d := '**ERROR** UNKNOWN';
          --pkwf_00_00_err.pr_raise(pi_msg => 'Invalid country code ['||pi_id||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Country code ['||pi_id||'] duplicated');
      END;
    END IF;
    --
    RETURN v_d;
    --
  END fn_get_ctr_dsc;
  --
  --
  FUNCTION fn_get_nty_k(pi_id IN VARCHAR2) RETURN NUMBER IS
    v_k wf_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT row_key
        INTO v_k
        FROM wf_vc_00_ctr
       WHERE ctr_cd = pi_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Invalid nationality code ['||pi_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Nationality code ['||pi_id||'] duplicated');
    END;
    --
    RETURN v_k;
    --
  END fn_get_nty_k;
  --
  FUNCTION fn_get_nty_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2 IS
    v_d wf_00_00_dtd.c255%TYPE;
  BEGIN
    --
    IF pi_id IS NOT NULL THEN
      BEGIN
        SELECT ctr_dsc
          INTO v_d
          FROM wf_vc_00_ctr
         WHERE ctr_cd = pi_id;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_d := '**ERROR** UNKNOWN';
          --pkwf_00_00_err.pr_raise(pi_msg => 'Invalid country code ['||pi_id||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Country code ['||pi_id||'] duplicated');
      END;
    END IF;
    --
    RETURN v_d;
    --
  END fn_get_nty_dsc;
  --
  --
  FUNCTION fn_get_sta_k(pi_ctr_id IN VARCHAR2, pi_id IN VARCHAR2) RETURN NUMBER IS
    v_k     wf_00_00_dtd.n38%TYPE;
    v_ctr_k wf_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT row_key
        INTO v_ctr_k
        FROM wf_vc_00_ctr
       WHERE ctr_cd = pi_ctr_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Invalid country code ['||pi_ctr_id||'] for state ['||pi_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Country code ['||pi_ctr_id||'] for state ['||pi_id||'] duplicated');
    END;
    --
    /*BEGIN
      SELECT row_key
        INTO v_k
        FROM wf_vc_00_sta
       WHERE ctr_k = v_ctr_k
         AND sta_cd = pi_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Invalid state code ['||pi_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'State code ['||pi_id||'] duplicated');
    END;*/
    RETURN v_k;
    --
  END fn_get_sta_k;
  --
  FUNCTION fn_get_sta_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2 IS
    v_d wf_00_00_dtd.c255%TYPE;
  BEGIN
    --
    IF pi_id IS NOT NULL THEN
      BEGIN
        SELECT sta_dsc
          INTO v_d
          FROM wf_vc_00_sta
         WHERE sta_cd = pi_id;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_d := '**ERROR** UNKNOWN';
          --pkwf_00_00_err.pr_raise(pi_msg => 'Invalid state code ['||pi_id||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'State code ['||pi_id||'] duplicated');
      END;
    END IF;
    --
    RETURN v_d;
    --
  END fn_get_sta_dsc;
  --
  --
  FUNCTION fn_get_ttl_k(pi_id IN VARCHAR2) RETURN NUMBER IS
    v_k wf_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT ctc_ttl_k
        INTO v_k
        FROM wf_vc_00_ttl
       WHERE ctc_ttl_id = pi_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Invalid title code ['||pi_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Title code ['||pi_id||'] duplicated');
    END;
    --
    RETURN v_k;
    --
  END fn_get_ttl_k;
  --
  FUNCTION fn_get_ttl_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2 IS
    v_d wf_00_00_dtd.c255%TYPE;
  BEGIN
    --
    IF pi_id IS NOT NULL THEN
      BEGIN
        SELECT ctc_ttl_dsc
          INTO v_d
          FROM wf_vc_00_ttl
         WHERE ctc_ttl_id = pi_id;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_d := '**ERROR** UNKNOWN';
          --pkwf_00_00_err.pr_raise(pi_msg => 'Invalid title code ['||pi_id||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Title code ['||pi_id||'] duplicated');
      END;
    END IF;
    --
    RETURN v_d;
    --
  END fn_get_ttl_dsc;
  --
  --
  FUNCTION fn_get_rln_k(pi_id IN VARCHAR2) RETURN NUMBER IS
    v_k wf_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT ctc_rln_k
        INTO v_k
        FROM wf_vc_00_rln
       WHERE ctc_rln_id = pi_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Invalid relationship code ['||pi_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Relationship code ['||pi_id||'] duplicated');
    END;
    --
    RETURN v_k;
    --
  END fn_get_rln_k;
  --
  FUNCTION fn_get_rln_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2 IS
    v_d wf_00_00_dtd.c255%TYPE;
  BEGIN
    --
    IF pi_id IS NOT NULL THEN
      BEGIN
        SELECT ctc_rln_dsc
          INTO v_d
          FROM wf_vc_00_rln
         WHERE ctc_rln_id = pi_id;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_d := '**ERROR** UNKNOWN';
          --pkwf_00_00_err.pr_raise(pi_msg => 'Invalid relationship code ['||pi_id||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Relationship code ['||pi_id||'] duplicated');
      END;
    END IF;
    --
    RETURN v_d;
    --
  END fn_get_rln_dsc;
  --
  --
  FUNCTION fn_get_bnk_k(pi_id IN VARCHAR2) RETURN NUMBER IS
    v_k wf_00_00_dtd.n38%TYPE;
  BEGIN
    --
    BEGIN
      SELECT bnk_k
        INTO v_k
        FROM wf_vc_00_bnk
       WHERE bnk_id = pi_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Invalid bank code ['||pi_id||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Bank code ['||pi_id||'] duplicated');
    END;
    --
    RETURN v_k;
    --
  END fn_get_bnk_k;
  --
  FUNCTION fn_get_bnk_dsc(pi_id IN VARCHAR2) RETURN VARCHAR2 IS
    v_d wf_00_00_dtd.c255%TYPE;
  BEGIN
    --
    IF pi_id IS NOT NULL THEN
      BEGIN
        SELECT bnk_dsc
          INTO v_d
          FROM wf_vc_00_bnk
         WHERE bnk_id = pi_id;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_d := '**ERROR** UNKNOWN';
          --pkwf_00_00_err.pr_raise(pi_msg => 'Invalid relationship code ['||pi_id||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Bank code ['||pi_id||'] duplicated');
      END;
    END IF;
    --
    RETURN v_d;
    --
  END fn_get_bnk_dsc;
  --
  PROCEDURE pr_migr_data IS
    v_k    VARCHAR2(100);
  BEGIN
    --
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO v_k
    FROM dual;
    --
    SAVEPOINT sp_1;
    pk99_trg.pr_set_sdml (pi_k => v_k);
    DELETE FROM t_99_00_dmm;
    DELETE FROM t_99_00_dmv;
    --
    INSERT INTO t_99_00_dmm SELECT row_key as r_k, 
                                   dmd_dm  as dm_id, 
                                   dmd_dsc as dm_dsc, 
                                   dsp_ord 
                            FROM   cs_00_00_dmd@wf_sy;
    INSERT INTO t_99_00_dmm SELECT row_key as r_k, 
                                   cdd_dm  as dm_id, 
                                   cdd_dsc as dm_dsc, 
                                   dsp_ord 
                            FROM   cs_00_00_cdd@wf_sy
                            WHERE  cdd_dm <> 'CTC-CTR'; 
    INSERT INTO t_99_00_dmm VALUES(50, 'CTC-CTR','Countries',50);
    --
    INSERT INTO t_99_00_dmv SELECT s_99_00_rk.NEXTVAL as r_k, 
                                   dmd_dm_k as r_p, 
                                   dmv_id,
                                   dmv_dsc, 
                                   dsp_ord,
                                   ius_yn 
                            FROM   cs_00_00_dmv@wf_sy;
    INSERT INTO t_99_00_dmv SELECT s_99_00_rk.NEXTVAL  as r_k, 
                                   cd_dm_k  as r_p, 
                                   cdv_id,
                                   cdv_dsc, 
                                   dsp_ord,
                                   ius_yn 
                            FROM   cs_00_cdv@wf_sy;  
    INSERT INTO t_99_00_dmv SELECT s_99_00_rk.NEXTVAL  as r_k, 
                                   50  as r_p,
                                   ctr_id as cdv_id,
                                   ctr_nm as cdv_dsc, 
                                   dsp_ord,
                                   ius_yn
                            FROM   t_99_00_ctr@wf_sy;
    --
    COMMIT;
    pk99_trg.pr_reset_sdml;
    --
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      NULL;
    WHEN OTHERS THEN
      ROLLBACK;
      RAISE;
  END pr_migr_data;
  --
END pkwf_00_00; 
/
