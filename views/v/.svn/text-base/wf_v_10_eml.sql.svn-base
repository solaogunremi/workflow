CREATE OR REPLACE FORCE VIEW wf_v_10_eml
  AS 
  SELECT R_K,
         CUS_ID,
         CUS_NME,
         TO_EML,         
         EML_SBJ,
         EML_BDY_TXT,
         EML_BDY_HTML,
         SND_CNT,
         INT_SND_DT,
         LST_SND_DT,
         SND_UPD     AS LST_SND_ERR
  FROM   wf_10_eml
WITH READ ONLY;