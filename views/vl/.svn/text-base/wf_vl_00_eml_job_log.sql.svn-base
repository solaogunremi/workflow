CREATE OR REPLACE FORCE VIEW wf_vl_00_eml_job_log
AS 
  SELECT log_date,
         status, additional_info,
         TRIM(SUBSTR(additional_info, point_1 + 10, (point_2 - (point_1 + 1)))) additional_info1
  FROM  (SELECT log_date,
                status,
                (INSTR(additional_info, 'ORA', 1, 2)) point_1,
                (INSTR(additional_info, 'ORA', 1, 3))  point_2,
                additional_info
         FROM user_scheduler_job_run_details
         WHERE job_name = 'J_WF_10_EML_JOB')
  ORDER BY log_date DESC;
 
