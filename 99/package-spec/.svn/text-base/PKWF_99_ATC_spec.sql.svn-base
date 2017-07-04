CREATE OR REPLACE PACKAGE pkwf_99_atc AUTHID DEFINER AS
 /** 
  * ===========================================================<br/>
  *  PURPOSE : System Admin Authentication Parameters <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 15-dec-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns TRUE if Logon User is not allowed access to Application
  */   
  FUNCTION fn_nacs RETURN BOOLEAN;
  --   
  /** 
    * Returns TRUE if Logon User has verified access to Application
  */   
  FUNCTION fn_acsv RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Logon User has unverified access to Application
  */   
  FUNCTION fn_acsuv RETURN BOOLEAN;
  --   
  /** 
    * Returns TRUE if Logon User is verified System Administrator
  */   
  FUNCTION fn_sadm RETURN BOOLEAN;
  --
  /** 
    * Returns TRUE if Logon User is external (i.e not internal)  System Administrator
  */   
  FUNCTION fn_xadm RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Logon User is verified Internal Administrator
  */   
  FUNCTION fn_iadm RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Logon User is verified Internal Support
  */   
  FUNCTION fn_ispt RETURN BOOLEAN;
  --   
  /** 
    * Returns TRUE if Logon User is verified Internal User
  */   
  FUNCTION fn_iusr RETURN BOOLEAN;
  --    
  /** 
    * Returns TRUE if Login User has been internally verified
  */       
  FUNCTION fn_is_ivrf RETURN BOOLEAN;
  --
  /** 
    * Returns TRUE if Login User must change password immediately
  */       
  FUNCTION fn_cpw RETURN BOOLEAN;
  --  
  /** 
    * Validates that Logon User is verified System Administrator
  */     
  PROCEDURE pr_vld_sadm;
  --
  /** 
    * Validates that Logon User is verified Internal Administrator
  */   
  PROCEDURE pr_vld_iadm;
  --
  /** 
    * Returns Front End Interface key
  */       
  FUNCTION fn_pik RETURN VARCHAR2;
  --
  /** 
    * Returns TRUE if licensed to use application
  */       
  FUNCTION fn_lic RETURN BOOLEAN;
  --   
END pkwf_99_atc;
/