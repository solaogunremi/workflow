CREATE OR REPLACE VIEW wf_vi_30_cs_reg
AS
SELECT DC.ROW_KEY,
       DC.D_ID,
       DC.DC_TP_K,  
       DC.DC_ID,
       DC.DC_DTT,
       DC.DC_ST_DM,
       DC.DC_JSN,
       --
       LID01   MK_AC_ID, -- GROUP 1
       LDC01   AC_NM,    -- GROUP 1
       --
       D01     DOB_DT,
       SDC01   PRY_EM_AD,
       LID02   MBL_PHN
  FROM wf_30_dc dc
 WHERE d_id = 'WFVI30CSREG'
/
