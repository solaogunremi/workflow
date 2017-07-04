DECLARE
  v_owner   VARCHAR2(30) := USER;
BEGIN 
  FOR cur IN (SELECT OBJECT_NAME, OBJECT_TYPE
              FROM   user_objects 
              WHERE  status = 'INVALID'
              AND    object_type IN ('PACKAGE','PACKAGE BODY','VIEW')
              ORDER BY object_type) LOOP 
    BEGIN
      if cur.OBJECT_TYPE = 'PACKAGE BODY' then 
        EXECUTE IMMEDIATE 'alter package "'  || cur.OBJECT_NAME || '" compile body'; 
      else 
        EXECUTE IMMEDIATE 'alter ' || cur.OBJECT_TYPE || ' "' || cur.OBJECT_NAME || '" compile'; 
      end if; 
    EXCEPTION
      WHEN OTHERS THEN NULL; 
    END;
  END LOOP; 
END;
/

