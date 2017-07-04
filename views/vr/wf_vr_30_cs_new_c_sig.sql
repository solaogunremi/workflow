CREATE OR REPLACE VIEW wf_vr_30_cs_new_c_sig
AS
SELECT  dc.row_key,
        dc.d_id,
        dc.dc_tp_k,  
        tp.tp_id,
        tp.tp_dsc,
        dc.dc_id,
        dc.dc_dtt,
        dc.dc_st_dm,
        dc.dc_jsn,
        dc.dc_lnk_yn,
        dc.dc_lnk_k,
        --
        dc.tt_dm,
        dc.ls_nm,
        dc.md_nm,
        dc.fi_nm,
        dc.gdr_dm,
        dc.dob_dt,
        dc.nty_cd,
        pkwf_00_00.fn_get_nty_dsc(dc.nty_cd) nty_cd_dsc,
        dc.pry_a_ad1,
        dc.pry_a_ad2,
        dc.pry_a_cty,
        dc.pry_a_sta_cd,
        pkwf_00_00.fn_get_sta_dsc(dc.pry_a_sta_cd) pry_a_sta_cd_dsc,
        dc.pry_a_zip,
        dc.pry_a_ctr_cd,
        pkwf_00_00.fn_get_ctr_dsc(dc.pry_a_ctr_cd) pry_a_ctr_cd_dsc,
        dc.pry_em_ad,
        dc.sec_em_ad,
        dc.mbl_phn,
        dc.oth_phn
  FROM wf_vi_30_cs_new_c_sig dc, wf_10_tp tp
 WHERE dc.dc_tp_k = tp.row_key;
/
