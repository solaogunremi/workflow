CREATE OR REPLACE   PACKAGE BODY pkwf_00_acl AS
  --
  /* Author : Aderemi Alabi, 02-FEB-2017
  **
  ** Purpose  : WB -  ACL Configuration
  **
  ** Modification History :
  **
  ** Copyright :  Neulogic Solutions Limited, 2017
  **
  */
  --
  -- 
  -- Packkage Variables
  --    
  --
  /* Private Routines */
  --  
  --
   /* Public Routines */
  --
  --  Configure
  PROCEDURE pr_configure(pi_principal IN VARCHAR2,
                         pi_schemas   IN VARCHAR2,
                         pi_host      IN VARCHAR2,
                         pi_port      IN VARCHAR2) IS
    --
    v_acl    VARCHAR2(100) := 'SymPlusWeb.xml';
    v_arr0   APEX_APPLICATION_GLOBAL.VC_ARR2;
    v_arr1   APEX_APPLICATION_GLOBAL.VC_ARR2;
    v_arr2   APEX_APPLICATION_GLOBAL.VC_ARR2;
    --
    CURSOR c_apx IS
    SELECT username 
    FROM   dba_users
    WHERE  username LIKE 'APEX_%';
    --
  BEGIN
    --
    BEGIN
      DBMS_NETWORK_ACL_ADMIN.DROP_ACL (v_acl);
    EXCEPTION
      WHEN OTHERS THEN
        NULL;
    END;
    --
    DBMS_NETWORK_ACL_ADMIN.CREATE_ACL (
    acl          => v_acl, 
    description  => 'Symplus Web Auto Configuratino for ACL',
    principal    => pi_principal,
    is_grant     => TRUE, 
    privilege    => 'connect'); 
  --
  FOR cr IN c_apx LOOP
    DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(
      acl       => v_acl, 
      principal => cr.username, 
      is_grant  => TRUE, 
      privilege => 'connect'); 
  END LOOP;
  --
  IF pi_schemas IS NOT NULL THEN
    FOR i IN 1..v_arr0.count LOOP
      DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE (
        acl       => v_acl,
        principal => v_arr0(i), 
        is_grant  => TRUE, 
        privilege => 'connect');
    END LOOP;
  END IF;
  --
  BEGIN
    v_arr1 := APEX_UTIL.STRING_TO_TABLE(pi_host);
    FOR i IN 1..v_arr1.count LOOP
      IF pi_port IS NULL THEN
        DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL (
          acl         => v_acl,
          host        => v_arr1(i));
      ELSE
        v_arr2 := APEX_UTIL.STRING_TO_TABLE(pi_port);
        FOR i IN 1..v_arr2.count LOOP
          DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL (
            acl         => v_acl,
            host        => v_arr1(i),
            lower_port  => v_arr2(i), 
            upper_port  => v_arr2(i));
        END LOOP;
      END IF;
   END LOOP;
  END;
  --
  END pr_configure;
  --  
END pkwf_00_acl;
/
