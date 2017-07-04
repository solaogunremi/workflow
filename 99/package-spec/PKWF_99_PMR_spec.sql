CREATE OR REPLACE PACKAGE pkwf_99_pmr AUTHID DEFINER AS 
 /** 
  * ===========================================================<br/>
  *  PURPOSE : System Parameters <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 25-OCT-2012 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /** 
    * Returns System Restriction Status
  */  
  FUNCTION fn_restrict_sta (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns TRUE if User Type is restricted from accessing the application
  */     
  FUNCTION fn_restrict_usr_acs (pi_k VARCHAR2, pi_usr_typ VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if Installation Administrator logon is allowed
  */   
  FUNCTION fn_use_itl_adm (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if Installation User logon is allowed
  */   
  FUNCTION fn_use_itl_usr (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if APPROVALS PROCESSING is in use
  */     
  FUNCTION fn_use_apv (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if only trusted IP ADDRESSES are allowed
  */  
  FUNCTION fn_use_tip (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if EMAILS PROCESSING is in use
  */     
  FUNCTION fn_use_eml (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if SMS PROCESSING is in use
  */     
  FUNCTION fn_use_sms (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if ERROR LOG PROCESSING is in use
  */     
  FUNCTION fn_use_err_log (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if QUERY LOG PROCESSING is in use
  */     
  FUNCTION fn_use_qry_log (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if TRACE PROCESSING is in use
  */     
  FUNCTION fn_use_trc_log (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if AUDIT PROCESSING is in use
  */     
  FUNCTION fn_use_aud (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns Maximum Session Time (In Seconds)
  */     
  FUNCTION fn_apx_mst (pi_k VARCHAR2) RETURN NUMBER;
  --  
  /** 
    * Returns Maximum Idle Time (In Seconds)
  */   
  FUNCTION fn_apx_mit (pi_k VARCHAR2) RETURN NUMBER;
  --  
  /** 
    * Returns Default Installation Language
  */   
  FUNCTION fn_itl_lang (pi_k VARCHAR2) RETURN VARCHAR2;
  --
  /** 
    * Returns Minimum length of User Names   
  */     
  FUNCTION fn_min_nme_len (pi_k VARCHAR2) RETURN NUMBER;
  --
  /** 
    * Returns Minimum length of User Passwords   
  */     
  FUNCTION fn_min_pw_len (pi_k VARCHAR2) RETURN NUMBER;
  --  
  /** 
    * Returns TRUE if same Email address could be used for multiple System Users 
  */     
  FUNCTION fn_usr_reg_eml_dupl (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns Maximum number of days for verification of Automated User Registration
  */     
  FUNCTION fn_max_auv_dys (pi_k VARCHAR2) RETURN NUMBER;
  --  
  /** 
    * Returns TRUE if editing of CORE data is allowed
  */     
  FUNCTION fn_alw_cor_dml (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if purging of AUDIT data is allowed
  */     
  FUNCTION fn_purge_aud (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if purging of TRACE/ERROR/QUERY log data is allowed
  */     
  FUNCTION fn_purge_log (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if auditing of Failed (Unsuccessful) User Logins is enabled
  */     
  FUNCTION fn_aud_lgn_f (pi_k VARCHAR2) RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if Email Address is used as Login ID
  */     
  FUNCTION fn_use_email_as_uid (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Return Installation Organization ID
  */
  FUNCTION fn_itl_org_id (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Return Installation Organization Name
  */
  FUNCTION fn_itl_org_nme (pi_k VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Return Organization Timezone Offset
  */
  FUNCTION fn_tmz_offset (pi_k VARCHAR2) RETURN VARCHAR2;
  --   
  /** 
    * Return Organization Timezone Region
  */
  FUNCTION fn_tmz_region (pi_k VARCHAR2) RETURN VARCHAR2;
  --     
  /** 
    * Returns TRUE if running as DEMO application
  */      
  FUNCTION fn_is_demo_app RETURN BOOLEAN;
  --     
  /** 
    * Returns TRUE to display user password at approval or password resets
  */      
  FUNCTION fn_dsp_upw (pi_k VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns Installation APEX Workspace
  */   
  FUNCTION fn_apx_wsp (pi_k VARCHAR2) RETURN VARCHAR2;
  -- 
  /** 
    * Returns System Admin APEX Application Number
  */  
  FUNCTION fn_apx_apl (pi_k VARCHAR2) RETURN NUMBER;
  --   
  /** 
    * Returns System Login APEX Application Number
  */  
  FUNCTION fn_slgn_apl (pi_k VARCHAR2) RETURN NUMBER;
  --     
  /** 
    * Returns TRUE to validate and enforce Installation parameters
  */      
  FUNCTION fn_vld_itl_pmr (pi_k VARCHAR2) RETURN BOOLEAN;
  --   
  /** 
    * Returns TRUE if Symbols GL is installed
  */     
  FUNCTION fn_gl_intrf RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Symbols LN is installed
  */     
  FUNCTION fn_ln_intrf RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Symbols ST is installed
  */     
  FUNCTION fn_st_intrf RETURN BOOLEAN;
  --    
  /** 
    * Returns TRUE if XTrader is installed
  */     
  FUNCTION fn_xt_intrf RETURN BOOLEAN;
  --    
  /** 
    * Returns TRUE if Symbols AM is installed
  */     
  FUNCTION fn_am_intrf RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Symbols TU is installed
  */     
  FUNCTION fn_tu_intrf RETURN BOOLEAN;
  --
  /** 
    * Returns TRUE if Symbols CH is installed
  */     
  FUNCTION fn_ch_intrf RETURN BOOLEAN;
  -- 
  /** 
    * Returns TRUE if Symbols TR is installed
  */     
  FUNCTION fn_tr_intrf RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Symbols PS is installed
  */     
  FUNCTION fn_ps_intrf RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Symbols FA is installed
  */     
  FUNCTION fn_fa_intrf RETURN BOOLEAN;
  --   
  /** 
    * Returns TRUE if Interfaced to Old Symbols SA
  */      
  FUNCTION fn_oldsa_intrf RETURN BOOLEAN;
  --    
  /** 
    * Returns Database Parsing Schema
  */   
  FUNCTION fn_dbp_sch (pi_k VARCHAR2) RETURN VARCHAR2;
  --  
  /** 
    * Returns Application Context
  */   
  FUNCTION fn_apl_ctx RETURN VARCHAR2;
  --  
  /** 
    * Returns Number of licensed companies  
  */    
  FUNCTION fn_lcpy_cnt (pi_k VARCHAR2) RETURN NUMBER;
  --
  /** 
    * Returns Application Alias
  */   
  FUNCTION fn_apl_ali RETURN VARCHAR2;
  --  
  /** 
    * Returns TRUE if CORE module
  */    
  FUNCTION fn_is_capl (pi_d VARCHAR2) RETURN BOOLEAN;
  --  
  /** 
    * Returns TRUE if Sub-Module is separately licensed
  */    
  FUNCTION fn_is_slsm (pi_d VARCHAR2) RETURN BOOLEAN;
  --
  /** 
    * Generic
  */    
  --  
  FUNCTION fn_b_pmv (pi_id VARCHAR2) RETURN BOOLEAN;
  FUNCTION fn_n_pmv (pi_id VARCHAR2) RETURN NUMBER;
  FUNCTION fn_c_pmv (pi_id VARCHAR2) RETURN VARCHAR2;
  FUNCTION fn_d_pmv (pi_id VARCHAR2) RETURN DATE;
  --
END pkwf_99_pmr;
/

