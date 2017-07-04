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
 p_id=>wwv_flow_api.id(49451430857224640)
,p_name=>'web.post.workflow.local'
);
 
end;
/
prompt --application/restful_services/web_post_workflow_local
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(49451430857224640)
,p_name=>'web.post.workflow.local'
,p_uri_prefix=>'post/1.0/'
,p_parsing_schema=>'WORKFLOW'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>24
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49451537568235986)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'cashwithdraw/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49451653152240500)
,p_template_id=>wwv_flow_api.id(49451537568235986)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_cash_withdraw(:object));',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46464631152207636)
,p_handler_id=>wwv_flow_api.id(49451653152240500)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49451731812243844)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'customer-c/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49452559994261386)
,p_template_id=>wwv_flow_api.id(49451731812243844)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_cs_new_c(:object));',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46464516298201199)
,p_handler_id=>wwv_flow_api.id(49452559994261386)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49451836314245165)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'customer-i/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49452742463265779)
,p_template_id=>wwv_flow_api.id(49451836314245165)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_cs_new_i(:object));',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46464453856097907)
,p_handler_id=>wwv_flow_api.id(49452742463265779)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49451940816246392)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'customer-j/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49452961856271375)
,p_template_id=>wwv_flow_api.id(49451940816246392)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_cs_new_j(:object));',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46464696344210530)
,p_handler_id=>wwv_flow_api.id(49452961856271375)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(46413804690479967)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'file/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(46414126232484324)
,p_template_id=>wwv_flow_api.id(46413804690479967)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  INSERT INTO WF_30_DC_IM VALUES (:key, :type, :body);',
'  commit;',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    logger.log(sqlerrm);',
'END;  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46414230766485611)
,p_handler_id=>wwv_flow_api.id(46414126232484324)
,p_name=>'key'
,p_bind_variable_name=>'key'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46414538919487455)
,p_handler_id=>wwv_flow_api.id(46414126232484324)
,p_name=>'type'
,p_bind_variable_name=>'type'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49452045664247856)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'mandate/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49453131297281537)
,p_template_id=>wwv_flow_api.id(49452045664247856)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_if_mandate(:object));',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46464797803215632)
,p_handler_id=>wwv_flow_api.id(49453131297281537)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49452151898249604)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'redemption/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49453355539288553)
,p_template_id=>wwv_flow_api.id(49452151898249604)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_mf_redeem(:object));',
'END;  ',
'  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46464859832218485)
,p_handler_id=>wwv_flow_api.id(49453355539288553)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(20049391574215579)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'signatory/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(20057161597454632)
,p_template_id=>wwv_flow_api.id(20049391574215579)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_cs_new_sig(:object));',
'END;'))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(20057536701497837)
,p_handler_id=>wwv_flow_api.id(20057161597454632)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49456831287555925)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'test/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49456939599558364)
,p_template_id=>wwv_flow_api.id(49456831287555925)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(''helo'');',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49452256400250883)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'webaccess/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49453539393293322)
,p_template_id=>wwv_flow_api.id(49452256400250883)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_web_access(:object));',
'END;  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46464966487221803)
,p_handler_id=>wwv_flow_api.id(49453539393293322)
,p_name=>'object'
,p_bind_variable_name=>'object'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(49452360902252201)
,p_module_id=>wwv_flow_api.id(49451430857224640)
,p_uri_template=>'webaccess2/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(49453758786298962)
,p_template_id=>wwv_flow_api.id(49452360902252201)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwf_30_ws.fn_web_access2(:object));',
'END;  '))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(46465076136224382)
,p_handler_id=>wwv_flow_api.id(49453758786298962)
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
