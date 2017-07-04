CREATE OR REPLACE VIEW wf_vi_30_ch_wdr
AS
SELECT DC.ROW_KEY,
       DC.D_ID,
       DC.DC_TP_K,  
       DC.DC_ID,
       DC.DC_DTT,
       DC.DC_ST_DM,
       DC.DC_JSN,
       LID01   AC_ID,
       LID02   PM_BK_ID,
       LID03   PM_BK_AC_NO,
       LID04   WB_ACC_ID,
       M01     WDR_AMT,
       K01     PMT_NO
  FROM wf_30_dc dc
 WHERE d_id = 'WFVI30CHWDR'
/
