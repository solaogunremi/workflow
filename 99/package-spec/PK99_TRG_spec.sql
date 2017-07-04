CREATE OR REPLACE PACKAGE "PK99_TRG" AUTHID DEFINER AS 
 /** 
  * ===========================================================<br/>
  *  PURPOSE : INTERNAL Tables Triggers processing <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * CORE Tables triggers processing
  */
  PROCEDURE pr_trg00 (p1 IN OUT v_99_99_trg%ROWTYPE);
  --  
  /** 
    * CORE Language Tables maintenance processing
  */
  PROCEDURE pr_trg00l (p1 IN OUT v_99_99_lgg%ROWTYPE);
  --    
  /** 
    * SECURITY Tables triggers processing
  */
  PROCEDURE pr_trg10 (p1 IN OUT v_99_99_trg%ROWTYPE);
  --  
  /** 
    * LOG/TRACE Tables triggers processing
  */
  PROCEDURE pr_trg20 (p1 IN OUT v_99_99_trg%ROWTYPE);
  --  
  /** 
    * GENERAL Tables triggers processing
  */
  PROCEDURE pr_trg30 (p1 IN OUT v_99_99_trg%ROWTYPE);
  --    
  /** 
    * AUDIT Tables triggers processing
  */
  PROCEDURE pr_trg90 (p1 IN OUT v_99_99_trg%ROWTYPE);
  PROCEDURE pr_trg99 (p1 IN OUT v_99_99_trg%ROWTYPE);
  --    
  /** 
    * Set System DML flag
  */
  PROCEDURE pr_set_sdml (pi_k IN VARCHAR2);
  --
  /** 
    * Set System MAINTENANCE flag
  */
  PROCEDURE pr_set_smnt (pi_k IN VARCHAR2);
  --  
  /** 
    * Reset System DML flag
  */
  PROCEDURE pr_reset_sdml;
  --  
END pk99_trg;

/

