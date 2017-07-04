ALTER TABLE t_99_00_dmm DISABLE ALL TRIGGERS
/

ALTER TABLE t_99_00_dmv DISABLE ALL TRIGGERS
/

TRUNCATE TABLE t_99_00_dmm REUSE STORAGE;
TRUNCATE TABLE t_99_00_dmv REUSE STORAGE;

-- Domain Master
--INSERT INTO t_99_00_dmm SELECT * FROM t_99_00_dmm@wf_sy;
INSERT INTO t_99_00_dmm SELECT row_key as r_k, 
                               dmd_dm  as dm_id, 
                               dmd_dsc as dm_dsc, 
                               dsp_ord 
                        FROM   cs_00_00_dmd@wf_sy;
INSERT INTO t_99_00_dmm SELECT row_key as r_k, 
                               cdd_dm  as dm_id, 
                               cdd_dsc as dm_dsc, 
                               dsp_ord 
                        FROM   cs_00_00_cdd@wf_sy
                        WHERE  cdd_dm <> 'CTC-CTR'; 
INSERT INTO t_99_00_dmm VALUES(50, 'CTC-CTR','Countries',50);                        
--
--Domain Values

--INSERT INTO t_99_00_dmv SELECT * FROM t_99_00_dmv@wf_sy;
INSERT INTO t_99_00_dmv SELECT s_99_00_rk.NEXTVAL as r_k, 
                               dmd_dm_k as r_p, 
                               dmv_id,
                               dmv_dsc, 
                               dsp_ord,
                               ius_yn 
                        FROM   cs_00_00_dmv@wf_sy;
INSERT INTO t_99_00_dmv SELECT s_99_00_rk.NEXTVAL  as r_k, 
                               cd_dm_k  as r_p, 
                               cdv_id,
                               cdv_dsc, 
                               dsp_ord,
                               ius_yn 
                        FROM   cs_00_cdv@wf_sy;  
INSERT INTO t_99_00_dmv SELECT s_99_00_rk.NEXTVAL  as r_k, 
                               50  as r_p,
                               ctr_id as cdv_id,
                               ctr_nm as cdv_dsc, 
                               dsp_ord,
                               ius_yn
                        FROM   t_99_00_ctr@wf_sy;
--

ALTER TABLE t_99_00_dmm ENABLE ALL TRIGGERS
/

ALTER TABLE t_99_00_dmv ENABLE ALL TRIGGERS
/

COMMIT
/


