CREATE OR REPLACE VIEW v_99_10_usrs_all_ext 
AS
SELECT  *
FROM    v_99_10_usrs_all@wf_sy a
WHERE sta_dm IN ('N')
AND NOT EXISTS (SELECT 1 
                  FROM   t_99_10_ssu b
                  WHERE  a.usr_id = b.lgn_id);