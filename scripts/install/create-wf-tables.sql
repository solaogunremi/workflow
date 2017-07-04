CREATE TABLE WF_00_00_DTD
(
  DT     DATE,
  DTT    DATE,
  N1     NUMBER(1),
  N3     NUMBER(3),
  N5     NUMBER(5),
  N10    NUMBER(10),
  N155   NUMBER(15,5),
  N20    NUMBER(20),
  N224   NUMBER(22,4),
  N2812  NUMBER(38,12),
  N38    NUMBER(38),
  C1     VARCHAR2(1 BYTE),
  C5     VARCHAR2(5 BYTE),
  C10    VARCHAR2(10 BYTE),
  C15    VARCHAR2(15 BYTE),
  C30    VARCHAR2(30 BYTE),
  C50    VARCHAR2(50 BYTE),
  C80    VARCHAR2(80 BYTE),
  C100   VARCHAR2(100 BYTE),
  C255   VARCHAR2(255 BYTE),
  C500   VARCHAR2(500 BYTE),
  C1000  VARCHAR2(1000 BYTE),
  C4000  VARCHAR2(4000 BYTE),
  CLB    CLOB,
  BLB    BLOB
);


CREATE TABLE WF_00_00_ERD
(
  ROW_KEY  NUMBER(38)                           NOT NULL,
  ERR_ID   VARCHAR2(30 BYTE)                    NOT NULL,
  ERR_MSG  VARCHAR2(250 BYTE)                   NOT NULL,
  PLH_CNT  NUMBER(2)                            DEFAULT 0                     NOT NULL
);

ALTER TABLE WF_00_00_ERD ADD CONSTRAINT PK_WF_00_00_ERD PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_00_00_ERD ADD CONSTRAINT UK1_WF_00_00_ERD UNIQUE
(
  ERR_ID
);


CREATE TABLE WF_00_00_DMD
(
  ROW_KEY  NUMBER(38)                           NOT NULL,
  DMD_DM   VARCHAR2(20 BYTE)                    NOT NULL,
  DMD_DSC  VARCHAR2(100 BYTE)                   NOT NULL,
  DSP_ORD  NUMBER(5)                            NOT NULL,
  RMK_TXT  VARCHAR2(500 BYTE)
);
ALTER TABLE WF_00_00_DMD ADD CONSTRAINT PK_WF_00_00_DMD PRIMARY KEY
(
  ROW_KEY
)
;

CREATE TABLE WF_00_00_DMV
(
  ROW_KEY  NUMBER(38)                           NOT NULL,
  DMD_K    NUMBER(38)                           NOT NULL,
  DMV_ID   VARCHAR2(20 BYTE)                    NOT NULL,
  DMV_DSC  VARCHAR2(100 BYTE)                   NOT NULL,
  DSP_ORD  NUMBER(5)                            NOT NULL,
  IUS_YN   VARCHAR2(1 BYTE)                     NOT NULL,
  RMK_TXT  VARCHAR2(500 BYTE)
);

ALTER TABLE WF_00_00_DMV ADD CONSTRAINT PK_WF_00_00_DMV PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_00_00_DMV ADD CONSTRAINT UK1_WF_00_00_DMV UNIQUE
(
  DMD_K, DMV_ID
);


CREATE TABLE WF_00_00_PDM
(
  ROW_KEY  NUMBER(38)                           NOT NULL,
  PMR_DM   VARCHAR2(30 BYTE)                    NOT NULL,
  PMR_DSC  VARCHAR2(100 BYTE)                   NOT NULL,
  DSP_ORD  NUMBER(5)                            NOT NULL
);

ALTER TABLE WF_00_00_PDM ADD CONSTRAINT PK_WF_00_00_PDM PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_00_00_PDM ADD CONSTRAINT UK1_WF_00_00_PDM UNIQUE
(
  PMR_DM
);

