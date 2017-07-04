CREATE OR REPLACE FORCE VIEW wf_vl_00_eml_job
AS 
  SELECT job_name,
         enabled,
         state,
         run_count,
         failure_count,
         (run_count - failure_count) success_count,
         last_run_duration,
         next_run_date,
         comments
  FROM   user_scheduler_jobs
  WHERE  job_name = 'J_WF_10_EML_JOB';
 
