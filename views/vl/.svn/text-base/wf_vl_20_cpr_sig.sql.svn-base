CREATE OR REPLACE  VIEW wf_vl_20_cpr_sig
AS
  SELECT a.rowid as pry_key, a.row_key,
         a.lid01  as dc_id,
         a.sdc01  as fir_nm,
         a.sdc02  as lst_nm,
         a.sdc03  as oth_nm,
         a.lid02  as gdr_dm,
         a.d01    as bth_dt,
         a.ldc01  as eml_adr,
         a.sdc04  as mbl_phn,
         a.sdc05  as adr_l1,
         a.sdc06  as adr_cty,
         a.sdc07  as adr_ctr,
         a.sdc08  as adr_sta,
         a.sdc09  as adr_zip,
         b.sig_pic,
         c.sig_sgn,         
        'image/jpeg ' mm_tp,
        '20284767421347459/picture.jpg' fl_nm --LOWER(row_key||sdc01||sdc02)||'.jpg' as fl_nm
  FROM   wf_30_dc a,
        (SELECT aa.dc_k, aa.im_blb as sig_pic FROM wf_30_dc_im aa WHERE aa.im_tp_dm = 'SIG_IMG') b,
        (SELECT ab.dc_k, ab.im_blb as sig_sgn FROM wf_30_dc_im ab WHERE ab.im_tp_dm = 'SIG_SGN') c
  WHERE  d_id = 'WFVI30CSNEWSIG'
  AND    b.dc_k = a.row_key
  AND    c.dc_k = a.row_key;
/  
         