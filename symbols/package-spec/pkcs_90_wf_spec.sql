CREATE OR REPLACE PACKAGE pkcs_90_wf AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Customer Interface to Workflow <br/>
  *  Created By       : Femi Akintoye <br/>
  *  Date Created     : 21-MAR-2016 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  SUBTYPE r_00_ctc IS cs_vt_00_ctc%ROWTYPE;
  --
  --
  /**
    * Returns the row key of a processed {inserted/modified} record.
    * @param pi_rec Input Data
  */
  PROCEDURE pr_prc_ctc (pi_rec    IN OUT r_00_ctc,
                        po_ctc_k  OUT NUMBER,
                        po_cus_k  OUT NUMBER);
  --
--  
  PROCEDURE pr_prc_ctc_c (pi_rec    IN OUT r_00_ctc,
                        po_ctc_k  OUT NUMBER,
                        po_cus_k  OUT NUMBER);
  --
  --
  PROCEDURE pr_prc_ctc_j(pi_rec      IN OUT r_00_ctc,
                         pi_rec_j    IN OUT r_00_ctc,
                         po_ctc_k    OUT NUMBER,
                         po_cus_k    OUT NUMBER,
                         po_ctc_j_k  OUT NUMBER);
  --
  --
  PROCEDURE pr_prc_img (pi_dc_k   IN NUMBER,
                        pi_dc_id  IN VARCHAR2,
                        pi_cus_k  IN NUMBER,
                        pi_doc_tp IN VARCHAR2);
  --
  --
  PROCEDURE pr_prc_web(pi_cus_k IN NUMBER);
  --
  --
  PROCEDURE pr_prc_web(pi_cus_id IN VARCHAR2);
  --
  --
END pkcs_90_wf;
/

