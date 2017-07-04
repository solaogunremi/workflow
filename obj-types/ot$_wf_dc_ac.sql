DROP TYPE OT$_WF_DC_AC_TB FORCE
/

CREATE OR REPLACE TYPE OT$_WF_DC_AC AS OBJECT
 (    DC_K              NUMBER(38),
      DC_ID             VARCHAR2(50),
      DC_DSC            VARCHAR2(250),
      DC_TK_K           NUMBER(38),
      TK_K              NUMBER(38),
      TK_ID             VARCHAR2(50),
      TK_DSC            VARCHAR2(250),
      AC_K              NUMBER(38),
      AC_SQ_NO          NUMBER(38),
      AC_DTT            DATE,
      AC_RMK            VARCHAR2(4000),
      AC_DM             VARCHAR2(1),
      AC_DM_DSC         VARCHAR2(20),
      MB_K              NUMBER(38),
      MB_ID             VARCHAR2(50),
      MB_DSC            VARCHAR2(250),
      AC_P1_DSC         VARCHAR2(50),
      AC_P1_TP          VARCHAR2(1),
      AC_P1             VARCHAR2(100),
      AC_P2_DSC         VARCHAR2(50),
      AC_P2_TP          VARCHAR2(1),
      AC_P2             VARCHAR2(100),
      AC_P3_DSC         VARCHAR2(50),
      AC_P3_TP          VARCHAR2(1),
      AC_P3             VARCHAR2(100),
      AC_P4_DSC         VARCHAR2(50),
      AC_P4_TP          VARCHAR2(1),
      AC_P4             VARCHAR2(100),
      AC_P5_DSC         VARCHAR2(50),
      AC_P5_TP          VARCHAR2(1),
      AC_P5             VARCHAR2(100),
   CONSTRUCTOR FUNCTION OT$_WF_DC_AC RETURN SELF AS RESULT)
/

CREATE OR REPLACE TYPE BODY OT$_WF_DC_AC IS
  CONSTRUCTOR FUNCTION OT$_WF_DC_AC RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
END;
/
   
CREATE OR REPLACE TYPE OT$_WF_DC_AC_TB AS TABLE OF OT$_WF_DC_AC
/