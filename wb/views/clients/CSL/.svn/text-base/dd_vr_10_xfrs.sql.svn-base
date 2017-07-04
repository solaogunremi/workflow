CREATE OR REPLACE VIEW dd_vr_10_xfrs 
AS
  SELECT
      a.row_key, 
      a.acc_no, 
      a.bus_dt, 
      a.trn_tp,
      to_char(a.sys_dtt, 'DD-MON-YYYY HH:MI:SS PM') sys_dtt_dsc, 
      DECODE(a.trn_tp, 'XX','Bank Transfer',
                     'SX','Own Account Transfer',
                     'OX','Third Party Transfer') trn_tp_dsc,
      DECODE(a.trn_sta, '0','In Progress',
                      '1','Failed',
                      '4','Symbols Transfer Complete',
                      '5','Symbols Transfer Complete',
                      '6','Symbols Transfer Complete',                  
                      '7','Transfer Successful') trn_sta_dsc,
      a.trn_sta,
      a.trn_ref, 
      a.trn_amt,
      a.trn_frm_act, 
      a.trn_to_act, 
      b.act_nm trn_to_nm,
      a.sup_act, 
      a.bnk_act, 
      a.trn_rmk
  FROM t_wb_10_acc_xfr a,
       t_wb_10_acc b
  WHERE a.trn_to_act = b.act_no(+)     
  ORDER BY a.sys_dtt DESC
  WITH READ ONLY;
/  