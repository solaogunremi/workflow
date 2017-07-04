CREATE OR REPLACE FORCE VIEW wf_vi_30_cs_new_sig
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
         DC.K01   DOC_KEY,
         DC.LID01 DOC_ID,
         DC.SDC01 FIR_NM,
         DC.SDC02 LST_NM,
         DC.SDC03 OTH_NM,
         DC.LID02 GDR_DM,
         DC.D01   BTH_DT,
         DC.LDC01 EML_ADR,
         DC.SDC04 MBL_PHN,
         DC.SDC05 ADR_L1,
         DC.SDC06 ADR_CTY,
         DC.SDC07 ADR_CTR,
         DC.SDC08 ADR_STA,
         DC.SDC09 ADR_ZIP,
         --
         DC.LDC02 PIC_FIL,
         DC.BL01  PIC_BLB,
         DC.LDC03 SIG_FIL,
         DC.BL02  SIG_BLB
  FROM   wf_30_dc dc
 WHERE d_id = 'WFVI30CSNEWSIG'
/