CREATE OR REPLACE VIEW wf_lv_wb_00_nty
AS 
SELECT *
FROM   wf_vc_00_nty@wb_wf
ORDER BY ctr_dsc
WITH READ ONLY;
/