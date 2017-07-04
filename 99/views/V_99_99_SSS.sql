CREATE OR REPLACE VIEW V_99_99_SSS 
 ( SSU_P1,
   SSU_P2,
   USR_FULNAME,
   USR_SHTNAME,
   USR_LANG,
   USR_TIME_IN,
   USR_LTIME_IN,
   SSU_UKY,
   SSU_LKY,
   SSU_ID,
   SSU_ADM_YN, 
   SSU_TYP,
   SSU_APL) 
AS SELECT 
   C100 SSU_P1,
   C100 SSU_P2,
   C100 USR_FULNAME,
   C100 USR_SHTNAME,
   C100 USR_LANG,
   C100 USR_TIME_IN,
   C100 USR_LTIME_IN,
   C100 SSU_UKY,
   C100 SSU_LKY,
   C100 SSU_ID,
   C100 SSU_ADM_YN, 
   C100 SSU_TYP,
   C100 SSU_APL
 FROM T_99_00_STC 
 WHERE ROWNUM < 1 ;