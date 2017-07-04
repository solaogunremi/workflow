create or replace PACKAGE         pkwb_00_ch AS
    /**
  * ===========================================================<br/>
  *  PURPOSE : Symbols Web Cash Management <br/>
  *  SCHEMA: PG_WEB <br/>
  *  Created By       : Aderemi Alabi <br/>
  *  Date Created     : 18-APR-2016 <br/>
  *  Release Version  : 0.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /* Record Types */
    TYPE r_ret IS RECORD (
         ret_cd          number(38),
         err_msg         varchar2(4000),
         err_dsc         varchar2(4000),
         err_sta         varchar2(4000),
         ret_ref         varchar2(100)
         );
  --
  /* Package Variable */
  --
  /* Package Routines */
  --
  PROCEDURE pr_upd_sta(pi_ref IN VARCHAR2, pi_sta IN VARCHAR2);
  --
  FUNCTION fn_xfr(pi_tp   IN VARCHAR2,
                  pi_frm IN VARCHAR2,
                  pi_to   IN VARCHAR2,
                  pi_amt  IN NUMBER) RETURN VARCHAR2;
  FUNCTION fn_xfr2(pi_tp   IN VARCHAR2,
                  pi_frm IN VARCHAR2,
                  pi_to   IN VARCHAR2,
                  pi_amt  IN NUMBER) RETURN r_ret;
  --
  PROCEDURE pr_pms(pi_ref IN VARCHAR2);
  --
  PROCEDURE pr_rxfr(pi_ref IN VARCHAR2);
  --
  FUNCTION fn_val_to_act(pi_act IN VARCHAR2) RETURN VARCHAR2;
  --
  FUNCTION fn_xfr_max_val RETURN NUMBER;
  FUNCTION fn_xfr_max_amt RETURN NUMBER;
  FUNCTION fn_xfr_max_cnt RETURN NUMBER;
  --
  FUNCTION fn_xfr_bal(pi_act IN VARCHAR2) RETURN NUMBER;
  --
  PROCEDURE pr_do_xfr(pi_frm_act IN VARCHAR2,
                      pi_bnf_act IN VARCHAR2,
                      pi_amt     IN NUMBER);
  --
  PROCEDURE pr_get_bnk_bal(pi_act IN VARCHAR2,
                           po_bal     OUT NUMBER,
                           po_act_nm  OUT VARCHAR2,
                           po_act_msg OUT VARCHAR2);
  --                      
END pkwb_00_ch; 