CREATE OR REPLACE VIEW wf_vt_10_mb
AS
SELECT A.n38  row_key,
       A.c30  mb_id,
       A.c100 mb_dsc,
       A.n38  u_k,
       A.c1   iu_yn
  FROM wf_00_00_dtd A;
/