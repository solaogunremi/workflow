CREATE OR REPLACE PACKAGE pkch_90 AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Stockbroking Interface to Workflow <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 21-MAR-2016 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  TYPE r_00_xfr IS RECORD (
          row_key    ch_00_00_dtd.n38%TYPE,
          xfr_no     ch_00_00_dtd.n38%TYPE,
          xfr_act_id ch_00_00_dtd.c50%TYPE, 
          xfr_dt     ch_00_00_dtd.dt%TYPE,
          xfr_amt    ch_00_00_dtd.n224%TYPE,
          xfr_dsc    ch_00_00_dtd.c255%TYPE,
          trc_id     ch_00_00_dtd.c30%TYPE, 
          xfr_ref    ch_00_00_dtd.c50%TYPE, 
          --
          d_act_id   ch_00_00_dtd.c50%TYPE, 
          --d_xfr_amt  ch_00_00_dtd.n224%TYPE,
          d_xfr_dsc  ch_00_00_dtd.c255%TYPE,
          d_trc_id   ch_00_00_dtd.c30%TYPE
        );
  --
  TYPE r_00_pms IS RECORD (
          row_key    ch_00_00_dtd.n38%TYPE,
          pm_act_id  ch_00_00_dtd.c50%TYPE,
          pm_no      ch_00_00_dtd.n38%TYPE,
          pm_dt      ch_00_00_dtd.dt%TYPE,
          pm_amt     ch_00_00_dtd.n224%TYPE,
          pm_dsc     ch_00_00_dtd.c255%TYPE,
          trc_id     ch_00_00_dtd.c30%TYPE,
          pm_ref     ch_00_00_dtd.c50%TYPE,
          --
          d_trc_id   ch_00_00_dtd.c30%TYPE,
          d_act_id   ch_00_00_dtd.c50%TYPE, 
          d_pm_dsc   ch_00_00_dtd.c255%TYPE
          --d_pm_amt   ch_00_00_dtd.n224%TYPE
        );
  --
  TYPE r_00_rcs IS RECORD (
          row_key    ch_00_00_dtd.n38%TYPE,
          rc_act_id  ch_00_00_dtd.c50%TYPE,
          rc_no      ch_00_00_dtd.n38%TYPE,
          rc_dt      ch_00_00_dtd.dt%TYPE,
          rc_amt     ch_00_00_dtd.n224%TYPE,
          rc_dsc     ch_00_00_dtd.c255%TYPE,
          trc_id     ch_00_00_dtd.c30%TYPE,
          rc_ref     ch_00_00_dtd.c50%TYPE,
          --
          d_trc_id   ch_00_00_dtd.c30%TYPE,
          d_act_id   ch_00_00_dtd.c50%TYPE, 
          d_rc_dsc   ch_00_00_dtd.c255%TYPE
          --d_pm_amt   ch_00_00_dtd.n224%TYPE
        );
  --
  TYPE r_00_act IS RECORD (
          act_k      ch_00_00_dtd.n38%TYPE,
          boa_k      ch_00_00_dtd.n38%TYPE,
          cur_k      ch_00_00_dtd.n38%TYPE
        );
  --
  TYPE r_00_cus_act IS RECORD (
          act_tp_dm   ch_00_00_dtd.c5%TYPE,
          cus_id      ch_00_00_dtd.c30%TYPE,
          mkt_act_id  ch_00_00_dtd.c30%TYPE,
          mkt_act_dsc ch_00_00_dtd.c255%TYPE,
          act_id      ch_00_00_dtd.c30%TYPE,
          act_dsc     ch_00_00_dtd.c255%TYPE,
          err_yn      ch_00_00_dtd.c1%TYPE,
          err_cd      ch_00_00_dtd.n38%TYPE,
          err_msg     ch_00_00_dtd.c255%TYPE,
          err_sta     ch_00_00_dtd.c4000%TYPE
        );
  --
  TYPE r_00_dd_act IS RECORD (
          cus_id      ch_00_00_dtd.c30%TYPE,
          act_id      ch_00_00_dtd.c30%TYPE,
          act_dsc     ch_00_00_dtd.c255%TYPE,
          opn_bal     ch_00_00_dtd.n224%TYPE,
          cur_bal     ch_00_00_dtd.n224%TYPE,
          col_bal     ch_00_00_dtd.n224%TYPE,
          clr_bal     ch_00_00_dtd.n224%TYPE,    
          clr_col_bal ch_00_00_dtd.n224%TYPE,    
          err_yn      ch_00_00_dtd.c1%TYPE,
          err_cd      ch_00_00_dtd.n38%TYPE,
          err_msg     ch_00_00_dtd.c255%TYPE,
          err_sta     ch_00_00_dtd.c4000%TYPE
        );
  --
  TYPE r_ret IS RECORD (
         ret_cd       ch_00_00_dtd.n38%TYPE,
         err_msg      ch_00_00_dtd.c4000%TYPE,
         err_dsc      ch_00_00_dtd.c4000%TYPE,
         err_sta      ch_00_00_dtd.c4000%TYPE
         );
  --
  FUNCTION fn_bus_dt RETURN DATE;
  --
  FUNCTION fn_dft_bnk_id RETURN VARCHAR2;
  --
  FUNCTION fn_dft_sus_id RETURN VARCHAR2;
  --
  --
  FUNCTION fn_val_cus_act (pi_act       IN VARCHAR2,
                           pi_ex_rm_cus IN VARCHAR2 DEFAULT NULL) RETURN r_00_cus_act;
  --
  -- Debit Customer, Credit Suspense - TRANSFER
  -- Debit Customer, Credit Another Customer - TRANSFER
  PROCEDURE pr_cre_xfr (pi_rec IN OUT r_00_xfr);
  FUNCTION  fn_cre_xfr (pi_rec IN OUT r_00_xfr) RETURN r_ret;
  --
  -- Debit Suspense, Credit Bank - CASH PAYMENT
  PROCEDURE pr_cre_pms (pi_rec IN OUT r_00_pms);
  FUNCTION  fn_cre_pms (pi_rec IN OUT r_00_pms) RETURN r_ret;
  --
  -- Debit Bank, Credit customer - CASH RECEIPT
  PROCEDURE pr_cre_rcs (pi_rec IN OUT r_00_rcs);
  FUNCTION  fn_cre_rcs (pi_rec IN OUT r_00_rcs) RETURN r_ret;
  --
  -- Return Collactable Balance For Online Withdrawal purposes
  FUNCTION  fn_get_coll_bal(pi_act IN VARCHAR2) RETURN NUMBER;
  --
  --
  FUNCTION  fn_get_acct_dtl(pi_act IN VARCHAR2) RETURN r_00_dd_act;
  --
  --
END pkch_90;
/

