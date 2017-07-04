CREATE OR REPLACE PACKAGE BODY pkwf_99_ncr AS
  --
  /* Created By       : Chiedu Okeleke
  ** Date Created     : 30-APR-2009
  ** Release Version  : 2.0
  **
  ** PURPOSE: Application Encryption Routines
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
  gv_k      VARCHAR2(100); -- Checks for validity of calling programs
  --
  -- Encryption/Decryption
  gc_key    RAW(32) := SYS.UTL_I18N.STRING_TO_RAW('qX[zR[~9{_+7162*$L8pH}Z50kIs3^-e');
  gc_typ    PLS_INTEGER := SYS.DBMS_CRYPTO.ENCRYPT_AES256 + SYS.DBMS_CRYPTO.CHAIN_CBC + SYS.DBMS_CRYPTO.PAD_PKCS5;
  --
  --
  /* Private Routines */
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
  -- Generate Hash Output
  FUNCTION fn_hsh (pi_k IN VARCHAR2, pi_d IN VARCHAR2, pi_t IN VARCHAR2) RETURN RAW IS
    v_out RAW(256);
  BEGIN
    --
    v_out := NULL;
    pr_load_gvs;
    --
    IF pi_d IS NOT NULL THEN
      IF pi_t = 'MD5' THEN -- generates 128-bits
        v_out := SYS.DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(pi_d, 'AL32UTF8'),SYS.DBMS_CRYPTO.HASH_MD5);
      ELSE -- SH1 is more secure: generates 160-bits
        v_out := SYS.DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(pi_d, 'AL32UTF8'),SYS.DBMS_CRYPTO.HASH_SH1);
      END IF;
    END IF;
    --
    RETURN v_out;
    --
  END fn_hsh;
  --
  -- Encryption
  FUNCTION fn_encr (pi_k IN VARCHAR2, pi_d IN VARCHAR2) RETURN RAW IS
    v_out RAW(2048);
  BEGIN
    --
    v_out := NULL;
    pr_load_gvs;
    --
    IF pi_d IS NOT NULL THEN
      v_out := SYS.DBMS_CRYPTO.ENCRYPT(src => UTL_I18N.STRING_TO_RAW(pi_d, 'AL32UTF8'),
                                       typ => gc_typ,
                                       key => gc_key);
    END IF;
    --
    RETURN v_out;
    --
  END fn_encr;
  --
  -- Decryption
  FUNCTION fn_decr (pi_k IN VARCHAR2, pi_d IN RAW) RETURN VARCHAR2 IS
    v_out RAW(2048);
  BEGIN
    --
    pr_load_gvs;
    IF LENGTH(pi_d) > 0 THEN
      v_out := SYS.DBMS_CRYPTO.DECRYPT(src => pi_d,
                                       typ => gc_typ,
                                       key => gc_key);
      RETURN UTL_I18N.RAW_TO_CHAR(v_out, 'AL32UTF8');
    ELSE
      RETURN NULL;
    END IF;
    --
  END fn_decr;
  --
  -- Encryption
  FUNCTION fn_encr_k (pi_k IN VARCHAR2, pi_d IN VARCHAR2, pi_dk RAW) RETURN RAW IS
    v_out RAW(2048);
  BEGIN
    --
    v_out := NULL;
    pr_load_gvs;
    --
    IF pi_d IS NOT NULL THEN
      v_out := SYS.DBMS_CRYPTO.ENCRYPT(src => UTL_I18N.STRING_TO_RAW(pi_d, 'AL32UTF8'),
                                       typ => gc_typ,
                                       key => NVL(pi_dk,gc_key));
    END IF;
    --
    RETURN v_out;
    --
  END fn_encr_k;
  --
  -- Decryption
  FUNCTION fn_decr_k (pi_k IN VARCHAR2, pi_d IN RAW, pi_dk RAW) RETURN VARCHAR2 IS
    v_out RAW(2048);
  BEGIN
    --
    pr_load_gvs;
    IF LENGTH(pi_d) > 0 THEN
      v_out := SYS.DBMS_CRYPTO.DECRYPT(src => pi_d,
                                       typ => gc_typ,
                                       key => NVL(pi_dk,gc_key));
      RETURN UTL_I18N.RAW_TO_CHAR(v_out, 'AL32UTF8');
    ELSE
      RETURN NULL;
    END IF;
    --
  END fn_decr_k;
  --
  -- Generate Random Bytes
  -- PI_N=Number of Bytes to be generated
  FUNCTION fn_ranb (pi_k IN VARCHAR2, pi_n IN NUMBER) RETURN RAW IS
  BEGIN
    pr_load_gvs;
    IF pi_n > 0 THEN
      RETURN SYS.DBMS_CRYPTO.RANDOMBYTES(pi_n);
    END IF;
  END fn_ranb;
  --
  -- Generate Random Integer
  FUNCTION fn_rani (pi_k IN VARCHAR2) RETURN NUMBER IS
  BEGIN
    pr_load_gvs;
    RETURN SYS.DBMS_CRYPTO.RANDOMINTEGER;
  END fn_rani;
  --
  -- Generate Random Number
  FUNCTION fn_rann (pi_k IN VARCHAR2) RETURN NUMBER IS
  BEGIN
    pr_load_gvs;
    RETURN SYS.DBMS_CRYPTO.RANDOMNUMBER;
  END fn_rann;
  --
  -- Generate Random String
  FUNCTION fn_rans (pi_k IN VARCHAR2, pi_len PLS_INTEGER DEFAULT 10, pi_opt VARCHAR2 DEFAULT 'A') RETURN VARCHAR2 IS
    v_len  PLS_INTEGER := pi_len;
    v_opt  VARCHAR2(1) := 'A';
  BEGIN
    pr_load_gvs;
    IF v_len <= 0 THEN
      v_len := 10;
    END IF;
    IF UPPER(pi_opt) IN ('U','L','X','A') THEN
      v_opt := UPPER(pi_opt);
    ELSE
      v_opt := 'A';
    END IF;
    RETURN SYS.DBMS_RANDOM.STRING(v_opt,v_len); 
  END fn_rans;
  --  
END pkwf_99_ncr;
/

