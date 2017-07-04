Workflow Installation Guide

INSTALLATION
===========================================================================

Log in as SYS or user with DBA privilege
- Create Workflow Schema 
- Run .\99\scripts\install\grant_99_schema_privileges.sql 
  Alter the script to add your schema name
- Grant necessary tablespace privilege to created schema  

Log in as created Schema 
- Install JRXML
- Install Logger 3.1.1
- Alter .\scripts\database_links.sql to point to a Symplus Schema
- Run .\install
- Check the installation log .\WF_installation.log 
- Run .\99\scripts\sysdata\Create_or Reset_WF_SETUP_Admin.sql

Log into APEX
- Create the Workflow Workspace
- Import the most recent APEX App from .\apex
- Import the most recent application static files .\apex
- Import the most recent workspace static files .\apex
- Import the REST Module .\apex\com_neulogicsolutions_workflow.sql
- Import the REST Module .\apex\web_get_symbols_local.sql
- Import the REST Module .\apex\web_post_workflow_local.sql


Log into the Symplus Schema
 - Run .\symbols\install.sql
 - Run .\symbols\scripts\CS-dflt-loc.sql

WORKFLOW SETUP
==============================================================================
- Manually update "WF_00_00_PVL" table to Interface with ST, AM or both
- Log in to Workflow with the default setup user "setup" with password Default$123. 
  Change password after first login
- Upload JRXML Report files located at .\scripts\xml\* using the system setup screen
  under "JRXML Defintions" tab. Select a Report Type and open the corresponding files
  copy and paste the contenet into the report XML textarea. If Report requires add
  sub report copy the "-02".xml file  
- Setup System Parameters. Determine Which type of users to be allowed and other
  parameters
- Refresh the LOVs to populate the List of values from your target Symplus
  Schema.  
- Configure ACL using the screen provide to enable PDF Printing, REST calls and email delivery
- Setup Email Parameters. Test by sending a Test Mail. Confirm receipt of mail
- Define the Document Code as defined in Symplus
- Confirm or Modify preshipped Roles
- Assign Roles to Tasks on the Workflow Screen
- Assign Roles to Users 
    
    
Run the application and test
Have fun    