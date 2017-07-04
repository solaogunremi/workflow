set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_default_workspace_id=>1840626480548546
);
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(35748807513336257)
,p_name=>'com.neulogicsolutions.workflow'
);
 
end;
/
prompt --application/restful_services/com_neulogicsolutions_workflow
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(35748807513336257)
,p_name=>'com.neulogicsolutions.workflow'
,p_uri_prefix=>'api/'
,p_parsing_schema=>'WORKFLOW'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>19
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(36222245067277420)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'cashwithdraw'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(36222331391279952)
,p_template_id=>wwv_flow_api.id(36222245067277420)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_response CLOB;',
'  v_customer VARCHAR2(4000) := :CUSTOMER;',
'BEGIN',
'  logger.log(''Cash Withdrawal Document => ''|| v_customer);',
'  v_response := pkwf_00_jsn.fn_cash_withdraw(v_customer);',
'  sys.htp.p(v_response);',
'END;  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(36236151547332271)
,p_handler_id=>wwv_flow_api.id(36222331391279952)
,p_name=>'CUSTOMER'
,p_bind_variable_name=>'CUSTOMER'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(13500680338505079)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'doc/{DOCKEY}/{DOCTP}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(13500769340506685)
,p_template_id=>wwv_flow_api.id(13500680338505079)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_length    NUMBER;',
'  v_file_name VARCHAR2(200);',
'  v_pdf_file  BLOB;',
'  v_mime      VARCHAR2(48);-- := ''image/jpeg'';',
'  v_ext       VARCHAR2(24);-- := ''.jpg'';',
'BEGIN',
'  --',
'  BEGIN',
'    SELECT  im_blb, dbms_lob.getlength(im_blb),',
'            CASE',
'              WHEN b.dc_tp_k = 400 THEN ''application/pdf''',
'              ELSE ''image/jpeg''',
'            END mime_type,',
'            CASE',
'              WHEN b.dc_tp_k = 400 THEN ''.pdf''',
'              ELSE ''.jpg''',
'            END file_ext',
'    INTO    v_pdf_file, v_length, v_mime, v_ext  ',
'    FROM    wf_30_dc_im a,',
'            wf_30_dc b',
'    WHERE   a.dc_k = b.row_key',
'    AND     dc_k = :DOCKEY',
'    AND     im_tp_dm = :DOCTP;',
'    v_file_name := :AAID || v_ext;',
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
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(6459386431858312)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'download/{DOCKEY}/{DOCTP}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(6459487835872009)
,p_template_id=>wwv_flow_api.id(6459386431858312)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_length    NUMBER;',
'  v_file_name VARCHAR2(200);',
'  v_pdf_file  BLOB;',
'  v_mime      VARCHAR2(48) := ''application/octet'';',
'BEGIN',
'  --',
'  v_file_name := :AAID || ''.jpg'';',
'  BEGIN',
'    SELECT  im_blb, dbms_lob.getlength(im_blb)',
'    INTO    v_pdf_file, v_length       ',
'    FROM    wf_30_dc_im',
'    WHERE   dc_k = :DOCKEY',
'    AND     im_tp_dm = :DOCTP;',
'    htp.init;',
'    OWA_UTIL.MIME_HEADER(v_mime, FALSE);',
'    htp.p(''Content-Disposition: attachment; filename="'' || v_file_name || ''"'');',
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
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(6159542914473325)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'img/{DOCKEY}/{DOCTP}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(6159685435475018)
,p_template_id=>wwv_flow_api.id(6159542914473325)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_length    NUMBER;',
'  v_file_name VARCHAR2(200);',
'  v_pdf_file  BLOB;',
'  v_mime      VARCHAR2(48) := ''image/jpeg'';',
'BEGIN',
'  --',
'  v_file_name := :AAID || ''.jpg'';',
'  BEGIN',
'    SELECT  im_blb, dbms_lob.getlength(im_blb)',
'    INTO    v_pdf_file, v_length       ',
'    FROM    wf_30_dc_im',
'    WHERE   dc_k = :DOCKEY',
'    AND     im_tp_dm = :DOCTP;',
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
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(36102981795124508)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'newcustomer'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(36103038484139502)
,p_template_id=>wwv_flow_api.id(36102981795124508)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_response CLOB;',
'BEGIN',
'  logger.log(''New Customer REST call'');',
'  v_response := pkwf_00_jsn.fn_new_customer(:CUSTOMER);',
'  sys.htp.p(v_response);',
'END;  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(36103207367141676)
,p_handler_id=>wwv_flow_api.id(36103038484139502)
,p_name=>'CUSTOMER'
,p_bind_variable_name=>'CUSTOMER'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(35748876207336263)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'pdf/{APPID}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(35748960437336291)
,p_template_id=>wwv_flow_api.id(35748876207336263)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(3714709954659352)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'pdfcprdoc/{APPID}/{DOCID}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(3714804733660816)
,p_template_id=>wwv_flow_api.id(3714709954659352)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_length    NUMBER;',
'  v_file_name VARCHAR2(200);',
'  v_pdf_file  BLOB;',
'  v_mime      VARCHAR2(48) := ''application/pdf'';',
'BEGIN',
'  --',
'  v_file_name := :AAID || ''.pdf'';',
'  BEGIN',
'    SELECT  doc_blb, dbms_lob.getlength(doc_blb)',
'    INTO    v_pdf_file, v_length       ',
'    FROM    wf_vl_20_cpr_doc',
'    WHERE   dc_id = :APPID',
'    AND     doc_id = :DOCID;',
'    htp.init;',
'    OWA_UTIL.MIME_HEADER(v_mime, FALSE);',
'    htp.p(''Content-Disposition: inline; filename="'' || v_file_name || ''"'');',
'    owa_util.http_header_close;',
'    wpg_docload.download_file(v_pdf_file);',
'    apex_application.g_unrecoverable_error:= true;',
'  EXCEPTION',
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
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(36221662040487301)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'test'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(36221808351493164)
,p_template_id=>wwv_flow_api.id(36221662040487301)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  sys.htp.p(''Hello World'');',
'END;  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(36221846308494836)
,p_handler_id=>wwv_flow_api.id(36221808351493164)
,p_name=>'CUSTOMER'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(36222104572271052)
,p_module_id=>wwv_flow_api.id(35748807513336257)
,p_uri_template=>'webaccess'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(36222145896276034)
,p_template_id=>wwv_flow_api.id(36222104572271052)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_response CLOB;',
'BEGIN',
'  v_response := pkwf_00_jsn.fn_web_access(:CUSTOMER);',
'  sys.htp.p(v_response);',
'END;  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(36222544516284248)
,p_handler_id=>wwv_flow_api.id(36222145896276034)
,p_name=>'CUSTOMER'
,p_bind_variable_name=>'CUSTOMER'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
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
