ALTER TABLE T_99_00_MSG DISABLE ALL TRIGGERS
/

Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141257,'99-000',NULL,
'WORKFLOW Application Email Test',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">This is a test message generated from WORKFLOW application.</p>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Please ignore and do not reply. </p>
 </td></tr><tr></tr><tr></tr><tr></tr>
"',0,1);
Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141274,'99-001',NULL,
'WORKFLOW Application Login Account',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">An account has been created for you to access the WORKFLOW application with the following parameters:</p>
 </td></tr><tr></tr>
 </table>
 <table width ="200">
 <tr><td colspan="1"><span style="font-size:15px;"><b>Login ID: </b></span></td><td align="left">%p1%</td> </tr>
 <tr><td colspan="1"><span style="font-size:15px;"><b>Password: </b></span></td><td>%p2%</td></tr>
 <tr></tr><tr></tr>
 </table>
 <table width ="700">
 <tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">You are required to login immediately and change your password.</p>
 </td></tr>
 </table>
"',2,1);
Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141291,'99-002',NULL,
'WORKFLOW Application Password Reset',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Your password used to access the WORKFLOW application has been reset to the following:</p>
 </td></tr><tr></tr><tr></tr>
 </table>
 <table width ="200">
 <tr><td colspan="1"><span style="font-size:15px;"><b>New Password: </b></span></td><td align="left">%p1%</td> </tr>
 <tr></tr><tr></tr>
 </table>
 <table width ="700">
 <tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">You are required to login immediately and change this password.</p>
 </td></tr>
 </table>
"',1,1);
Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141308,'99-003',NULL,
'WORKFLOW Application Account Deactivation',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Your WORKFLOW application account has been locked and deactivated.</p>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Please inform the System Administrator to unlock and reactivate your account.</p>
 </td></tr><tr></tr><tr></tr><tr></tr>
 </table>
"',0,1);
Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141325,'99-004',NULL,
'WORKFLOW Application Account Reactivation',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Your WORKFLOW application account has been reactivated and is now unlocked.</p>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">You are required to login immediately and change your password.</p>
 </td></tr><tr></tr><tr></tr><tr></tr>
 </table>
"',0,1);
Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141342,'99-005',NULL,
'WORKFLOW Application Password Change',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Your WORKFLOW application password has just been altered.</p>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Please inform the System Administrator at once if this action was not executed by yourself.</p>
 </td></tr><tr></tr><tr></tr><tr></tr>
 </table>
"',0,1);
Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141359,'99-006',NULL,
'WORKFLOW Application Login ID Modification',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Your WORKFLOW application Login ID has just been altered as follows:</p>
 </table>
 <table width ="200">
 <tr><td colspan="1"><span style="font-size:15px;"><b>Old Value: </b></span></td><td align="left">%p1%</td> </tr>
 <tr></tr>
 <tr><td colspan="1"><span style="font-size:15px;"><b>New Value: </b></span></td><td align="left">%p2%</td> </tr>
 <tr></tr>
 </table>
 <table width ="700">
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Please inform the System Administrator at once if this action was not executed by yourself.</p>
 </td></tr><tr></tr><tr></tr><tr></tr>
 </table>
"',2,1);
Insert into T_99_00_MSG (R_K,MSG_ID,SNDR_ADR,MSG_SBJ,MSG_BDY,PLH_CNT,IUS_YN) values (141376,'99-007',NULL,
'WORKFLOW Application Email Address Modification',
'"<table width ="700"><tr><td>
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Your WORKFLOW application email address has just been altered as follows:</p>
 </table>
 <table width ="400">
 <tr><td colspan="1"><span style="font-size:15px;"><b>Old Value: </b></span></td><td align="left">%p1%</td> </tr>
 <tr></tr>
 <tr><td colspan="1"><span style="font-size:15px;"><b>New Value: </b></span></td><td align="left">%p2%</td> </tr>
 <tr></tr>
 </table>
 <table width ="700">
 <p style="font-family:arial;color:black;font-size:15px;text-align:left">Please inform the System Administrator at once if this action was not executed by yourself.</p>
 </td></tr><tr></tr><tr></tr><tr></tr>
 </table>
"',2,1);
COMMIT
/

ALTER TABLE T_99_00_MSG ENABLE ALL TRIGGERS
/