CREATE OR REPLACE VIEW wf_vi_30_am_if_mnd
AS
SELECT DC.ROW_KEY,
       DC.D_ID,
       DC.DC_TP_K,  
       DC.DC_ID,
       DC.DC_DTT,
       DC.DC_ST_DM,
       DC.DC_JSN,
       DC.DC_LNK_YN,
       DC.DC_LNK_K,
       --
       LID01  CUS_ID,
       LID02  FND_ID,
       SDC01  FND_DSC,
       LID03  AST_TP_DM,
       SDC01  AST_TP_DSC,
       SDC02  AST_CL_DSC,
       SDC03  AST_SCL_DSC,
       SDC04  AST_DSC,
       LID04  AST_CURR_ID,
       SDC05  AST_CURR_DS,
       LID05  IF_ACCT_ID,
       SDC06  IF_ACCT_DSC,
       M01    HLD_VAL,
       RK01   MND_DSC
  FROM wf_30_dc dc
 WHERE d_id = 'WFVI30AMIFMND'
/
