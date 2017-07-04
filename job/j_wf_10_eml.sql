   --
  /* Author : Aderemi Alabi, 13-OCT-2014
  **
  ** Purpose  : WB -  Order processing Job
  **
  ** Modification History :
  **
  ** Copyright :  Neulogic Solutions Limited, 2014
  **
  */
  --
  -- Datapump Job Scan Frequency 
  BEGIN
    SYS.DBMS_SCHEDULER.CREATE_SCHEDULE(
        schedule_name    => 'J_WF_10_EML_SCH',
        repeat_interval  => 'FREQ=MINUTELY;INTERVAL=5',
        end_date         => NULL,
        comments         => 'Symbols Email Job Scan Frequency');
  END;
  /		
  --
  -- Datapump Job Scan Program Call		
  BEGIN
    SYS.DBMS_SCHEDULER.CREATE_PROGRAM(
        program_name    => 'J_WF_10_EML_PGM',  
        program_type    => 'STORED_PROCEDURE',  
        program_action  => 'pkwf_10_eml.pr_send',  
        enabled         => true,  
        comments        => 'Symbols Email Program Call'); 
  END;
  /      
  --
  -- Datapump Scan Job 
  BEGIN
    -- create job
    SYS.DBMS_SCHEDULER.CREATE_JOB(
       job_name        => 'J_WF_10_EML_JOB',
       schedule_name   => 'J_WF_10_EML_SCH',
       program_name    => 'J_WF_10_EML_PGM',
       comments        => 'Symbols Email  Job');
    --   
    -- set restartable on   
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE( 
       name      => 'J_WF_10_EML_JOB',
       attribute => 'RESTARTABLE',
       value     => TRUE);
    --
    -- set logging full
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE( 
       name      => 'J_WF_10_EML_JOB',
       attribute => 'LOGGING_LEVEL',
       value     => SYS.DBMS_SCHEDULER.LOGGING_FULL);
    --
    -- set maximum failures 10
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL( 
       name      => 'J_WF_10_EML_JOB',
       attribute => 'MAX_FAILURES');
   --
   -- set unlimited runs    
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL( 
       name      => 'J_WF_10_EML_JOB',
       attribute => 'MAX_RUNS');
    --
    -- set run in background
    BEGIN
      SYS.DBMS_SCHEDULER.SET_ATTRIBUTE( 
        name      => 'J_WF_10_EML_JOB',
        attribute => 'STOP_ON_WINDOW_CLOSE',
        value     => FALSE);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    --
    -- set priority to highest
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE( 
      name      => 'J_WF_10_EML_JOB',
      attribute => 'JOB_PRIORITY',
      value     => 1);
    --
    -- no success limit
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE_NULL( 
      name      => 'J_WF_10_EML_JOB',
      attribute => 'SCHEDULE_LIMIT');
    --
    -- set auto-drop off
    SYS.DBMS_SCHEDULER.SET_ATTRIBUTE( 
      name      => 'J_WF_10_EML_JOB',
      attribute => 'AUTO_DROP',
      value     => FALSE);
    --
  END;
  /
	--
  -- Enable immediately
  BEGIN
    SYS.DBMS_SCHEDULER.enable(name => 'J_WF_10_EML_JOB');
  END;
  /