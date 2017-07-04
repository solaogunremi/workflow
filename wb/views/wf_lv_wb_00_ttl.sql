CREATE OR REPLACE VIEW wf_lv_wb_00_ttl
AS 
SELECT *
FROM   wf_vc_00_ttl@wb_wf
ORDER BY ctc_ttl_dsc
WITH READ ONLY;
/