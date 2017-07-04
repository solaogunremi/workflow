CREATE OR REPLACE FORCE   VIEW wf_vt_00_eml
AS 
SELECT r_k,
       smtp_hst,
       smtp_prt,
       smtp_auth_yn,
       frm_eml,
       auth_act,
       auth_pwd,
       max_rtry_no,
       tls_yn,
       wlt_pth,
       wlt_pwd,
       ehlo_yn
FROM   wf_00_00_eml
WHERE  r_k = 1;
/
