--------------------------------------------------------
--  DDL for Trigger T_99_00_DMM_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_DMM_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_DMM FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_DMM_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 0;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_DMM_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_DMV_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_DMV_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_DMV FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_DMV_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_DMV_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_EMLP_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_EMLP_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_EMLP FOR EACH ROW                  
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_EMLP_TB';                                                   
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_EMLP_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_ERRL_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_ERRL_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_ERRL FOR EACH ROW                  
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_ERRL_TB';                                                   
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_ERRL_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_ERR_TA
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_ERR_TA" 
AFTER INSERT OR UPDATE OR DELETE ON T_99_00_ERR FOR EACH ROW                    
DECLARE                                                                         
	TR  V_99_99_LGG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_ERR_TA';                                                    
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		TR.D_5 := :NEW.ERR_MSG;                                                       
		PKWF_99_TRG.PR_TRG00L(TR);                                                       
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.D_5 := :NEW.ERR_MSG;                                                       
		PKWF_99_TRG.PR_TRG00L(TR);                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00L(TR);                                                       
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_ERR_TA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_ERR_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_ERR_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_ERR FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_ERR_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_ERR_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_HDY_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_HDY_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_HDY FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_HDY_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_HDY_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_MSG_APR_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_MSG_APR_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_MSG_APR FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_MSG_APR_TB';                                                
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_MSG_APR_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_MSG_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_MSG_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_MSG FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_MSG_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_MSG_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_NWD_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_NWD_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_NWD FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_NWD_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_NWD_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_PMD_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_PMD_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_PMD FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_PMD_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 0;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_PMD_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_PMV_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_PMV_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_PMV FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_PMV_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.CNG_YN;                                                       
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_PMV_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_SSI_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_SSI_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_SSI FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_SSI_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_SSI_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_SSS_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_SSS_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_SSS FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_SSS_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_SSS_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_STC_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_STC_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_STC FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_STC_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 0;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_STC_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_00_SWL_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_00_SWL_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_SWL FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_SWL_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		PKWF_99_TRG.PR_TRG00(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_00_SWL_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PEA_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PEA_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PEA FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PEA_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PEA_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PIP_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PIP_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PIP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PIP_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PIP_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PPW_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PPW_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PPW FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PPW_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PPW_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PTN_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PTN_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PTN FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PTN_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PTN_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PUN_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PUN_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PUN FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PUN_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PUN_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PWH_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PWH_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PWH FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PWH_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PWH_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PWR_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PWR_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PWR FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PWR_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 8 THEN                                                            
			:NEW.U_KY := TR.U_KY;                                                        
			:NEW.U_TM := TR.U_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PWR_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_PWU_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_PWU_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_PWU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_PWU_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_PWU_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_SSU_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_SSU_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_SSU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_SSU_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.R_S := TR.N_RS;                                                          
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
		IF TR.N_RS = 1 THEN                                                           
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
		IF TR.T_A = 7 THEN                                                            
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
		IF TR.T_A = 8 THEN                                                            
			:NEW.U_KY := TR.U_KY;                                                        
			:NEW.U_TM := TR.U_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_SSU_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_STP_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_STP_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_STP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_STP_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.R_S := TR.N_RS;                                                          
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
		IF TR.N_RS = 1 THEN                                                           
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
		IF TR.T_A = 7 THEN                                                            
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_STP_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_10_TIP_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_10_TIP_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_10_TIP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_10_TIP_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_10_TIP_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_20_LAE_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_20_LAE_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_20_LAE FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_20_LAE_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_20_LAE_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_20_LGE_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_20_LGE_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_20_LGE FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_20_LGE_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_20_LGE_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_20_LGQ_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_20_LGQ_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_20_LGQ FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_20_LGQ_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_20_LGQ_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_20_MSG_ATT_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_20_MSG_ATT_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_20_MSG_ATT FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_20_MSG_ATT_TB';                                                
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_20_MSG_ATT_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_20_MSG_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_20_MSG_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_20_MSG FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_20_MSG_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG20(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_20_MSG_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_21_MSG_ARC_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_21_MSG_ARC_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_21_MSG_ARC FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_21_MSG_ARC_TB';                                                
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.R_S := TR.N_RS;                                                          
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
		IF TR.N_RS = 1 THEN                                                           
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
		IF TR.T_A = 7 THEN                                                            
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
		IF TR.T_A = 8 THEN                                                            
			:NEW.U_KY := TR.U_KY;                                                        
			:NEW.U_TM := TR.U_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_21_MSG_ARC_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_21_MSG_RCP_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_21_MSG_RCP_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_21_MSG_RCP FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_21_MSG_RCP_TB';                                                
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_21_MSG_RCP_TB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_99_21_MSG_TB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "T_99_21_MSG_TB" 
BEFORE INSERT OR UPDATE OR DELETE ON T_99_21_MSG FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_21_MSG_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.R_S := TR.N_RS;                                                          
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
		IF TR.N_RS = 1 THEN                                                           
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		TR.N_RS := :NEW.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
		END IF;                                                                       
		IF TR.T_A = 7 THEN                                                            
			:NEW.A_KY := TR.A_KY;                                                        
			:NEW.A_TM := TR.A_TM;                                                        
		END IF;                                                                       
		IF TR.T_A = 8 THEN                                                            
			:NEW.U_KY := TR.U_KY;                                                        
			:NEW.U_TM := TR.U_TM;                                                        
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		TR.O_RS := :OLD.R_S;                                                          
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;
/
ALTER TRIGGER "T_99_21_MSG_TB" ENABLE;
