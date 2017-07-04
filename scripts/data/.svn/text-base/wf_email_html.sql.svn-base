SET DEFINE OFF
DECLARE
  vr wf_00_eml%ROWTYPE;
BEGIN
  -- 
  vr := NULL;
  vr.eml_ctt := q'<p>Dear #CUSTOMERNAME#,</p>

  <p>You online access password has been reset.&nbsp;</p>

  <p>New Password : #PASSWORD#</p>

  <p>Thank you.</p>';
  vr.eml_itr := NULL;
  UPDATE wf_00_eml
  SET    eml_ctt = vr.eml_ctt,
         eml_itr = vr.eml_itr
  WHERE  eml_id = 'PWD-RST';
  COMMIT;
  -- 
  vr := NULL;
  vr.eml_ctt := q'<p>Dear #APPLICANT#,</p> <p>Your application has been received successfully. It currently under consideration and we will revert to you shortly</p> 
                  
                  <p>Thank you.</p>';
  vr.eml_itr := NULL;
  UPDATE wf_00_eml
  SET    eml_ctt = vr.eml_ctt,
         eml_itr = vr.eml_itr
  WHERE  eml_id = 'OB_RCPT';
  COMMIT;
  --
  vr := NULL;
  vr.eml_ctt := q'<p>Dear #CUSTOMERNAME#,</p> <p>You online access has been created. The details provided are</p> 
                  <p>LOGIN ID # : #LOGINID#</p> 
                  <p>Password : #PASSWORD#</p>  
                  
                  <p>Thank you.</p>';
  vr.eml_itr := NULL;
  UPDATE wf_00_eml
  SET    eml_ctt = vr.eml_ctt,
         eml_itr = vr.eml_itr
  WHERE  eml_id = 'NEW-USR';
  COMMIT;
  --
END;