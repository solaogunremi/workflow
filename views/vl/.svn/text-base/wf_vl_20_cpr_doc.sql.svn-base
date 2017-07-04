CREATE OR REPLACE FORCE VIEW wf_vl_20_cpr_doc
AS
  SELECT dc.row_key dc_k, dc.dc_id, 
           dd.id doc_id, dd.dsc doc_dsc,
           im.im_blb doc_blb
      FROM wf_30_dc dc, wf_vd_cpr_doc dd, 
           wf_30_dc_im im
     WHERE dc.row_key = im.dc_k
       AND im.im_tp_dm = dd.id
    ORDER BY dd.dsc ASC;
/ 