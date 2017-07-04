CREATE OR REPLACE FORCE VIEW wf_v_00_dc_pdt
AS
  SELECT dc.row_key,
         dc.d_id,
         dc.dc_tp_k,  
         dc.dc_id,
         CASE
           WHEN dc.dc_tp_k = 100 THEN dc.lid18
           WHEN dc.dc_tp_k = 400 THEN dc.lid10
           WHEN dc.dc_tp_k = 500 THEN dc.lid18
         END as pdt_id,
         CASE
           WHEN dc.dc_tp_k = 100 THEN dc.sdc13
           WHEN dc.dc_tp_k = 400 THEN dc.sdc04
           WHEN dc.dc_tp_k = 500 THEN dc.sdc13
         END as pdt_dsc
  FROM   wf_30_dc dc
  WHERE  dc.dc_tp_k IN (100, 400, 500);
/  