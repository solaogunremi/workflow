CREATE OR REPLACE PACKAGE BODY pk99_ath AS 
  --       
  /* Public Routines */
  --    
  FUNCTION fn_ath (pi_k VARCHAR2, pi_u IN VARCHAR2, pi_p IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN pkwf_99_ath.fn_ath (pi_k => pi_k, pi_u => pi_u, pi_p => pi_p);
  END fn_ath;
  --
  FUNCTION fn_athsa (pi_k VARCHAR2, pi_u IN VARCHAR2, pi_p IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN pkwf_99_ath.fn_athsa (pi_k => pi_k, pi_u => pi_u, pi_p => pi_p);
  END fn_athsa;
  --  
  -- Set Post-Authentication Session States
  FUNCTION fn_ath_sss (pi_k VARCHAR2, pi_u IN VARCHAR2) RETURN BOOLEAN IS
  BEGIN
    RETURN pkwf_99_ath.fn_ath_sss (pi_k => pi_k, pi_u => pi_u);
  END fn_ath_sss;
  --  
END pk99_ath;
/