CREATE TABLE WF_00_00_PVL
(
  ROW_KEY  NUMBER(38)                           NOT NULL,
  PMR_DM_K NUMBER(38)                           NOT NULL,
  PMR_ID   VARCHAR2(30 BYTE)                    NOT NULL,
  PMR_DSC  VARCHAR2(100 BYTE)                   NOT NULL,
  CHG_YN   VARCHAR2(1 BYTE)                     DEFAULT '0'                   NOT NULL,
  DSP_YN   VARCHAR2(1 BYTE)                     DEFAULT '0'                   NOT NULL,
  DSP_ORD  NUMBER(5)                            NOT NULL,
  TP_DM    VARCHAR2(1 BYTE)                     NOT NULL,
  BLN_VAL  VARCHAR2(1 BYTE)                         NULL,
  NBR_VAL  NUMBER(38,12)                            NULL,
  DT_VAL   DATE                                     NULL,
  CHR_VAL  VARCHAR2(4000 BYTE)                      NULL
);

ALTER TABLE WF_00_00_PVL ADD CONSTRAINT PK_WF_00_00_PVL PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_00_00_PVL ADD CONSTRAINT UK1_WF_00_00_PVL UNIQUE
(
  PMR_ID
);

CREATE TABLE WF_10_RL
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE,
  SYS_DTT         DATE,
  APPR_STAT_DM    VARCHAR2(1 BYTE),
  UPD_DM          VARCHAR2(10 BYTE),
  DB_LOGIN        VARCHAR2(30 BYTE),
  C_N             NUMBER(38),
  R_PS            VARCHAR2(30 BYTE),
  R_T             NUMBER(38),
  R_C             NUMBER(38),
  R_I_UK          NUMBER(38),
  R_I_SD          DATE,
  R_U_UK          NUMBER(38),
  R_U_SD          DATE,
  R_A_UK          NUMBER(38),
  R_A_SD          DATE,
  R_RA_CT         NUMBER(2),
  R_CA_CT         NUMBER(2),
  RL_ID           VARCHAR2(30 BYTE)             NOT NULL,
  RL_DSC          VARCHAR2(100 BYTE)            NOT NULL,
  IU_YN           VARCHAR2(1 BYTE)              NOT NULL
);

ALTER TABLE WF_10_RL ADD CONSTRAINT PK_WF_10_RL PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_10_RL ADD CONSTRAINT UK1_WF_10_RL UNIQUE
(
  RL_ID
);



CREATE TABLE WF_10_MB
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE,
  SYS_DTT         DATE,
  APPR_STAT_DM    VARCHAR2(1 BYTE),
  UPD_DM          VARCHAR2(10 BYTE),
  DB_LOGIN        VARCHAR2(30 BYTE),
  C_N             NUMBER(38),
  R_PS            VARCHAR2(30 BYTE),
  R_T             NUMBER(38),
  R_C             NUMBER(38),
  R_I_UK          NUMBER(38),
  R_I_SD          DATE,
  R_U_UK          NUMBER(38),
  R_U_SD          DATE,
  R_A_UK          NUMBER(38),
  R_A_SD          DATE,
  R_RA_CT         NUMBER(2),
  R_CA_CT         NUMBER(2),
  MB_ID           VARCHAR2(30 BYTE)             NOT NULL,
  MB_DSC          VARCHAR2(100 BYTE)            NOT NULL,
  U_K             NUMBER(38)                    NOT NULL,
  IU_YN           VARCHAR2(1 BYTE)              NOT NULL
);

ALTER TABLE WF_10_MB ADD CONSTRAINT PK_WF_10_MB PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_10_MB ADD CONSTRAINT UK1_WF_10_MB UNIQUE
(
  MB_ID
);


CREATE TABLE WF_10_RL_MB
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE,
  SYS_DTT         DATE,
  APPR_STAT_DM    VARCHAR2(1 BYTE),
  UPD_DM          VARCHAR2(10 BYTE),
  DB_LOGIN        VARCHAR2(30 BYTE),
  C_N             NUMBER(38),
  R_PS            VARCHAR2(30 BYTE),
  R_T             NUMBER(38),
  R_C             NUMBER(38),
  R_I_UK          NUMBER(38),
  R_I_SD          DATE,
  R_U_UK          NUMBER(38),
  R_U_SD          DATE,
  R_A_UK          NUMBER(38),
  R_A_SD          DATE,
  R_RA_CT         NUMBER(2),
  R_CA_CT         NUMBER(2),
  RL_K            NUMBER(38)                    NOT NULL,
  MB_K            NUMBER(38)                    NOT NULL,
  IU_YN           VARCHAR2(1 BYTE)              NOT NULL
);

