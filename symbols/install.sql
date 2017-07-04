set define off
set feedback on
set echo off
SPOOL WF_installation.log
Prompt ===========================================================     
Prompt INSTALLING Workflow DB OBJECTS - Symbols Side
Prompt ===========================================================  
Prompt      
Prompt
Prompt creating WF Tables
Prompt ___________________________________________________________
Prompt 
@./views/tables/install.sql
Prompt     
Prompt     
Prompt
Prompt creating WF Views
Prompt ___________________________________________________________
Prompt 
@./views/install.sql
Prompt     
Prompt
Prompt
Prompt
Prompt creating WF Package
Prompt ___________________________________________________________
Prompt 
@./package-spec/install.sql
@./package-body/install.sql
Prompt     
Prompt
Prompt
Prompt creating WF Views
Prompt ___________________________________________________________
Prompt 
@./views/install.sql
Prompt
Prompt
Prompt 
Prompt WF Objects Installed
Prompt 
Prompt Please read the Installation log file...
Prompt 
Prompt ;-) 

SPOOL OFF