CREATE OR REPLACE VIEW wf_vl_10_tp_tk
AS
  SELECT a.row_key tp_k, a.tp_id, a.tp_dsc,
         b.row_key tk_k, b.tk_id, b.tk_dsc,
         c.row_key rl_k, c.rl_id, c.rl_dsc
  FROM   wf_10_tp a,
         wf_10_tp_tk b,
         wf_10_rl c
  WHERE  a.row_key = b.tp_k
  AND    b.ac_rl_k = c.row_key(+)
  ORDER BY a.tp_dsc, b.seq_no;
/  