ALTER TABLE WF_10_RL_MB ADD CONSTRAINT PK_WF_10_RL_MB PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_10_RL_MB ADD CONSTRAINT UK1_WF_10_RL_MB UNIQUE
(
  RL_K, MB_K
);


CREATE TABLE WF_10_TP
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE                          NOT NULL,
  SYS_DTT         DATE                          NOT NULL,
  TP_ID           VARCHAR2(30 BYTE)             NOT NULL,
  TP_DSC          VARCHAR2(100 BYTE)            NOT NULL,
  RP_ID           VARCHAR2(30 BYTE),
  ACC_PRC         VARCHAR2(30 BYTE),
  REJ_PRC         VARCHAR2(30 BYTE),
  ACC_EML         VARCHAR2(30 BYTE),
  REJ_EML         VARCHAR2(30 BYTE),
  ACC_ALT_ID      VARCHAR2(30 BYTE),
  REJ_ALT_ID      VARCHAR2(30 BYTE),
  IU_YN           VARCHAR2(1 BYTE)              NOT NULL
);

ALTER TABLE WF_10_TP ADD CONSTRAINT PK_WF_10_TP PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_10_TP ADD CONSTRAINT UK1_WF_10_TP UNIQUE
(
  TP_ID
);


CREATE TABLE WF_10_TP_TK
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE                          NOT NULL,
  SYS_DTT         DATE                          NOT NULL,
  TP_K            NUMBER(38)                    NOT NULL,
  SEQ_NO          NUMBER(38)                    NOT NULL,
  TK_ID           VARCHAR2(30 BYTE)             NOT NULL,
  TK_DSC          VARCHAR2(100 BYTE)            NOT NULL,
  AC_RL_K         NUMBER(38),
  PRE_PRC         VARCHAR2(30 BYTE),
  PST_PRC         VARCHAR2(30 BYTE),
  ACC_EML         VARCHAR2(30 BYTE),
  REV_EML         VARCHAR2(30 BYTE),
  ACC_ALT_ID      VARCHAR2(30 BYTE),
  REV_ALT_ID      VARCHAR2(30 BYTE),
  P1_IU_YN        VARCHAR2(1 BYTE)              NOT NULL,
  P1_DSC          VARCHAR2(30 BYTE),
  P1_TP_DM        VARCHAR2(1 BYTE),
  P1_MND_YN       VARCHAR2(1 BYTE),
  P2_IU_YN        VARCHAR2(1 BYTE)              NOT NULL,
  P2_DSC          VARCHAR2(30 BYTE),
  P2_TP_DM        VARCHAR2(1 BYTE),
  P2_MND_YN       VARCHAR2(1 BYTE),
  P3_IU_YN        VARCHAR2(1 BYTE)              NOT NULL,
  P3_DSC          VARCHAR2(30 BYTE),
  P3_TP_DM        VARCHAR2(1 BYTE),
  P3_MND_YN       VARCHAR2(1 BYTE),
  P4_IU_YN        VARCHAR2(1 BYTE)             NOT NULL,
  P4_DSC          VARCHAR2(30 BYTE),
  P4_TP_DM        VARCHAR2(1 BYTE),
  P4_MND_YN       VARCHAR2(1 BYTE),
  P5_IU_YN        VARCHAR2(1 BYTE)              NOT NULL,
  P5_DSC          VARCHAR2(30 BYTE),
  P5_TP_DM        VARCHAR2(1 BYTE),
  P5_MND_YN       VARCHAR2(1 BYTE)
);

ALTER TABLE WF_10_TP_TK ADD CONSTRAINT PK_WF_10_TP_TK PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_10_TP_TK ADD CONSTRAINT UK1_WF_10_TP_TK UNIQUE
(
  TP_K, TK_ID
);


CREATE TABLE WF_10_TP_LK
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  D_ID            VARCHAR2(30 BYTE)             NOT NULL,
  TP_K            NUMBER(38),
  IU_YN           VARCHAR2(1 BYTE)              NOT NULL
);

