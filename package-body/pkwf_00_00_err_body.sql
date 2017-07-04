CREATE OR REPLACE PACKAGE BODY pkwf_00_00_err AS
  --
  /* Created By       : Femi Akintoye
  ** Date Created     : 07-MAR-2016
  **
  ** PURPOSE: Error Handling Routines
  **
  ** MODIFICATION HISTORY:
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **  
  ** Neulogic Solutions Ltd, 2016
  **
  */
  --
  --package variables
  --pv_err_rfr st_00_00_erl.err_rfr%TYPE;
  pv_err_cd  NUMBER;
  pv_item    VARCHAR2(255);
  --
  --
  -----------------------------------------------------------------------------------
  --  Internal Routines
  -----------------------------------------------------------------------------------
  -- Generate error reference
  FUNCTION fn_err_rfr RETURN VARCHAR2
  IS
  BEGIN
    --
    --pv_err_rfr := NULL;
    DBMS_RANDOM.SEED(TO_CHAR(SYSDATE,'DDMMYYYYHH24MISS'));
    --
    RETURN DBMS_RANDOM.STRING('A',12);
    --
  END fn_err_rfr;
  --
  --
  --  Get Error Message
  FUNCTION fn_get_err(pi_err_id IN VARCHAR2) RETURN VARCHAR2
  IS
    --
    v_mss  wf_00_00_erd.err_msg%TYPE;
    --
    CURSOR c_err IS
      SELECT err_msg
        FROM wf_00_00_erd
       WHERE err_id = pi_err_id;
    --
  BEGIN
    --
    v_mss := NULL;
    --
    OPEN  c_err;
    FETCH c_err INTO v_mss;
    CLOSE c_err;
    --
    RETURN NVL(v_mss,'Undefined WF error condition [' || pi_err_id || '] detected ');
    --
  END fn_get_err;
  --
  -----------------------------------------------------------------------------------
  --  External Routines
  -----------------------------------------------------------------------------------
  /*
   *  Determine if input is null. Returns TRUE is null condition is determined
  */
  FUNCTION fn_apex_error(p_error apex_error.t_error) RETURN apex_error.t_error_result
  IS
    --
  BEGIN
    RETURN NULL;--'1'; --pk99$$err.fn_apex_error (p_error);
  END fn_apex_error;
  --
  -- Error Call Interface 1
  PROCEDURE pr_raise(pi_msg IN VARCHAR2) IS
    v_loc CONSTANT VARCHAR2(100) := apex_error.c_inline_in_notification;
  BEGIN
    logger.log(pi_msg, 'WFERR');
    raise_application_error(-20005, '{WF} '||pi_msg);
  END pr_raise;
  --
  -- Error Call Interface 2
  PROCEDURE pr_raise(pi_id IN VARCHAR2,
                     pi_p1 IN VARCHAR2 DEFAULT NULL,
                     pi_p2 IN VARCHAR2 DEFAULT NULL,
                     pi_p3 IN VARCHAR2 DEFAULT NULL,
                     pi_p4 IN VARCHAR2 DEFAULT NULL,
                     pi_p5 IN VARCHAR2 DEFAULT NULL,
                     pi_p6 IN VARCHAR2 DEFAULT NULL,
                     pi_p7 IN VARCHAR2 DEFAULT NULL,
                     pi_p8 IN VARCHAR2 DEFAULT NULL,
                     pi_p9 IN VARCHAR2 DEFAULT NULL)
  IS
    --
    v_loc CONSTANT VARCHAR2(100) := apex_error.c_inline_in_notification;
    v_msg  wf_00_00_erd.err_msg%TYPE;    
    --
  BEGIN
    --
    v_msg := fn_get_err(pi_err_id => pi_id);
    --
    v_msg := REPLACE (v_msg, '%p1%', pi_p1);
    v_msg := REPLACE (v_msg, '%p2%', pi_p2);
    v_msg := REPLACE (v_msg, '%p3%', pi_p3);
    v_msg := REPLACE (v_msg, '%p4%', pi_p4);
    v_msg := REPLACE (v_msg, '%p5%', pi_p5);
    v_msg := REPLACE (v_msg, '%p6%', pi_p6);
    v_msg := REPLACE (v_msg, '%p7%', pi_p7);
    v_msg := REPLACE (v_msg, '%p8%', pi_p8);
    v_msg := REPLACE (v_msg, '%p9%', pi_p9);
    --
    v_msg := '{'||pi_id||'} '||LTRIM(v_msg);
    --
    logger.log(v_msg, 'WFERR');
    raise_application_error(-20025, v_msg);
    --
    --apex_error.add_error(p_message => v_msg, 
      --                   p_display_location => v_loc);
    --
  END pr_raise;
  --
  -- Error Call Interface 3
