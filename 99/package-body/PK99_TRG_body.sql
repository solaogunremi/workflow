CREATE OR REPLACE PACKAGE BODY "PK99_TRG" AS
  --
  /* Created By       : Chiedu Okeleke 
  ** Date Created     : 30-APR-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: INTERNAL Tables Triggers processing
  **
  ** MODIFICATION HISTORY:
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **  
  ** Copyright:  ProGenics Corp. Ltd, 2009
  **
  */
  /* Public Routines */
  --  
  -- SECURITY TABLES trigger processing
  PROCEDURE pr_trg10 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
  BEGIN
    pkwf_99_trg.pr_trg10 (p1);
    --
  END pr_trg10;
  -- 
  -- LOG TABLES trigger processing
  PROCEDURE pr_trg20 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
  BEGIN
    pkwf_99_trg.pr_trg20(p1);
  END pr_trg20;
  -- 
  -- GENERAL TABLES trigger processing
  PROCEDURE pr_trg30 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
  BEGIN
    pkwf_99_trg.pr_trg30(p1);
  END pr_trg30;
  --   
  -- CORE TABLES trigger processing
  PROCEDURE pr_trg00 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
  BEGIN
    pkwf_99_trg.pr_trg00(p1);
  END pr_trg00;
  --
  -- CORE LANGUAGE TABLES maintenance processing
  PROCEDURE pr_trg00l (p1 IN OUT v_99_99_lgg%ROWTYPE) IS
  BEGIN
    pkwf_99_trg.pr_trg00l(p1);
  END pr_trg00l;
  --    
  -- AUDIT TABLES trigger processing
  PROCEDURE pr_trg90 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
  BEGIN
    pkwf_99_trg.pr_trg90(p1);
  END pr_trg90;
  --     
  PROCEDURE pr_trg99 (p1 IN OUT v_99_99_trg%ROWTYPE) IS
    v1      v_99_99_trg%ROWTYPE;   
  BEGIN
    pkwf_99_trg.pr_trg99(p1);
  END pr_trg99;
  --   
  --  Set System DML flag 
  PROCEDURE pr_set_sdml (pi_k IN VARCHAR2) IS
  BEGIN
    pkwf_99_trg.pr_set_sdml(pi_k);
  END pr_set_sdml;
  --
  --  Set System MAINTENANCE flag
  PROCEDURE pr_set_smnt (pi_k IN VARCHAR2) IS
  BEGIN
    pkwf_99_trg.pr_set_smnt(pi_k);
  END pr_set_smnt;
  --  
  --  Reset System DML flag
  PROCEDURE pr_reset_sdml IS
  BEGIN
    pkwf_99_trg.pr_reset_sdml;
  END pr_reset_sdml;
  -- 
END pk99_trg;

/

