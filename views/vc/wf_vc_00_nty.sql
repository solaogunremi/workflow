CREATE OR REPLACE FORCE VIEW wf_vc_00_nty AS
  SELECT row_key, ctr_cd, ctr_dsc
    FROM cs_00_ctr@wf_sy
/  