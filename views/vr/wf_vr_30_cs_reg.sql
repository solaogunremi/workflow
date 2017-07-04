CREATE OR REPLACE VIEW wf_vr_30_cs_reg
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
       dc.mk_ac_id,
       pm.ptf_mkt_dsc mk_ac_dsc,
       pm.cus_id cus_id,
       pm.cus_dsc cus_dsc,
       pm.a_ptf_id      ptf_id,
       pm.a_ptf_dsc     ptf_dsc,
       pm.a_fnd_act_id  csh_id,
       pm.a_fnd_act_dsc csh_dsc,
       dc.ac_nm,
       dc.dob_dt,
       dc.pry_em_ad,
       dc.mbl_phn
  FROM wf_vi_30_cs_reg dc, wf_10_tp tp, st_vl_20_ptf_mkt@wf_sy pm
 WHERE dc.dc_tp_k = tp.row_key
   AND dc.mk_ac_id = pm.mkt_act_id (+);
/
