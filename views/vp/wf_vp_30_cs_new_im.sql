CREATE OR REPLACE VIEW wf_vp_30_cs_new_im
AS
SELECT ab.dc_id, aa.dc_k, aa.pic_img, aa.pic_sgn, 
       aa.pic_usr, aa.pic_utl
FROM   (SELECT a.dc_k, b.pic_img, c.pic_sgn, 
               d.pic_usr, e.pic_utl
        FROM  (SELECT DISTINCT dc_k FROM wf_30_dc_im) a,
              (SELECT dc_k, im_blb as pic_img FROM wf_30_dc_im WHERE im_tp_dm = 'PIC_IMG') b,
              (SELECT dc_k, im_blb as pic_sgn FROM wf_30_dc_im WHERE im_tp_dm = 'PIC_SGN') c,
              (SELECT dc_k, im_blb as pic_usr FROM wf_30_dc_im WHERE im_tp_dm = 'PIC_USR') d,
              (SELECT dc_k, im_blb as pic_utl FROM wf_30_dc_im WHERE im_tp_dm = 'PIC_UTL') e      
        WHERE  a.dc_k = b.dc_k
        AND    a.dc_k = c.dc_k
        AND    a.dc_k = d.dc_k
        AND    a.dc_k = e.dc_k) aa,
       (SELECT DISTINCT row_key, dc_id FROM wf_vl_20_doc) ab
WHERE  aa.dc_k = ab.row_key;
/