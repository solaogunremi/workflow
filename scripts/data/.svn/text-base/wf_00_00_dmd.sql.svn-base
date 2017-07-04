DECLARE
    --
    v_dmd_k      NUMBER;
    v_pvl_ord    PLS_INTEGER;
    v_pdm_ord    PLS_INTEGER;
    --
    PROCEDURE pr_mnt_dmd (pi_dmd VARCHAR2, pi_dsc VARCHAR2) IS
    BEGIN
      v_pdm_ord := v_pdm_ord + 1;
      v_pvl_ord := 0;
      UPDATE wf_00_00_dmd SET
        dmd_dsc = pi_dsc,
        dsp_ord = v_pdm_ord
      WHERE dmd_dm = pi_dmd
      RETURNING row_key INTO v_dmd_k;
      IF SQL%NOTFOUND THEN
        v_dmd_k := pkwf_00_00.fn_rk;
        INSERT INTO wf_00_00_dmd
        (row_key, dmd_dm, dmd_dsc, dsp_ord)
        VALUES
        (v_dmd_k, pi_dmd, pi_dsc, v_pdm_ord);
      END IF;

    END pr_mnt_dmd;
    --
    PROCEDURE pr_clear_dmv IS
    BEGIN
      NULL; -- DELETE FROM ST_00_00_DMV WHERE dmd_k = v_dmd_k;
    END pr_clear_dmv;
    --
    PROCEDURE pr_mnt_dmv (pi_dmv VARCHAR2, pi_dsc VARCHAR2, pi_rmks VARCHAR2 DEFAULT NULL, pi_use_yn VARCHAR2 DEFAULT '1') IS
      v_k   NUMBER;
    BEGIN
      v_pvl_ord := v_pvl_ord + 10;
      UPDATE wf_00_00_dmv SET
        dmv_dsc = pi_dsc,
        dsp_ord = v_pvl_ord,
        ius_yn = pi_use_yn,
        rmk_txt = NVL(pi_rmks, rmk_txt)
      WHERE dmd_k = v_dmd_k
      AND   dmv_id = pi_dmv;
      IF SQL%NOTFOUND THEN
        v_k := pkwf_00_00.fn_rk;
        INSERT INTO wf_00_00_dmv
        (row_key, dmd_k, dmv_id, dmv_dsc, ius_yn, dsp_ord, rmk_txt)
        VALUES
        (v_k, v_dmd_k, pi_dmv, pi_dsc, pi_use_yn, v_pvl_ord, pi_rmks);
      END IF;
    END pr_mnt_dmv;
    --
