set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_default_workspace_id=>21902084923961395
);
end;
/
prompt  Set Application Offset...
begin
   -- SET APPLICATION OFFSET
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(25038827731319903)
,p_name=>'wf.get.workflow.local'
);
 
end;
/
prompt --application/restful_services/wf_get_workflow_local
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(25038827731319903)
,p_name=>'wf.get.workflow.local'
,p_uri_prefix=>'api/'
,p_parsing_schema=>'WF'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>9
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(25038944196319904)
,p_module_id=>wwv_flow_api.id(25038827731319903)
,p_uri_template=>'pdf/{APPID}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(25039098410319907)
,p_template_id=>wwv_flow_api.id(25038944196319904)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_length    NUMBER;',
'  v_file_name VARCHAR2(200);',
'  v_pdf_file  BLOB;',
'  v_mime      VARCHAR2(48) := ''application/pdf'';',
'BEGIN',
'  --',
'  v_file_name := :AAID || ''.pdf'';',
'  BEGIN',
'    SELECT  dc_blb, dbms_lob.getlength(dc_blb)',
'    INTO    v_pdf_file, v_length       ',
'    FROM    wf_20_dc',
'    WHERE   dc_id = :APPID;',
'    htp.init;',
'    OWA_UTIL.MIME_HEADER(v_mime, FALSE);',
'    htp.p(''Content-Disposition: inline; filename="'' || v_file_name || ''"'');',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_pdf_file);',
'    apex_application.g_unrecoverable_error:= true;',
'  EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'      v_pdf_file  := EMPTY_BLOB();',
'      v_length    := dbms_lob.getlength(v_pdf_file);',
'      v_file_name := ''file_not_found.pdf'';',
'    WHEN OTHERS THEN',
'      v_pdf_file  := EMPTY_BLOB();',
'      v_length    := dbms_lob.getlength(v_pdf_file);',
'      v_file_name := ''file_not_found.pdf'';',
'  END;    ',
'  --',
'  ',
'  --',
'end;'))
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
