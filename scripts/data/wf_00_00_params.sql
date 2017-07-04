ALTER TABLE wf_00_00_pdm DISABLE ALL TRIGGERS
/

ALTER TABLE wf_00_00_pvl DISABLE ALL TRIGGERS
/

DECLARE
    --
    v_apl_dm     VARCHAR2(5) := 'WF';
    --
    v_pdm_k      NUMBER;
    v_pvl_ord    PLS_INTEGER;
    v_pdm_ord    PLS_INTEGER;
    v_pmr_dm     VARCHAR2(5);
    v_pmr_dsc    VARCHAR2(50);
    --
    PROCEDURE pr_mnt_pdm IS
    BEGIN
      v_pdm_ord := v_pdm_ord + 10;
      UPDATE wf_00_00_pdm SET
        pmr_dsc = v_pmr_dsc,
        dsp_ord = v_pdm_ord
      WHERE pmr_dm = v_pmr_dm
      RETURNING row_key INTO v_pdm_k;
      IF SQL%NOTFOUND THEN
        v_pdm_k := pkwf_00_00.fn_rk;
        INSERT INTO wf_00_00_pdm
        (row_key, pmr_dm, pmr_dsc, dsp_ord)
        VALUES
        (v_pdm_k, v_pmr_dm, v_pmr_dsc, v_pdm_ord);
      END IF;
    END pr_mnt_pdm;
    --
    PROCEDURE pr_mnt_pvl (pi_id     VARCHAR2, 
                          pi_tp     VARCHAR2,  
                          pi_dsc    VARCHAR2, 
                          pi_chg_yn VARCHAR2 DEFAULT '0',
                          pi_dsp_yn VARCHAR2 DEFAULT '0') IS
      v_k   NUMBER;                            
    BEGIN
      v_pvl_ord := v_pvl_ord + 10;
      UPDATE wf_00_00_pvl SET
        pmr_dm_k = v_pdm_k,
        pmr_dsc = pi_dsc,
        tp_dm = pi_tp,
        chg_yn = pi_chg_yn,
        dsp_yn = pi_dsp_yn,
        dsp_ord = v_pvl_ord
      WHERE pmr_id = pi_id;
      IF SQL%NOTFOUND THEN
        v_k := pkwf_00_00.fn_rk;
        INSERT INTO wf_00_00_pvl
        (row_key, pmr_dm_k, pmr_id, tp_dm, pmr_dsc, chg_yn, dsp_yn, dsp_ord)
        VALUES
        (v_k, v_pdm_k, pi_id, pi_tp, pi_dsc, pi_chg_yn, pi_dsp_yn, v_pvl_ord);
      END IF;
    END pr_mnt_pvl;
    --    
BEGIN
    --
    v_pdm_ord := 0;
    --
    -- APPLICATION PARAMETERS
    v_pdm_k := NULL;
    v_pmr_dm  := 'WF';
    v_pmr_dsc := 'Application Parameters';
    pr_mnt_pdm;
    --
    v_pvl_ord := 0;
    pr_mnt_pvl (pi_id => 'WF_ALW_RMT',      
                pi_tp => 'B', 
                pi_dsc => 'Allow Remote Users',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    --
    pr_mnt_pvl (pi_id => 'WF_ALW_LCL',      
                pi_tp => 'B', 
                pi_dsc => 'Allow Remote Users',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    -- 
    pr_mnt_pvl (pi_id => 'WF_RFH_TM',      
                pi_tp => 'N', 
                pi_dsc => 'Page Refresh Time in milliseconds',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    -- 
    pr_mnt_pvl (pi_id => 'EML_FRM_ADR',      
                pi_tp => 'C', 
                pi_dsc => 'Default Sender Email Address ',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    --
    pr_mnt_pvl (pi_id => 'WF_PDF_URI',      
                pi_tp => 'C', 
                pi_dsc => 'PDF REST end point ',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    -- 
    pr_mnt_pvl (pi_id => 'WF_ST_YN',      
                pi_tp => 'B', 
                pi_dsc => 'ST Interfaced ? ',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    --
    pr_mnt_pvl (pi_id => 'WF_AM_YN',      
                pi_tp => 'B', 
                pi_dsc => 'AM Interfaced ? ',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    --
    pr_mnt_pvl (pi_id => 'SY_DOC_CD',      
                pi_tp => 'C', 
                pi_dsc => 'Symbols Document Code ',    
                pi_chg_yn => '0', 
                pi_dsp_yn => '0');
    --    
END;
/

COMMIT
/

ALTER TABLE wf_00_00_pdm ENABLE ALL TRIGGERS
/

ALTER TABLE wf_00_00_pvl ENABLE ALL TRIGGERS
/