ALTER TABLE WF_10_TP_LK ADD CONSTRAINT PK_WF_10_TP_LK PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_10_TP_LK ADD CONSTRAINT UK1_WF_10_TP_LK UNIQUE
(
  D_ID
);


CREATE TABLE WF_20_DC
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE                          NOT NULL,
  SYS_DTT         DATE                          NOT NULL,
  TP_K            NUMBER(38)                    NOT NULL,
  DC_ID           VARCHAR2(50 BYTE)             NOT NULL,
  DC_DSC          VARCHAR2(250 BYTE)            NOT NULL,
  ST_DTT          DATE                          NOT NULL,
  ED_DTT          DATE,
  DC_ST_DM        VARCHAR2(1 BYTE)              NOT NULL,
  CR_SQ_NO        NUMBER(38)                    NOT NULL,
  TK_NO           NUMBER(38)                    NOT NULL,
  DC_BLB          BLOB,
  DC_BLB_MM       VARCHAR2(50 BYTE),
  DC_BLB_NM       VARCHAR2(50 BYTE),
  DC_BLB_LN       NUMBER(38)
);

ALTER TABLE WF_20_DC ADD CONSTRAINT PK_WF_20_DC PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_20_DC ADD CONSTRAINT UK1_WF_20_DC UNIQUE
(
  DC_ID
);


CREATE TABLE WF_20_DC_TK
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE                          NOT NULL,
  SYS_DTT         DATE                          NOT NULL,
  DC_K            NUMBER(38)                    NOT NULL,
  TK_K            NUMBER(38)                    NOT NULL,
  MB_K            NUMBER(38),
  ST_DTT          DATE,
  ED_DTT          DATE,
  AC_RMK          VARCHAR2(4000 BYTE),
  DN_YN           VARCHAR2(1 BYTE)              NOT NULL,
  TK_SQ_NO        NUMBER(38)
);

ALTER TABLE WF_20_DC_TK ADD CONSTRAINT PK_WF_20_DC_TK PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_20_DC_TK ADD CONSTRAINT UK1_WF_20_DC_TK UNIQUE
(
  DC_K, TK_K
);
  
  
CREATE TABLE WF_20_DC_AC
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  BUS_DT          DATE                          NOT NULL,
  SYS_DTT         DATE                          NOT NULL,
  DC_TK_K         NUMBER(38)                    NOT NULL,
  MB_K            NUMBER(38)                    NOT NULL,
  AC_SQ_NO        NUMBER(38)                    NOT NULL,
  AC_DTT          DATE                          NOT NULL,
  AC_RMK          VARCHAR2(4000 BYTE)           NOT NULL,
  AC_DM           VARCHAR2(1 BYTE)              NOT NULL,
  AC_P1           VARCHAR2(100 BYTE),
  AC_P2           VARCHAR2(100 BYTE),
  AC_P3           VARCHAR2(100 BYTE),
  AC_P4           VARCHAR2(100 BYTE),
  AC_P5           VARCHAR2(100 BYTE)
);

ALTER TABLE WF_20_DC_AC ADD CONSTRAINT PK_WF_20_DC_AC PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_20_DC_AC ADD CONSTRAINT UK1_WF_20_DC_AC UNIQUE
(
  AC_SQ_NO
);


