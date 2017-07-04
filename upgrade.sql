set define off
set feedback on
set echo off
SPOOL OB_upgrade.log
Prompt ===========================================================     
Prompt UPGRADE Onboarding DB OBJECTS
Prompt ===========================================================  
Prompt     
Prompt
Prompt
Prompt creating OB views
Prompt ___________________________________________________________
Prompt 
@./views/install.sql
Prompt     
Prompt
Prompt
Prompt creating OB Packages
Prompt ___________________________________________________________
Prompt 
@./package-spec/install.sql
@./package-body/install.sql
@./views/install.sql
Prompt
Prompt 
Prompt
Prompt recompiling invalid objects
Prompt ___________________________________________________________
Prompt
@@recompile_objects.sql
Prompt 
Prompt 
Prompt OB Objects Installed
Prompt 
Prompt Please read the Installation log file...
Prompt 
Prompt ;-) 

SPOOL OFF