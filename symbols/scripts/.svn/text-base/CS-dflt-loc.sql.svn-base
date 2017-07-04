DECLARE
  --
  v_id   VARCHAR2(10)  := '001';
  v_dsc  VARCHAR2(100) := 'Default Location';
  v_key  NUMBER        := pkcs_00_cdv.fn_cdd_k(pi_cd => 'CUS-FLX-K2');
  --
  CURSOR c_cs_dm_k IS
    SELECT row_key
    FROM   cs_00_00_pdm
    WHERE  pmr_dm = 'CS';
BEGIN
  --
  UPDATE  cs_00_00_pvl
  SET     chr_val = v_id
  WHERE   pmr_id = 'CS_WFLOC';
  IF SQL%NOTFOUND THEN
    OPEN  c_cs_dm_k;
    FETCH c_cs_dm_k INTO v_key;
    CLOSE c_cs_dm_k;
    INSERT INTO CS_00_00_PVL (row_key,pmr_dm_k,pmr_id,pmr_dsc,chg_yn,dsp_yn,
                              dsp_ord,tp_dm,bln_val,nbr_val,dt_val,chr_val) 
    VALUES (pkcs_00.fn_nxt_key,V_key,'CS_WFLOC','Default Workflow Location Code',
            '1','1',80,'C',null,null,null,v_id);
  END IF;
  --
  BEGIN
    INSERT INTO 
      cs_00_cdv(row_key, cdv_id, cd_dm_k, 
                cdv_dsc, dsp_ord, ius_yn, rmk_txt)
    VALUES (pkcs_00.fn_nxt_key, v_id, v_key, 
            v_dsc, 999, '1', NULL);
  EXCEPTION
    WHEN OTHERS THEN
      NULL;
  END;
END; 