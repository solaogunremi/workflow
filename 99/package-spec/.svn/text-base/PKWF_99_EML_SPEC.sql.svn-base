CREATE OR REPLACE PACKAGE pkwf_99_eml AUTHID DEFINER AS
 --
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
  -- Message Parameter Values
  TYPE r_pv IS RECORD
  ( pi_src_app   VARCHAR2 (10)   ,    -- Source Module            * Required 
    pi_msg_id    VARCHAR2 (30)   ,    -- Message ID               * Required 
    pi_rcpt_adr  VARCHAR2 (4000) ,    -- Recipient Address(es)    * Required     (Comma-separated if many)
    pi_sndr_adr  VARCHAR2 (100)  ,    -- Sender Address
    pi_now_yn    VARCHAR2 (1)    ,    -- '1' to send immediately    
    -- Message Subject Parameters
    pi_sbj1      VARCHAR2 (50)  ,
    pi_sbj2      VARCHAR2 (50)  ,
    pi_sbj3      VARCHAR2 (50)  ,
    -- Message Body Parameters
    pi_bdy1      VARCHAR2 (500) ,
    pi_bdy2      VARCHAR2 (500) ,
    pi_bdy3      VARCHAR2 (500) ,
    pi_bdy4      VARCHAR2 (500) ,
    pi_bdy5      VARCHAR2 (500) ,
    pi_bdy6      VARCHAR2 (500) ,
    pi_bdy7      VARCHAR2 (500) ,
    pi_bdy8      VARCHAR2 (500) ,
    pi_bdy9      VARCHAR2 (500) ,
    pi_bdy10     VARCHAR2 (500) ,
    pi_bdy11     VARCHAR2 (500) ,
    pi_bdy12     VARCHAR2 (500) ,
    pi_bdy13     VARCHAR2 (500) ,
    pi_bdy14     VARCHAR2 (500) ,
    pi_bdy15     VARCHAR2 (500) ,
    -- Source Reference parameters
    pi_src_ref   VARCHAR2 (50) ,
    pi_src_key   NUMBER   (38),
    -- Additional Flex (for future use)
    pi_flx1      VARCHAR2 (500),
    pi_flx2      VARCHAR2 (500),
    pi_flx3      VARCHAR2 (500),
    -- Output Parameters
    po_snt_yn    VARCHAR2 (1),              -- '1' if successfully sent (or queued) 
    po_err_txt   VARCHAR2 (500));           -- Error message if failed
  --  
  --
  -- Parameter Values
  TYPE r_pv2 IS RECORD
  ( id       VARCHAR2 (50)  ,
    gid      VARCHAR2 (50)  ,
    ps1      VARCHAR2 (50)  ,
    ps2      VARCHAR2 (50)  ,
    ps3      VARCHAR2 (50)  ,
    pb1      VARCHAR2 (500) ,
    pb2      VARCHAR2 (500) ,
    pb3      VARCHAR2 (500) ,
    pb4      VARCHAR2 (500) ,
    pb5      VARCHAR2 (500) ,
    pb6      VARCHAR2 (500) ,
    pb7      VARCHAR2 (500) ,
    pb8      VARCHAR2 (500) ,
    pb9      VARCHAR2 (500) ,
    pb10     VARCHAR2 (500) ,
    pb11     VARCHAR2 (500) ,
    pb12     VARCHAR2 (500) ,
    pb13     VARCHAR2 (500) ,
    pb14     VARCHAR2 (500) ,
    pb15     VARCHAR2 (500) ,
    sref     VARCHAR2 (100) ,
    sky      NUMBER(38),
    ofrid    VARCHAR2 (50),
    flx1     VARCHAR2 (500),
    flx2     VARCHAR2 (500),
    flx3     VARCHAR2 (500));
  --
  /**
    * Send email message 
    * @param pi_sndr_adr    Sender Email
    * @param pi_rcpt_adr    Recipient Email    
    * @param pi_msg_sbj     Message Subject    
    * @param pi_msg_bdy     Message Body
    * @param pi_src_app     Source Module
    * @param pi_src_ref     Source Reference 
    * @param pi_src_key     Source Record Key 
    * @param pi_now_yn     '1' to send immediately     
  */
  PROCEDURE pr_snd (pi_rcpt_adr  VARCHAR2, 
                    pi_msg_sbj   VARCHAR2, 
                    pi_msg_bdy   CLOB,     
                    pi_sndr_adr  VARCHAR2 DEFAULT NULL,                        
                    pi_src_app   VARCHAR2 DEFAULT NULL,
                    pi_src_ref   VARCHAR2 DEFAULT NULL,
                    pi_src_key   NUMBER DEFAULT NULL,
                    pi_now_yn    VARCHAR2 DEFAULT '0');  
  --  
  PROCEDURE pr_snd2 (pi_pv IN OUT r_pv);
  --
  PROCEDURE pr_snd_att_blb (pi_rcpt_adr       IN VARCHAR2,                
                            pi_msg_sbj        IN VARCHAR2,  
                            pi_pv             IN r_pv DEFAULT NULL,                           
                            pi_msg_bdy        IN CLOB,
                            pi_att_blb        IN BLOB,
                            pi_att_filename   IN VARCHAR2,                                 
                            pi_att_inline_yn  IN VARCHAR2 DEFAULT '1',
                            pi_att_mime_type  IN VARCHAR2 DEFAULT 'application/octet-stream',                           
                            pi_sndr_adr       IN VARCHAR2 DEFAULT NULL,                           
                            pi_src_app        IN VARCHAR2 DEFAULT NULL,
                            pi_src_ref        IN VARCHAR2 DEFAULT NULL,
                            pi_src_key        IN NUMBER DEFAULT NULL,
                            pi_now_yn         IN VARCHAR2 DEFAULT '0');
  -- 
  FUNCTION fn_is_valid_adr (pi_adr VARCHAR2) RETURN BOOLEAN;
  --  
  FUNCTION fn_get_usr_adr (pi_uk IN NUMBER) RETURN VARCHAR2;
  --
  FUNCTION fn_get_ofr_adr (pi_id IN VARCHAR2) RETURN VARCHAR2;
  --
  -- Push out all unsent mails in queue
  PROCEDURE pr_prc_que;
  --
END pkwf_99_eml; 
/