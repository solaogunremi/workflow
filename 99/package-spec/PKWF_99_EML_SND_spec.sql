CREATE OR REPLACE PACKAGE pkwf_99_eml_snd AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Messaging Email Interface <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/> 
  *  Date Created     : 27-DEC-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * Queue Message
    * @param pi_msg_sbj   Message Subject
    * @param pi_rcp_key   Recipient Key
    * @param pi_rcp_adr   Recipient Email
    * @param pi_sndr_adr  Sender Email
    * @param pi_msg_bdy   Message Body
    * @param pi_src_app   Source Module
    * @param pi_src_ref   Source Reference 
    * @param pi_src_key   Source Record Key  
    * @param pi_send_now  '1' to send immediately     
  */
  FUNCTION fn_send_msg (pi_k         VARCHAR2,
                        pi_msg_sbj   VARCHAR2, 
                        pi_rcp_key   NUMBER DEFAULT NULL, 
                        pi_rcp_adr   VARCHAR2, 
                        pi_sndr_adr  VARCHAR2 DEFAULT NULL,
                        pi_msg_bdy   CLOB,
                        pi_src_app   VARCHAR2 DEFAULT NULL,
                        pi_src_ref   VARCHAR2 DEFAULT NULL,
                        pi_src_key   NUMBER DEFAULT NULL) RETURN NUMBER;
  PROCEDURE pr_send_msg(pi_k        VARCHAR2,
                        pi_msg_sbj  VARCHAR2, 
                        pi_rcp_key  NUMBER, 
                        pi_rcp_adr  VARCHAR2, 
                        pi_sndr_adr VARCHAR2 DEFAULT NULL,
                        pi_msg_bdy  CLOB);
  PROCEDURE pr_send_msg1 (pi_k         VARCHAR2,                         
                          pi_msg_sbj   VARCHAR2, 
                          pi_rcp_adr   VARCHAR2, 
                          pi_msg_bdy   CLOB,
                          pi_sndr_adr  VARCHAR2 DEFAULT NULL,                           
                          pi_src_app   VARCHAR2 DEFAULT NULL,
                          pi_src_ref   VARCHAR2 DEFAULT NULL,
                          pi_src_key   NUMBER DEFAULT NULL,
                          pi_send_now  VARCHAR2 DEFAULT '0');  
  PROCEDURE pr_send_msg2 (pi_k         VARCHAR2,                         
                          pi_msg_sbj   VARCHAR2, 
                          pi_rcp_adr   VARCHAR2, 
                          pi_msg_bdy   CLOB,                       
                          pi_src_app   VARCHAR2 DEFAULT NULL,
                          pi_src_ref   VARCHAR2 DEFAULT NULL,
                          pi_src_key   NUMBER DEFAULT NULL,
                          pi_send_now  VARCHAR2 DEFAULT '0');                              
  --
  PROCEDURE pr_send_msg_att ( pi_k              IN VARCHAR2,                         
                              pi_msg_sbj        IN VARCHAR2, 
                              pi_rcp_adr        IN VARCHAR2, 
                              pi_msg_bdy        IN CLOB,
                              pi_att_blb        IN BLOB,
                              pi_att_filename   IN VARCHAR2,                                 
                              pi_att_inline_yn  IN VARCHAR2 DEFAULT '1',
                              pi_att_mime_type  IN VARCHAR2 DEFAULT 'application/octet-stream',                           
                              pi_sndr_adr       IN VARCHAR2 DEFAULT NULL,                           
                              pi_src_app        IN VARCHAR2 DEFAULT NULL,
                              pi_src_ref        IN VARCHAR2 DEFAULT NULL,
                              pi_src_key        IN NUMBER DEFAULT NULL,
                              pi_send_now       IN VARCHAR2 DEFAULT '0');
  --                              
  /**
   * Push Out Message Queue
   * @param pi_msg_ky   Specific Message Key. If NULL, process all
  */
  PROCEDURE pr_prc_msg (pi_k VARCHAR2, pi_msg_ky NUMBER DEFAULT NULL);
  --
  /**
   * Delete unsent message(s) on the queue
   * @param pi_msg_ky   Specific Message Key. If NULL, delete all
  */
  PROCEDURE pr_del_msg (pi_k VARCHAR2, pi_msg_ky NUMBER DEFAULT NULL);
  --  
  /**
   * Purge sent messages 
  */
  PROCEDURE pr_clr_snt (pi_k  VARCHAR2);
  --
  /**
   * Returns TRUE if message has been sent
   * @param pi_msg_ky   Message Key
  */  
  FUNCTION fn_snt (pi_k VARCHAR2, pi_msg_ky NUMBER) RETURN BOOLEAN;
  --
  /**
    * Format TIMESTAMP WITH TIMEZONE (Output format: DD-MON-YY HH24:MI:SS AM (TIMEZONE))
  */   
  FUNCTION fn_tmm (pi_d IN "TIMESTAMP WITH TIME ZONE") RETURN VARCHAR2;
  --
  /**
    * Process Email Queue
  */
  PROCEDURE pr_prc_que;
  --  
END pkwf_99_eml_snd; 
/