CREATE OR REPLACE VIEW wf_vr_30_cs_reg_2
AS
SELECT dc.row_key,
       dc.d_id,
       dc.dc_tp_k,  
       tp.tp_id,
       tp.tp_dsc,
       dc.dc_id,
       dc.dc_dtt,
       dc.dc_st_dm,
       dc.dc_jsn,
       '000239' cus_id,
       'MISTER LAGBAJA' cus_dsc,
       dc.dob_dt,
       dc.pry_em_ad,
       dc.mbl_phn
  FROM wf_vi_30_cs_reg_2 dc, wf_10_tp tp
 WHERE dc.dc_tp_k = tp.row_key;
/
