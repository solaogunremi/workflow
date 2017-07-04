CREATE OR REPLACE VIEW wf_vl_20_dc_rej
AS
SELECT a.row_key dc_k,
       a.dc_id,
       a.dc_dsc,
       a.st_dtt,
       b.tp_id,
       b.tp_dsc,
       c.ed_dtt,
       d.ac_dtt,
       d.ac_rmk,
       d.mb_k,
       e.mb_id,
       e.mb_dsc,
       f.tk_id,
       f.tk_dsc,
       g.pdt_id,
       g.pdt_dsc
FROM   wf_20_dc a,
       wf_10_tp b,
       wf_20_dc_tk c,
       wf_20_dc_ac d,
       wf_10_mb e,
       wf_10_tp_tk f,
       wf_v_00_dc_pdt g
WHERE  a.dc_st_dm = 'R'
AND    a.tp_k = b.row_key
AND    a.row_key = c.dc_k
AND    c.row_key = d.dc_tk_k
AND    d.mb_k = e.u_k
AND    c.tk_k = f.row_key
AND    a.dc_id = g.dc_id
AND    d.ac_dm = '2';
/