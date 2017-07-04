CREATE OR REPLACE VIEW wf_vl_20_dc_ac
AS
SELECT a.row_key dc_ac_k,
       a.mb_k,
       b.mb_id,
       b.mb_dsc,
       a.dc_tk_k,
       d.tk_id,
       d.tk_dsc,
       f.dc_id,
       f.dc_dsc,
       f.st_dtt,
       f.dc_st_dm,
       g.dsc dc_st_dm_dsc,
       a.ac_sq_no,
       a.ac_dtt,
       a.ac_rmk,
       a.ac_dm,
       e.dsc ac_dm_dsc,
       a.ac_p1,
       d.p1_dsc ac_p1_lbl,
       a.ac_p2,
       d.p2_dsc ac_p2_lbl,
       a.ac_p3,
       d.p3_dsc ac_p3_lbl,
       a.ac_p4,
       d.p4_dsc ac_p4_lbl,
       a.ac_p5,
       d.p5_dsc ac_p5_lbl       
FROM   wf_20_dc_ac a,
       wf_10_mb b,
       wf_20_dc_tk c,
       wf_10_tp_tk d,
       wf_vd_00_ac_tp e,
       wf_20_dc f,
       wf_vd_00_dc_st g
WHERE  a.mb_k = b.u_k
AND    a.dc_tk_k = c.row_key
AND    c.tk_k = d.row_key
AND    a.ac_dm = e.id
AND    c.dc_k = f.row_key
AND    f.dc_st_dm = g.id;
/