--  PROCEDURE pr_raise(pi_id IN VARCHAR2,
--                     pi_ci IN VARCHAR2,
--                     pi_p1 IN VARCHAR2 DEFAULT NULL,
--                     pi_p2 IN VARCHAR2 DEFAULT NULL,
--                     pi_p3 IN VARCHAR2 DEFAULT NULL,
--                     pi_p4 IN VARCHAR2 DEFAULT NULL,
--                     pi_p5 IN VARCHAR2 DEFAULT NULL,
--                     pi_p6 IN VARCHAR2 DEFAULT NULL,
--                     pi_p7 IN VARCHAR2 DEFAULT NULL,
--                     pi_p8 IN VARCHAR2 DEFAULT NULL,
--                     pi_p9 IN VARCHAR2 DEFAULT NULL)
--  IS
--    --
--    v_loc1  CONSTANT VARCHAR2(100) := apex_error.c_inline_in_notification;
--    v_loc2  CONSTANT VARCHAR2(100) := apex_error.c_inline_with_field_and_notif;
--    v_msg  st_00_00_erd.err_msg%TYPE;  
--    v_page_item VARCHAR2(200); 
--    v_item VARCHAR2(200); 
--    v_page VARCHAR2(100); 
--    v_app  VARCHAR2(100); 
--    --
--  BEGIN
--    --
--   v_msg := fn_get_err(pi_err_id => pi_id);
--    --
--    v_msg := REPLACE (v_msg, '%p1%', pi_p1);
--    v_msg := REPLACE (v_msg, '%p2%', pi_p2);
--    v_msg := REPLACE (v_msg, '%p3%', pi_p3);
--    v_msg := REPLACE (v_msg, '%p4%', pi_p4);
--    v_msg := REPLACE (v_msg, '%p5%', pi_p5);
--    v_msg := REPLACE (v_msg, '%p6%', pi_p6);
--    v_msg := REPLACE (v_msg, '%p7%', pi_p7);
--    v_msg := REPLACE (v_msg, '%p8%', pi_p8);
--    v_msg := REPLACE (v_msg, '%p9%', pi_p9);
--    --
--    v_msg := '{'||pi_id||'} '||LTRIM(v_msg);
--    --
--    IF pi_ci IS NOT NULL THEN
--      v_app  := pkst_00.fn_crnt_apx_ap;
--      v_page := pkst_00.fn_crnt_apx_pg;
--      v_item := 'P' || '_' || v_page || '_' || pi_ci;
--      BEGIN
--        SELECT item_name
--          INTO v_page_item
--          FROM apex_application_page_items
--         WHERE application_id = v_app
--           AND page_id = v_page
--           AND item_name = v_item;
--        IF NVL(v_page_item,'0') <> '0' THEN
--          v_msg := '#LABEL# ' || v_msg;
--          apex_error.add_error(p_message => v_msg, 
--                               p_display_location => v_loc2,
--                               p_page_item_name => v_page_item);
--        ELSE
--          apex_error.add_error(p_message => v_msg, 
--                               p_display_location => v_loc1);
--        END IF;
--      EXCEPTION
--        WHEN OTHERS THEN
--          apex_error.add_error(p_message => v_msg, 
--                               p_display_location => v_loc1);
--      END;
--    ELSE
--      /* apex_error.add_error(p_message => v_msg, 
--                                 p_display_location => v_loc1); */
--      NULL;                                 
--    END IF;                                 
--    --
--    logger.log(v_msg, 'WFERR');
--    raise_application_error(-20055, v_msg);
--    --
--  END pr_raise;
  --
END pkwf_00_00_err;
/
