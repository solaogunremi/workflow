alter table T_99_00_ERR disable all triggers
/
DECLARE
    --
    v_rk         NUMBER;
    v_mdl_dm     VARCHAR2(5) := '99';
    --
    FUNCTION fn_rk RETURN NUMBER IS
      v_k  NUMBER;
    BEGIN
      SELECT S_99_00_RK.NEXTVAL INTO v_k FROM DUAL;
      RETURN v_k;
    END fn_rk;
    --
    PROCEDURE pr_mnt (pi_err_id VARCHAR2, pi_err_msg VARCHAR2, pi_plh_cnt NUMBER DEFAULT 0) IS
    BEGIN
      UPDATE T_99_00_ERR SET
        err_msg = pi_err_msg,
        plh_cnt = pi_plh_cnt
      WHERE err_id = pi_err_id;
      IF SQL%NOTFOUND THEN
        v_rk := fn_rk;
        INSERT INTO T_99_00_ERR
        (r_k, mdl_dm, err_id, err_msg, plh_cnt)
        VALUES
        (v_rk, v_mdl_dm, pi_err_id, pi_err_msg, pi_plh_cnt);
      END IF;
    END pr_mnt;
    --
 BEGIN
  --
   pr_mnt('990000','Action processed.',0);
   pr_mnt('990001','One or more mandatory inputs not defined.',0);
   pr_mnt('990002','Invalid Program.',0);
   pr_mnt('990003','System Parameters not defined.',0);
   pr_mnt('990004','Internal Error: Invalid Inter-Process [%p1%] Call.',1);
   pr_mnt('990005','Invalid Username or Password',0);
   pr_mnt('990006','Your account is locked. ',0);
   pr_mnt('990007','Access from this location is prohibited.',0);
   pr_mnt('990008','Access from this location is not authorized.',0);
   pr_mnt('990009','Your Password has expired. ',0);
   pr_mnt('990010','Record creation not allowed.',0);
   pr_mnt('990011','You do not have the privilege to create records here.',0);
   pr_mnt('990012','Record modification not allowed.',0);
   pr_mnt('990013','You do not have the privilege to modify this record.',0);
   pr_mnt('990014','Record deletion not allowed.',0);
   pr_mnt('990015','You do not have the privilege to delete this record.',0);
   pr_mnt('990016','Record approval not applicable.',0);
   pr_mnt('990017','You are not authorized to approve this record.',0);
   pr_mnt('990018','Record already approved.',0);
   pr_mnt('990019','Printing not applicable.',0);
   pr_mnt('990020','You do not have the privilege to print this report.',0);
   pr_mnt('990021','Record edit not allowed.',0);
   pr_mnt('990022','You are not authorized to edit or create new records here.',0);
   pr_mnt('990023','You do not have the privilege to access this function.',0);
   pr_mnt('990024','System access is currently restricted.',0);
   pr_mnt('990025','Administrator privilege required for this operation.',0);
   pr_mnt('990026','%p1% has already been rejected.',1);
   pr_mnt('990027','%p1% is pending approval. %p2%',1);
   pr_mnt('990028','Record status is invalid and cannot be processed.',0);
   pr_mnt('990029','You cannot alter another person''s username or password.',0);
   pr_mnt('990030','New Username should not be same as the Current Username.',0);
   pr_mnt('990031','Invalid Installation [1].',0);
   pr_mnt('990032','Invalid Installation [2].',0);
   pr_mnt('990033','Invalid or unauthorized connection.',0);
   pr_mnt('990034','Session Identifier not found.',0);
   pr_mnt('990035','Your session is not authenticated.',0);
   pr_mnt('990036','Post-Authentication processing failed. %p1% %p2% %p3%',3);
   pr_mnt('990037','Password has been used before and may not reused again.',0);
   pr_mnt('990038','New Password and Confirm New Password must be same.',0);
   pr_mnt('990039','New Password should not be same as Current Password',0);
   pr_mnt('990040','Login ID %p1% is already in use.',1);
   pr_mnt('990041','Length of Login ID should not be less than %p1%.',1);
   pr_mnt('990042','Length of Password should not be less than %p1%.',1);
   pr_mnt('990043','Password should contain at least %p1% number(s).',1);
   pr_mnt('990044','Password same as or similar to Login ID.',0);
   pr_mnt('990045','Password same as Login ID reversed.',0);
   pr_mnt('990046','Password same as or similar to Server Name.',0);
   pr_mnt('990047','Password too simple or contains easy-to-guess phrase.',0);
   pr_mnt('990048','Password should begin with an alphabet.',0);
   pr_mnt('990049','Password is prohibited and not allowed.',0);
   pr_mnt('990050','Password should contain at least %p1% non-alphabetic character(s).',1);
   pr_mnt('990051','Password contains an invalid character %p1%.',1);
   pr_mnt('990052','Password should differ from the old password by at least 3 characters.',0);
   pr_mnt('990053','%p1% not permitted for use as User ID.',1);
   pr_mnt('990054','Reporting ID %p1% already in use.',1);
   pr_mnt('990055','Email Address %p1% already in use.',1);
   pr_mnt('990056','%p1% is not a valid Email Address.',1);
   pr_mnt('990057','Invalid User Category.',0);
   pr_mnt('990058','Invalid User Status.',0);
   pr_mnt('990059','Invalid Address Country.',0);
   pr_mnt('990060','%p1% not found.',1);
   pr_mnt('990061','%p1% Record key %p2% not found.',2);
   pr_mnt('990062','%p1% duplicated.',1);
   pr_mnt('990063','Record key %p1% duplicates found.',1);
   pr_mnt('990064','Record not found.',0);
   pr_mnt('990065','Duplicate records found.',0);
   pr_mnt('990066','%p1% is required.',1);
   pr_mnt('990067','%p1% data not found.',1);
   pr_mnt('990068','Data not found.',0);
   pr_mnt('990069','Required data not found.',0);
   pr_mnt('990070','%p1% already in use. Duplicates not allowed.',1);
   pr_mnt('990071','%p1% is reserved and may not be used.',1);
   pr_mnt('990072','Date of Birth cannot be in future.',0);
   pr_mnt('990073','%p1% should be greater than zero.',1);
   pr_mnt('990074','%p1% should be less than zero.',1);
   pr_mnt('990075','%p1% should equal zero.',1);
   pr_mnt('990076','%p1% should be a whole number without fractions.',1);
   pr_mnt('990077','%p1% should be greater than %p2%.',2);
   pr_mnt('990078','%p1% should be less than %p2%.',2);
   pr_mnt('990079','%p1% should equal %p2%.',2);
   pr_mnt('990080','%p1% should be earlier than today.',1);
   pr_mnt('990081','%p1% should be later than today.',1);
   pr_mnt('990082','%p1% should be same as today''s date.',1);
   pr_mnt('990083','%p1% should be earlier than %p2%.',2);
   pr_mnt('990084','%p1% should be later than %p2%.',2);
   pr_mnt('990085','%p1% should be same as %p2%.',2);
   pr_mnt('990086','%p1% should not be less than zero.',1);
   pr_mnt('990087','%p1% should not be greater than zero.',1);
   pr_mnt('990088','%p1% should not be earlier than today.',1);
   pr_mnt('990089','%p1% should not be later than today.',1);
   pr_mnt('990090','%p1% should not be earlier than %p2%.',2);
   pr_mnt('990091','%p1% should not be later than %p2%.',2);
   pr_mnt('990092','%p1% is not a valid monetary amount.',1);
   pr_mnt('990093','You may not reset your own password. Use the Change Password Screen instead.',0);
   pr_mnt('990094','User does not exist or has been removed.',0);
   pr_mnt('990095','User Account is locked. Processing not allowed.',0);
   pr_mnt('990096','User Account is active. Processing not allowed.',0);
   pr_mnt('990097','You may not alter your own account status. Operation not allowed.',0);
   pr_mnt('990098','Invalid Data Input.',0);
   pr_mnt('990099','You do not have privilege to execute this operation.',0);
   --
   pr_mnt('990100','[P1=%p1%] [P2=%p2%] [P3=%p3%] [P4=%p4%] [P5=%p5%]',5);
   pr_mnt('990101','Invalid %p1% %p2% %p3%.',3);
   pr_mnt('990102','%p1% should not be greater than %p2%.',2);
   pr_mnt('990103','%p1% should not be less than %p2%.',2);
   pr_mnt('990104','Invalid Gender Type',0);
   pr_mnt('990105','Invalid Frequency Interval',0);
   pr_mnt('990106','Invalid Verification Credentials.',0);
   pr_mnt('990107','Invalid %p1% Password.',1);
   pr_mnt('990108','Default Email Server connection parameters have not been defined.',0);
   pr_mnt('990109','Host Email Server [%p1%] connection parameters have not been defined.',1);
   pr_mnt('990110','Host Email Server [%p1%] connection is no longer in use.',1);
   --
   pr_mnt('990111','Default %p1% has already been defined. Duplicates not allowed.',1);
   pr_mnt('990112','%p1% is not valid or is not in use.',1);
   pr_mnt('990113','Application is running in query-only mode. Update not allowed.',0);
   pr_mnt('990114','You are not authorized to approve the same record that you created or edited.',0);
   pr_mnt('990115','You are not authorized to access this application.',0);
   pr_mnt('990116','You are not authorized to verify this record.',0);
   pr_mnt('990117','Your Password has expired and should be changed immediately before proceeding.',0);
   pr_mnt('990118','Your user profile has just been updated; therefore you should logout and reconnect again.',0);
   pr_mnt('990119','%p1% has already been approved. %p2%',2);
   pr_mnt('990120','%p1% not valid.',1);
   --
   pr_mnt('990121','%p1% has been deleted.',1);
   pr_mnt('990122','You are not authorized to execute this internal operation.',0);
   pr_mnt('990123','Your login session requires access verification before proceeding with this operation',0);
   pr_mnt('990124','%p1% not in use.',1);
   pr_mnt('990125','Your organization is not licensed to use this application.',0);
   pr_mnt('990126','Application Module %p1% is restricted to only Administrators and as such should not be assigned to Non-Administrators.',1);
   pr_mnt('990127','Application Sub-Module %p1% is restricted to only Administrators and as such should not be assigned to Non-Administrators.',1);
   pr_mnt('990128','"%p1%" role is restricted to only Administrators and as such should not be assigned to Non-Administrators.',1);   
   pr_mnt('990129','%p1% does not belong to %p2%. Processing not allowed.',2);
   pr_mnt('990130','Application Sub-Module %p1% is invalid or it does not belong to the selected Module.',1);
   --
   pr_mnt('990131','"%p1%" role is invalid or it does not belong to the selected Module/Sub-Module.',1);
   pr_mnt('990132','Posting of %p1% email message into the messaging queue failed. %p2%',2);
   pr_mnt('990133','Sending of %p1% email message to the email server failed. %p2%',2);
   pr_mnt('990134','%p1% not defined.',1);
   pr_mnt('990135','As a precaution against unintentional deletion of valid accounts, it is required that an account is first locked before proceeding with its final deletion.',0);
   --
   pr_mnt('990136','You are not authorized to access this sub-module.',0);
   pr_mnt('990137','You are not authorized to verify the same record that you created or edited.',0);
   pr_mnt('990138','System Administrators are not authorized to access this application.',0);
   pr_mnt('990139','Privileges have not yet been granted to this Access Role. This should be done first before proceeding to assign users to the role.',0);
   pr_mnt('990140','%p1% is restricted to only Administrators and as such should not be assigned to %p2% who is not an Adminstrator.',2);   
   --
   pr_mnt('990141','%p1% is excluded from Administrators and as such should not be assigned to %p2%.',2);  
   pr_mnt('990142','%p1% does not have the privilege to access %p2% application.',2); 
   pr_mnt('990143','%p1% does not have the privilege to access %p2% sub-module.',2);    
   pr_mnt('990144','This operation is not allowed on the default SETUP administrator account.',0);  
   pr_mnt('990145','You do not have the required privilege %p1%.',1);
   pr_mnt('990146','An Oracle database schema with this name already exists; therefore it cannot be used as a new user login id.',0);
   pr_mnt('990147','SYM-SA Interface validation failed: A user with this name already exists; therefore it cannot be used again for a new user.',0);   
   pr_mnt('990148','SYM-SA Interface validation failed: %p1% %p2%.',2);   
   pr_mnt('990149','Since SYM-SA module is currently in use, change of Login ID will result in failure to access some legacy applications. %p1%',1);   
   pr_mnt('990150','This is the default system-defined %p1% which may not be updated or modified. Processing not allowed.',1);  
   --
   pr_mnt('990151','%p1% Update is currently in progress. Processing not allowed.',1); 
   pr_mnt('990152','%p1% Update for the current business date has not executed. Processing not allowed.',1); 
   pr_mnt('990153','Last %p1% Update was not completely and successfully executed! No further processing is allowed until Update is completed.',1);   
   pr_mnt('990154','%p1% not allowed.',1);
   pr_mnt('990155','%p1% not authorized to access %p2%.',2);
   --  
   pr_mnt('990200','The number of registered users have exceeded the licensed number of users! Please inform the System Administrator.',0);
   --  
 END;
/

commit
/

alter table T_99_00_ERR enable all triggers
/

