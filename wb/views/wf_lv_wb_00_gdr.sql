CREATE OR REPLACE VIEW wf_lv_wb_00_gdr
AS 
SELECT *
FROM   wf_vd_cs_gdr@wb_wf
ORDER BY dsc
WITH READ ONLY;
/