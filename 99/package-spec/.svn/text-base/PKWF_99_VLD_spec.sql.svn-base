CREATE OR REPLACE PACKAGE pkwf_99_vld AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : General Validation routines <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Validate that Data is not empty. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */ 
  --
  PROCEDURE pr_reqd (pi_d IN VARCHAR2, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  PROCEDURE pr_reqd (pi_d IN NUMBER, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  PROCEDURE pr_reqd (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Validate that Input Number is greater than zero. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */ 
  PROCEDURE pr_above_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Validate that Input Number is not greater than zero. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */   
  PROCEDURE pr_not_above_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  -- 
  /** 
    * Validate that Input Number is less than zero. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */   
  PROCEDURE pr_below_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that Input Number is not less than zero. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_not_below_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that Input Number is equal to zero. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_equal_zero (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that Input Number is greater than the Specified Limit. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_lim    Limit Number
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_above_num (pi_d   IN NUMBER, 
                          pi_lim IN NUMBER DEFAULT 0, 
                          pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                          pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that Input Number is not greater than the Specified Limit. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_lim    Limit Number
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_not_above_num (pi_d   IN NUMBER, 
                              pi_lim IN NUMBER DEFAULT 0, 
                              pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                              pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that Input Number is less than the Specified Limit. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_lim    Limit Number
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_below_num (pi_d   IN NUMBER, 
                          pi_lim IN NUMBER DEFAULT 0, 
                          pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                          pi_pgm IN VARCHAR2 DEFAULT NULL);
  --                          
  /** 
    * Validate that Input Number is not less than the Specified Limit. Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_lim    Limit Number
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_not_below_num (pi_d   IN NUMBER, 
                              pi_lim IN NUMBER DEFAULT 0, 
                              pi_dsc IN VARCHAR2 DEFAULT 'Value', 
                              pi_pgm IN VARCHAR2 DEFAULT NULL);
  --                            
  /** 
    * Validate that Input Date is earlier than Current System Date (ignores time). Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_bef_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Validate that Input Date is not earlier than Current System Date (ignores time). Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_not_bef_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that Input Date is later than Current System Date (ignores time). Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_aft_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  -- 
  /** 
    * Validate that Input Date is not later than Current System Date (ignores time). Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */       
  PROCEDURE pr_not_aft_sys_dt (pi_d IN DATE, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that IST DATE is earlier than 2ND DATE (ignores time). Otherwise raise error.
    * @param pi_d1      Date 1
    * @param pi_dsc1    Date 1 Description/Label   
    * @param pi_d2      Date 2
    * @param pi_dsc2    Date 2 Description/Label       
    * @param pi_pgm     Calling program
  */       
  PROCEDURE pr_d1_bef_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Validate that IST DATE is not earlier than 2ND DATE (ignores time). Otherwise raise error.
    * @param pi_d1      Date 1
    * @param pi_dsc1    Date 1 Description/Label   
    * @param pi_d2      Date 2
    * @param pi_dsc2    Date 2 Description/Label       
    * @param pi_pgm     Calling program
  */       
  PROCEDURE pr_d1_not_bef_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Validate that IST DATE is later than 2ND DATE (ignores time). Otherwise raise error.
    * @param pi_d1      Date 1
    * @param pi_dsc1    Date 1 Description/Label   
    * @param pi_d2      Date 2
    * @param pi_dsc2    Date 2 Description/Label       
    * @param pi_pgm     Calling program
  */       
  PROCEDURE pr_d1_aft_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --  
  /** 
    * Validate that IST DATE is not later than 2ND DATE (ignores time). Otherwise raise error.
    * @param pi_d1      Date 1
    * @param pi_dsc1    Date 1 Description/Label   
    * @param pi_d2      Date 2
    * @param pi_dsc2    Date 2 Description/Label       
    * @param pi_pgm     Calling program
  */       
  PROCEDURE pr_d1_not_aft_d2 (pi_d1 IN DATE, pi_dsc1 IN VARCHAR2, pi_d2 IN DATE, pi_dsc2 IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --     
  /** 
    * Validate that Input Number is an Integer (i.e. has no fractional part). Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */     
  PROCEDURE pr_whole_num (pi_d NUMBER, pi_dsc VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Returns TRUE if Input Number is a valid Money Amount (i.e. is > 0 and has max of 2 decimals). 
    * @param pi_d      Input Data
  */     
  FUNCTION fn_is_valid_money (pi_d IN NUMBER) RETURN BOOLEAN;
  -- 
  /** 
    * Validate that Input Number is a valid Money Amount (i.e. is > 0 and has max of 2 decimals). Otherwise raise error.
    * @param pi_d      Input Data
    * @param pi_dsc    Data Description/Label   
    * @param pi_pgm    Calling program
  */       
  PROCEDURE pr_money (pi_d IN NUMBER, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
  /** 
    * Validate that Input Record Status is 'Pending'. Otherwise raise error.
    * @param pi_d      Record Status
    * @param pi_pgm    Calling program
  */      
  PROCEDURE pr_pending_rec (pi_d IN NUMBER, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --   
  /** 
    * Validate that Input Record Status is 'Approved'. Otherwise raise error.
    * @param pi_d      Record Status
    * @param pi_pgm    Calling program
  */      
  PROCEDURE pr_approved_rec (pi_d IN NUMBER, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --   
  /** 
    * Validate that length of Input Data is not greater than specified value. Otherwise raise error.
    * @param pi_d       Input Data
    * @param pi_len     Maximum Length limit
    * @param pi_dsc     Data Description/Label       
    * @param pi_pgm     Calling program
  */       
  PROCEDURE pr_dat_len_max (pi_d IN VARCHAR2, pi_len IN NUMBER DEFAULT 50, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  -- 
  /** 
    * Validate that length of Input Data is not less than specified value. Otherwise raise error.
    * @param pi_d       Input Data
    * @param pi_len     Minimum Length limit
    * @param pi_dsc     Data Description/Label       
    * @param pi_pgm     Calling program
  */       
  PROCEDURE pr_dat_len_min (pi_d IN VARCHAR2, pi_len IN NUMBER DEFAULT 10, pi_dsc IN VARCHAR2, pi_pgm IN VARCHAR2 DEFAULT NULL);
  --
END pkwf_99_vld;
/