CREATE TABLE WF_30_DC
(
  ROW_KEY         NUMBER(38)                    NOT NULL,
  D_ID            VARCHAR2(50 BYTE)             NOT NULL,
  DC_TP_K         NUMBER(38)                    NOT NULL,
  DC_ID           VARCHAR2(50 BYTE)             NOT NULL,
  DC_DTT          DATE                          NOT NULL,
  DC_ST_DM        VARCHAR2(1)                   NOT NULL,
  DC_JSN          CLOB,
  DC_LNK_YN       VARCHAR2(1 BYTE), 
	DC_LNK_K        NUMBER(38,0), 
  DM01            VARCHAR2(5),
  DM02            VARCHAR2(5),
  DM03            VARCHAR2(5),
  DM04            VARCHAR2(5),
  DM05            VARCHAR2(5),
  DM06            VARCHAR2(5),
  DM07            VARCHAR2(5),
  DM08            VARCHAR2(5),
  DM09            VARCHAR2(5),
  DM10            VARCHAR2(5),
  SID01           VARCHAR2(10),
  SID02           VARCHAR2(10),
  SID03           VARCHAR2(10),
  SID04           VARCHAR2(10),
  SID05           VARCHAR2(10),
  SID06           VARCHAR2(10),
  SID07           VARCHAR2(10),
  SID08           VARCHAR2(10),
  SID09           VARCHAR2(10),
  SID10           VARCHAR2(10),
  SID11           VARCHAR2(10),
  SID12           VARCHAR2(10),
  SID13           VARCHAR2(10),
  SID14           VARCHAR2(10),
  SID15           VARCHAR2(10),
  LID01           VARCHAR2(50),
  LID02           VARCHAR2(50),
  LID03           VARCHAR2(50),
  LID04           VARCHAR2(50),
  LID05           VARCHAR2(50),
  LID06           VARCHAR2(50),
  LID07           VARCHAR2(50),
  LID08           VARCHAR2(50),
  LID09           VARCHAR2(50),
  LID10           VARCHAR2(50),
  LID11           VARCHAR2(50),
  LID12           VARCHAR2(50),
  LID13           VARCHAR2(50),
  LID14           VARCHAR2(50),
  LID15           VARCHAR2(50),
  LID16           VARCHAR2(50),
  LID17           VARCHAR2(50),
  LID18           VARCHAR2(50),
  LID19           VARCHAR2(50),
  LID20           VARCHAR2(50),
  LID21           VARCHAR2(50),
  LID22           VARCHAR2(50),
  LID23           VARCHAR2(50),
  LID24           VARCHAR2(50),
  LID25           VARCHAR2(50),
  SDC01           VARCHAR2(100),
  SDC02           VARCHAR2(100),
  SDC03           VARCHAR2(100),
  SDC04           VARCHAR2(100),
  SDC05           VARCHAR2(100),
  SDC06           VARCHAR2(100),
  SDC07           VARCHAR2(100),
  SDC08           VARCHAR2(100),
  SDC09           VARCHAR2(100),
  SDC10           VARCHAR2(100),
  SDC11           VARCHAR2(100),
  SDC12           VARCHAR2(100),
  SDC13           VARCHAR2(100),
  SDC14           VARCHAR2(100),
  SDC15           VARCHAR2(100),
  SDC16           VARCHAR2(100),
  SDC17           VARCHAR2(100),
  SDC18           VARCHAR2(100),
  SDC19           VARCHAR2(100),
  SDC20           VARCHAR2(100),
  LDC01           VARCHAR2(250),
  LDC02           VARCHAR2(250),
  LDC03           VARCHAR2(250),
  LDC04           VARCHAR2(250),
  LDC05           VARCHAR2(250),
  LDC06           VARCHAR2(250),
  LDC07           VARCHAR2(250),
  LDC08           VARCHAR2(250),
  LDC09           VARCHAR2(250),
  LDC10           VARCHAR2(250),  
  LDC11           VARCHAR2(250),
  LDC12           VARCHAR2(250),
  LDC13           VARCHAR2(250),
  LDC14           VARCHAR2(250),
  LDC15           VARCHAR2(250),
  LDC16           VARCHAR2(250),
  LDC17           VARCHAR2(250),
  LDC18           VARCHAR2(250),
  LDC19           VARCHAR2(250),
  LDC20           VARCHAR2(250),  
  K01             NUMBER(38),
  K02             NUMBER(38),
  K03             NUMBER(38),
  K04             NUMBER(38),
  K05             NUMBER(38),
  K06             NUMBER(38),
  K07             NUMBER(38),
  K08             NUMBER(38),
  K09             NUMBER(38),
  K10             NUMBER(38),  
  K11             NUMBER(38),
  K12             NUMBER(38),
  K13             NUMBER(38),
  K14             NUMBER(38),
  K15             NUMBER(38),
  K16             NUMBER(38),
  K17             NUMBER(38),
  K18             NUMBER(38),
  K19             NUMBER(38),
  K20             NUMBER(38), 
  M01             NUMBER(22,4),
  M02             NUMBER(22,4),
  M03             NUMBER(22,4),
  M04             NUMBER(22,4),
  M05             NUMBER(22,4),
  M06             NUMBER(22,4),
  M07             NUMBER(22,4),
  M08             NUMBER(22,4),
  M09             NUMBER(22,4),
  M10             NUMBER(22,4),
  EM01            NUMBER(28,12),
  EM02            NUMBER(28,12),
  EM03            NUMBER(28,12),
  EM04            NUMBER(28,12),
  EM05            NUMBER(28,12),
  D01             DATE,
  D02             DATE,
  D03             DATE,
  D04             DATE,
  D05             DATE,
  D06             DATE,
  D07             DATE,
  D08             DATE,
  D09             DATE,
  D10             DATE,
  RK01            VARCHAR2(4000),
  RK02            VARCHAR2(4000),
  RK03            VARCHAR2(4000),
  RK04            VARCHAR2(4000),
  RK05            VARCHAR2(4000),
  BL01            BLOB,
  BL02            BLOB,
  BL03            BLOB,   
  BL04            BLOB,   
  BL05            BLOB
);

