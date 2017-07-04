-- Created by Aderemi Alabi
-- DB Wrap utility
-- Wraps Package Spec and body
--
DECLARE
  -- variables
  v_object VARCHAR2(200);
  v_type   VARCHAR2(200);
  --
  -- get packages
  CURSOR c_objs IS
    SELECT object_name, object_type
    FROM   user_objects
    WHERE  object_type LIKE 'PACKAGE%';
  --
  -- get package source
  CURSOR c_text IS
    SELECT text
    FROM   user_source
    WHERE  type LIKE 'PACKAGE%'
    AND    name = v_object
    AND    type = v_type;
  --
  v_source  dbms_sql.varchar2a;
  --  
BEGIN
  --
  FOR c1 IN c_objs LOOP
    --
    v_object := c1.object_name;
    v_type   := c1.object_type;
    --
    OPEN  c_text;
    FETCH c_text
    BULK COLLECT INTO v_source;
    CLOSE c_text;
    --
    IF v_source.COUNT > 0 THEN --lets wrap
      IF INSTR(v_source(1), 'wrapped') < 1 THEN
        BEGIN
          v_source(1) := 'CREATE OR REPLACE ' || v_source(1);
          dbms_ddl.create_wrapped(ddl => v_source,
                                  lb  => 1,
                                  ub  => v_source.COUNT);
        EXCEPTION
          WHEN OTHERS THEN
            dbms_output.put_line('Unable to wrap ' || v_object || ' due to thr following reason ' || SQLERRM);
        END;
      END IF;                          
    END IF;
    --
  END LOOP;
  --
EXCEPTION
  WHEN OTHERS THEN 
    RAISE;
END;    