BEGIN
    --
    --
    v_pdm_ord := 0;
    --
    /* Domains values are fixed i.e. have processing implications */
    --
    pr_mnt_dmd (pi_dmd => '00_YES_NO', pi_dsc => 'Yes Or No');
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => '0', pi_dsc => 'No');
    pr_mnt_dmv (pi_dmv => '1', pi_dsc => 'Yes');
    --
    pr_mnt_dmd (pi_dmd => '00_APPR_STAT', pi_dsc => 'Record Approval Status');
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => '0', pi_dsc => 'Pending');
    pr_mnt_dmv (pi_dmv => '1', pi_dsc => 'Approved');
    pr_mnt_dmv (pi_dmv => '2', pi_dsc => 'Rejected');
    pr_mnt_dmv (pi_dmv => '3', pi_dsc => 'Approved');
    --
    pr_mnt_dmd (pi_dmd => '00_WEEK_DAY', pi_dsc => 'Day of the Week');
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => '0', pi_dsc => 'Sunday');
    pr_mnt_dmv (pi_dmv => '1', pi_dsc => 'Monday');
    pr_mnt_dmv (pi_dmv => '2', pi_dsc => 'Tuesday');
    pr_mnt_dmv (pi_dmv => '3', pi_dsc => 'Wednesday');
    pr_mnt_dmv (pi_dmv => '4', pi_dsc => 'Thursday');
    pr_mnt_dmv (pi_dmv => '5', pi_dsc => 'Friday');
    pr_mnt_dmv (pi_dmv => '6', pi_dsc => 'Saturday');
    ----------------------------------------------------------------------------    
    ----------------------------------- CS -------------------------------------
    pr_mnt_dmd (pi_dmd => '00_GENDER', pi_dsc => 'Gender'); 
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => 'M', pi_dsc => 'Male');
    pr_mnt_dmv (pi_dmv => 'F', pi_dsc => 'Female');    
    --
    pr_mnt_dmd (pi_dmd => '00_MARITAL', pi_dsc => 'Marital Status'); 
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => 'M', pi_dsc => 'Married');
    pr_mnt_dmv (pi_dmv => 'S', pi_dsc => 'Single');   
    --
    pr_mnt_dmd (pi_dmd => 'CTC_TTL', pi_dsc => 'Title'); 
    pr_clear_dmv; 
    --
    pr_mnt_dmd (pi_dmd => 'CTC_NTY', pi_dsc => 'Nationality'); 
    pr_clear_dmv; 
    --
    pr_mnt_dmd (pi_dmd => 'CTC_CTR', pi_dsc => 'Country'); 
    pr_clear_dmv; 
    --
    pr_mnt_dmd (pi_dmd => 'CTC_STA', pi_dsc => 'State'); 
    pr_clear_dmv; 
    --
    pr_mnt_dmd (pi_dmd => 'CTC_IDN', pi_dsc => 'Identification'); 
    pr_clear_dmv; 
    --
    pr_mnt_dmd (pi_dmd => 'CTC_RLN', pi_dsc => 'Relationship'); 
    pr_clear_dmv; 
    ----------------------------------------------------------------------------    
    ----------------------------------- WF -------------------------------------
    pr_mnt_dmd (pi_dmd => 'WF_ACT_TP', pi_dsc => 'Action Taken');
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => '0', pi_dsc => 'Hold');
    pr_mnt_dmv (pi_dmv => '1', pi_dsc => 'Complete');
    pr_mnt_dmv (pi_dmv => '2', pi_dsc => 'Reject');
    pr_mnt_dmv (pi_dmv => '3', pi_dsc => 'Revert');
    --
    pr_mnt_dmd (pi_dmd => 'WF_TSK_STA_TP', pi_dsc => 'Task Status');
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => 'pending', pi_dsc => 'Outstanding');
    pr_mnt_dmv (pi_dmv => 'sf_prog', pi_dsc => 'In Progress (By Myself)');
    pr_mnt_dmv (pi_dmv => 'ot_prog', pi_dsc => 'In Progress (By Others)');
    pr_mnt_dmv (pi_dmv => 'done', pi_dsc => 'Completed');
    pr_mnt_dmv (pi_dmv => 'unknown', pi_dsc => 'Unknown');
    --
    pr_mnt_dmd (pi_dmd => 'WF_ALT_TP', pi_dsc => 'Alert Type'); 
    pr_clear_dmv;
    --
    pr_mnt_dmd (pi_dmd => 'WF_DC_TP', pi_dsc => 'Documents Types');
    pr_clear_dmv;
    pr_mnt_dmv (pi_dmv => 'PIC_USR', pi_dsc => 'Identification');
    pr_mnt_dmv (pi_dmv => 'PIC_USR_J', pi_dsc => 'Identification(Joint)');
    pr_mnt_dmv (pi_dmv => 'PIC_UTL', pi_dsc => 'Utility Bill');
    pr_mnt_dmv (pi_dmv => 'PIC_UTL_J', pi_dsc => 'Utility Bill (Joint)');
    pr_mnt_dmv (pi_dmv => 'PIC_IMG', pi_dsc => 'Passport Photograph');
    pr_mnt_dmv (pi_dmv => 'PIC_IMG_J', pi_dsc => 'Passport Photograph(Joint)');
    pr_mnt_dmv (pi_dmv => 'PIC_SGN', pi_dsc => 'Signature');
    pr_mnt_dmv (pi_dmv => 'PIC_SGN_J', pi_dsc => 'Signature(Joint)');
    pr_mnt_dmv (pi_dmv => 'DOC_CAC7', pi_dsc => 'Form C.A.C 7');
    pr_mnt_dmv (pi_dmv => 'DOC_MEMO', pi_dsc => 'Memorandum and Articles of Association');
    pr_mnt_dmv (pi_dmv => 'DOC_BNK', pi_dsc => 'Bank Reference');
    pr_mnt_dmv (pi_dmv => 'DOC_RESO', pi_dsc => 'Board Resolution');
    pr_mnt_dmv (pi_dmv => 'DOC_CAC2', pi_dsc => 'Form C.A.C 2');
    pr_mnt_dmv (pi_dmv => 'DOC_UTI', pi_dsc => 'Utility Bill');
    pr_mnt_dmv (pi_dmv => 'DOC_INCO', pi_dsc => 'Certificate of Incorporation');
END;
/

COMMIT
/
