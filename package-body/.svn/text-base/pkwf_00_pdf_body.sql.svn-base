CREATE OR REPLACE PACKAGE BODY pkwf_00_pdf AS
  --
  /* Created By       : Aderemi Alabi 
  ** Date Created     : 19-MAR-2016
  **
  ** PURPOSE: WF PDF Management
  **
  ** MODIFICATION HISTORY:
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **
  **    Modified By   :
  **    Date          :
  **    Version       :
  **    Remarks       :
  **  
  ** Copyright:  Neulogic Solutions Ltd, 2016
  **
  */
  --
  /* Private Routines */
  --
  /* Public Routines */
  --
  --
  PROCEDURE pr_get_pdf IS
    --
    v_mime  VARCHAR2(48) := 'application/pdf'; --'application/octet'  
    v_len   NUMBER;  
    v_file  VARCHAR2(2000);  
    v_blob  BLOB; 
    --
    CURSOR c_blob IS
      SELECT  file_name, pdf_file, DBMS_LOB.GETLENGTH(pdf_file) 
      FROM    wf_00_pdf;
    --  
  BEGIN
    --
    OPEN  c_blob;
    FETCH c_blob INTO v_file, v_blob, v_len;
    CLOSE c_blob;
    --
    owa_util.mime_header(v_mime, FALSE);
    htp.p('Content-length: ' || v_len);
    htp.p('Content-Disposition:  inline; filename="'||
             replace(replace(substr
                 (v_file,instr(v_file,'/')+1),chr(10),null),
                 chr(13),null)|| '"');  
    owa_util.http_header_close;
    wpg_docload.download_file(v_blob); 
    --         
  END pr_get_pdf;
  --
END pkwf_00_pdf; 
/
