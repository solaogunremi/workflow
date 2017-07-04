CREATE OR REPLACE FORCE VIEW v_99_20_msg_pnd
AS
  SELECT r_k,
         que_tm,
         msg_sbj,
         rcp_ky,
         rcp_adr,
         sndr_adr,
         prc_stat_dm,
         prc_tm,
         prc_cnt,
         prc_msg
  FROM   t_99_20_msg
  WHERE  prc_stat_dm = 'F'
  ORDER BY que_tm DESC;
/  