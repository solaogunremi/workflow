CREATE OR REPLACE VIEW wf_vr_30_ch_wdr
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
       dc.ac_id,
       ac.acct_desc ac_dsc,
       dc.pm_bk_id,
       pkwf_00_00.fn_get_bnk_dsc(dc.pm_bk_id) pm_bk_dsc,
       dc.pm_bk_ac_no,
       dc.wdr_amt,
       pkwf_00_dsp.fn_amt_in_word (dc.wdr_amt, NULL) wdr_amt_dsc
  FROM wf_vi_30_ch_wdr dc, wf_10_tp tp, dd_acct@wf_sy ac
 WHERE dc.dc_tp_k = tp.row_key
   AND dc.ac_id = ac.acct_id (+);
/
