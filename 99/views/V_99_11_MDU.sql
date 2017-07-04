-- APPLICATION USERS
CREATE OR REPLACE FORCE VIEW V_99_11_MDU AS
SELECT  MDU.R_K           AS MDU_KY,
        USR.R_K           AS USR_KY,
        USR.LGN_ID        AS USR_ID,
        (CASE WHEN USR.USR_DM = 'ADM' THEN 1
           ELSE 0
         END)             AS ADM_USR_YN,
        USR.FIR_NM,
        USR.LST_NM,
        UPPER(USR.LST_NM)||' '||INITCAP(USR.FIR_NM) FUL_NM,
        USR.SHT_NM,
        USR.STA_DM,
        (CASE WHEN USR.STA_DM = 'N' THEN 'Active'
              WHEN USR.STA_DM = 'L' THEN 'Locked'
              WHEN USR.STA_DM = 'P' THEN 'Pending'
              WHEN USR.STA_DM = 'D' THEN 'Deleted'
          ELSE 'Invalid'
        END)              AS STATUS_DSC,
        (CASE WHEN USR.STA_DM = 'N' THEN TO_DATE(NULL)
           ELSE USR.STA_DT
         END)             AS STATUS_DT,
        MDL.MDL_DM,
        MDL.MDL_DSC,
        MDL.ADM_YN        AS ADM_MDL_YN
FROM  T_99_10_SSU       USR,
      T_99_11_MDU       MDU,
      T_99_00_MDL       MDL
WHERE MDL.MDL_DM  = MDU.MDL_DM
AND USR.R_K       = MDU.S_KY
AND MDL.IUS_YN    = 1
AND USR.R_S       = 1
AND USR.STA_DM IN ('N','L')
AND MDU.R_S      = 1
AND (USR.USR_DM = 'ADM' OR MDL.ADM_YN = 0)
WITH READ ONLY;
