create or replace PACKAGE BODY pkwf_20_gen AS
  --
  /* Created By       : Femi Akintoye 
  ** Date Created     : 11-MAR-2016
  **
  ** PURPOSE: WF Routines for Preship Objects
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
  ** Copyright:  Neulogic Solutions Ltd, 2016
  **
  */
  --
  /* Private Routines */
  FUNCTION fn_usr_k RETURN NUMBER IS
  BEGIN
    RETURN pkwf_00.fn_usr_ky; --1;
  END fn_usr_k;
  --
  FUNCTION fn_mb_u_k RETURN NUMBER IS
    --
    v_k NUMBER;
    --
    CURSOR c_usr IS
      SELECT u_k
      FROM   wf_10_mb
      WHERE  UPPER(mb_id) = UPPER(v('APP_USER'));
    --
  BEGIN
    --
    OPEN  c_usr;
    FETCH c_usr INTO v_k;
    CLOSE c_usr;
    --
    RETURN v_k;
    --
  END fn_mb_u_k;
  --
  -- Current Document Key
  FUNCTION fn_dc_k RETURN NUMBER IS
  BEGIN
    RETURN apex_util.get_session_state('AI_DC_K');
  END fn_dc_k;
  --
  -- Execute post task process
  FUNCTION fn_exec_prc(pi_prc_dsc  IN VARCHAR2,
                       pi_use_par  IN BOOLEAN,
                       pi_dc_k     IN NUMBER,
                       pi_dc_tk_k  IN NUMBER,
                       pi_p1       IN VARCHAR2 DEFAULT NULL,
                       pi_p2       IN VARCHAR2 DEFAULT NULL,
                       pi_p3       IN VARCHAR2 DEFAULT NULL,
                       pi_p4       IN VARCHAR2 DEFAULT NULL,
                       pi_p5       IN VARCHAR2 DEFAULT NULL) RETURN NUMBER IS
    --
    v_exec_txt VARCHAR2(1000);
    v_cur_id   NUMBER;
    v_dummy    NUMBER;
    --
  BEGIN
    BEGIN
      --
      IF pi_use_par THEN
        v_exec_txt := 'BEGIN '||
                       pi_prc_dsc||' (pi_dc_k => '''||pi_dc_k||''', '||
                                   '  pi_dc_tk_k => '''||pi_dc_tk_k||''', '||
                                   '  pi_p1 => '''||pi_p1||''', '||
                                   '  pi_p2 => '''||pi_p2||''', '||
                                   '  pi_p3 => '''||pi_p3||''', '||
                                   '  pi_p4 => '''||pi_p4||''', '||
                                   '  pi_p5 => '''||pi_p5||''' ); '||
                      'END;';
      ELSE
        v_exec_txt := 'BEGIN '||
                       pi_prc_dsc||' (pi_dc_k => '''||pi_dc_k||''', '||
                                   '  pi_dc_tk_k => '''||pi_dc_tk_k||''' ); '||
                      'END;';
      END IF;
logger.log('CALLING ROUTINE '||v_exec_txt,'exec');        
      --
      -- Use Dynamic SQL to execute procedure
      v_cur_id := DBMS_SQL.OPEN_CURSOR;
      DBMS_SQL.PARSE (v_cur_id, v_exec_txt, DBMS_SQL.NATIVE);
      v_dummy := DBMS_SQL.EXECUTE(v_cur_id);
      DBMS_SQL.CLOSE_CURSOR(v_cur_id);
      --
    EXCEPTION
      WHEN OTHERS THEN
      BEGIN
        IF DBMS_SQL.IS_OPEN (v_cur_id) THEN
          DBMS_SQL.CLOSE_CURSOR (v_cur_id);
        END IF;
        RAISE; -- Reraise the exeception that caused failure
      END;
    END;
    --
    RETURN 0;
    --
  END fn_exec_prc;
  --
  -- Execute post action
  FUNCTION fn_post_act(pi_act  IN wf_20_dc_ac%ROWTYPE) RETURN NUMBER IS
    v_r     wf_20_dc_ac%ROWTYPE := pi_act;
  BEGIN
    --
    v_r.row_key  := pkwf_00_00.fn_rk;
    v_r.bus_dt   := TRUNC(SYSDATE);
    v_r.sys_dtt  := SYSDATE;
    v_r.ac_sq_no := pkwf_00_00.fn_act;
    v_r.ac_dtt   := SYSDATE;
    v_r.mb_k     := fn_mb_u_k;
    -- 
    INSERT
      INTO wf_20_dc_ac
    VALUES v_r;
    --
    RETURN 0;
    --
  END fn_post_act;
  --
  FUNCTION fn_get_mb (pi_mb_k IN NUMBER) RETURN wf_10_mb%ROWTYPE IS
    r_mb   wf_10_mb%ROWTYPE;
  BEGIN
    --
    BEGIN
      SELECT *
        INTO r_mb
        FROM wf_10_mb
       WHERE u_k = pi_mb_k;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Unable to locate user information. Please contact administrator ['||pi_mb_k||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Configuration for this user is duplicated. Please contact administrator ['||pi_mb_k||']');
    END;
    --
    RETURN r_mb;
    --
  END fn_get_mb;
  --
  FUNCTION fn_get_dc_id(pi_dc_k IN NUMBER) RETURN VARCHAR2 IS
    --
    v_dc_id VARCHAR2(30);
    --
    CURSOR c_id Is
      SELECT dc_id
      FROM   wf_20_dc
      WHERE  row_key = pi_dc_k;
    --
  BEGIN
    --
    OPEN  c_id;
    FETCH c_id INTO v_dc_id;
    CLOSE c_id;
    --
    RETURN v_dc_id;
    --
  END fn_get_dc_id;
  --
  FUNCTION fn_get_dc_dsc(pi_dc_k IN NUMBER) RETURN VARCHAR2 IS
    --
    v_dc_dsc VARCHAR2(250);
    --
    CURSOR c_dsc Is
      SELECT dc_dsc
      FROM   wf_20_dc
      WHERE  row_key = pi_dc_k;
    --
  BEGIN
    --
    OPEN  c_dsc;
    FETCH c_dsc INTO v_dc_dsc;
    CLOSE c_dsc;
    --
    RETURN v_dc_dsc;
    --
  END fn_get_dc_dsc;
  --   
  --
  FUNCTION fn_get_pdt_dsc(pi_dc_k IN NUMBER) RETURN VARCHAR2 IS
    --
    v_rec  wf_30_dc%ROWTYPE;
    --
    CURSOR c_rec IS
      SELECT a.*
      FROM   wf_30_dc a,
             wf_20_dc b
      WHERE  a.dc_id = b.dc_id
      AND    b.row_key = pi_dc_k;
  BEGIN
    --
    OPEN  c_rec;
    FETCH c_rec INTO v_rec;
    CLOSE c_rec;
    --
    IF v_rec.dc_tp_k = 400 THEN
      RETURN v_rec.sdc04;
    ELSE
      RETURN v_rec.sdc13;
    END IF;
  END fn_get_pdt_dsc;
  /* Public Routines */
  --
  -- General processing routine template. Does nothing
  PROCEDURE pr_gen_prc(pi_dc_k    IN NUMBER,
                       pi_dc_tk_k IN NUMBER,
                       pi_p1      IN VARCHAR2 DEFAULT NULL,
                       pi_p2      IN VARCHAR2 DEFAULT NULL,
                       pi_p3      IN VARCHAR2 DEFAULT NULL,
                       pi_p4      IN VARCHAR2 DEFAULT NULL,
                       pi_p5      IN VARCHAR2 DEFAULT NULL) IS
  BEGIN 
    NULL;
  END pr_gen_prc;
  --
  --
  FUNCTION fn_get_dc (pi_dc_k IN NUMBER) RETURN wf_20_dc%ROWTYPE IS
    r_dc   wf_20_dc%ROWTYPE;
  BEGIN
    --
    BEGIN
      SELECT *
        INTO r_dc
        FROM wf_20_dc
       WHERE row_key = pi_dc_k;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Unable to locate process application information. Please contact administrator ['||pi_dc_k||']');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Configuration for this process application is duplicated. Please contact administrator ['||pi_dc_k||']');
    END;
    --
    RETURN r_dc;
    --
  END fn_get_dc;
  --
  --
  FUNCTION fn_u_ot_tk RETURN OT$_WF_DC_TK_TB PIPELINED IS
    --
 --   t_tk     OT$_WF_DC_TK_TB := OT$_WF_DC_TK_TB();
    v_tk     OT$_WF_DC_TK := OT$_WF_DC_TK();       
    --
    v_u_k    wf_00_00_dtd.n38%TYPE := fn_mb_u_k;
    --
    CURSOR cur_rec IS
    SELECT tp.row_key tp_k, tp.tp_id, tp.tp_dsc, tp.rp_id,
           dc.row_key dc_k, dc.dc_id, dc.dc_dsc, dc.st_dtt, dc.cr_sq_no,
           dk.row_key dc_tk_k,
           tk.tk_id cr_seq_tk_id, tk.tk_dsc cr_seq_tk_dsc
      FROM wf_20_dc dc, wf_20_dc_tk dk, wf_10_tp tp, wf_10_tp_tk tk,
           wf_10_rl_mb rm, wf_10_mb mb
     WHERE dc.tp_k = tp.row_key
       AND dc.tp_k = tk.tp_k
       AND dc.cr_sq_no = tk.seq_no
       AND dk.dc_k = dc.row_key
       AND dk.tk_k = tk.row_key
       AND dk.mb_k IS NULL
       AND tk.ac_rl_k = rm.rl_k
       AND rm.mb_k = mb.u_k
       AND mb.u_k = v_u_k
    ORDER BY dc.st_dtt ASC;
    --
  BEGIN
    --
    --t_tk.DELETE;
    --
    FOR c1 IN cur_rec LOOP
      --
      v_tk.tp_k          := c1.tp_k;
      v_tk.tp_id         := c1.tp_id;   
      v_tk.tp_dsc        := c1.tp_dsc;
      v_tk.rp_id         := c1.rp_id;
      v_tk.dc_k          := c1.dc_k;  
      v_tk.dc_id	       := c1.dc_id;   
      v_tk.dc_dsc        := c1.dc_dsc; 
      v_tk.st_dtt        := c1.st_dtt;   
      v_tk.dc_tk_k       := c1.dc_tk_k;    
      v_tk.cr_seq_no     := c1.cr_sq_no;     
      v_tk.cr_seq_tk_id  := c1.cr_seq_tk_id;
      v_tk.cr_seq_tk_dsc := c1.cr_seq_tk_dsc;
      --
      BEGIN
        SELECT MAX(ac_dtt)
          INTO v_tk.ls_ac_dtt
          FROM wf_20_dc_ac
         WHERE dc_tk_k = c1.dc_tk_k;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_tk.ls_ac_dtt     := NULL;
      END;
      --
      PIPE ROW(v_tk);
      --
    END LOOP;
    --
    RETURN;
    --
  END fn_u_ot_tk;
  --
  --
  FUNCTION fn_m_tk RETURN OT$_WF_DC_TK_TB PIPELINED IS
    --
    t_tk     OT$_WF_DC_TK_TB := OT$_WF_DC_TK_TB();
    v_tk     OT$_WF_DC_TK := OT$_WF_DC_TK();       
    --
    v_u_k    wf_00_00_dtd.n38%TYPE := fn_mb_u_k;
    v_y      wf_00_00_dtd.n38%TYPE;
    --
    CURSOR cur_rec IS
    SELECT tp.row_key tp_k, tp.tp_id, tp.tp_dsc, tp.rp_id,
           dc.row_key dc_k, dc.dc_id, dc.dc_dsc, dc.st_dtt, dc.cr_sq_no,
           dk.row_key dc_tk_k,
           tk.row_key cr_seq_tk_k, tk.tk_id cr_seq_tk_id, tk.tk_dsc cr_seq_tk_dsc
      FROM wf_20_dc dc, wf_20_dc_tk dk, wf_10_tp tp, wf_10_tp_tk tk,
           wf_10_rl_mb rm, wf_10_mb mb
     WHERE dc.tp_k = tp.row_key
       AND dc.tp_k = tk.tp_k
       AND dc.cr_sq_no = tk.seq_no
       AND dk.dc_k = dc.row_key
       AND dk.tk_k = tk.row_key
       AND dk.mb_k = mb.u_k
       AND dk.ed_dtt IS NULL
       AND tk.ac_rl_k = rm.rl_k
       AND rm.mb_k = mb.u_k
       AND mb.u_k = v_u_k
       AND dc.dc_st_dm <> 'R'
    ORDER BY dc.st_dtt ASC;
    --
  BEGIN
    --
    t_tk.DELETE;
    --
    FOR c1 IN cur_rec LOOP
      --
      v_tk.tp_k          := c1.tp_k;
      v_tk.tp_id         := c1.tp_id;   
      v_tk.tp_dsc        := c1.tp_dsc;
      v_tk.rp_id         := c1.rp_id;
      v_tk.dc_k          := c1.dc_k;  
      v_tk.dc_id	       := c1.dc_id;   
      v_tk.dc_dsc        := c1.dc_dsc; 
      v_tk.st_dtt        := c1.st_dtt;   
      v_tk.dc_tk_k       := c1.dc_tk_k;    
      v_tk.cr_seq_no     := c1.cr_sq_no;  
      v_tk.cr_seq_tk_k   := c1.cr_seq_tk_k;   
      v_tk.cr_seq_tk_id  := c1.cr_seq_tk_id;
      v_tk.cr_seq_tk_dsc := c1.cr_seq_tk_dsc;
      --
      BEGIN
        SELECT MAX(ac_dtt)
          INTO v_tk.ls_ac_dtt
          FROM wf_20_dc_ac
         WHERE dc_tk_k = c1.dc_tk_k;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_tk.ls_ac_dtt     := NULL;
      END;
      --
      BEGIN
        SELECT COUNT(tp_k)
        INTO   v_y
        FROM   wf_10_tp_tk
        WHERE  tp_k = c1.tp_k;
      END;  
      v_tk.tk_stp := c1.cr_sq_no||' of '||TO_CHAR(v_y);
      --
      PIPE ROW(v_tk);
      --
    END LOOP;
    --
    RETURN;
    --
  END fn_m_tk;
  --
  -- Coporate Documents
  --
  FUNCTION fn_cpr_doc RETURN OT$_WF_DC_CPR_DOC_TB PIPELINED IS
    --
    t_tk     OT$_WF_DC_CPR_DOC_TB := OT$_WF_DC_CPR_DOC_TB();
    v_tk     OT$_WF_DC_CPR_DOC    := OT$_WF_DC_CPR_DOC();       
    --
    v_dc_k    wf_00_00_dtd.n38%TYPE := fn_dc_k;
    --
    CURSOR cur_rec IS
    SELECT dc.row_key dc_k, dc.dc_id, 
           dd.id doc_id, dd.dsc doc_dsc,
           im.im_blb doc_blb
      FROM wf_30_dc dc, wf_vd_cpr_doc dd, 
           wf_30_dc_im im
     WHERE dc.row_key = im.dc_k
       AND im.im_tp_dm = dd.id
    ORDER BY dd.dsc ASC;
    --
  BEGIN
    --
    t_tk.DELETE;
    --
    FOR c1 IN cur_rec LOOP
      --
      v_tk.dc_k          := c1.dc_k;
      v_tk.dc_id         := c1.dc_id;   
      v_tk.doc_id        := c1.doc_id;
      v_tk.doc_dsc       := c1.doc_dsc;
      v_tk.doc_blb       := c1.doc_blb; 
      --
    END LOOP;
    --
    RETURN;
    --
  END fn_cpr_doc;
  --
  -- Document Task Status
  FUNCTION fn_dc_tk_st(pi_dc_k IN NUMBER) RETURN OT$_WF_DC_ST_TB PIPELINED IS
    --
    t_tk     OT$_WF_DC_ST_TB := OT$_WF_DC_ST_TB();
    v_tk     OT$_WF_DC_ST := OT$_WF_DC_ST();       
    --
    v_u_k    wf_00_00_dtd.n38%TYPE := fn_mb_u_k;
    --
    CURSOR cur_rec IS
    SELECT dk.row_key dc_tk_k, dk.dc_k, dk.tk_k, tk.tk_id, tk.tk_dsc, tk.seq_no, dk.st_dtt, dk.ed_dtt,
           mb.mb_id, mb.mb_dsc,
           CASE WHEN (ed_dtt IS NOT NULL) THEN 'done'
                WHEN (dk.mb_k =  v_u_k) AND (ed_dtt IS NULL) THEN 'sf_prog'
                WHEN (dk.mb_k <> v_u_k) AND (ed_dtt IS NULL) THEN 'ot_prog'
                WHEN (dk.mb_k IS NULL) THEN 'pending'
           ELSE 'unknown'
           END tk_st_id,
           CASE WHEN (ed_dtt IS NOT NULL) THEN 'Completed'
                WHEN (dk.mb_k =  v_u_k) AND (ed_dtt IS NULL) THEN 'In Progress (Myself)'
                WHEN (dk.mb_k <> v_u_k) AND (ed_dtt IS NULL) THEN 'In Progress (Others)'
                WHEN (dk.mb_k IS NULL) THEN 'Outstanding'
           ELSE 'Unknown'
           END tk_st_dsc
      FROM wf_20_dc_tk dk, wf_10_tp_tk tk, wf_10_mb mb
     WHERE dk.tk_k = tk.row_key
       AND dk.mb_k = mb.u_k (+)
       AND dk.dc_k = pi_dc_k
     ORDER BY tk.seq_no ASC;
    --
  BEGIN
    --
    t_tk.DELETE;
    --
    FOR c1 IN cur_rec LOOP
      --
      v_tk.dc_k       := c1.dc_k;
  --    v_tk.dc_id	    := c1.dc_id;
  --    v_tk.dc_dsc     := c1.dc_dsc;   
      v_tk.tk_k       := c1.tk_k;
      v_tk.tk_id      := c1.tk_id;      
      v_tk.tk_dsc     := c1.tk_dsc;
      v_tk.seq_no     := c1.seq_no;
      v_tk.st_dtt     := c1.st_dtt;
      v_tk.ed_dtt     := c1.ed_dtt;
      v_tk.mb_id      := c1.mb_id;
      v_tk.mb_dsc     := c1.mb_dsc;
      v_tk.tk_st_id   := c1.tk_st_id;
      v_tk.tk_st_dsc  := c1.tk_st_dsc;
      --
      BEGIN
        SELECT MAX(ac_dtt)
          INTO v_tk.ls_ac_dtt
          FROM wf_20_dc_ac
         WHERE dc_tk_k = c1.dc_tk_k;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          v_tk.ls_ac_dtt     := NULL;
      END;
      --
      PIPE ROW(v_tk);
      --
    END LOOP;
    --
    RETURN;
    --
  END fn_dc_tk_st;
  --
  -- Document Actions
  FUNCTION fn_dc_ac(pi_dc_k IN NUMBER, pi_dc_tk_k IN NUMBER DEFAULT NULL) RETURN OT$_WF_DC_AC_TB PIPELINED IS
    --
    t_tk     OT$_WF_DC_AC_TB := OT$_WF_DC_AC_TB();
    v_tk     OT$_WF_DC_AC := OT$_WF_DC_AC();       
    --
    v_u_k    wf_00_00_dtd.n38%TYPE := fn_usr_k;
    --
    CURSOR cur_rec IS
    SELECT dc.row_key dc_k, dc.dc_id, dc.dc_dsc,
           tk.row_key tk_k, tk.tk_id, tk.tk_dsc,
           ac.row_key ac_k, ac.dc_tk_k, ac.mb_k, 
           UPPER(mb.mb_id) mb_id, INITCAP(mb.mb_dsc) mb_dsc,
           ac.ac_sq_no, ac.ac_dtt, ac.ac_rmk, ac.ac_dm, dm.dsc ac_dm_dsc,
           ac.ac_p1, ac.ac_p2, ac.ac_p3, ac.ac_p4, ac.ac_p5,
           tk.p1_dsc, tk.p2_dsc, tk.p3_dsc, tk.p4_dsc, tk.p5_dsc,
           tk.p1_tp_dm, tk.p2_tp_dm, tk.p3_tp_dm, tk.p4_tp_dm, tk.p5_tp_dm
      FROM wf_20_dc dc, wf_20_dc_tk dk, wf_20_dc_ac ac, wf_10_tp_tk tk,
           wf_10_mb mb, wf_vd_00_ac_tp dm
     WHERE dc.row_key = pi_dc_k
       AND dk.row_key = NVL(pi_dc_tk_k, dk.row_key)
       AND dk.dc_k = dc.row_key
       AND ac.dc_tk_k = dk.row_key
       AND dk.tk_k = tk.row_key
       AND ac.mb_k = mb.u_k (+)
       AND ac.ac_dm = dm.ID (+)
     ORDER BY ac.ac_sq_no DESC;
    --
  BEGIN
    --
    t_tk.DELETE;
    --
    FOR c1 IN cur_rec LOOP
      --
      v_tk.dc_k      := c1.dc_k;
      v_tk.dc_id     := c1.dc_id;
      v_tk.dc_dsc    := c1.dc_dsc;
      v_tk.dc_tk_k   := c1.dc_tk_k;
      v_tk.tk_k      := c1.tk_k;
      v_tk.tk_id     := c1.tk_id;
      v_tk.tk_dsc    := c1.tk_dsc;
      v_tk.ac_k      := c1.ac_k;
      v_tk.ac_sq_no  := c1.ac_sq_no;
      v_tk.ac_dtt    := c1.ac_dtt;
      v_tk.ac_rmk    := c1.ac_rmk;
      v_tk.mb_k      := c1.mb_k;
      v_tk.mb_id     := c1.mb_id;
      v_tk.mb_dsc    := c1.mb_dsc;
      v_tk.ac_dm     := c1.ac_dm;
      v_tk.ac_dm_dsc := c1.ac_dm_dsc;
      v_tk.ac_p1_dsc := c1.p1_dsc;
      v_tk.ac_p1_tp  := c1.p1_tp_dm;
      v_tk.ac_p1     := c1.ac_p1;
      v_tk.ac_p2_dsc := c1.p2_dsc;
      v_tk.ac_p2_tp  := c1.p2_tp_dm;
      v_tk.ac_p2     := c1.ac_p2;
      v_tk.ac_p3_dsc := c1.p3_dsc;
      v_tk.ac_p3_tp  := c1.p3_tp_dm;
      v_tk.ac_p3     := c1.ac_p3;
      v_tk.ac_p4_dsc := c1.p4_dsc;
      v_tk.ac_p4_tp  := c1.p4_tp_dm;
      v_tk.ac_p4     := c1.ac_p4;
      v_tk.ac_p5_dsc := c1.p5_dsc;
      v_tk.ac_p5_tp  := c1.p5_tp_dm;
      v_tk.ac_p5     := c1.ac_p5;
      --
      PIPE ROW(v_tk);
      --
    END LOOP;
    --
    RETURN;
    --
  END fn_dc_ac;
  --
  -- Accept Task
  PROCEDURE pr_acc_tk(pi_dc_tk_k  IN NUMBER) IS
    --
    v_r      wf_20_dc_ac%ROWTYPE;
    r_mb     wf_10_mb%ROWTYPE;
    v_u_k    wf_00_00_dtd.n38%TYPE := fn_mb_u_k;
    v_mb_k   wf_00_00_dtd.n38%TYPE;
    v_ret    wf_00_00_dtd.n38%TYPE;
    --
  BEGIN
    --
    pkwf_00_vld.pr_reqd (pi_d => pi_dc_tk_k, pi_dsc => 'Task to be accepted not defined');
    --
    BEGIN
      --
      SELECT mb_k
        INTO v_mb_k
        FROM wf_20_dc_tk
       WHERE row_key = pi_dc_tk_k;
      --
      IF (v_mb_k IS NOT NULL) THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'This task has already been accepted by another user');
      END IF;
      --
      UPDATE wf_20_dc_tk
         SET mb_k = v_u_k
       WHERE row_key = pi_dc_tk_k;
      --
      r_mb := fn_get_mb(pi_mb_k => v_u_k);
      -- Insert 'xxx task concluded' moved to next task.
      v_r := NULL;
      --
      v_r.dc_tk_k := pi_dc_tk_k;
      v_r.ac_dm := '0';
      v_r.ac_rmk := 'Task Accepted ';--by user '||r_mb.mb_id;
      --
      v_ret := fn_post_act(pi_act => v_r);
      --
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'This task cannot be found');
      WHEN TOO_MANY_ROWS THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'This task is duplicated');
    END;
    --
  END pr_acc_tk;
  --
  -- Post Action
  PROCEDURE pr_act(pi_action   IN wf_20_dc_ac%ROWTYPE) IS
    --
    v_r     wf_20_dc_ac%ROWTYPE;
    r_dc_tk wf_20_dc_tk%ROWTYPE;
    v_ret   wf_00_00_dtd.n38%TYPE;
    --
  BEGIN
    IF NVL(pi_action.row_key,0) <> 0 THEN
      pkwf_00_00_err.pr_raise(pi_msg => 'You might be attemting to edit an action. This is not allowed');
    END IF;
    --
    BEGIN
      SELECT *
        INTO r_dc_tk
        FROM wf_20_dc_tk
       WHERE row_key = pi_action.dc_tk_k;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        pkwf_00_00_err.pr_raise(pi_msg => 'Unable to locate the data definition for this task. Please contact administrator ['||pi_action.dc_tk_k||']');
    END;
    --
    -- Ensure that task selected is assigned to currently logged on user
    -- 
    v_r := pi_action; 
    --
    pkwf_00_vld.pr_reqd (pi_d => v_r.ac_rmk, pi_dsc => 'Action Remarks');
    pkwf_00_vld.pr_reqd (pi_d => v_r.ac_dm, pi_dsc => 'Action Type');
    --
    IF v_r.ac_dm = '1' THEN
      pkwf_00_flx.pr_v_data (pi_tk_k => r_dc_tk.tk_k,
                             pi_c_no => 1,
                             pi_data => v_r.ac_p1);
      --
      pkwf_00_flx.pr_v_data (pi_tk_k => r_dc_tk.tk_k,
                             pi_c_no => 2,
                             pi_data => v_r.ac_p2);
      --
      pkwf_00_flx.pr_v_data (pi_tk_k => r_dc_tk.tk_k,
                             pi_c_no => 3,
                             pi_data => v_r.ac_p3);
      --
      pkwf_00_flx.pr_v_data (pi_tk_k => r_dc_tk.tk_k,
                             pi_c_no => 4,
                             pi_data => v_r.ac_p4);
      --
      pkwf_00_flx.pr_v_data (pi_tk_k => r_dc_tk.tk_k,
                             pi_c_no => 5,
                             pi_data => v_r.ac_p5);
    END IF;
    -- 
    v_ret := fn_post_act(pi_act => v_r);
    --
    -- Routine processing
    DECLARE
      r_tk   wf_10_tp_tk%ROWTYPE;
      r_n_tk wf_10_tp_tk%ROWTYPE;
      r_tp   wf_10_tp%ROWTYPE;
      --
      v_ret  NUMBER;
    BEGIN
      --
      BEGIN
        SELECT *
          INTO r_tk
          FROM wf_10_tp_tk
         WHERE row_key = r_dc_tk.tk_k;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Unable to locate the configuration of this task. Please contact administrator ['||pi_action.dc_tk_k||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Configuration of this task is duplicated. Please contact administrator ['||pi_action.dc_tk_k||']');
      END;
      --
      BEGIN
        SELECT *
          INTO r_n_tk
          FROM wf_10_tp_tk A
         WHERE tp_k = r_tk.tp_k
           AND seq_no = (SELECT MIN(b.seq_no)
                           FROM wf_10_tp_tk b
                          WHERE b.tp_k = r_tk.tp_k
                            AND b.seq_no > r_tk.seq_no);
      EXCEPTION 
        WHEN NO_DATA_FOUND THEN
          NULL;
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Configuration of this subsequent task is duplicated. Please contact administrator ['||pi_action.dc_tk_k||']');
      END;
      --
      BEGIN
        SELECT *
          INTO r_tp
          FROM wf_10_tp
         WHERE row_key = r_tk.tp_k;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Unable to locate the configuration of this workflow type. Please contact administrator ['||pi_action.dc_tk_k||']');
        WHEN TOO_MANY_ROWS THEN
          pkwf_00_00_err.pr_raise(pi_msg => 'Configuration of this workflow type is duplicated. Please contact administrator ['||pi_action.dc_tk_k||']');
      END;
      --
      IF v_r.ac_dm = '1' THEN -- Accept
        -- Call post task routine
        IF r_tk.pst_prc IS NOT NULL THEN
logger.log('Executing Procedure '||r_tk.pst_prc);
          v_ret := fn_exec_prc(pi_prc_dsc  => r_tk.pst_prc,
                               pi_use_par  => TRUE,
                               pi_dc_k     => r_dc_tk.dc_k,
                               pi_dc_tk_k  => r_dc_tk.row_key,
                               pi_p1       => v_r.ac_p1,
                               pi_p2       => v_r.ac_p2,
                               pi_p3       => v_r.ac_p3,
                               pi_p4       => v_r.ac_p4,
                               pi_p5       => v_r.ac_p5);
logger.log('Done executing procedure '||r_tk.pst_prc);
        END IF;
        --
        UPDATE wf_20_dc_tk
           SET ed_dtt = SYSDATE
         WHERE row_key = r_dc_tk.row_key;
        --
        IF r_n_tk.row_key IS NULL THEN         
          -- -- If last task, call global accept routine
          IF r_tp.acc_prc IS NOT NULL THEN
            v_ret := fn_exec_prc(pi_prc_dsc  => r_tp.acc_prc,
                                 pi_use_par  => FALSE,
                                 pi_dc_k     => r_dc_tk.dc_k,
                                 pi_dc_tk_k  => r_dc_tk.row_key);
          END IF;
          --
          -- Insert 'xxx task concluded' moved to next task.
          v_r := NULL;
          --
          v_r.dc_tk_k := r_dc_tk.row_key;
          v_r.ac_dm := '0';
          v_r.ac_rmk := 'Workflow Concluded Successfully';
          --
          v_ret := fn_post_act(pi_act => v_r);
          --
        ELSE
          -- -- Else call pre task routine for next task
          IF r_n_tk.pre_prc IS NOT NULL THEN
            v_ret := fn_exec_prc(pi_prc_dsc  => r_n_tk.pre_prc,
                                 pi_use_par  => FALSE,
                                 pi_dc_k     => r_dc_tk.dc_k,
                                 pi_dc_tk_k  => r_dc_tk.row_key);
          END IF;
          --
          UPDATE wf_20_dc
             SET cr_sq_no = r_n_tk.seq_no
           WHERE row_key = r_dc_tk.dc_k;
          --
          pkwf_01_eml.pr_new_tsk(pi_tk_k   => r_n_tk.row_key,
                                 pi_app_id => fn_get_dc_id(r_dc_tk.dc_k),
                                 pi_product => fn_get_pdt_dsc(r_dc_tk.dc_k),
                                 pi_app_nm => fn_get_dc_dsc(r_dc_tk.dc_k));
          --                     
        END IF;
        --
      ELSIF v_r.ac_dm = '2' THEN -- Reject
        -- Call global reject routine
        IF r_tp.rej_prc IS NOT NULL THEN
          v_ret := fn_exec_prc(pi_prc_dsc  => r_tp.rej_prc,
                               pi_use_par  => FALSE,
                               pi_dc_k     => r_dc_tk.dc_k,
                               pi_dc_tk_k  => r_dc_tk.row_key);
        END IF;
        --
        -- Insert 'xxx task concluded' moved to next task.
        v_r := NULL;
        --
        v_r.dc_tk_k := r_dc_tk.row_key;
        v_r.ac_dm := '0';
        v_r.ac_rmk := 'Workflow REJECTED. No further actions allowed';
        --
        v_ret := fn_post_act(pi_act => v_r);
        --
        UPDATE wf_20_dc
           SET dc_st_dm = 'R'
         WHERE row_key = r_dc_tk.dc_k;
        --
        pkwf_01_eml.pr_app_rej(pi_tp_id  => r_tp.tp_id,
                               pi_app_id => fn_get_dc_id(r_dc_tk.dc_k),
                               pi_app_nm => fn_get_dc_dsc(r_dc_tk.dc_k),
                               pi_product => fn_get_pdt_dsc(r_dc_tk.dc_k),
                               pi_reason => pi_action.ac_rmk);
        --
      ELSIF v_r.ac_dm = '3' THEN -- Revert
        --
        -- Ensure task is the most recent task accepted
        -- 
        -- Revert to previous task
        UPDATE wf_20_dc_tk
           SET mb_k = NULL,
               st_dtt = NULL
         WHERE row_key = r_dc_tk.row_key;
        --
        -- Insert 'xxx task concluded' moved to next task.
        v_r := NULL;
        --
        v_r.dc_tk_k := r_dc_tk.row_key;
        v_r.ac_dm := '0';
        v_r.ac_rmk := 'Workflow REVERTED to previous state';
        --
        v_ret := fn_post_act(pi_act => v_r);
        --
      END IF;
    END;
    --
logger.log('Completed action processing');
  EXCEPTION
    WHEN OTHERS THEN
      logger.log(dbms_utility.format_error_backtrace, 'wferr', dbms_utility.format_error_stack);
      RAISE;
  END pr_act;
  --
  FUNCTION fn_cpr_doc_links(pi_app_id IN VARCHAR2) RETURN VARCHAR2 IS
    --
    v_arr2   apex_application_global.vc_arr2; 
    v_return VARCHAR2(4000);
    --
  BEGIN
    --
    SELECT '<a href="'|| doc_link ||'" alt="View Document">'|| doc_dsc || '</a>'
    BULK COLLECT 
    INTO v_arr2
    FROM (SELECT doc_dsc,
                 apex_util.prepare_url(p_url => 'f?p='||v('APP_ID') || ':1:' || v('APP_SESSION') || '::NO::P1_ID,P1_TYPE:' || pi_app_id || ',' ||doc_id) as doc_link
          FROM   wf_vl_20_cpr_doc
          WHERE  dc_id = pi_app_id)
          ORDER BY doc_dsc;
    --
    v_return := apex_util.table_to_string(v_arr2, ',  ');
    --
    RETURN v_return;
    --
  END fn_cpr_doc_links;
  --
END pkwf_20_gen;