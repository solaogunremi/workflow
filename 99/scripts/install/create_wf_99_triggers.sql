SET FEEDBACK ON                                                                 
SPOOL create_99_triggers.log                                                    
Prompt ....                                                                     
Prompt CREATING SECURITY TABLES TRIGGERS...                                     
Prompt ....                                                                     
Prompt Creating Table "T_99_10_PEA"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PEA_TB                                        
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
Prompt Creating Table "T_99_10_PIP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PIP_TB                                        
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
Prompt Creating Table "T_99_10_PPW"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PPW_TB                                        
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
Prompt Creating Table "T_99_10_PTN"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PTN_TB                                        
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
Prompt Creating Table "T_99_10_PUN"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PUN_TB                                        
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
Prompt Creating Table "T_99_10_PWH"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PWH_TB                                        
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
Prompt Creating Table "T_99_10_PWR"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PWR_TB                                        
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
Prompt Creating Table "T_99_10_PWU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_PWU_TB                                        
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
Prompt Creating Table "T_99_10_SSU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_SSU_TB                                        
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
Prompt Creating Table "T_99_10_STP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_STP_TB                                        
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
Prompt Creating Table "T_99_10_TIP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_10_TIP_TB                                        
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
Prompt Creating Table "T_99_11_AGP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_11_AGP_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_11_AGP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_11_AGP_TB';                                                    
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
Prompt Creating Table "T_99_11_AGR"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_11_AGR_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_11_AGR FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_11_AGR_TB';                                                    
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
Prompt Creating Table "T_99_11_AGS"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_11_AGS_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_11_AGS FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_11_AGS_TB';                                                    
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
Prompt Creating Table "T_99_11_AGU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_11_AGU_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_11_AGU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_11_AGU_TB';                                                    
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
Prompt Creating Table "T_99_11_CPU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_11_CPU_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_11_CPU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_11_CPU_TB';                                                    
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
Prompt Creating Table "T_99_11_LGP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_11_LGP_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_11_LGP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_11_LGP_TB';                                                    
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
Prompt Creating Table "T_99_11_MDU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_11_MDU_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_11_MDU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_11_MDU_TB';                                                    
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
Prompt Creating Table "T_99_21_MSG"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_21_MSG_TB                                        
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
Prompt Creating Table "T_99_21_MSG_ARC"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_21_MSG_ARC_TB                                    
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
Prompt Creating Table "T_99_21_MSG_RCP"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_21_MSG_RCP_TB                                    
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
Prompt Creating Table "T_99_22_MSG_APR"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_22_MSG_APR_TB                                    
BEFORE INSERT OR UPDATE OR DELETE ON T_99_22_MSG_APR FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_22_MSG_APR_TB';                                                
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
Prompt Creating Table "T_99_22_MSG_APR_ARC"  BEFORE Triggers...                 
CREATE OR REPLACE TRIGGER T_99_22_MSG_APR_ARC_TB                                
BEFORE INSERT OR UPDATE OR DELETE ON T_99_22_MSG_APR_ARC FOR EACH ROW           
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_22_MSG_APR_ARC_TB';                                            
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
Prompt Creating Table "T_99_22_MSG_APR_RCP"  BEFORE Triggers...                 
CREATE OR REPLACE TRIGGER T_99_22_MSG_APR_RCP_TB                                
BEFORE INSERT OR UPDATE OR DELETE ON T_99_22_MSG_APR_RCP FOR EACH ROW           
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_22_MSG_APR_RCP_TB';                                            
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
Prompt Creating Table "T_99_23_ALG"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_23_ALG_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_23_ALG FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_23_ALG_TB';                                                    
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
Prompt Creating Table "T_99_23_GRA"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_23_GRA_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_23_GRA FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_23_GRA_TB';                                                    
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
Prompt Creating Table "T_99_23_GRU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_23_GRU_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_23_GRU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_23_GRU_TB';                                                    
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
Prompt Creating Table "T_99_23_MSG"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_23_MSG_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_23_MSG FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_23_MSG_TB';                                                    
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
Prompt Creating Table "T_99_23_MSGA"  BEFORE Triggers...                        
CREATE OR REPLACE TRIGGER T_99_23_MSGA_TB                                       
BEFORE INSERT OR UPDATE OR DELETE ON T_99_23_MSGA FOR EACH ROW                  
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_23_MSGA_TB';                                                   
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
Prompt Creating Table "T_99_23_RCP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_23_RCP_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_23_RCP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_23_RCP_TB';                                                    
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
Prompt Creating Table "T_99_23_RCPA"  BEFORE Triggers...                        
CREATE OR REPLACE TRIGGER T_99_23_RCPA_TB                                       
BEFORE INSERT OR UPDATE OR DELETE ON T_99_23_RCPA FOR EACH ROW                  
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_23_RCPA_TB';                                                   
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
Prompt Creating Table "T_99_24_SMS_ARC"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_24_SMS_ARC_TB                                    
BEFORE INSERT OR UPDATE OR DELETE ON T_99_24_SMS_ARC FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_24_SMS_ARC_TB';                                                
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
Prompt Creating Table "T_99_24_SMS_DFN"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_24_SMS_DFN_TB                                    
BEFORE INSERT OR UPDATE OR DELETE ON T_99_24_SMS_DFN FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_24_SMS_DFN_TB';                                                
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
Prompt Creating Table "T_99_24_SMS_PND"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_24_SMS_PND_TB                                    
BEFORE INSERT OR UPDATE OR DELETE ON T_99_24_SMS_PND FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_24_SMS_PND_TB';                                                
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
Prompt Creating Table "T_99_24_SMS_PRC"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_24_SMS_PRC_TB                                    
BEFORE INSERT OR UPDATE OR DELETE ON T_99_24_SMS_PRC FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_24_SMS_PRC_TB';                                                
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		PKWF_99_TRG.PR_TRG10(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_50_CPM"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_50_CPM_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_50_CPM FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_50_CPM_TB';                                                    
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
Prompt Creating Table "T_99_50_CUM"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_50_CUM_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_50_CUM FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_50_CUM_TB';                                                    
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
Prompt Creating Table "T_99_50_HDY"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_50_HDY_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_50_HDY FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_50_HDY_TB';                                                    
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
Prompt Creating Table "T_99_50_LOC"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_50_LOC_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_50_LOC FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_50_LOC_TB';                                                    
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
Prompt Creating Table "T_99_50_OFR"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_50_OFR_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_50_OFR FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_50_OFR_TB';                                                    
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
Prompt Creating Table "T_99_50_TRN"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_50_TRN_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_50_TRN FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_50_TRN_TB';                                                    
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
Prompt ....                                                                     
Prompt END SECURITY TABLES TRIGGERS...                                          
Prompt ....                                                                     
Prompt ....                                                                     
Prompt CREATING CORE TABLES TRIGGERS...                                         
Prompt ....                                                                     
Prompt Creating Table "T_99_00_SWL"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_SWL_TB                                        
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
Prompt Creating Table "T_99_00_SWK"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_SWK_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_SWK FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_SWK_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 9;                                                                   
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
Prompt Creating Table "T_99_00_STE"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_STE_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_STE FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_STE_TB';                                                    
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
Prompt Creating Table "T_99_00_STC"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_STC_TB                                        
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
Prompt Creating Table "T_99_00_SSS"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_SSS_TB                                        
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
Prompt Creating Table "T_99_00_SSI"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_SSI_TB                                        
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
Prompt Creating Table "T_99_00_SMDL"  BEFORE Triggers...                        
CREATE OR REPLACE TRIGGER T_99_00_SMDL_TB                                       
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_SMDL FOR EACH ROW                  
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_SMDL_TB';                                                   
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
Prompt Creating Table "T_99_00_SLC"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_SLC_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_SLC FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_SLC_TB';                                                    
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
Prompt Creating Table "T_99_00_ROL"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_ROL_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_ROL FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_ROL_TB';                                                    
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
Prompt Creating Table "T_99_00_PMV"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_PMV_TB                                        
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
Prompt Creating Table "T_99_00_PMD"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_PMD_TB                                        
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
Prompt Creating Table "T_99_00_NWD"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_NWD_TB                                        
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
Prompt Creating Table "T_99_00_MSG_APR"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_00_MSG_APR_TB                                    
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
Prompt Creating Table "T_99_00_MSG"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_MSG_TB                                        
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
Prompt Creating Table "T_99_00_MDL"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_MDL_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_MDL FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_MDL_TB';                                                    
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
Prompt Creating Table "T_99_00_HDY"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_HDY_TB                                        
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
Prompt Creating Table "T_99_00_ERRL"  BEFORE Triggers...                        
CREATE OR REPLACE TRIGGER T_99_00_ERRL_TB                                       
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
Prompt Creating Table "T_99_00_ERR"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_ERR_TB                                        
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
Prompt Creating Table "T_99_00_ERR"  AFTER Triggers...                          
CREATE OR REPLACE TRIGGER T_99_00_ERR_TA                                        
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
Prompt Creating Table "T_99_00_EMLP"  BEFORE Triggers...                        
CREATE OR REPLACE TRIGGER T_99_00_EMLP_TB                                       
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
Prompt Creating Table "T_99_00_DMV"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_DMV_TB                                        
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
Prompt Creating Table "T_99_00_DMM"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_DMM_TB                                        
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
Prompt Creating Table "T_99_00_CUR"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_CUR_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_CUR FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_CUR_TB';                                                    
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
Prompt Creating Table "T_99_00_CTR"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_CTR_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_CTR FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_CTR_TB';                                                    
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
Prompt Creating Table "T_99_00_CMP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_CMP_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_CMP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_CMP_TB';                                                    
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
Prompt Creating Table "T_99_00_ALT"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_00_ALT_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_00_ALT FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_00_ALT_TB';                                                    
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
Prompt END CORE TABLES TRIGGERS...                                              
Prompt ....                                                                     
Prompt ....                                                                     
Prompt CREATING LOG/TRACE TABLES TRIGGERS...                                    
Prompt ....                                                                     
Prompt Creating Table "T_99_20_LGE"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_20_LGE_TB                                        
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
Prompt Creating Table "T_99_20_LGQ"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_20_LGQ_TB                                        
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
Prompt Creating Table "T_99_20_MSG"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_20_MSG_TB                                        
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
Prompt Creating Table "T_99_20_MSG_ATT"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_20_MSG_ATT_TB                                    
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
Prompt Creating Table "T_99_20_LAE"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_20_LAE_TB                                        
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
Prompt Creating Table "T_99_20_UPD"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_20_UPD_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_20_UPD FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_20_UPD_TB';                                                    
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
Prompt ....                                                                     
Prompt END LOG/TRACE TABLES TRIGGERS...                                         
Prompt ....                                                                     
Prompt ....                                                                     
Prompt CREATING DATA AUDIT TABLES TRIGGERS...                                   
Prompt ....                                                                     
Prompt Creating Table "T_99_99_AGU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_99_AGU_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_99_AGU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_99_AGU_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_99_LGP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_99_LGP_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_99_LGP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_99_LGP_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_99_PMV"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_99_PMV_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_99_PMV FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_99_PMV_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_99_SSU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_99_SSU_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_99_SSU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_99_SSU_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG99(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt ....                                                                     
Prompt END DATA AUDIT TABLES TRIGGERS...                                        
Prompt ....                                                                     
Prompt ....                                                                     
Prompt CREATING ACCESS AUDIT TABLES TRIGGERS...                                 
Prompt ....                                                                     
Prompt Creating Table "T_99_90_APX_WKS"  BEFORE Triggers...                     
CREATE OR REPLACE TRIGGER T_99_90_APX_WKS_TB                                    
BEFORE INSERT OR UPDATE OR DELETE ON T_99_90_APX_WKS FOR EACH ROW               
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_90_APX_WKS_TB';                                                
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_90_LGF"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_90_LGF_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_90_LGF FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_90_LGF_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_90_LGP"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_90_LGP_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_90_LGP FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_90_LGP_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_90_LGU"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_90_LGU_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_90_LGU FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_90_LGU_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_90_SSS"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_90_SSS_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_90_SSS FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_90_SSS_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		TR.T_A := 3;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG90(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt ....                                                                     
Prompt END ACCESS AUDIT TABLES TRIGGERS...                                      
Prompt ....                                                                     
Prompt ....                                                                     
Prompt CREATING UTILITY TABLES TRIGGERS...                                      
Prompt ....                                                                     
Prompt Creating Table "T_99_30_VPD"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_30_VPD_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_30_VPD FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_30_VPD_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		PKWF_99_TRG.PR_TRG30(TR);                                                        
		:NEW.VPD_KY := TR.R_K;                                                        
		:NEW.VPD_ID := TR.T_N;                                                        
		:NEW.I_TM := TR.I_TM;                                                         
		IF :NEW.SCE_KY IS NULL THEN                                                   
			:NEW.SCE_KY := 0;                                                            
		END IF;                                                                       
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
	IF DELETING THEN                                                               
		NULL;                                                                         
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_30_CLB"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_30_CLB_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_30_CLB FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_30_CLB_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG30(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG30(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
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
		PKWF_99_TRG.PR_TRG30(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt Creating Table "T_99_30_BLB"  BEFORE Triggers...                         
CREATE OR REPLACE TRIGGER T_99_30_BLB_TB                                        
BEFORE INSERT OR UPDATE OR DELETE ON T_99_30_BLB FOR EACH ROW                   
DECLARE                                                                         
	TR  V_99_99_TRG%ROWTYPE;                                                       
BEGIN                                                                           
	--                                                                             
	TR.T_N := 'T_99_30_BLB_TB';                                                    
	TR.R_K := -9;                                                                  
	TR.P_A := 1;                                                                   
	--                                                                             
	IF INSERTING THEN                                                              
		TR.T_A := 1;                                                                  
		TR.R_K := :NEW.R_K;                                                           
		PKWF_99_TRG.PR_TRG30(TR);                                                        
		:NEW.R_K := TR.R_K;                                                           
		:NEW.I_KY := TR.I_KY;                                                         
		:NEW.I_TM := TR.I_TM;                                                         
	END IF;                                                                        
	--                                                                             
	IF UPDATING THEN                                                               
		TR.T_A := 2;                                                                  
		TR.R_K := :OLD.R_K;                                                           
		PKWF_99_TRG.PR_TRG30(TR);                                                        
		IF TR.T_A = 6 THEN                                                            
			:NEW.I_KY := TR.I_KY;                                                        
			:NEW.I_TM := TR.I_TM;                                                        
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
		PKWF_99_TRG.PR_TRG30(TR);                                                        
	END IF;                                                                        
	--                                                                             
END;                                                                            
/                                                                               
Prompt ....                                                                     
Prompt END UTILITY TABLES TRIGGERS...                                           
Prompt ....                                                                     
SPOOL OFF                                                                       
