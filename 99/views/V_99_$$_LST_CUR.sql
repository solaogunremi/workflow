CREATE OR REPLACE FORCE VIEW V_99_$$_LST_CUR  AS 
SELECT id       cur_id,
       dsc      cur_dsc,
       lcc_yn   lcl_yn,
       ius_yn   ius_yn,
       unt_dsc,
       sunt_dsc
FROM TABLE(pk99_cur.fn_lst)
/