ALTER TABLE WF_30_DC ADD CONSTRAINT PK_WF_30_DC PRIMARY KEY
(
  ROW_KEY
);

ALTER TABLE WF_30_DC ADD CONSTRAINT UK1_WF_30_DC UNIQUE
(
  DC_ID
);

CREATE TABLE WF_30_DC_IM
(
  DC_K            NUMBER(38)                    NOT NULL,
  IM_TP_DM        VARCHAR2(50 BYTE)             NOT NULL,
  IM_BLB          BLOB
);

ALTER TABLE WF_30_DC_IM ADD CONSTRAINT UK1_WF_30_DC_IM UNIQUE
(
  DC_K, IM_TP_DM
);

CREATE TABLE CS_90_WF_BLB
   (	ROW_KEY NUMBER(38,0), 
	DC_K NUMBER(38,0), 
	BLB_REF VARCHAR2(50 BYTE), 
	TP_DM VARCHAR2(1 BYTE), 
	WF_BLB BLOB, 
	CTC_K NUMBER, 
	CUS_K NUMBER
   );
   
CREATE TABLE WF_00_00_EML 
   (	SMTP_HST VARCHAR2(30 BYTE), 
	SMTP_PRT VARCHAR2(30 BYTE), 
	FRM_EML VARCHAR2(100 BYTE), 
	AUTH_ACT VARCHAR2(100 BYTE), 
	AUTH_PWD VARCHAR2(30 BYTE), 
	TLS_YN VARCHAR2(1 BYTE), 
	MAX_RTRY_NO NUMBER(3,0), 
	MAX_DYS NUMBER(3,0), 
	SMTP_AUTH_YN VARCHAR2(1 BYTE), 
	WLT_PTH VARCHAR2(100 BYTE), 
	WLT_PWD VARCHAR2(30 BYTE), 
	R_K NUMBER(38,0), 
	EHLO_YN VARCHAR2(1 BYTE)
   );   
   
CREATE TABLE WF_10_EML 
   (	R_K NUMBER(38,0), 
	TO_EML VARCHAR2(100 BYTE), 
	EML_SBJ VARCHAR2(100 BYTE), 
	EML_BDY_TXT VARCHAR2(2000 BYTE), 
	EML_BDY_HTML CLOB, 
	SND_CNT NUMBER(3,0), 
	INT_SND_DT DATE, 
	LST_SND_DT DATE, 
	SND_UPD VARCHAR2(500 BYTE), 
	CUS_ID VARCHAR2(30 BYTE), 
	CUS_NME VARCHAR2(300 BYTE)
   );

   CREATE TABLE WF_00_EML 
   (	R_K NUMBER(38,0) NOT NULL ENABLE, 
	EML_ID VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	EML_DSC VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	EML_SBJ VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	EML_CTT CLOB, 
	EML_ITR CLOB, 
	IUS_YN VARCHAR2(1 BYTE) NOT NULL ENABLE, 
	RPY_ADR VARCHAR2(100 BYTE), 
	CC_1 VARCHAR2(100 BYTE), 
	CC_2 VARCHAR2(100 BYTE), 
	CC_3 NUMBER
   );


