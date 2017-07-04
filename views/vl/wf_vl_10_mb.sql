CREATE OR REPLACE VIEW wf_vl_10_mb
AS
SELECT A.row_key,
       A.mb_id,
       A.mb_dsc,
       A.u_k,
       B.usr_name u_dsc,
       A.iu_yn,
       pkwf_00_00_dmv.fn_00_yes_no_dsc(A.iu_yn) iu_dsc
  FROM wf_10_mb A, wf_v_99_usr_l B
 WHERE A.u_k = B.usr_ky (+);
/