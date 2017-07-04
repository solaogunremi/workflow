create or replace PACKAGE BODY pkwf_00_ath AS
  --
  /* Created By       : Aderemi ALabi
  ** Date Created     : 09-JUN-2016
  ** Release Version  : 2.0
  **
  ** PURPOSE: WF Routines for dual authentication
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
  **
  */
  --
  pv_lgn_id VARCHAR2(30);
  gv_k      VARCHAR2(500) := NULL;
  --
  /* Pprivate Routines */
  --
  FUNCTION fn_is_local(pi_lgn_id VARCHAR2) RETURN BOOLEAN IS
    --
  CURSOR c_local IS
    SELECT trc_yn
    FROM   t_99_10_ssu
    where UPPER(lgn_id) = UPPER(pi_lgn_id);
    --
    v_local  VARCHAR2(100);
    v_return BOOLEAN := TRUE;
    --
  BEGIN
    --
    OPEN  c_local;
    FETCH c_local INTO v_local;
    CLOSE c_local;
    --
    v_local := NVL(v_local,'0');
    --
    IF v_local = '1' THEN
      v_return := FALSE;
    END IF;
    --
    RETURN v_return;
    --
  END fn_is_local;
  --
  PROCEDURE pr_load_gvs IS
  BEGIN
    SELECT SYS_CONTEXT ('USERENV', 'LANGUAGE') ||
           SYS_CONTEXT ('USERENV', 'SESSION_USER') ||
           SYS_CONTEXT ('USERENV', 'SESSIONID') ||
           SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') 
    INTO gv_k
    FROM dual;
  END pr_load_gvs;
  --
  /* Public Routines */
  --
  FUNCTION fn_login(p_username VARCHAR2, p_password VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    logger.log('fn_login IN | p_username => '||p_username);
    pv_lgn_id := p_username;
    IF fn_is_local(p_username) THEN
      logger.log('fn_login LOCAL USER');
      pr_load_gvs;
      RETURN pk$990.fn_login(p_username, p_password);
    ELSE
      logger.log('fn_login REMOTE USER');
      RETURN pk99$$wf.fn_login@wf_sy(p_username, p_password);
    END IF;  
    logger.log('fn_login OUT');
  END fn_login;
  --
  PROCEDURE pr_blath(pi_user IN VARCHAR2) IS
  BEGIN
    logger.log('pr_blath IN | p1_user => '||pi_user);
    pv_lgn_id := NULL;
    IF fn_is_local(pi_user) THEN
      logger.log('pr_blath LOCAL USER');
      pk$990.pr_blath(pi_user);
     ELSE
     logger.log('pr_blath REMOTE USER');
      pk99$$wf.pr_blath@wf_sy(pi_user);
    END IF; 
    logger.log('pr_blath OUT');
  END pr_blath;
  --
  PROCEDURE pr_alath IS 
  BEGIN
    logger.log('pr_alath LOCAL USER');
    logger.log('pr_alayt user => '|| pv_lgn_id);
    IF fn_is_local(pv_lgn_id) THEN
      logger.log('pr_alath LOCAL USER');
      pk$990.pr_alath;
    ELSE
      logger.log('pr_alath REMOTE USER');
      --pk$990.pr_alath@wf_sy;
    END IF;  
    logger.log('pr_alath OUT');
  END pr_alath;
  --
END pkwf_00_ath;