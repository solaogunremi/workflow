ALTER TABLE T_99_10_SSU DISABLE ALL TRIGGERS
/

ALTER TABLE T_99_10_PWU DISABLE ALL TRIGGERS
/

DECLARE
  v_agp_k  NUMBER;
  v_usr_k  NUMBER := 100;
BEGIN
  --
  UPDATE T_99_10_SSU SET 
    lgn_id = 'setup',
    r_s = 1,
    sta_dm = 'N',
    usr_dm = 'ADM'
  WHERE r_k = v_usr_k;
  IF SQL%NOTFOUND THEN
    INSERT INTO T_99_10_SSU 
    (R_K, R_S, I_TM, I_KY,
     A_TM, A_KY, STA_DM, STA_DT,
     LGN_ID, USR_DM, FIR_NM, LST_NM, SHT_NM,
     LGG_DM, EML_YN, SMS_YN, GDR_DM, EDT_YN, VRF_YN, APR_YN, CNG_PW_YN, EML_ADR) 
     VALUES 
     (v_usr_k,1,to_timestamp_tz('01-JAN-10 10.22.24.989000000 +01:00','DD-MON-RR HH24.MI.SS.FF TZR'),1,
     to_timestamp_tz('01-JAN-10 10.21.06.146000000 +01:00','DD-MON-RR HH24.MI.SS.FF TZR'),1,'N',to_date('01-JAN-10','DD-MON-RR'),
     'setup','ADM','SETUP','SETUP','SYSTEM SETUP',
     'EN',1,null,'M',1,1,1,1,'setup@localhost.com');
   END IF;
   --
  DELETE FROM T_99_10_PWU WHERE S_KY IN (49979700,49980393);                
  INSERT INTO T_99_10_PWU (R_K, I_TM, S_KY, PW_HSH) VALUES (1387,TO_TIMESTAMP('01-JAN-10 10.37.25 AM','DD-MON-RR HH.MI.SS AM'),49979700,HEXTORAW('F507CAC4B8CB7D2A9910571461A07FC9919E08B5'));                                                                                                                         
  INSERT INTO T_99_10_PWU (R_K, I_TM, S_KY, PW_HSH) VALUES (2050,TO_TIMESTAMP('01-JAN-10 10.28.12 PM','DD-MON-RR HH.MI.SS AM'),49980393,HEXTORAW('F1004F6AB4C1EA7C0E39EE318E7BF1076BC13B75')); 
  --
END;
/

COMMIT
/

ALTER TABLE T_99_10_SSU ENABLE ALL TRIGGERS
/

ALTER TABLE T_99_10_PWU ENABLE ALL TRIGGERS
/
