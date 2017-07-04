CREATE OR REPLACE VIEW wf_lv_wb_00_sta
AS 
SELECT *
FROM   wf_vc_00_sta@wb_wf
ORDER BY sta_dsc
WITH READ ONLY;
/