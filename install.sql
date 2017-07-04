set define off
set feedback on
set echo off
SPOOL WF_installation.log
Prompt ===========================================================     
Prompt INSTALLING Workflow DB OBJECTS
Prompt ===========================================================  
Prompt     
Prompt
Prompt creating WF99 Objects
Prompt ___________________________________________________________
Prompt 
@./99/install.sql
Prompt     
Prompt    
Prompt
Prompt creating WF Sequences
Prompt ___________________________________________________________
Prompt 
@./sequences/install.sql
Prompt     
Prompt   
Prompt
Prompt creating WF Types
Prompt ___________________________________________________________
Prompt 
@./obj-types/install.sql
Prompt     
Prompt
Prompt   
Prompt
Prompt creating WF Tables
Prompt ___________________________________________________________
Prompt 
@./scripts/install/create-wf-tables.sql
@./scripts/install/alter-wf-tables.sql
Prompt     
Prompt
Prompt
Prompt creating WF Database Link
Prompt ___________________________________________________________
Prompt 
@./scripts/install/create-wf-links.sql
Prompt     
Prompt
Prompt
Prompt
Prompt creating WF Views
Prompt ___________________________________________________________
Prompt 
@./views/v/install.sql
@./views/vc/install.sql
@./views/vd/install.sql
@./views/vi/install.sql
--@./views/vl/install.sql
@./views/vp/install.sql
--@./views/vr/install.sql
@./views/vt/install.sql
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
@./views/v/install.sql
@./views/vc/install.sql
@./views/vd/install.sql
@./views/vi/install.sql
@./views/vl/install.sql
@./views/vp/install.sql
@./views/vr/install.sql
@./views/vt/install.sql
Prompt
Prompt     
Prompt
Prompt
Prompt creating WF table data
Prompt ___________________________________________________________
Prompt 
@./scripts/data/install.sql
Prompt     
Prompt
Prompt
Prompt
Prompt creating WF Scheduler
Prompt ___________________________________________________________
Prompt 
@./job/j_wf_10_eml.sql
Prompt     
Prompt
Prompt
Prompt 
Prompt
Prompt recompiling invalid objects
Prompt ___________________________________________________________
Prompt
@@recompile.sql
Prompt
Prompt Wrapping all packages
Prompt ___________________________________________________________
Prompt
@@wrap.sql
@@recompile.sql
Prompt 
Prompt 
Prompt WF Objects Installed
Prompt 
Prompt Please read the Installation log file...
Prompt 
Prompt ;-) 

SPOOL OFF