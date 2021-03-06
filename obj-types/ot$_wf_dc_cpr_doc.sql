DROP TYPE OT$_WF_DC_CPR_DOC_TB FORCE
/

CREATE OR REPLACE TYPE OT$_WF_DC_CPR_DOC AS OBJECT
 (    DC_K              NUMBER(38),
      DC_ID	            VARCHAR2(50),
      DOC_ID            VARCHAR2(50),
      DOC_DSC           VARCHAR2(250),
      DOC_BLB           BLOB,
   CONSTRUCTOR FUNCTION OT$_WF_DC_CPR_DOC RETURN SELF AS RESULT)
/

CREATE OR REPLACE TYPE BODY OT$_WF_DC_CPR_DOC IS
  CONSTRUCTOR FUNCTION OT$_WF_DC_CPR_DOC RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
END;
/
   
CREATE OR REPLACE TYPE OT$_WF_DC_CPR_DOC_TB AS TABLE OF OT$_WF_DC_CPR_DOC
/