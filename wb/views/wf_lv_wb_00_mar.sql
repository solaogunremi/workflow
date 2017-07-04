CREATE OR REPLACE VIEW wf_lv_wb_00_mar
AS 
SELECT *
FROM   wf_vd_cs_mar@wb_wf
ORDER BY dsc
WITH READ ONLY;
/