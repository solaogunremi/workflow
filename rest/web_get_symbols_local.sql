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
 p_id=>wwv_flow_api.id(28461345619952753)
,p_name=>'web.get.symbols.local'
);
 
end;
/
prompt --application/restful_services/web_get_symbols_local
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(28461345619952753)
,p_name=>'web.get.symbols.local'
,p_uri_prefix=>'get/1.0/'
,p_parsing_schema=>'WORKFLOW'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>1
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(29426641041154525)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'cashaccount/{account}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(29426724287161967)
,p_template_id=>wwv_flow_api.id(29426641041154525)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwb_90_jsn.fn_cashaccount(:account));',
'END;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(29539553849951885)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'cashtrans/{account}/{from}/{to}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(29539719555955756)
,p_template_id=>wwv_flow_api.id(29539553849951885)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_cashtrans(:account,:from,:to));',
'end;  '))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(31765465905700402)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'cs-lovs/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(31765549299702236)
,p_template_id=>wwv_flow_api.id(31765465905700402)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_cs_lovs);',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(29213987757593991)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'customer/{type}/{customer}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(29214062673609763)
,p_template_id=>wwv_flow_api.id(29213987757593991)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  IF :type = ''C'' THEN',
'    NULL;',
'  ELSIF :type = ''I'' THEN',
'    htp.p(pkwb_90_jsn.fn_icustomer(:customer));',
'  END IF;  ',
'END;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(28461645980971636)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'customers/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(28461817853979355)
,p_template_id=>wwv_flow_api.id(28461645980971636)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_customers(''010119''));',
'end;  '))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(28461877942981149)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'dashboard/{customer}/{currency}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(28462037818985097)
,p_template_id=>wwv_flow_api.id(28461877942981149)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_dashboard(:customer,:currency));',
'end;  '))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(28461539200952753)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'lovs/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(28461571521952753)
,p_template_id=>wwv_flow_api.id(28461539200952753)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_lovs);',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(31509924160281461)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'mfbid/{fund}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(31509995745283480)
,p_template_id=>wwv_flow_api.id(31509924160281461)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwb_90_jsn.fn_bid_prc(:fund));',
'END;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(31509688931272717)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'mfoffer/{fund}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(31509830084277435)
,p_template_id=>wwv_flow_api.id(31509688931272717)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  htp.p(pkwb_90_jsn.fn_offer_prc(:fund));',
'END;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(29428369905310986)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'mutualfund/{fund}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(29428504700441777)
,p_template_id=>wwv_flow_api.id(29428369905310986)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_mutualfund(:fund));',
'end;  '))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(29294021795081961)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'nonunitized/{fund}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(29294141516087642)
,p_template_id=>wwv_flow_api.id(29294021795081961)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_nonunitized(:fund));',
'end;  '))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(29069360466979763)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'portfolio/{fund}/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(29069469235983514)
,p_template_id=>wwv_flow_api.id(29069360466979763)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  htp.p(pkwb_90_jsn.fn_portfolio(:fund));',
'end;  '))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(28462344784989572)
,p_module_id=>wwv_flow_api.id(28461345619952753)
,p_uri_template=>'test/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(28462358516991102)
,p_template_id=>wwv_flow_api.id(28462344784989572)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_origin VARCHAR2(20)  := SUBSTR(OWA_UTIL.GET_CGI_ENV (''REMOTE_ADDR''),1,20); ',
'  v_agent  VARCHAR2(250) := SUBSTR(OWA_UTIL.GET_CGI_ENV (''HTTP_USER_AGENT''),1,250);',
'BEGIN',
'  htp.p(''<hr>'');',
'  htp.p(''<span style="font-size:22px;color:red;font-weight:700;">'');',
'  htp.p(''SYMBOLS PORTAL REST END-POINT'');',
'  htp.p(''</span>'');',
'  htp.p(''<hr>'');',
'  htp.p(''<br/>'');',
'  htp.p(''<span style="font-size:14px;font-weight:700;">'');',
'  htp.p(''ORIGIN: '');',
'  htp.p(''</span><span style="font-size:11px;font-style:italic;">'');',
'  htp.p(v_origin);',
'  htp.p(''</span><br/>'');',
'  htp.p(''<span style="font-size:14px;font-weight:700;">'');',
'  htp.p(''AGENT: '');',
'  htp.p(''</span><span style="font-size:11px;font-style:italic;">'');',
'  htp.p(v_agent);',
'  htp.p(''</span><br/>'');',
'  htp.p(''<br/>'');',
'  htp.p(''<span style="font-size:11px;font-style:italic;">'');',
'  htp.p(TO_CHAR(SYSDATE, ''Day Dth Month, YYYY HH:MI PM''));',
'  htp.p(''</span><br/>'');',
'END;'))
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
