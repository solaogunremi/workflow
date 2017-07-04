-- General Errors
 DECLARE
   v_k NUMBER;
 PROCEDURE pr_upd (pi_id VARCHAR2, pi_msg VARCHAR2, pi_pcnt PLS_INTEGER DEFAULT 0) IS
   v_id   VARCHAR2(10) := LPAD(pi_id,6,'0');
   v_apl  VARCHAR2(10) := '00';
 BEGIN
    UPDATE wf_00_00_erd SET 
      err_msg = pi_msg,
      plh_cnt = pi_pcnt
    WHERE err_id = v_id;
    IF SQL%NOTFOUND THEN
      INSERT INTO wf_00_00_erd (row_key, err_id, err_msg, plh_cnt) VALUES (pkwf_00_00.fn_rk, v_id, pi_msg, pi_pcnt);
    END IF;
 END;
BEGIN
  --
  pr_upd('0','Action processed.');
  pr_upd('1','%p1% not found. %p2%',2);
  pr_upd('2','%p1% duplicated. %p2%',2);
  pr_upd('3','%p1% already exists. %p2%',2);
  pr_upd('4','%p1% already defined. %p2%',2);
  pr_upd('5','%p1% not allowed. %p2%',2);
  pr_upd('6','%p1% not valid. %p2%',2);
  pr_upd('7','%p1% already in use. %p2%',2);
  pr_upd('8','%p1% not in use. %p2%',2);
  pr_upd('9','%p1% no longer in use. %p2%',2);
  pr_upd('10','%p1% is required. %p2%',2);
  pr_upd('11','Invalid %p1%.',1);  
  --
  pr_upd('12','%p1% should be greater than zero. %p2%',2);
  pr_upd('13','%p1% should be less than zero. %p2%',2);
  pr_upd('14','%p1% should equal zero. %p2%',2);
  pr_upd('15','%p1% should not be greater than zero. %p2%',2);
  pr_upd('16','%p1% should not be less than zero. %p2%',2);
  pr_upd('17','%p1% should be greater than %p2%. %p3%',3);
  pr_upd('18','%p1% should be less than %p2%. %p3%',3);
  pr_upd('19','%p1% should equal %p2%. %p3%',3);
  pr_upd('20','%p1% should not be greater than %p2%. %p3%',3);
  pr_upd('21','%p1% should not be less than %p2%. %p3%',3);
  pr_upd('22','%p1% should not equal %p2%. %p3%',3); 
  pr_upd('23','%p1% should be a whole number without fractions. %p2%',2); 
  --
  pr_upd('24','%p1% should be later than today. %p2%',2);
  pr_upd('25','%p1% should be earlier than today. %p2%',2);
  pr_upd('26','%p1% should be same as today''s date. %p2%',2);
  pr_upd('27','%p1% should not be later than today. %p2%',2);
  pr_upd('28','%p1% should be not earlier than today. %p2%',2);
  pr_upd('29','%p1% should be later than %p2%. %p3%',3);
  pr_upd('30','%p1% should be earlier than %p2%. %p3%',3);
  pr_upd('31','%p1% should be same as %p2%. %p3%',3); 
  pr_upd('32','%p1% should not be later than %p2%. %p3%',3);
  pr_upd('33','%p1% should be not earlier than %p2%. %p3%',3);  
  --
  pr_upd('34','%p1% is not a valid monetary amount. %p2%',2); 
  pr_upd('35','%p1% should not exceed %p2% characters. %p3%',3);
  pr_upd('36','%p1% should not be less than %p2% characters. %p3%',3);
  pr_upd('37','%p1% should equal %p2% characters. %p3%',3);
  --  
  pr_upd('38','Record already approved.');
  pr_upd('39','Record is pending approval.');
  pr_upd('40','Record status is invalid.');
  pr_upd('41','Record already rejected.'); 
  pr_upd('42','Record is pending final approval.'); 
  pr_upd('43','Record has not been submitted for approval.');   
  pr_upd('44','Record approval in progress. Modifications not allowed.'); 
  pr_upd('45','Record approval in progress. %p1%',1);   
  pr_upd('46','Record already submitted for approval. Modifications not allowed.'); 
  pr_upd('47','Record has been deleted. Further processing not allowed.'); 
  pr_upd('48','Record has been deleted. %p1%',1); 
  pr_upd('49','%p1% has been deleted. Further processing not allowed.',1); 
  pr_upd('50','%p1% has been deleted. %p2%',2); 
  pr_upd('51','%p1% no longer exists. %p2%',2); 
  -- 
  pr_upd('52','%p1% is reserved for internal use. %p2%',2);  
  pr_upd('53','%p1% already approved. %p2%',2); 
  pr_upd('54','You are not authorized to approve the same record that you also edited and posted.'); 
  pr_upd('55','%p1% not defined. %p2%',2); 
  --
  pr_upd('56','Invalid Login Attempt.'); 
  pr_upd('57','Invalid Username or Password.'); 
  pr_upd('58','Your account is locked.'); 
  pr_upd('59','Access from this location is prohibited.'); 
  pr_upd('60','Access from this location is not authorized.');   
  pr_upd('61','Your Password has expired.');   
  pr_upd('62','New Username should not be same as Current Username.');   
  pr_upd('63','You may not reset your own password. Use the Change Password Screen instead.');   
  pr_upd('64','New Password should not be same as Current Password.');   
  pr_upd('65','Password has been used before and may not reused.');   
  pr_upd('66','You cannot alter another person''s username or password.');   
  pr_upd('67','New Password and Confirm New Password must be same.');   
  pr_upd('68','%p1% record not found.',1);   
  pr_upd('69','Record details not found.'); 
  --
  pr_upd('70','You cannot alter your own account status.');   
  pr_upd('71','User Account is already locked.');   
  pr_upd('72','User Account is already active.');   
  pr_upd('73','Operation not applicable to the System Administrator.');  
  pr_upd('74','%p1% not approved. %p2%',2); 
  pr_upd('75','New Password should not be same or similar to Username.'); 
  pr_upd('76','New Password should not be shorter than %p1% characters.',1); 
  pr_upd('77','New Password should not be a reversal (back-spelling) of the Username.');
  pr_upd('78','New Password is too simple and easy to hack.');
  pr_upd('79','New Password should begin with an alphabet.');
  -- 
  pr_upd('80','%p1% is prohibited and should not be used.',1);  
  pr_upd('81','%p1% should contain a minimum of %p2%.',2);   
  pr_upd('82','%p1% should contains an invalid %p2% character/symbol.',2);    
  pr_upd('83','New Password should differ from the previous password by at least %p1% characters.',1);   
  pr_upd('84','This process should not be executed from this application.'); 
  pr_upd('85','%p1% has been modified by another user. Please refresh.',1); 
  --
  pr_upd('86','%p1% may not be used for %p2%.',2);
  pr_upd('87','%p1% has not been defined %p2%.',2);
  pr_upd('88','%p1% has not been defined or enabled %p2%.',2);
  pr_upd('89','%p1% does not exist %p2%.',2);
  pr_upd('90','%p1% differs from %p2% %p3%.',3);
  --
  pr_upd('91','%p1% belongs to a different %p2% %p3%.',3);
  pr_upd('92','%p1% has already been %p2%.',2);
  pr_upd('93','%p1% is not a valid %p2%.',2);
  pr_upd('94','%p1% has been %p2%.',2);
  pr_upd('95','%p1% is already %p2%. %p3%',3);
  pr_upd('96','%p1% is invalid %p2%.',2);
  pr_upd('97','%p1% has not been %p2%. %p3%',3);
  pr_upd('98','%p1% is only applicable to %p2%. %p3%',3);
  --  
  pr_upd('100','You are not authorized to execute this process.'); 
  pr_upd('101','You are not authorized to edit this record.'); 
  pr_upd('102','You are not authorized to modify this record.'); 
  pr_upd('103','You are not authorized to delete this record.'); 
  pr_upd('104','You are not authorized to approve this record.'); 
  pr_upd('105','You are not authorized to create new records here.'); 
  pr_upd('106','You are not authorized to access this function.'); 
  pr_upd('107','You are not authorized to access this Business Group.'); 
  pr_upd('108','You are not authorized to access this Company.'); 
  pr_upd('109','You are not authorized to access this Business Unit.'); 
  pr_upd('110','You are not authorized to access this module.'); 
  pr_upd('111','You do not have the privilege required for this operation.'); 
  pr_upd('112','System is currently running in restricted mode. %p1%',1); 
  pr_upd('113','Your current session is not authenticated.'); 
  pr_upd('114','Your current session is not valid.'); 
  pr_upd('115','Unauthorized program or connection.'); 
  pr_upd('116','Your Organization is not licensed to use this application.'); 
  pr_upd('117','Your Organization is not licensed to define multiple companies.'); 
  pr_upd('118','Your Organization is not licensed to define more than %p1% companies.',1); 
  pr_upd('119','Your Organization is not licensed to use this module.'); 
  pr_upd('120','Your Organization has reached the limit of licensed number of users.'); 
  pr_upd('121','Your Organization''s Licence to use this application has expired.'); 
  pr_upd('123','Your Organization''s Licence to use this application will expire in %p1% days.',1); 
  pr_upd('124','Your Organization''s Licence to use this application will expire tomorrow.'); 
  pr_upd('125','System Administrator is not authorized to access this function.');
  pr_upd('126','System Administrator is not authorized to execute this process.');
  pr_upd('127','Unauthorized modification of system-maintained data detected! Further processing halted.');
  pr_upd('128','Only the System Administrator is authorized to access this function.');
  pr_upd('129','Only Administrators are authorized to access this function.');
  --
  pr_upd('130','Record edit not allowed.'); 
  pr_upd('131','Record modification not allowed.'); 
  pr_upd('132','Record deletion not allowed.'); 
  pr_upd('133','Record approval not applicable.'); 
  pr_upd('134','Record creation not allowed.'); 
  --
  pr_upd('135','Business Group record not found.');
  pr_upd('136','Company record not found.');  
  pr_upd('137','Another Company within the Group has already been defined as the "Consolidation" Company.');  
  pr_upd('138','Post-Authentication processing failed. [%p1%] [%p2%] [%p3%].',3); 
  pr_upd('139','You are not authorized to access the application at this time.');
  pr_upd('140','Access to the company at this time is not authorized.');
  --
  pr_upd('141','Invalid installation: System Administrator record not created.');
  pr_upd('142','Invalid installation: System Administrator record missing or deleted!!!');
  pr_upd('143','Invalid installation: System Administrator record has been altered!!!');
  pr_upd('144','Invalid installation: System Administrator login is locked!!!');
  pr_upd('145','Internal Administrator password has not been set. Further processing not allowed.');
  pr_upd('146','Internal Administrator is not authorized to execute this process.');
  pr_upd('147','Creation of multiple Business Groups is not permitted for this installation.'); 
  pr_upd('148','Application Login Authentication failed.'); 
  pr_upd('149','This Company is not licensed to use this module.');
  pr_upd('150','This Business Unit (Branch) does not belong to the Company.');    
  --
  pr_upd('151','Business Unit (Branch) record not found.');
  pr_upd('152','You have not yet been assigned to any Company. Access not allowed.'); 
  pr_upd('153','You are not authorized to access %p1% %p2%.',3); 
  pr_upd('154','You are not currently connected to %p1% %p2% %p3%.',3); 
  pr_upd('155','You are not allowed to access or process %p1% that belongs to another Company which you are not currently connected to.',3); 
  pr_upd('156','%p1% validation failed; further processing not allowed.'); 
  pr_upd('157','You may only access or process records belonging to the Company you are currently connected to.'); 
  pr_upd('158','Front-End Page process is attempting to execute the wrong internal procedure. Please inform the System Administrator.');
  pr_upd('159','%p1% should not be same as %p2%. %p3%',3); 
  pr_upd('160','Update is currently not in progress. Program execution not allowed.',0); 
  pr_upd('161','Another record exists that is pending and has not been approved. First, it should be approved or deleted before posting a new one.',0); 
  pr_upd('162','%p1% is not yet due since %p2% is still in future i.e. later than the Current Business Date.',2); 
  pr_upd('163','%p1% %p2% has already been posted and approved. Duplicates not allowed.',2); 
  pr_upd('164','%p1% is still in future i.e. later than the Current Business Date, therefore %p2% is not allowed.',2); 
  pr_upd('165','Record has already been verified and may no longer be modified. Either it is approved or it is deleted and reposted afresh.',0); 
  pr_upd('166','%p1% has already been verified. %p2%',2); 
  pr_upd('167','You are not authorized to verify this record.'); 
  pr_upd('168','%p1% has not yet been verified. Processing not allowed.',1);
  --
  pr_upd('169','%p1% Update is currently in progress. Processing not allowed.',1); 
  pr_upd('170','%p1% Update for the current business date has not executed. Processing not allowed.',1); 
  pr_upd('171','Last %p1% Update was not completely and successfully executed! No further processing is allowed until Update is completed.',1); 
  pr_upd('172','A pending %p1% record %p2% exists; it should first be approved or deleted before creating another new record.',2); 
  pr_upd('173','A pending %p1% record %p2% exists; it should first be approved or deleted before proceeding with this operation.',2); 
  --
  pr_upd('200','Connection to Email SMTP Server does not exist.');
  pr_upd('201','Email SMTP Server Error Code "%p1%". Refer to UTL_SMTP documentation for more details.',3);
  pr_upd('202','Email Message MIME "%p1%" is not recognised and therefore cannot be processed.',3);
  pr_upd('203','Email UTL_SMTP %p1% %p2% %p3%',3); 
  --  
  --
END;
/

-- ST Errors
DECLARE
  PROCEDURE pr_upd (pi_id VARCHAR2, pi_msg VARCHAR2, pi_pcnt PLS_INTEGER DEFAULT 0) IS
   v_id   VARCHAR2(10) := 'WF'||LPAD(pi_id,4,'0');
   v_apl  VARCHAR2(10) := 'WF';
 BEGIN
    UPDATE wf_00_00_erd SET 
      err_msg = pi_msg,
      plh_cnt = pi_pcnt
    WHERE err_id = v_id;
    IF SQL%NOTFOUND THEN
      INSERT INTO wf_00_00_erd (row_key, err_id, err_msg, plh_cnt) VALUES (pkwf_00_00.fn_rk, v_id, pi_msg, pi_pcnt);
    END IF;
  END;
BEGIN
  --
  NULL;
  pr_upd('1','Normal Completion',0);
  --
END;
/

COMMIT
/
