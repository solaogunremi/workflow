CREATE OR REPLACE FORCE VIEW wf_vd_00_ac_tp AS
  SELECT ID, dsc
    FROM wf_vd_00_00_dmv 
   WHERE dmd_dm = 'WF_ACT_TP';
/   
