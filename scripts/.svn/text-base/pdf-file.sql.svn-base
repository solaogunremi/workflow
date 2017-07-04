DECLARE
  v_length    NUMBER;
  v_file_name VARCHAR2(200);
  v_pdf_file  BLOB;
  v_mime      VARCHAR2(48) := 'application/pdf';
BEGIN
  --
  v_file_name := :AAID || '.pdf';
  BEGIN
    SELECT  dc_blb, dbms_lob.getlength(dc_blb)
    INTO    v_pdf_file, v_length       
    FROM    wf_20_dc
    WHERE   dc_id = :APPID;
    htp.init;
    OWA_UTIL.MIME_HEADER(v_mime, FALSE);
    htp.p('Content-Disposition: inline; filename="' || v_file_name || '"');
    owa_util.http_header_close;
    wpg_docload.download_file(v_pdf_file);
    apex_application.g_unrecoverable_error:= true;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_pdf_file  := EMPTY_BLOB();
      v_length    := dbms_lob.getlength(v_pdf_file);
      v_file_name := 'file_not_found.pdf';
    WHEN OTHERS THEN
      v_pdf_file  := EMPTY_BLOB();
      v_length    := dbms_lob.getlength(v_pdf_file);
      v_file_name := 'file_not_found.pdf';
  END;    
  --
  
  --
end;