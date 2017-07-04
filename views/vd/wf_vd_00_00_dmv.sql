CREATE OR REPLACE FORCE VIEW wf_vd_00_00_dmv AS
SELECT dmv_id ID, dmv_dsc dsc, dmd_dm, b.dsp_ord
  FROM wf_00_00_dmd A, wf_00_00_dmv b
 WHERE A.row_key = b.dmd_k
   AND ius_yn = '1';
/   
