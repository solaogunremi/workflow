CREATE OR REPLACE VIEW wf_vl_11_mb
AS
SELECT a.mb_id, a.mb_dsc, a.u_k, a.iu_yn,
       DECODE(a.iu_yn,'1','Yes','No') iu_yn_dsc,
       b.eml_adr, NVL(b.trc_yn,0) as rmt_usr_yn,
       DECODE(b.trc_yn,1,'Symbols User','Workflow Only') rmt_usr_dsc,
       b.fl_05 as is_adm_yn,
       DECODE(b.fl_05,'1','Yes','No') as is_adm_yn_dsc,
       pkwf_11_mb.fn_get_usr_role(a.u_k) as usr_roles
FROM   wf_10_mb a,
       t_99_10_ssu b
WHERE  UPPER(a.mb_id) = UPPER(b.lgn_id)  
ORDER BY a.mb_id;
/