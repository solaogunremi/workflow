CREATE OR REPLACE VIEW wf_vl_10_rl_mb
AS
SELECT A.row_key,
       A.rl_k,
       B.rl_id,
       B.rl_dsc,
       A.mb_k,
       C.mb_id,
       C.mb_dsc,
       A.iu_yn,
       pkwf_00_00_dmv.fn_00_yes_no_dsc(A.iu_yn) iu_dsc
  FROM wf_10_rl_mb A, wf_10_rl B, wf_10_mb C
 WHERE A.rl_k = B.row_key
   AND A.mb_k = C.row_key; 
/