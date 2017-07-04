CREATE OR REPLACE PACKAGE pkst_90_wf AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Stockbroking Interface to Workflow <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 21-MAR-2016 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  TYPE r_00_ptf IS RECORD (
          mkt_id         st_00_00_dtd.c50%TYPE,
          ptf_tp_id      st_00_00_dtd.c50%TYPE,
          cus_id         st_00_00_dtd.c50%TYPE,
          cus_nme        st_00_00_dtd.c255%TYPE,
          prd_id         st_00_00_dtd.c50%TYPE,
          mkt_act_id     st_00_00_dtd.c50%TYPE,
          mkt_chn_no     st_00_00_dtd.c50%TYPE
        );
  --
  --
  TYPE r_00_map IS RECORD (
          ptf_id         st_00_00_dtd.c50%TYPE,
          cus_id         st_00_00_dtd.c50%TYPE,
          mkt_act_id     st_00_00_dtd.c50%TYPE
        );
  --
  --
  /**
    * Returns the row key of a processed {inserted/modified} record.
    * @param pi_rec Input Data
  */
  PROCEDURE pr_cre_ptf (pi_rec IN OUT r_00_ptf,
                        pi_loc IN VARCHAR2 DEFAULT '001');
  --
  --
  PROCEDURE pr_cre_map (pi_rec IN OUT r_00_map);
  --
  --
END pkst_90_wf;
/

