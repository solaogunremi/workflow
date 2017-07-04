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
,p_default_workspace_id=>22167334930236429
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
 p_id=>wwv_flow_api.id(24389204461567645)
,p_name=>'web.post.symbols.local'
);
 
end;
/
prompt --application/restful_services/web_post_symbols_local
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(24389204461567645)
,p_name=>'web.post.symbols.local'
,p_uri_prefix=>'post/1.0/'
,p_parsing_schema=>'AM4WEB'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>30
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(24389319814574200)
,p_module_id=>wwv_flow_api.id(24389204461567645)
,p_uri_template=>'cashdeposit/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(24389463955578475)
,p_template_id=>wwv_flow_api.id(24389319814574200)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  logger.log(:object);',
'  sys.htp.p(''{"response":[{"code":"000","message":"Cash deposit successful"}]}'');',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(24389532252582242)
,p_handler_id=>wwv_flow_api.id(24389463955578475)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(25342709403873357)
,p_module_id=>wwv_flow_api.id(24389204461567645)
,p_uri_template=>'customer-i'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(24461374864641737)
,p_module_id=>wwv_flow_api.id(24389204461567645)
,p_uri_template=>'subscription/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(24462160781654540)
,p_template_id=>wwv_flow_api.id(24461374864641737)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'BEGIN',
'  logger.log(:object);',
'  sys.htp.p(''{"response":[{"code":"000","message":"Fund subcription successful"}]}'');',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(24485465572905176)
,p_handler_id=>wwv_flow_api.id(24462160781654540)
,p_name=>'object'
,p_bind_variable_name=>'object'
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
