CREATE OR REPLACE FORCE VIEW wf_vl_20_doc
AS
  SELECT b.dc_k row_key, b.im_tp_dm, 
        d.dmv_dsc doc_dsc, b.im_blb,
        a.dc_id
FROM   wf_30_dc a,
       wf_30_dc_im b,
       wf_00_00_dmd c,
       wf_00_00_dmv d
WHERE a.row_key = b.dc_k
AND   c.row_key = d.dmd_k
AND   c.dmd_dm = 'WF_DC_TP'
AND   b.im_tp_dm = d.dmv_id
ORDER BY d.dmv_dsc
/ 