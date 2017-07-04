CREATE OR REPLACE FORCE VIEW wf_vc_00_bnk AS
  SELECT bnk_k, bnk_id, bnk_dsc
    FROM ch_vl_30_bnk@wf_sy
/  
