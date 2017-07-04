CREATE OR REPLACE VIEW wf_vi_30_cs_new_c
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
       LDC01   ORG_NM,
       LID01   REG_NBR,
       LID02   TAX_ID,
       D01     REG_DT,
       SID01   REG_CTR_CD,
       LDC02   ORG_AD1,
       LDC03   ORG_AD2,
       LID03   ORG_CTY,
       SID03   ORG_STA_CD,
       LID04   ORG_ZIP,
       SID02   ORG_CTR_CD,
       --
       M01     EST_TRN_VAL,
       --
       SDC01   BK_NM,
       LID05   BK_AC_NO,
       SDC02   BK_AC_NM,
       SDC03   BK_BR_NM,
       LID07   BK_ST_CD,
       LDC04   BK_A_AD1,
       LDC05   BK_A_AD2,
       LID08   BK_A_CTY,
       SID08   BK_A_STA_CD,
       LID09   BK_A_ZIP,
       SID09   BK_A_CTR_CD,
       SDC05   PRY_EML_AD,
       --
       SDC11   MKT_ACT_ID,
       SDC12   MKT_CHN_NO,
       DM04    MDL_ID,
       LID10   PDT_ID,
       SDC04   PDT_DSC
  FROM wf_30_dc dc
 WHERE d_id = 'WFVI30CSNEWC'
/
