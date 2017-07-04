CREATE OR REPLACE FORCE VIEW wf_vc_00_ttl AS
  SELECT ctc_ttl_k, ctc_ttl_id, ctc_ttl_dsc
    FROM cs_vl_00_cdv_ctc_ttl@wf_sy
/  
