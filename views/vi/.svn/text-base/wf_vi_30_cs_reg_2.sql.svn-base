CREATE OR REPLACE VIEW wf_vi_30_cs_reg_2
AS
SELECT DC.ROW_KEY,
       DC.D_ID,
       DC.DC_TP_K,  
       DC.DC_ID,
       DC.DC_DTT,
       DC.DC_ST_DM,
       DC.DC_JSN,
       --
       LID03   CUS_ID, -- GROUP 2
       LID04   CUS_NM, -- GROUP 2
       --
       D01     DOB_DT,
       SDC01   PRY_EM_AD,
       LID02   MBL_PHN
  FROM wf_30_dc dc
 WHERE d_id = 'WFVI30CSREG2'
/
