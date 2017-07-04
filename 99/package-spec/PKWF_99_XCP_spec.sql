CREATE OR REPLACE PACKAGE pkwf_99_xcp AUTHID DEFINER AS
 /**
  * ===========================================================<br/>
  *  PURPOSE : Pre-defined Application Exceptions <br/>
  *  SCHEMA: INTERNAL <br/>
  *  Created By       : Chiedu Okeleke <br/>
  *  Date Created     : 30-APR-2009 <br/>
  *  Release Version  : 2.0 <br/>
  * ===========================================================<br/>
  * @headcom
  */
  --
  /**
    * No Access Privilege. This is raised when attempting to access a function without the requisite privilege to do so.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_acs_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Edit Not Allowed. This is raised when attempting to edit records from a function which does not allow such.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_dml (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * No Edit Privilege. This is raised when attempting to edit records without the requisite privilege to do so.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_dml_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record Creation Not Allowed. This is raised when attempting to create records from a function which does not allow such.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_ins (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * No Record Creation Privilege. This is raised when attempting to create records without the requisite privilege to do so.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_ins_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record Update Not Allowed. This is raised when attempting to update records from a function which does not allow such.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_upd (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * No Record Update Privilege. This is raised when attempting to update records without the requisite privilege to do so.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_upd_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record Deletion Not Allowed. This is raised when attempting to delete records from a function which does not allow such.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_del (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * No Record Deletion Privilege. This is raised when attempting to delete records without the requisite privilege to do so.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_del_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record Approval Not Allowed. This is raised when attempting to approve records from a function which does not allow such.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_apv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * No Record Approval Privilege. This is raised when attempting to approve records without the requisite privilege to do so.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_apv_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record Already Approved. This is raised when attempting to approve a record that has already been approved or rejected.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_apv_rec (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Printing Not Allowed. This is raised when attempting to print from a function which does not allow such.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_prt (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * No Print Privilege. This is raised when attempting to print without the requisite privilege to do so.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_no_prt_prv (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Invalid Program. This is raised when an unknown source attempts to execute a program
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_ivl_pgm (pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Restricted System Access. This is raised when attempting to access the system while it is in restricted mode.
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_restrict_acs (pi_k IN VARCHAR2, pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Invalid Input Parameters. This is raised when one or more input parameters is invalid
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_ivl_in_pmr (pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Data already in use. This is raised when attempting to enter Data (Code, Identifier etc) that has already been used.
    * @param pi_dsc    Description of the data
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_raise_is_in_use (pi_dsc IN VARCHAR2 DEFAULT 'Code', pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Data is reserved. This is raised when attempting to enter Data (Code, Identifier etc) that is reserved for specific use.
    * @param pi_dsc    Description of the data
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_reserved (pi_dsc IN VARCHAR2 DEFAULT 'Code', pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record duplicates found. This is raised when a query retrieves duplicate records.
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_dupl_found (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record not found. This is raised when a query does not retrieve any record.
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_not_found (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Record not valid. 
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_not_valid (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  --
  /**
    * Code not valid. 
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_not_defined (pi_dsc IN VARCHAR2 DEFAULT 'Code', pi_pg IN VARCHAR2 DEFAULT NULL);
  --  
  /**
    * Record already approved.
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_already_approved (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  --  
  /**
    * Record is pending approval
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_pending_approval (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  -- 
  /**
    * Record is rejected
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_already_rejected (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  -- 
  /**
    * Record already deleted.
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_deleted (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  --   
  /**
    * Record not in use
    * @param pi_dsc    Description of the data being queried
    * @param pi_pg     Name of program that raised this exception.
  */
  PROCEDURE pr_not_in_use (pi_dsc IN VARCHAR2 DEFAULT 'Record', pi_pg IN VARCHAR2 DEFAULT NULL);
  --   
  /**
    * Own record approval. This is raised when attempting to approve a record edited by same user
  */
  PROCEDURE pr_own_rec_apr;
  --  
  /**
    * No access privilege at the application
  */
  PROCEDURE pr_no_apl_acs_prv;
  --   
  /**
    * No privilege to execute operation
  */
  PROCEDURE pr_no_execute_prv;
  --   
  /**
    * Unauthorized connection
  */
  PROCEDURE pr_unauth_conn;
  --   
  /**
    * Processing not allowed 
    * @param pi_dsc    Description of the action being processed
    * @param pi_pg     Name of program that raised this exception.
  */  
  PROCEDURE pr_not_allowed (pi_dsc IN VARCHAR2 DEFAULT 'Processing', pi_pg IN VARCHAR2 DEFAULT NULL);
  --
END pkwf_99_xcp;
/

