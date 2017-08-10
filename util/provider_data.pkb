create or replace package body provider_data
as

    type t_keyword_list is table of varchar2(50)
        index by pls_integer;

    type t_package_list is table of all_procedures.object_name%type
        index by pls_integer;

    type t_procedure_list is table of all_procedures.procedure_name%type
        index by pls_integer;

    function get_packs return t_varchar2_table pipelined
    as
    begin
        pipe row ('APEX_CUSTOM_AUTH');
        pipe row ('APEX_APPLICATION');
        pipe row ('APEX_ITEM');
        pipe row ('APEX_UTIL');
        pipe row ('CTX_ADM');
        pipe row ('CTX_CLS');
        pipe row ('CTX_DDL');
        pipe row ('CTX_DOC');
        pipe row ('CTX_ENTITY');
        pipe row ('CTX_OUTPUT');
        pipe row ('CTX_QUERY');
        pipe row ('CTX_REPORT');
        pipe row ('CTX_THES');
        pipe row ('CTX_ULEXER');
        pipe row ('DBMS_ADDM');
        pipe row ('DBMS_ADVANCED_REWRITE');
        pipe row ('DBMS_ADVISOR');
        pipe row ('DBMS_ALERT');
        pipe row ('DBMS_APPLICATION_INFO');
        pipe row ('DBMS_APPLY_ADM');
        pipe row ('DBMS_AQ');
        pipe row ('DBMS_AQADM');
        pipe row ('DBMS_AQELM');
        pipe row ('DBMS_AQIN');
        pipe row ('DBMS_ASSERT');
        pipe row ('DBMS_AUDIT_MGMT');
        pipe row ('DBMS_AUTO_SQLTUNE');
        pipe row ('DBMS_AUTO_TASK_ADMIN');
        pipe row ('DBMS_AUTO_TASK_IMMEDIATE');
        pipe row ('DBMS_AW_STATS');
        pipe row ('DBMS_CAPTURE_ADM');
        pipe row ('DBMS_CDC_PUBLISH');
        pipe row ('DBMS_CDC_SUBSCRIBE');
        pipe row ('DBMS_COMPARISON');
        pipe row ('DBMS_COMPRESSION');
        pipe row ('DBMS_CONNECTION_POOL');
        pipe row ('DBMS_CQ_NOTIFICATION');
        pipe row ('DBMS_CRYPTO');
        pipe row ('DBMS_CSX_ADMIN');
        pipe row ('DBMS_CUBE');
        pipe row ('DBMS_CUBE_ADVISE');
        pipe row ('DBMS_CUBE_LOG');
        pipe row ('DBMS_DATA_MINING');
        pipe row ('DBMS_DATA_MINING_TRANSFORM');
        pipe row ('DBMS_DATAPUMP');
        pipe row ('DBMS_DBFS_CONTENT');
        pipe row ('DBMS_DBFS_CONTENT_SPI');
        pipe row ('DBMS_DBFS_HS');
        pipe row ('DBMS_DBFS_SFS');
        pipe row ('DBMS_DB_VERSION');
        pipe row ('DBMS_DEBUG');
        pipe row ('DBMS_DDL');
        pipe row ('DBMS_DEFER');
        pipe row ('DBMS_DEFER_QUERY');
        pipe row ('DBMS_DEFER_SYS');
        pipe row ('DBMS_DESCRIBE');
        pipe row ('DBMS_DG');
        pipe row ('DBMS_DIMENSION');
        pipe row ('DBMS_DST');
        pipe row ('DBMS_DISTRIBUTED_TRUST_ADMIN');
        pipe row ('DBMS_EDITIONS_UTILITIES');
        pipe row ('DBMS_EPG');
        pipe row ('DBMS_ERRLOG');
        pipe row ('DBMS_EXPFIL');
        pipe row ('DBMS_FGA');
        pipe row ('DBMS_FILE_GROUP');
        pipe row ('DBMS_FILE_TRANSFER');
        pipe row ('DBMS_FLASHBACK');
        pipe row ('DBMS_FLASHBACK_ARCHIVE');
        pipe row ('DBMS_FREQUENT_ITEMSET');
        pipe row ('DBMS_HM');
        pipe row ('DBMS_HPROF');
        pipe row ('DBMS_HS_PARALLEL');
        pipe row ('DBMS_HS_PASSTHROUGH');
        pipe row ('DBMS_IOT');
        pipe row ('DBMS_JAVA');
        pipe row ('DBMS_JOB');
        pipe row ('DBMS_LDAP');
        pipe row ('DBMS_LDAP_UTL');
        pipe row ('DBMS_LIBCACHE');
        pipe row ('DBMS_LOB');
        pipe row ('DBMS_LOCK');
        pipe row ('DBMS_LOGMNR');
        pipe row ('DBMS_LOGMNR_D');
        pipe row ('DBMS_LOGSTDBY');
        pipe row ('DBMS_METADATA');
        pipe row ('DBMS_METADATA_DIFF');
        pipe row ('DBMS_MGD_ID_UTL');
        pipe row ('DBMS_MGWADM');
        pipe row ('DBMS_MGWMSG');
        pipe row ('DBMS_MONITOR');
        pipe row ('DBMS_MVIEW');
        pipe row ('DBMS_NETWORK_ACL_ADMIN');
        pipe row ('DBMS_NETWORK_ACL_UTILITY');
        pipe row ('DBMS_OBFUSCATION_TOOLKIT');
        pipe row ('DBMS_ODCI');
        pipe row ('DBMS_OFFLINE_OG');
        pipe row ('DBMS_OUTLN');
        pipe row ('DBMS_OUTPUT');
        pipe row ('DBMS_PARALLEL_EXECUTE');
        pipe row ('DBMS_PCLXUTIL');
        pipe row ('DBMS_PIPE');
        pipe row ('DBMS_PREDICTIVE_ANALYTICS');
        pipe row ('DBMS_PREPROCESSOR');
        pipe row ('DBMS_PROFILER');
        pipe row ('DBMS_PROPAGATION_ADM');
        pipe row ('DBMS_RANDOM');
        pipe row ('DBMS_RECTIFIER_DIFF');
        pipe row ('DBMS_REDEFINITION');
        pipe row ('DBMS_REDACT');
        pipe row ('DBMS_REFRESH');
        pipe row ('DBMS_REPAIR');
        pipe row ('DBMS_REPCAT');
        pipe row ('DBMS_REPCAT_ADMIN');
        pipe row ('DBMS_REPCAT_INSTANTIATE');
        pipe row ('DBMS_REPCAT_RGT');
        pipe row ('DBMS_REPUTIL');
        pipe row ('DBMS_RESCONFIG');
        pipe row ('DBMS_RESOURCE_MANAGER');
        pipe row ('DBMS_RESOURCE_MANAGER_PRIVS');
        pipe row ('DBMS_RESULT_CACHE');
        pipe row ('DBMS_RESUMABLE');
        pipe row ('DBMS_RLMGR');
        pipe row ('DBMS_RLS');
        pipe row ('DBMS_ROWID');
        pipe row ('DBMS_RULE');
        pipe row ('DBMS_RULE_ADM');
        pipe row ('DBMS_SCHEDULER');
        pipe row ('DBMS_SERVER_ALERT');
        pipe row ('DBMS_SERVICE');
        pipe row ('DBMS_SESSION');
        pipe row ('DBMS_SHARED_POOL');
        pipe row ('DBMS_SPACE');
        pipe row ('DBMS_SPACE_ADMIN');
        pipe row ('DBMS_SPM');
        pipe row ('DBMS_SQL');
        pipe row ('DBMS_SQLDIAG');
        pipe row ('DBMS_SQLPA');
        pipe row ('DBMS_SQLTUNE');
        pipe row ('DBMS_STAT_FUNCS');
        pipe row ('DBMS_STATS');
        pipe row ('DBMS_STORAGE_MAP');
        pipe row ('DBMS_STREAMS');
        pipe row ('DBMS_STREAMS_ADM');
        pipe row ('DBMS_STREAMS_ADVISOR_ADM');
        pipe row ('DBMS_STREAMS_AUTH');
        pipe row ('DBMS_STREAMS_HANDLER_ADM');
        pipe row ('DBMS_STREAMS_MESSAGING');
        pipe row ('DBMS_STREAMS_TABLESPACE_ADM');
        pipe row ('DBMS_TDB');
        pipe row ('DBMS_TRACE');
        pipe row ('DBMS_TRANSACTION');
        pipe row ('DBMS_TRANSFORM');
        pipe row ('DBMS_TTS');
        pipe row ('DBMS_TYPES');
        pipe row ('DBMS_UTILITY');
        pipe row ('DBMS_WARNING');
        pipe row ('DBMS_WM');
        pipe row ('DBMS_WORKLOAD_CAPTURE');
        pipe row ('DBMS_WORKLOAD_REPLAY');
        pipe row ('DBMS_WORKLOAD_REPOSITORY');
        pipe row ('DBMS_XA');
        pipe row ('DBMS_XDB');
        pipe row ('DBMS_XDB_ADMIN');
        pipe row ('DBMS_XDB_VERSION');
        pipe row ('DBMS_XDBRESOURCE');
        pipe row ('DBMS_XDBT');
        pipe row ('DBMS_XDBZ');
        pipe row ('DBMS_XEVENT');
        pipe row ('DBMS_XMLDOM');
        pipe row ('DBMS_XMLGEN');
        pipe row ('DBMS_XMLINDEX');
        pipe row ('DBMS_XMLPARSER');
        pipe row ('DBMS_XMLQUERY');
        pipe row ('DBMS_XMLSAVE');
        pipe row ('DBMS_XMLSCHEMA');
        pipe row ('DBMS_XMLSTORE');
        pipe row ('DBMS_XMLTRANSLATIONS');
        pipe row ('DBMS_XPLAN');
        pipe row ('DBMS_XSLPROCESSOR');
        pipe row ('DEBUG_EXTPROC');
        pipe row ('HTF');
        pipe row ('HTP');
        pipe row ('ORD_DICOM');
        pipe row ('ORD_DICOM_ADMIN');
        pipe row ('OWA_CACHE');
        pipe row ('OWA_COOKIE');
        pipe row ('OWA_CUSTOM');
        pipe row ('OWA_IMAGE');
        pipe row ('OWA_OPT_LOCK');
        pipe row ('OWA_PATTERN');
        pipe row ('OWA_SEC');
        pipe row ('OWA_TEXT');
        pipe row ('OWA_UTIL');
        pipe row ('SDO_CS');
        pipe row ('SDO_CSW_PROCESS');
        pipe row ('SDO_GCDR');
        pipe row ('SDO_GEOM');
        pipe row ('SDO_GEOR');
        pipe row ('SDO_GEOR_ADMIN');
        pipe row ('SDO_GEOR_UTL');
        pipe row ('SDO_LRS');
        pipe row ('SDO_MIGRATE');
        pipe row ('SDO_NET');
        pipe row ('SDO_NET_MEM');
        pipe row ('SDO_OLS');
        pipe row ('SDO_PC_PKG');
        pipe row ('SDO_SAM');
        pipe row ('SDO_TIN_PKG');
        pipe row ('SDO_TOPO');
        pipe row ('SDO_TOPO_MAP');
        pipe row ('SDO_TUNE');
        pipe row ('SDO_UTIL');
        pipe row ('SDO_WFS_LOCK');
        pipe row ('SDO_WFS_PROCESS');
        pipe row ('SEM_APIS');
        pipe row ('SEM_PERF');
        pipe row ('SEM_RDFCTX');
        pipe row ('SEM_RDFSA');
        pipe row ('UTL_COLL');
        pipe row ('UTL_COMPRESS');
        pipe row ('UTL_ENCODE');
        pipe row ('UTL_FILE');
        pipe row ('UTL_HTTP');
        pipe row ('UTL_I18N');
        pipe row ('UTL_INADDR');
        pipe row ('UTL_IDENT');
        pipe row ('UTL_LMS');
        pipe row ('UTL_MAIL');
        pipe row ('UTL_MATCH');
        pipe row ('UTL_NLA');
        pipe row ('UTL_RAW');
        pipe row ('UTL_RECOMP');
        pipe row ('UTL_REF');
        pipe row ('UTL_SMTP');
        pipe row ('UTL_SPADV');
        pipe row ('UTL_TCP');
        pipe row ('UTL_URL');
        pipe row ('WPG_DOCLOAD');
        pipe row (--from synonyms; package names extracted from published documentation
        'APEX_APPLICATION');
        pipe row ('APEX_APPLICATION_INSTALL');
        pipe row ('APEX_AUTHENTICATION');
        pipe row ('APEX_AUTHORIZATION');
        pipe row ('APEX_COLLECTION');
        pipe row ('APEX_CSS');
        pipe row ('APEX_CUSTOM_AUTH');
        pipe row ('APEX_DEBUG');
        pipe row ('APEX_ERROR');
        pipe row ('APEX_ESCAPE');
        pipe row ('APEX_INSTANCE_ADMIN');
        pipe row ('APEX_IR');
        pipe row ('APEX_ITEM');
        pipe row ('APEX_JAVASCRIPT');
        pipe row ('APEX_JSON');
        pipe row ('APEX_LANG');
        pipe row ('APEX_LDAP');
        pipe row ('APEX_MAIL');
        pipe row ('APEX_PAGE');
        pipe row ('APEX_PLSQL_JOB');
        pipe row ('APEX_PLUGIN');
        pipe row ('APEX_PLUGIN_UTIL');
        pipe row ('APEX_REGION');
        pipe row ('APEX_SPATIAL');
        pipe row ('APEX_UI_DEFAULT_UPDATE');
        pipe row ('APEX_UTIL');
        pipe row ('APEX_WEB_SERVICE');
        pipe row ('APEX_ZIP');
    end get_packs;

    function get_tab_chars(
        p_num_tabs in number,
        p_chars_per_tab in number default 4,
        p_replace_with in varchar2 default ' '
    ) return varchar2
    as
        l_return_chars varchar2(100);
    begin

        for tabindex in 1..p_num_tabs
        loop
            for charindex in 1..p_chars_per_tab
            loop
                l_return_chars := l_return_chars || p_replace_with;
            end loop;
        end loop;

        return l_return_chars;

    end get_tab_chars;


    function get_keywords
    return t_keyword_list
    as
        l_keys t_keyword_list;
    begin

        return l_keys;
    end get_keywords;

    function get_packages
    return t_package_list
    as
        l_pkg_list t_package_list;
    begin

        with unique_package_names as (
            select distinct
                case
                    when aliass.synonym_name is not null
                        then aliass.synonym_name
                    else
                        all_procedures.object_name
                end object_name
            from
                all_procedures
                left outer join all_synonyms aliass on (
                    all_procedures.owner = aliass.table_owner
                    and all_procedures.object_name = aliass.table_name
                 )
            where procedure_name is not null
        )
        select unique_package_names.object_name
        bulk collect into l_pkg_list
        from unique_package_names
        join table(provider_data.get_packs()) documented_packs on (
            documented_packs.column_value = unique_package_names.object_name
        )
        order by  1 asc;




        return l_pkg_list;

    end get_packages;

    function get_procedures(
        p_package_name in all_procedures.object_name%type
    )
    return t_procedure_list
    as
        l_procs t_procedure_list;
    begin
        if p_package_name not like 'APEX_%'
        then
            select distinct procedure_name
            bulk collect into l_procs
            from all_procedures
            where object_name = p_package_name
            and procedure_name is not null
            order by 1;
        else
            select distinct procedure_name
            bulk collect into l_procs
            from
                all_procedures
                join all_synonyms on (all_synonyms.table_owner = all_procedures.owner and all_synonyms.table_name = all_procedures.object_name)
            and
                all_synonyms.synonym_name = p_package_name
                and all_synonyms.table_owner = apex_application.g_flow_schema_owner
                and all_procedures.procedure_name is not null
            order by 1;

        end if;


        return l_procs;
    end get_procedures;


    procedure databuilder as
        l_keys t_keyword_list;
        l_pks t_package_list;
        l_procs t_procedure_list;
    begin
        dbms_output.enable(buffer_size => null);

        --TODO: Remove
        nondocumentedprocsdatabuilder;
        return;

        l_keys := get_keywords();
        l_pks := get_packages();

        dbms_output.put_line('{');
        dbms_output.put_line(get_tab_chars(1) || '"keywords": [');

        for i in 1..l_keys.count
        loop


            if i = l_keys.count
            then
                dbms_output.put_line(get_tab_chars(2) || rtrim(l_keys(i), ','));
            else
                dbms_output.put_line(get_tab_chars(2) || l_keys(i));
            end if;

        end loop;

        dbms_output.put_line(get_tab_chars(1) || '],');
        dbms_output.put_line(get_tab_chars(1) || '"packages" : {');

        for i in 1..l_pks.count
        loop

            l_procs := get_procedures(l_pks(i));

            dbms_output.put_line(get_tab_chars(2) || '"'||l_pks(i)||'": {');


            dbms_output.put_line(get_tab_chars(3) || '"procedures": [');

            for i in 1..l_procs.count
            loop
              dbms_output.put_line(get_tab_chars(4) || '"' || l_procs(i) || '"');


              if i = l_procs.count
              then
                  dbms_output.put_line(get_tab_chars(4));
              else
                  dbms_output.put_line(get_tab_chars(4) || ',');
              end if;

            end loop;

            dbms_output.put_line(get_tab_chars(3) || ']');

            if i = l_pks.count
            then
                dbms_output.put_line(get_tab_chars(2) || '}');
            else
                dbms_output.put_line(get_tab_chars(2) || '},');
            end if;
        end loop;

        dbms_output.put_line(get_tab_chars(1) || '}');
        dbms_output.put_line('}');



    end databuilder;


  
    -- Ben Shumway (Insum): Aug/07/2017
    procedure nonDocumentedProcsDataBuilder is

      l_curr_package all_arguments.package_name%type;
      l_curr_proc    all_arguments.object_name%type;
      l_curr_arg     all_arguments.argument_name%type;


      procedure writeNonDocProcLine(
                               p_package_name all_arguments.package_name%type,
                               p_proc_name all_arguments.object_name%type,
                               p_argument_name all_arguments.argument_name%type,
                               p_position all_arguments.position%type,
                               p_data_type all_arguments.data_type%type,
                               p_in_out all_arguments.in_out%type,
                               p_defaulted all_arguments.defaulted%type
                              )
      is
      begin
      
        if l_curr_package is null or l_curr_package != p_package_name then
          l_curr_package := p_package_name;
          dbms_output.put_line(l_curr_package);
          l_curr_proc := null;
        end if;
      
      
        if l_curr_proc is null or l_curr_proc != p_proc_name then
          l_curr_proc := p_proc_name;
          dbms_output.put_line(get_tab_chars(1) || l_curr_proc);
        end if;
      
        if p_position = 0 then
          if p_argument_name is not null then
            dbms_output.put_line('-Error-: Found position non-null name for position 0');
          end if;
          dbms_output.put_line(get_tab_chars(2) || '#Returning ' || p_data_type);
        else
          dbms_output.put_line(get_tab_chars(2) || p_argument_name || ' ' || p_in_out || ' ' || p_data_type || ' ' || p_defaulted);
        end if;      
      end;

    begin

      for row in (select package_name,
                         object_name proc_name,
                         argument_name,
                         position,
                         data_type,
                         in_out,
                         defaulted
                    from all_arguments
                   where 1=1
                     and (overload is null or overload = 1)
                     and data_level = 0
                     and package_name || '.' || object_name in
                     (
                      'APEX_APPLICATION.ACCEPT',
                      'APEX_APPLICATION.APPS_ONLY_WORKSPACE',
                      'APEX_APPLICATION.CLEAR_APP_CACHE',
                      'APEX_APPLICATION.CLEAR_COMPONENT',
                      'APEX_APPLICATION.CLEAR_FLOW_CACHE',
                      'APEX_APPLICATION.CLEAR_PAGE_CACHE',
                      'APEX_APPLICATION.CLEAR_PAGE_CACHES',
                      'APEX_APPLICATION.CLEAR_USER_CACHE',
                      'APEX_APPLICATION.DEBUG',
                      'APEX_APPLICATION.DO_SUBSTITUTIONS',
                      'APEX_APPLICATION.FETCH_APP_ITEM',
                      'APEX_APPLICATION.FETCH_FLOW_ITEM',
                      'APEX_APPLICATION.FIND_ITEM_ID',
                      'APEX_APPLICATION.FIND_ITEM_NAME',
                      'APEX_APPLICATION.GET_APPLICATION_ID',
                      'APEX_APPLICATION.GET_BROWSER_VERSION',
                      'APEX_APPLICATION.GET_COMPANY_NAME',
                      'APEX_APPLICATION.GET_COMPONENT',
                      'APEX_APPLICATION.GET_CUSTOM_AUTH_LOGIN_URL',
                      'APEX_APPLICATION.GET_ELAPSED_TIME',
                      'APEX_APPLICATION.GET_FORM_CLOSE_TAG',
                      'APEX_APPLICATION.GET_G_BASE_HREF',
                      'APEX_APPLICATION.GET_HOME_LINK_URL',
                      'APEX_APPLICATION.GET_NEXT_SESSION_ID',
                      'APEX_APPLICATION.GET_NLS_DECIMAL_SEPARATOR',
                      'APEX_APPLICATION.GET_NLS_GROUP_SEPARATOR',
                      'APEX_APPLICATION.GET_PAGE_ALIAS',
                      'APEX_APPLICATION.GET_PAGE_ID',
                      'APEX_APPLICATION.GET_SECURITY_GROUP_ID',
                      'APEX_APPLICATION.GET_SESSION_ID',
                      'APEX_APPLICATION.GET_SGID',
                      'APEX_APPLICATION.GET_TRANSLATED_APP_ID',
                      'APEX_APPLICATION.GET_UNIQUE_ID',
                      'APEX_APPLICATION.G_INLINE_VALIDATION_ERROR_CNT',
                      'APEX_APPLICATION.IS_CUSTOM_AUTH_PAGE',
                      'APEX_APPLICATION.IS_PRESSED_BUTTON',
                      'APEX_APPLICATION.JS_MESSAGES',
                      'APEX_APPLICATION.NULL_PAGE_CACHE',
                      'APEX_APPLICATION.NULL_PAGE_CACHES',
                      'APEX_APPLICATION.NULL_STEP_CACHE',
                      'APEX_APPLICATION.NULL_STEP_CACHES',
                      'APEX_APPLICATION.PAINT_BUTTONS',
                      'APEX_APPLICATION.PAINT_FORMOPEN',
                      'APEX_APPLICATION.PROCESS_STATE',
                      'APEX_APPLICATION.PUBLIC_ROLE_CHECK',
                      'APEX_APPLICATION.PUBLIC_SECURITY_CHECK',
                      'APEX_APPLICATION.REPLACE_CGI_ENV',
                      'APEX_APPLICATION.RESET_G_BASE_HREF',
                      'APEX_APPLICATION.RESET_G_NLS_DATE_FORMAT',
                      'APEX_APPLICATION.RESET_G_NLS_DECIMAL_SEPARATOR',
                      'APEX_APPLICATION.RESET_PAGE_PROCESS',
                      'APEX_APPLICATION.RESET_PAGE_PROCESSESS',
                      'APEX_APPLICATION.RESET_SECURITY_CHECK',
                      'APEX_APPLICATION.RESOLVE_FRIENDLY_URL',
                      'APEX_APPLICATION.S',
                      'APEX_APPLICATION.SET_COMPONENT',
                      'APEX_APPLICATION.SET_G_BASE_HREF',
                      'APEX_APPLICATION.SET_G_NLS_DATE_FORMAT',
                      'APEX_APPLICATION.SET_G_NLS_DECIMAL_SEPARATOR',
                      'APEX_APPLICATION.SET_PPR_QUERY_SESSION_STATE',
                      'APEX_APPLICATION.SHOW',
                      'APEX_APPLICATION.SHOW_ERROR_MESSAGE',
                      'APEX_APPLICATION.TRIM_NL_SP_TAB',
                      'APEX_APPLICATION.TRIM_SQL',
                      'APEX_APPLICATION.UPDATE_CACHE_WITH_WRITE',
                      'APEX_APPLICATION_INSTALL.GET_STATIC_APP_FILE_PREFIX',
                      'APEX_APPLICATION_INSTALL.GET_STATIC_PLUGIN_FILE_PREFIX',
                      'APEX_APPLICATION_INSTALL.GET_STATIC_THEME_FILE_PREFIX',
                      'APEX_APPLICATION_INSTALL.PUBLISH_APPLICATION',
                      'APEX_APPLICATION_INSTALL.SET_STATIC_APP_FILE_PREFIX',
                      'APEX_APPLICATION_INSTALL.SET_STATIC_PLUGIN_FILE_PREFIX',
                      'APEX_APPLICATION_INSTALL.SET_STATIC_THEME_FILE_PREFIX',
                      'APEX_COLLECTION.DELETE_ALL_APP_COLLECTIONS',
                      'APEX_CSS.NEW_CSS_REPOSITORY_RECORD',
                      'APEX_CSS.REMOVE_CSS',
                      'APEX_CUSTOM_AUTH.LDAP_AUTHENTICATE',
                      'APEX_CUSTOM_AUTH.LDAP_DNPREP',
                      'APEX_CUSTOM_AUTH.LOGOUT_THEN_GO_TO_PAGE',
                      'APEX_CUSTOM_AUTH.LOGOUT_THEN_GO_TO_URL',
                      'APEX_CUSTOM_AUTH.PORTAL_SSO_SENTRY_V1',
                      'APEX_CUSTOM_AUTH.REMOVE_SESSION',
                      'APEX_DEBUG.DISABLE_DEBUG_MESSAGES',
                      'APEX_DEBUG.ENABLE_DEBUG_MESSAGES',
                      'APEX_ERROR.DEBUG_ERROR',
                      'APEX_ERROR.GET_ERROR_COUNT',
                      'APEX_ERROR.HAVE_ERRORS_OCCURRED',
                      'APEX_ESCAPE.CSS_SELECTOR',
                      'APEX_ESCAPE.INIT',
                      'APEX_INSTANCE_ADMIN.ADD_AUTHORIZED_URL',
                      'APEX_INSTANCE_ADMIN.ARCHIVE_WORKSPACE',
                      'APEX_INSTANCE_ADMIN.DISABLE_WORKSPACE',
                      'APEX_INSTANCE_ADMIN.ENABLE_WORKSPACE',
                      'APEX_INSTANCE_ADMIN.EXISTS_PARAMETER',
                      'APEX_INSTANCE_ADMIN.GET_AUTHORIZED_URLS',
                      'APEX_INSTANCE_ADMIN.PURGE_ARCHIVES',
                      'APEX_INSTANCE_ADMIN.PURGE_ARCHIVE_VERSIONS',
                      'APEX_INSTANCE_ADMIN.REMOVE_AUTHORIZED_URL',
                      'APEX_ITEM.CHECKBOX',
                      'APEX_ITEM.MULTI_ROW_UPDATE',
                      'APEX_JAVASCRIPT.ADD_3RD_PARTY_LIBRARY_FILE',
                      'APEX_JSON.LINK',
                      'APEX_JSON.WRITE_ITEMS',
                      'APEX_JSON.WRITE_LINKS',
                      'APEX_JSON.WRITE_RAW',
                      'APEX_LANG.CREATE_MESSAGE',
                      'APEX_LANG.DELETE_MESSAGE',
                      'APEX_LANG.MESSAGE_P',
                      'APEX_LDAP.GET_GROUPS',
                      'APEX_LDAP.GET_GROUPS_STRING',
                      'APEX_LDAP.SEARCH',
                      'APEX_PAGE.PURGE_CACHE',
                      'APEX_PLSQL_JOB.JOBS_ARE_ENABLED',
                      'APEX_PLSQL_JOB.PURGE_PROCESS',
                      'APEX_PLSQL_JOB.SUBMIT_PROCESS',
                      'APEX_PLSQL_JOB.TIME_ELAPSED',
                      'APEX_PLSQL_JOB.UPDATE_JOB_STATUS',
                      'APEX_PLUGIN_UTIL.CLEANUP_PAGE_ITEM_NAMES',
                      'APEX_PLUGIN_UTIL.DEBUG_AUTHENTICATION',
                      'APEX_PLUGIN_UTIL.DEBUG_AUTHORIZATION',
                      'APEX_PLUGIN_UTIL.FREE_SQL_HANDLER',
                      'APEX_PLUGIN_UTIL.GET_COLUMN_NO',
                      'APEX_PLUGIN_UTIL.GET_DATA_TYPE',
                      'APEX_PLUGIN_UTIL.GET_HTML_ATTR',
                      'APEX_PLUGIN_UTIL.GET_LINK',
                      'APEX_PLUGIN_UTIL.GET_PLSQL_EXPR_RESULT_BOOLEAN',
                      'APEX_PLUGIN_UTIL.GET_PLSQL_FUNC_RESULT_BOOLEAN',
                      'APEX_PLUGIN_UTIL.GET_PLSQL_FUNC_RESULT_CLOB',
                      'APEX_PLUGIN_UTIL.GET_SQL_HANDLER',
                      'APEX_PLUGIN_UTIL.IS_COMPONENT_USED',
                      'APEX_PLUGIN_UTIL.PREPARE_QUERY',
                      'APEX_PLUGIN_UTIL.PRINT_HIDDEN',
                      'APEX_PLUGIN_UTIL.PRINT_HIDDEN_IF_READONLY',
                      'APEX_PLUGIN_UTIL.PRINT_HIDDEN_PROTECTED',
                      'APEX_PLUGIN_UTIL.PRINT_PAGE_ITEM_LOV_AS_JSON',
                      'APEX_PLUGIN_UTIL.PRINT_PROTECTED',
                      'APEX_REGION.IS_READ_ONLY',
                      'APEX_REGION.PURGE_CACHE',
                      'APEX_UTIL.AGENDA_CALENDAR',
                      'APEX_UTIL.COMPRESS_INT',
                      'APEX_UTIL.CREATE_USER_FROM_FILE',
                      'APEX_UTIL.DAILY_CALENDAR',
                      'APEX_UTIL.DECREMENT_CALENDAR',
                      'APEX_UTIL.EXPORT_APPLICATION',
                      'APEX_UTIL.EXPORT_APPLICATION_COMPONENT',
                      'APEX_UTIL.EXPORT_APPLICATION_PAGE',
                      'APEX_UTIL.FEEDBACK_ENABLED',
                      'APEX_UTIL.FILESIZE_MASK',
                      'APEX_UTIL.FLASH2',
                      'APEX_UTIL.GET_APEX_CHAR_ID',
                      'APEX_UTIL.GET_APEX_ID',
                      'APEX_UTIL.GET_APPLICATION_ID_STATUS',
                      'APEX_UTIL.GET_APPLICATION_NAME',
                      'APEX_UTIL.GET_BLOB',
                      'APEX_UTIL.GET_BLOB_FILE',
                      'APEX_UTIL.GET_LANGUAGE_SELECTOR_LIST',
                      'APEX_UTIL.GET_LANGUAGE_SELECTOR_UL',
                      'APEX_UTIL.GET_LANGUAGE_SELECTOR_UL2',
                      'APEX_UTIL.GET_SINCE_TSWLTZ',
                      'APEX_UTIL.GET_SINCE_TSWTZ',
                      'APEX_UTIL.GET_TIMEFRAME',
                      'APEX_UTIL.GET_UUID',
                      'APEX_UTIL.HAS_RESTRICTED_CHARS',
                      'APEX_UTIL.JSON_FROM_ARRAY',
                      'APEX_UTIL.JSON_FROM_ITEMS',
                      'APEX_UTIL.JSON_FROM_SQL',
                      'APEX_UTIL.JSON_FROM_STRING',
                      'APEX_UTIL.MINIMUM_FREE_APPLICATION_ID',
                      'APEX_UTIL.MONTH_CALENDAR',
                      'APEX_UTIL.PAUSE',
                      'APEX_UTIL.RESET_SESSION_LANG',
                      'APEX_UTIL.RESET_SESSION_TERRITORY',
                      'APEX_UTIL.RESET_SESSION_TIME_ZONE',
                      'APEX_UTIL.SET_BLOB',
                      'APEX_UTIL.SET_COMPATIBILITY_MODE',
                      'APEX_UTIL.SET_REPORT_COLUMN_FORMAT',
                      'APEX_UTIL.TODAY_CALENDAR',
                      'APEX_UTIL.UNCOMPRESS_INT',
                      'APEX_UTIL.USER_IN_GROUP',
                      'APEX_UTIL.WEEKLY_CALENDAR',
                      'CTX_ADM.DROP_USER_OBJECTS',
                      'CTX_ADM.SHUTDOWN',
                      'CTX_ADM.STOP_OPTIMIZE',
                      'CTX_ADM.TEST_EXTPROC',
                      'CTX_DDL.ADD_ATTR_SECTION',
                      'CTX_DDL.ADD_AUTO_OPTIMIZE',
                      'CTX_DDL.ADD_FIELD_SECTION',
                      'CTX_DDL.ADD_INDEX',
                      'CTX_DDL.ADD_MDATA',
                      'CTX_DDL.ADD_MDATA_COLUMN',
                      'CTX_DDL.ADD_MDATA_SECTION',
                      'CTX_DDL.ADD_MVDATA_SECTION',
                      'CTX_DDL.ADD_NDATA_SECTION',
                      'CTX_DDL.ADD_SDATA_COLUMN',
                      'CTX_DDL.ADD_SDATA_SECTION',
                      'CTX_DDL.ADD_SPECIAL_SECTION',
                      'CTX_DDL.ADD_STOPCLASS',
                      'CTX_DDL.ADD_STOPTHEME',
                      'CTX_DDL.ADD_STOPWORD',
                      'CTX_DDL.ADD_STOP_SECTION',
                      'CTX_DDL.ADD_SUB_LEXER',
                      'CTX_DDL.ADD_ZONE_SECTION',
                      'CTX_DDL.ALTER_INDEX',
                      'CTX_DDL.COPY_POLICY',
                      'CTX_DDL.CREATE_INDEX_SET',
                      'CTX_DDL.CREATE_POLICY',
                      'CTX_DDL.CREATE_PREFERENCE',
                      'CTX_DDL.CREATE_SECTION_GROUP',
                      'CTX_DDL.CREATE_SHADOW_INDEX',
                      'CTX_DDL.CREATE_STOPLIST',
                      'CTX_DDL.DELETE_MVDATA_VALUES',
                      'CTX_DDL.DROP_INDEX_SET',
                      'CTX_DDL.DROP_POLICY',
                      'CTX_DDL.DROP_PREFERENCE',
                      'CTX_DDL.DROP_SECTION_GROUP',
                      'CTX_DDL.DROP_SHADOW_INDEX',
                      'CTX_DDL.DROP_STOPLIST',
                      'CTX_DDL.EXCHANGE_SHADOW_INDEX',
                      'CTX_DDL.INSERT_MVDATA_VALUES',
                      'CTX_DDL.OPTIMIZE_INDEX',
                      'CTX_DDL.POPULATE_PENDING',
                      'CTX_DDL.RECREATE_INDEX_ONLINE',
                      'CTX_DDL.REMOVE_AUTO_OPTIMIZE',
                      'CTX_DDL.REMOVE_INDEX',
                      'CTX_DDL.REMOVE_MDATA',
                      'CTX_DDL.REMOVE_SECTION',
                      'CTX_DDL.REMOVE_STOPCLASS',
                      'CTX_DDL.REMOVE_STOPTHEME',
                      'CTX_DDL.REMOVE_STOPWORD',
                      'CTX_DDL.REMOVE_SUB_LEXER',
                      'CTX_DDL.REPLACE_INDEX_METADATA',
                      'CTX_DDL.SET_ATTRIBUTE',
                      'CTX_DDL.SPLIT_DOLLARI',
                      'CTX_DDL.SPLIT_ZONE_TOKENS',
                      'CTX_DDL.SYNC_INDEX',
                      'CTX_DDL.UNSET_ATTRIBUTE',
                      'CTX_DDL.UPDATE_MVDATA_SET',
                      'CTX_DDL.UPDATE_POLICY',
                      'CTX_DDL.UPDATE_SDATA',
                      'CTX_DDL.UPDATE_SUB_LEXER',
                      'CTX_DDL.ZONE_TO_FIELD',
                      'CTX_DOC.HIGHLIGHT_CLOB_QUERY',
                      'CTX_DOC.MARKUP_CLOB_QUERY',
                      'CTX_DOC.POLICY_HIGHLIGHT_CLOB_QUERY',
                      'CTX_DOC.POLICY_MARKUP_CLOB_QUERY',
                      'CTX_DOC.POLICY_SNIPPET_CLOB_QUERY',
                      'CTX_DOC.SNIPPET_CLOB_QUERY',
                      'CTX_ENTITY.ADD_EXTRACT_RULE',
                      'CTX_ENTITY.ADD_STOP_ENTITY',
                      'CTX_ENTITY.COMPILE',
                      'CTX_ENTITY.CREATE_EXTRACT_POLICY',
                      'CTX_ENTITY.DROP_EXTRACT_POLICY',
                      'CTX_ENTITY.EXTRACT',
                      'CTX_ENTITY.REMOVE_EXTRACT_RULE',
                      'CTX_ENTITY.REMOVE_STOP_ENTITY',
                      'CTX_QUERY.CHK_TXNQRY_DISBL_SWITCH',
                      'CTX_QUERY.CHK_XPATH',
                      'CTX_QUERY.COUNT_HITS_CLOB_QUERY',
                      'CTX_QUERY.EXPLAIN_CLOB_QUERY',
                      'CTX_QUERY.FCONTAINS',
                      'CTX_QUERY.HFEEDBACK_CLOB_QUERY',
                      'CTX_QUERY.RESULT_SET_CLOB_QUERY',
                      'CTX_QUERY.STORE_SQE_CLOB_QUERY',
                      'CTX_REPORT.TOKEN_TYPE',
                      'CTX_REPORT.VALIDATE_INDEX',
                      'DBMS_ADVANCED_REWRITE.BUILD_SAFE_REWRITE_EQUIVALENCE',
                      'DBMS_ADVISOR.CHECK_PRIVS',
                      'DBMS_ADVISOR.CHECK_READ_PRIVS',
                      'DBMS_ADVISOR.DELETE_DIRECTIVE',
                      'DBMS_ADVISOR.EVALUATE_DIRECTIVE',
                      'DBMS_ADVISOR.FORMAT_MESSAGE',
                      'DBMS_ADVISOR.FORMAT_MESSAGE_GROUP',
                      'DBMS_ADVISOR.GET_ACCESS_ADVISOR_DEFAULTS',
                      'DBMS_ADVISOR.INSERT_DIRECTIVE',
                      'DBMS_ADVISOR.RESUME_TASK',
                      'DBMS_ADVISOR.SETUP_REPOSITORY',
                      'DBMS_ADVISOR.SETUP_USER_ENVIRONMENT',
                      'DBMS_ADVISOR.UPDATE_DIRECTIVE',
                      'DBMS_AQ.AQ$_DEQUEUE',
                      'DBMS_AQ.AQ$_ENQUEUE',
                      'DBMS_AQADM.ADD_CONNECTION_TO_LDAP',
                      'DBMS_AQADM.AQ$_PROPAQ',
                      'DBMS_AQADM.DEL_ALIAS_FROM_LDAP',
                      'DBMS_AQADM.DEL_CONNECTION_FROM_LDAP',
                      'DBMS_AQADM.GET_PROP_SEQNO',
                      'DBMS_AQADM.GET_REPLAY_INFO',
                      'DBMS_AQADM.GET_TYPE_INFO',
                      'DBMS_AQADM.GRANT_TYPE_ACCESS',
                      'DBMS_AQADM.NONREPUDIATE_RECEIVER',
                      'DBMS_AQADM.NONREPUDIATE_SENDER',
                      'DBMS_AQADM.RECOVER_PROPAGATION',
                      'DBMS_AQADM.RESET_REPLAY_INFO',
                      'DBMS_AQADM.START_TIME_MANAGER',
                      'DBMS_AQADM.STOP_TIME_MANAGER',
                      'DBMS_AQADM.VERIFY_QUEUE_TYPES_GET_NRP',
                      'DBMS_AQADM.VERIFY_QUEUE_TYPES_NO_QUEUE',
                      'DBMS_AQELM.GET_MAILHOST',
                      'DBMS_AQELM.GET_MAILPORT',
                      'DBMS_AQELM.GET_PROXY',
                      'DBMS_AQELM.GET_SENDFROM',
                      'DBMS_AQELM.HTTP_SEND',
                      'DBMS_AQELM.SEND_EMAIL',
                      'DBMS_AQELM.SET_PROXY',
                      'DBMS_AQIN.AQ$_ALTER_QUEUE',
                      'DBMS_AQIN.AQ$_CREATE_QUEUE',
                      'DBMS_AQIN.AQ$_CREATE_QUEUE_TABLE',
                      'DBMS_AQIN.AQ$_DEQUEUE_IN',
                      'DBMS_AQIN.AQ$_DEQUEUE_RAW',
                      'DBMS_AQIN.AQ$_DROP_QUEUE',
                      'DBMS_AQIN.AQ$_DROP_QUEUE_TABLE',
                      'DBMS_AQIN.AQ$_ENQUEUE_OBJ',
                      'DBMS_AQIN.AQ$_ENQUEUE_OBJ_NO_RECPL',
                      'DBMS_AQIN.AQ$_ENQUEUE_RAW',
                      'DBMS_AQIN.AQ$_ENQUEUE_RAW_NO_RECPL',
                      'DBMS_AQIN.AQ$_GETBLOB_FROM_JMSANYDATA',
                      'DBMS_AQIN.AQ$_GETCLOB_FROM_JMSANYDATA',
                      'DBMS_AQIN.AQ$_JMS_ENQUEUE_BYTES_MESSAGE',
                      'DBMS_AQIN.AQ$_JMS_ENQUEUE_MAP_MESSAGE',
                      'DBMS_AQIN.AQ$_JMS_ENQUEUE_OBJECT_MESSAGE',
                      'DBMS_AQIN.AQ$_JMS_ENQUEUE_STREAM_MESSAGE',
                      'DBMS_AQIN.AQ$_JMS_ENQUEUE_TEXT_MESSAGE',
                      'DBMS_AQIN.AQ$_LISTEN',
                      'DBMS_AQIN.AQ$_QUEUE_SUBSCRIBERS',
                      'DBMS_AQIN.AQ$_REGISTER_IN',
                      'DBMS_AQIN.AQ$_START_QUEUE',
                      'DBMS_AQIN.AQ$_STOP_QUEUE',
                      'DBMS_AQIN.GET_DEQ_SORT',
                      'DBMS_AQIN.GET_MULTI_RETRY',
                      'DBMS_AQIN.SET_DEQ_SORT',
                      'DBMS_AQIN.SET_MULTI_RETRY',
                      'DBMS_AUDIT_MGMT.MOVE_DBAUDIT_TABLES',
                      'DBMS_AUDIT_MGMT.SET_DEBUG_LEVEL',
                      'DBMS_AUTO_TASK_ADMIN.SET_ATTRIBUTE',
                      'DBMS_AUTO_TASK_IMMEDIATE.GATHER_OPTIMIZER_STATS',
                      'DBMS_COMPRESSION.INCREMENTAL_COMPRESS',
                      'DBMS_CSX_ADMIN.COPYDEFAULTTOKENTABLESET',
                      'DBMS_CSX_ADMIN.GATHERTOKENTABLESTATS',
                      'DBMS_CSX_ADMIN.INSTANCE_INFO_EXP',
                      'DBMS_CSX_ADMIN.REGISTERTOKENTABLESET',
                      'DBMS_CUBE_LOG.COMPLETE_OPLOG',
                      'DBMS_CUBE_LOG.SET_QUERY_ENV',
                      'DBMS_CUBE_LOG.START_OPLOG',
                      'DBMS_CUBE_LOG.VERBOSE_ACTION',
                      'DBMS_CUBE_LOG.VERBOSE_DEBUG',
                      'DBMS_CUBE_LOG.VERBOSE_INFO',
                      'DBMS_CUBE_LOG.VERBOSE_NOTICE',
                      'DBMS_CUBE_LOG.VERBOSE_STATS',
                      'DBMS_CUBE_LOG.WRITE_TO_OPLOG',
                      'DBMS_DATAPUMP.ADD_DEVICE',
                      'DBMS_DATAPUMP.CLIENT_LOB_APPEND',
                      'DBMS_DATAPUMP.CLIENT_LOB_DELETE',
                      'DBMS_DATAPUMP.CLIENT_LOB_GET',
                      'DBMS_DATAPUMP.CREATE_JOB_VIEW',
                      'DBMS_DATAPUMP.DATAPUMP_JOB',
                      'DBMS_DATAPUMP.ESTABLISH_REMOTE_CONTEXT',
                      'DBMS_DATAPUMP.GET_STATUS_VERSION',
                      'DBMS_DATAPUMP.HAS_PRIVS',
                      'DBMS_DATAPUMP.LOG_ERROR',
                      'DBMS_DATAPUMP.SETUP_REMOTE_CONTEXT',
                      'DBMS_DATAPUMP.SET_DEBUG',
                      'DBMS_DATAPUMP.SET_REMOTE_WORKER',
                      'DBMS_DATAPUMP.TEST_REMOTE_CONTEXT1010',
                      'DBMS_DATAPUMP.TEST_REMOTE_CONTEXT1020',
                      'DBMS_DATAPUMP.TEST_REMOTE_CONTEXT1120',
                      'DBMS_DATA_MINING.GET_DEFAULT_SETTINGS',
                      'DBMS_DATA_MINING.GET_MODEL_DETAILS_ABN',
                      'DBMS_DATA_MINING.GET_MODEL_SETTINGS',
                      'DBMS_DATA_MINING.GET_MODEL_SIGNATURE',
                      'DBMS_DBFS_CONTENT.GETATTR_VIEW',
                      'DBMS_DBFS_CONTENT.GETDEFAULTCONTEXT',
                      'DBMS_DBFS_CONTENT.LISTCURSOR',
                      'DBMS_DBFS_CONTENT.PROPERTIESH2T',
                      'DBMS_DBFS_CONTENT.SEARCH',
                      'DBMS_DBFS_CONTENT_SPI.CREATEGETATTRVIEW',
                      'DBMS_DBFS_CONTENT_SPI.DROPGETATTRVIEW',
                      'DBMS_DBFS_CONTENT_SPI.LISTCURSOR',
                      'DBMS_DBFS_CONTENT_SPI.SPACEUSAGEFULL',
                      'DBMS_DBFS_HS.CHECKACCESS',
                      'DBMS_DBFS_HS.CREATEDIRECTORY',
                      'DBMS_DBFS_HS.CREATEFILE',
                      'DBMS_DBFS_HS.CREATELINK',
                      'DBMS_DBFS_HS.CREATEREFERENCE',
                      'DBMS_DBFS_HS.DELETECONTENT',
                      'DBMS_DBFS_HS.DELETEDIRECTORY',
                      'DBMS_DBFS_HS.DELETEFILE',
                      'DBMS_DBFS_HS.GETFEATURES',
                      'DBMS_DBFS_HS.GETPATH',
                      'DBMS_DBFS_HS.GETPATHBYSTOREID',
                      'DBMS_DBFS_HS.GETPATHNOWAIT',
                      'DBMS_DBFS_HS.GETSTOREID',
                      'DBMS_DBFS_HS.GETVERSION',
                      'DBMS_DBFS_HS.LIST',
                      'DBMS_DBFS_HS.LISTCONTENTFILENAME',
                      'DBMS_DBFS_HS.LOCKPATH',
                      'DBMS_DBFS_HS.PURGEALL',
                      'DBMS_DBFS_HS.PURGEPATH',
                      'DBMS_DBFS_HS.PUTPATH',
                      'DBMS_DBFS_HS.RENAMEPATH',
                      'DBMS_DBFS_HS.RESTOREALL',
                      'DBMS_DBFS_HS.RESTOREPATH',
                      'DBMS_DBFS_HS.SEARCH',
                      'DBMS_DBFS_HS.SETPATH',
                      'DBMS_DBFS_HS.SPACEUSAGE',
                      'DBMS_DBFS_HS.UNLOCKPATH',
                      'DBMS_DBFS_SFS.ADDFSPROPERTIES',
                      'DBMS_DBFS_SFS.CHECKACCESS',
                      'DBMS_DBFS_SFS.CREATEDIRECTORY',
                      'DBMS_DBFS_SFS.CREATEFILE',
                      'DBMS_DBFS_SFS.CREATEGETATTRVIEW',
                      'DBMS_DBFS_SFS.CREATELINK',
                      'DBMS_DBFS_SFS.CREATEREFERENCE',
                      'DBMS_DBFS_SFS.CREATESNAPSHOT',
                      'DBMS_DBFS_SFS.DELETECONTENT',
                      'DBMS_DBFS_SFS.DELETEDIRECTORY',
                      'DBMS_DBFS_SFS.DELETEFILE',
                      'DBMS_DBFS_SFS.DELETEFSPROPERTIES',
                      'DBMS_DBFS_SFS.DROPGETATTRVIEW',
                      'DBMS_DBFS_SFS.DROPSNAPSHOT',
                      'DBMS_DBFS_SFS.EXPORTFILESYSTEM',
                      'DBMS_DBFS_SFS.EXPORTTABLE',
                      'DBMS_DBFS_SFS.FS_ACCESS',
                      'DBMS_DBFS_SFS.FS_CHMOD',
                      'DBMS_DBFS_SFS.FS_CHOWN',
                      'DBMS_DBFS_SFS.FS_CREAT',
                      'DBMS_DBFS_SFS.FS_DESTROY',
                      'DBMS_DBFS_SFS.FS_FGETATTR',
                      'DBMS_DBFS_SFS.FS_FLUSH',
                      'DBMS_DBFS_SFS.FS_FSYNC',
                      'DBMS_DBFS_SFS.FS_FSYNCDIR',
                      'DBMS_DBFS_SFS.FS_FTRUNCATE',
                      'DBMS_DBFS_SFS.FS_GETATTR',
                      'DBMS_DBFS_SFS.FS_GETXATTR',
                      'DBMS_DBFS_SFS.FS_INIT',
                      'DBMS_DBFS_SFS.FS_LINK',
                      'DBMS_DBFS_SFS.FS_LISTXATTR',
                      'DBMS_DBFS_SFS.FS_MKDIR',
                      'DBMS_DBFS_SFS.FS_MKNOD',
                      'DBMS_DBFS_SFS.FS_OPEN',
                      'DBMS_DBFS_SFS.FS_OPENDIR',
                      'DBMS_DBFS_SFS.FS_READ',
                      'DBMS_DBFS_SFS.FS_READDIR',
                      'DBMS_DBFS_SFS.FS_READLINK',
                      'DBMS_DBFS_SFS.FS_RELEASE',
                      'DBMS_DBFS_SFS.FS_RELEASEDIR',
                      'DBMS_DBFS_SFS.FS_REMOVEXATTR',
                      'DBMS_DBFS_SFS.FS_RENAME',
                      'DBMS_DBFS_SFS.FS_RMDIR',
                      'DBMS_DBFS_SFS.FS_SETXATTR',
                      'DBMS_DBFS_SFS.FS_STATFS',
                      'DBMS_DBFS_SFS.FS_SYMLINK',
                      'DBMS_DBFS_SFS.FS_TRUNCATE',
                      'DBMS_DBFS_SFS.FS_UNLINK',
                      'DBMS_DBFS_SFS.FS_UTIME',
                      'DBMS_DBFS_SFS.FS_WRITE',
                      'DBMS_DBFS_SFS.GETFEATURES',
                      'DBMS_DBFS_SFS.GETPATH',
                      'DBMS_DBFS_SFS.GETPATHBYSTOREID',
                      'DBMS_DBFS_SFS.GETPATHNOWAIT',
                      'DBMS_DBFS_SFS.GETSTOREID',
                      'DBMS_DBFS_SFS.GETVERSION',
                      'DBMS_DBFS_SFS.GET_EPOCH',
                      'DBMS_DBFS_SFS.LIST',
                      'DBMS_DBFS_SFS.LISTCURSOR',
                      'DBMS_DBFS_SFS.LISTFILESYSTEMS',
                      'DBMS_DBFS_SFS.LISTSNAPSHOTS',
                      'DBMS_DBFS_SFS.LISTTABLES',
                      'DBMS_DBFS_SFS.LISTVOLUMES',
                      'DBMS_DBFS_SFS.LOCKPATH',
                      'DBMS_DBFS_SFS.NORMALIZEFS',
                      'DBMS_DBFS_SFS.PURGEALL',
                      'DBMS_DBFS_SFS.PURGEPATH',
                      'DBMS_DBFS_SFS.PUTPATH',
                      'DBMS_DBFS_SFS.REGISTERFILESYSTEM',
                      'DBMS_DBFS_SFS.RENAMEPATH',
                      'DBMS_DBFS_SFS.RESTOREALL',
                      'DBMS_DBFS_SFS.RESTOREPATH',
                      'DBMS_DBFS_SFS.REVERTSNAPSHOT',
                      'DBMS_DBFS_SFS.SEARCH',
                      'DBMS_DBFS_SFS.SETFSPROPERTIES',
                      'DBMS_DBFS_SFS.SETPATH',
                      'DBMS_DBFS_SFS.SHRINKFS',
                      'DBMS_DBFS_SFS.SPACEUSAGE',
                      'DBMS_DBFS_SFS.SPACEUSAGEFULL',
                      'DBMS_DBFS_SFS.TO_EPOCH',
                      'DBMS_DBFS_SFS.UNLOCKPATH',
                      'DBMS_DBFS_SFS.UNREGISTERFILESYSTEM',
                      'DBMS_DDL.ANALYZE_OBJECT',
                      'DBMS_DDL.IS_TRIGGER_FIRE_ONCE_INTERNAL',
                      'DBMS_DEBUG.ABORT',
                      'DBMS_DEBUG.GET_ENCODED_PKGVARS_FOR_CLIENT',
                      'DBMS_DEBUG.GET_ENCODED_STACK_FOR_CLIENT',
                      'DBMS_DEBUG.SET_DIAGNOSTIC_LEVEL',
                      'DBMS_DEFER.ANY_CHAR_ARG',
                      'DBMS_DEFER.ANY_CLOB_ARG',
                      'DBMS_DEFER.ANY_VARCHAR2_ARG',
                      'DBMS_DEFER.BLOB_ARG',
                      'DBMS_DEFER.CHAR_ARG',
                      'DBMS_DEFER.CLOB_ARG',
                      'DBMS_DEFER.DATE_ARG',
                      'DBMS_DEFER.GET_NEXT_TXN_LOG_RUN',
                      'DBMS_DEFER.GET_TXN_LOG_RUNS',
                      'DBMS_DEFER.IDS_ARG',
                      'DBMS_DEFER.IYM_ARG',
                      'DBMS_DEFER.NCHAR_ARG',
                      'DBMS_DEFER.NCLOB_ARG',
                      'DBMS_DEFER.NUMBER_ARG',
                      'DBMS_DEFER.NVARCHAR2_ARG',
                      'DBMS_DEFER.PURGE_TRANSACTION_LOG',
                      'DBMS_DEFER.RAW_ARG',
                      'DBMS_DEFER.RECORD_TRANSACTION',
                      'DBMS_DEFER.ROWID_ARG',
                      'DBMS_DEFER.TIMESTAMP_ARG',
                      'DBMS_DEFER.TIME_ARG',
                      'DBMS_DEFER.TSLTZ_ARG',
                      'DBMS_DEFER.TSTZ_ARG',
                      'DBMS_DEFER.TTZ_ARG',
                      'DBMS_DEFER.VARCHAR2_ARG',
                      'DBMS_DEFER_QUERY.GET_ANYDATA_ARG',
                      'DBMS_DEFER_QUERY.GET_ARG_CSETID',
                      'DBMS_DEFER_QUERY.GET_BLOB_ARG',
                      'DBMS_DEFER_QUERY.GET_CHAR_ARG',
                      'DBMS_DEFER_QUERY.GET_CLOB_ARG',
                      'DBMS_DEFER_QUERY.GET_DATE_ARG',
                      'DBMS_DEFER_QUERY.GET_IDS_ARG',
                      'DBMS_DEFER_QUERY.GET_IYM_ARG',
                      'DBMS_DEFER_QUERY.GET_NCHAR_ARG',
                      'DBMS_DEFER_QUERY.GET_NCLOB_ARG',
                      'DBMS_DEFER_QUERY.GET_NUMBER_ARG',
                      'DBMS_DEFER_QUERY.GET_NVARCHAR2_ARG',
                      'DBMS_DEFER_QUERY.GET_OBJECT_NULL_VECTOR_ARG',
                      'DBMS_DEFER_QUERY.GET_RAW_ARG',
                      'DBMS_DEFER_QUERY.GET_ROWID_ARG',
                      'DBMS_DEFER_QUERY.GET_TIMESTAMP_ARG',
                      'DBMS_DEFER_QUERY.GET_TIME_ARG',
                      'DBMS_DEFER_QUERY.GET_TSLTZ_ARG',
                      'DBMS_DEFER_QUERY.GET_TSTZ_ARG',
                      'DBMS_DEFER_QUERY.GET_TTZ_ARG',
                      'DBMS_DEFER_QUERY.GET_VARCHAR2_ARG',
                      'DBMS_DEFER_SYS.EXECUTE',
                      'DBMS_DEFER_SYS.EXECUTE_ERROR_CALL',
                      'DBMS_DEFER_SYS.EXECUTE_ERROR_CALL_AS_USER',
                      'DBMS_DEFER_SYS.NULLIFY_ALL_TRANS',
                      'DBMS_DEFER_SYS.NULLIFY_TRANS_TO_DESTINATION',
                      'DBMS_DEFER_SYS.PUSH_WITH_CATCHUP',
                      'DBMS_DEFER_SYS.SCHEDULE_EXECUTION',
                      'DBMS_DEFER_SYS.UNSCHEDULE_EXECUTION',
                      'DBMS_DST.END_PREPARE',
                      'DBMS_DST.LOAD_SECONDARY',
                      'DBMS_DST.UNLOAD_SECONDARY',
                      'DBMS_HM.CREATE_OFFLINE_DICTIONARY',
                      'DBMS_HM.CREATE_SCHEMA',
                      'DBMS_HM.DROP_SCHEMA',
                      'DBMS_HM.RUN_DDE_ACTION',
                      'DBMS_HS_PARALLEL.CREATE_OR_REPLACE_VIEW',
                      'DBMS_HS_PARALLEL.CREATE_TABLE_TEMPLATE',
                      'DBMS_HS_PARALLEL.DROP_VIEW',
                      'DBMS_HS_PARALLEL.LOAD_TABLE',
                      'DBMS_JOB.BACKGROUND_PROCESS',
                      'DBMS_JOB.ISUBMIT',
                      'DBMS_JOB.IS_JOBQ',
                      'DBMS_LDAP.ADD_S',
                      'DBMS_LDAP.BER_FREE',
                      'DBMS_LDAP.BIND_S',
                      'DBMS_LDAP.CHECK_INTERFACE_VERSION',
                      'DBMS_LDAP.COMPARE_S',
                      'DBMS_LDAP.COUNT_ENTRIES',
                      'DBMS_LDAP.COUNT_VALUES',
                      'DBMS_LDAP.COUNT_VALUES_BLOB',
                      'DBMS_LDAP.COUNT_VALUES_LEN',
                      'DBMS_LDAP.CREATE_MOD_ARRAY',
                      'DBMS_LDAP.DELETE',
                      'DBMS_LDAP.DELETE_S',
                      'DBMS_LDAP.ERR2STRING',
                      'DBMS_LDAP.EXPLODE_DN',
                      'DBMS_LDAP.FIRST_ATTRIBUTE',
                      'DBMS_LDAP.FIRST_ENTRY',
                      'DBMS_LDAP.FREE_MOD_ARRAY',
                      'DBMS_LDAP.GET_DN',
                      'DBMS_LDAP.GET_SESSION_INFO',
                      'DBMS_LDAP.GET_TRACE_LEVEL',
                      'DBMS_LDAP.GET_VALUES',
                      'DBMS_LDAP.GET_VALUES_BLOB',
                      'DBMS_LDAP.GET_VALUES_LEN',
                      'DBMS_LDAP.INIT',
                      'DBMS_LDAP.MODIFY_S',
                      'DBMS_LDAP.MODRDN2_S',
                      'DBMS_LDAP.MSGFREE',
                      'DBMS_LDAP.NEXT_ATTRIBUTE',
                      'DBMS_LDAP.NEXT_ENTRY',
                      'DBMS_LDAP.NLS_CONVERT_FROM_UTF8',
                      'DBMS_LDAP.NLS_CONVERT_TO_UTF8',
                      'DBMS_LDAP.NLS_GET_DBCHARSET_NAME',
                      'DBMS_LDAP.OPEN_SSL',
                      'DBMS_LDAP.POPULATE_MOD_ARRAY',
                      'DBMS_LDAP.RENAME_S',
                      'DBMS_LDAP.SEARCH_S',
                      'DBMS_LDAP.SEARCH_ST',
                      'DBMS_LDAP.SET_TRACE_LEVEL',
                      'DBMS_LDAP.SIMPLE_BIND_S',
                      'DBMS_LDAP.UNBIND_S',
                      'DBMS_LDAP.VALUE_FREE_BLOB',
                      'DBMS_LDAP_UTL.AUTHENTICATE_USER',
                      'DBMS_LDAP_UTL.AUTHENTICATE_USER_EXT',
                      'DBMS_LDAP_UTL.CHECK_GROUP_MEMBERSHIP',
                      'DBMS_LDAP_UTL.CHECK_INTERFACE_VERSION',
                      'DBMS_LDAP_UTL.CHECK_USER_SUBSCRIPTION',
                      'DBMS_LDAP_UTL.CREATE_GROUP_HANDLE',
                      'DBMS_LDAP_UTL.CREATE_MOD_PROPERTYSET',
                      'DBMS_LDAP_UTL.CREATE_SERVICE_HANDLE',
                      'DBMS_LDAP_UTL.CREATE_SUBSCRIBER_HANDLE',
                      'DBMS_LDAP_UTL.CREATE_USER_HANDLE',
                      'DBMS_LDAP_UTL.FREE_HANDLE',
                      'DBMS_LDAP_UTL.FREE_MOD_PROPERTYSET',
                      'DBMS_LDAP_UTL.FREE_PROPERTYSET_COLLECTION',
                      'DBMS_LDAP_UTL.GET_AVAILABLE_SERVICES',
                      'DBMS_LDAP_UTL.GET_GROUP_DN',
                      'DBMS_LDAP_UTL.GET_GROUP_MEMBERSHIP',
                      'DBMS_LDAP_UTL.GET_GROUP_PROPERTIES',
                      'DBMS_LDAP_UTL.GET_PROPERTY_NAMES',
                      'DBMS_LDAP_UTL.GET_PROPERTY_VALUES',
                      'DBMS_LDAP_UTL.GET_PROPERTY_VALUES_BLOB',
                      'DBMS_LDAP_UTL.GET_PROPERTY_VALUES_LEN',
                      'DBMS_LDAP_UTL.GET_SUBSCRIBED_SERVICES',
                      'DBMS_LDAP_UTL.GET_SUBSCRIBED_USERS',
                      'DBMS_LDAP_UTL.GET_SUBSCRIBER_DN',
                      'DBMS_LDAP_UTL.GET_SUBSCRIBER_EXT_PROPERTIES',
                      'DBMS_LDAP_UTL.GET_SUBSCRIBER_PROPERTIES',
                      'DBMS_LDAP_UTL.GET_USER_DN',
                      'DBMS_LDAP_UTL.GET_USER_EXTENDED_PROPERTIES',
                      'DBMS_LDAP_UTL.GET_USER_PROPERTIES',
                      'DBMS_LDAP_UTL.GET_USER_PROPS_AND_AUTH',
                      'DBMS_LDAP_UTL.LOCATE_SUBSCRIBER_FOR_USER',
                      'DBMS_LDAP_UTL.NORMALIZE_DN_WITH_CASE',
                      'DBMS_LDAP_UTL.POPULATE_MOD_PROPERTYSET',
                      'DBMS_LDAP_UTL.PROPERTY_VALUE_FREE_BLOB',
                      'DBMS_LDAP_UTL.SET_GROUP_HANDLE_PROPERTIES',
                      'DBMS_LDAP_UTL.SET_USER_HANDLE_PROPERTIES',
                      'DBMS_LDAP_UTL.SET_USER_PROPERTIES',
                      'DBMS_LDAP_UTL.SUBSCRIBE_USER',
                      'DBMS_LDAP_UTL.UNSUBSCRIBE_USER'/*,
                      'DBMS_LOB.GET_DEDUPLICATE_REGIONS',
                      'DBMS_LOB.ISSECUREFILE',
                      'DBMS_LOGSTDBY.DB_IS_LOGSTDBY',
                      'DBMS_LOGSTDBY.EDS_EVOLVE_TABLE',
                      'DBMS_LOGSTDBY.VALIDATE_AUTH',
                      'DBMS_METADATA.CHECK_MATCH_TEMPLATE',
                      'DBMS_METADATA.CHECK_MATCH_TEMPLATE_LOB',
                      'DBMS_METADATA.CHECK_MATCH_TEMPLATE_PAR',
                      'DBMS_METADATA.CHECK_TYPE',
                      'DBMS_METADATA.CONVERT_TO_CANONICAL',
                      'DBMS_METADATA.FETCH_CLOB',
                      'DBMS_METADATA.FETCH_DDL',
                      'DBMS_METADATA.FETCH_DDL_TEXT',
                      'DBMS_METADATA.FETCH_OBJNUMS',
                      'DBMS_METADATA.FETCH_OBJNUMS_NAMES',
                      'DBMS_METADATA.FETCH_SORTED_OBJNUMS',
                      'DBMS_METADATA.FETCH_XML_CLOB',
                      'DBMS_METADATA.FREE_CONTEXT_ENTRY',
                      'DBMS_METADATA.GET_ACTION_INSTANCE',
                      'DBMS_METADATA.GET_ACTION_SCHEMA',
                      'DBMS_METADATA.GET_ACTION_SYS',
                      'DBMS_METADATA.GET_CANONICAL_VSN',
                      'DBMS_METADATA.GET_CHECK_CONSTRAINT_NAME',
                      'DBMS_METADATA.GET_DDL',
                      'DBMS_METADATA.GET_DEPENDENT_DDL',
                      'DBMS_METADATA.GET_DEPENDENT_SXML',
                      'DBMS_METADATA.GET_DEPENDENT_XML',
                      'DBMS_METADATA.GET_DOMIDX_METADATA',
                      'DBMS_METADATA.GET_DPSTRM_MD',
                      'DBMS_METADATA.GET_EDITION',
                      'DBMS_METADATA.GET_EDITION_ID',
                      'DBMS_METADATA.GET_FK_CONSTRAINT_NAME',
                      'DBMS_METADATA.GET_GRANTED_DDL',
                      'DBMS_METADATA.GET_GRANTED_XML',
                      'DBMS_METADATA.GET_HASHCODE',
                      'DBMS_METADATA.GET_INDEX_INTCOL',
                      'DBMS_METADATA.GET_JAVA_METADATA',
                      'DBMS_METADATA.GET_PLUGTS_BLK',
                      'DBMS_METADATA.GET_PREPOST_TABLE_ACT',
                      'DBMS_METADATA.GET_PROCOBJ',
                      'DBMS_METADATA.GET_PROCOBJ_GRANT',
                      'DBMS_METADATA.GET_STAT_COLNAME',
                      'DBMS_METADATA.GET_STAT_INDNAME',
                      'DBMS_METADATA.GET_SXML',
                      'DBMS_METADATA.GET_SXML_DDL',
                      'DBMS_METADATA.GET_SYSPRIVS',
                      'DBMS_METADATA.GET_VERSION',
                      'DBMS_METADATA.IS_ATTR_VALID_ON_10',
                      'DBMS_METADATA.NETWORK_CALLOUTS',
                      'DBMS_METADATA.NETWORK_FETCH_CLOB',
                      'DBMS_METADATA.NETWORK_FETCH_ERRORS',
                      'DBMS_METADATA.NETWORK_FETCH_PARSE',
                      'DBMS_METADATA.NETWORK_OPEN',
                      'DBMS_METADATA.NET_SET_DEBUG',
                      'DBMS_METADATA.OKTOEXP_2NDARY_TABLE',
                      'DBMS_METADATA.OPEN_GET_FK_CONSTRAINT_NAME',
                      'DBMS_METADATA.PARSE_CONDITION',
                      'DBMS_METADATA.PARSE_DEFAULT',
                      'DBMS_METADATA.PARSE_QUERY',
                      'DBMS_METADATA.PATCH_TYPEID',
                      'DBMS_METADATA.SET_DEBUG',
                      'DBMS_METADATA.SET_FK_CONSTRAINT_COL_PAIR',
                      'DBMS_METADATA.SET_PARAMETER',
                      'DBMS_METADATA.SET_REMAP_PARAM',
                      'DBMS_METADATA.SET_XMLFORMAT',
                      'DBMS_METADATA_DIFF.COMPARE_ALTER',
                      'DBMS_METADATA_DIFF.COMPARE_ALTER_XML',
                      'DBMS_NETWORK_ACL_ADMIN.ASSIGN_WALLET_ACL',
                      'DBMS_NETWORK_ACL_ADMIN.HANDLEPREDELETE',
                      'DBMS_NETWORK_ACL_ADMIN.UNASSIGN_WALLET_ACL',
                      'DBMS_OBFUSCATION_TOOLKIT.DES3DECRYPT',
                      'DBMS_OBFUSCATION_TOOLKIT.DES3ENCRYPT',
                      'DBMS_OBFUSCATION_TOOLKIT.DES3GETKEY',
                      'DBMS_OBFUSCATION_TOOLKIT.DESDECRYPT',
                      'DBMS_OBFUSCATION_TOOLKIT.DESENCRYPT',
                      'DBMS_OBFUSCATION_TOOLKIT.DESGETKEY',
                      'DBMS_OBFUSCATION_TOOLKIT.MD5',
                      'DBMS_ODCI.CLEANUP',
                      'DBMS_ODCI.GETMETADATA',
                      'DBMS_ODCI.GETTABLENAMES',
                      'DBMS_ODCI.RESTOREREFCURSOR',
                      'DBMS_ODCI.SAVEREFCURSOR',
                      'DBMS_ODCI.UPGRADE_SECOBJ',
                      'DBMS_OFFLINE_OG.BEGIN_FLAVOR_CHANGE',
                      'DBMS_OFFLINE_OG.END_FLAVOR_CHANGE',
                      'DBMS_PARALLEL_EXECUTE.RUN_INTERNAL_WORKER',
                      'DBMS_PIPE.PACK_MESSAGE_RAW',
                      'DBMS_PIPE.PACK_MESSAGE_ROWID',
                      'DBMS_PIPE.UNPACK_MESSAGE_RAW',
                      'DBMS_PIPE.UNPACK_MESSAGE_ROWID',
                      'DBMS_PROFILER.ROLLUP_RUN',
                      'DBMS_PROFILER.ROLLUP_UNIT',
                      'DBMS_RECTIFIER_DIFF.TURN_REPLICATION_OFF',
                      'DBMS_RECTIFIER_DIFF.TURN_REPLICATION_ON',
                      'DBMS_REFRESH.MAKE_REPAPI',
                      'DBMS_REFRESH.USER_EXPORT',
                      'DBMS_REFRESH.USER_EXPORT_CHILD',
                      'DBMS_REPAIR.REBUILD_SHC_INDEX',
                      'DBMS_REPCAT.ABORT_FLAVOR_DEFINITION',
                      'DBMS_REPCAT.ADD_COLUMNS_TO_FLAVOR',
                      'DBMS_REPCAT.ADD_COLUMN_GROUP_TO_FLAVOR',
                      'DBMS_REPCAT.ADD_DELETE_RESOLUTION',
                      'DBMS_REPCAT.ADD_OBJECT_TO_FLAVOR',
                      'DBMS_REPCAT.ADD_PRIORITY_CHAR',
                      'DBMS_REPCAT.ADD_PRIORITY_DATE',
                      'DBMS_REPCAT.ADD_PRIORITY_NCHAR',
                      'DBMS_REPCAT.ADD_PRIORITY_NUMBER',
                      'DBMS_REPCAT.ADD_PRIORITY_NVARCHAR2',
                      'DBMS_REPCAT.ADD_PRIORITY_RAW',
                      'DBMS_REPCAT.ADD_PRIORITY_VARCHAR2',
                      'DBMS_REPCAT.ADD_UNIQUE_RESOLUTION',
                      'DBMS_REPCAT.ALTER_PRIORITY_CHAR',
                      'DBMS_REPCAT.ALTER_PRIORITY_DATE',
                      'DBMS_REPCAT.ALTER_PRIORITY_NCHAR',
                      'DBMS_REPCAT.ALTER_PRIORITY_NUMBER',
                      'DBMS_REPCAT.ALTER_PRIORITY_NVARCHAR2',
                      'DBMS_REPCAT.ALTER_PRIORITY_RAW',
                      'DBMS_REPCAT.ALTER_PRIORITY_VARCHAR2',
                      'DBMS_REPCAT.ALTER_SNAPSHOT_PROPAGATION',
                      'DBMS_REPCAT.BEGIN_FLAVOR_DEFINITION',
                      'DBMS_REPCAT.COMMA_TO_TABLE',
                      'DBMS_REPCAT.COMMENT_ON_DELETE_RESOLUTION',
                      'DBMS_REPCAT.COMMENT_ON_SNAPSHOT_REPSITES',
                      'DBMS_REPCAT.COMMENT_ON_UNIQUE_RESOLUTION',
                      'DBMS_REPCAT.CREATE_SNAPSHOT_REPGROUP',
                      'DBMS_REPCAT.CREATE_SNAPSHOT_REPOBJECT',
                      'DBMS_REPCAT.DROP_COLUMNS_FROM_FLAVOR',
                      'DBMS_REPCAT.DROP_COLUMN_GROUP_FROM_FLAVOR',
                      'DBMS_REPCAT.DROP_DELETE_RESOLUTION',
                      'DBMS_REPCAT.DROP_OBJECT_FROM_FLAVOR',
                      'DBMS_REPCAT.DROP_PRIORITY_CHAR',
                      'DBMS_REPCAT.DROP_PRIORITY_DATE',
                      'DBMS_REPCAT.DROP_PRIORITY_NCHAR',
                      'DBMS_REPCAT.DROP_PRIORITY_NUMBER',
                      'DBMS_REPCAT.DROP_PRIORITY_NVARCHAR2',
                      'DBMS_REPCAT.DROP_PRIORITY_RAW',
                      'DBMS_REPCAT.DROP_PRIORITY_VARCHAR2',
                      'DBMS_REPCAT.DROP_SNAPSHOT_REPGROUP',
                      'DBMS_REPCAT.DROP_SNAPSHOT_REPOBJECT',
                      'DBMS_REPCAT.DROP_UNIQUE_RESOLUTION',
                      'DBMS_REPCAT.GENERATE_FLAVOR_NAME',
                      'DBMS_REPCAT.GENERATE_REPLICATION_PACKAGE',
                      'DBMS_REPCAT.GENERATE_REPLICATION_TRIGGER',
                      'DBMS_REPCAT.GENERATE_SNAPSHOT_SUPPORT',
                      'DBMS_REPCAT.OBSOLETE_FLAVOR_DEFINITION',
                      'DBMS_REPCAT.ORDER_USER_OBJECTS',
                      'DBMS_REPCAT.PUBLISH_FLAVOR_DEFINITION',
                      'DBMS_REPCAT.PURGE_FLAVOR_DEFINITION',
                      'DBMS_REPCAT.REFRESH_SNAPSHOT_REPGROUP',
                      'DBMS_REPCAT.REGISTER_SNAPSHOT_REPGROUP',
                      'DBMS_REPCAT.REPCAT_IMPORT_REPSCHEMA',
                      'DBMS_REPCAT.REPCAT_IMPORT_REPSCHEMA_STRING',
                      'DBMS_REPCAT.SEND_AND_COMPARE_OLD_VALUES',
                      'DBMS_REPCAT.SET_LOCAL_FLAVOR',
                      'DBMS_REPCAT.SWITCH_SNAPSHOT_MASTER',
                      'DBMS_REPCAT.TICKLE_JOB',
                      'DBMS_REPCAT.UNREGISTER_SNAPSHOT_REPGROUP',
                      'DBMS_REPCAT.VALIDATE_FLAVOR_DEFINITION',
                      'DBMS_REPCAT.VALIDATE_FOR_LOCAL_FLAVOR',
                      'DBMS_REPCAT_ADMIN.BIC',
                      'DBMS_REPCAT_ADMIN.BIS',
                      'DBMS_REPCAT_ADMIN.DO_SQL',
                      'DBMS_REPCAT_ADMIN.GRANT_ADMIN_ANY_REPGROUP',
                      'DBMS_REPCAT_ADMIN.GRANT_ADMIN_ANY_REPSCHEMA',
                      'DBMS_REPCAT_ADMIN.GRANT_ADMIN_REPGROUP',
                      'DBMS_REPCAT_ADMIN.GRANT_ADMIN_REPSCHEMA',
                      'DBMS_REPCAT_ADMIN.GRANT_PROXY_SNAPADMIN_PRIVS',
                      'DBMS_REPCAT_ADMIN.GRANT_SNAPADMIN_PROXY',
                      'DBMS_REPCAT_ADMIN.REVOKE_ADMIN_ANY_REPGROUP',
                      'DBMS_REPCAT_ADMIN.REVOKE_ADMIN_ANY_REPSCHEMA',
                      'DBMS_REPCAT_ADMIN.REVOKE_ADMIN_REPGROUP',
                      'DBMS_REPCAT_ADMIN.REVOKE_ADMIN_REPSCHEMA',
                      'DBMS_REPCAT_ADMIN.REVOKE_SNAPADMIN_PROXY',
                      'DBMS_REPCAT_INSTANTIATE.INSTANTIATE_OFFLINE_REPAPI',
                      'DBMS_REPCAT_RGT.CHECK_DDL_TEXT',
                      'DBMS_REPCAT_RGT.CLOB_FROM_VC2',
                      'DBMS_REPCAT_RGT.INSTANTIATE_OFFLINE_JAVA',
                      'DBMS_REPCAT_RGT.INSTANTIATE_OFFLINE_REPAPI'*/
                     )
                order by package_name, proc_name,position,data_type)
      loop
        
        writeNonDocProcLine(
                           row.package_name,
                           row.proc_name,
                           row.argument_name,
                           row.position,
                           row.data_type,
                           row.in_out,
                           row.defaulted
                          );
        
      
      end loop;
      
      return;
      
      for row in (select package_name,
                         object_name proc_name,
                         argument_name,
                         position,
                         data_type,
                         in_out,
                         defaulted
                    from all_arguments
                   where 1=1
                     and (overload is null or overload = 1)
                     and data_level = 0
                     and package_name || '.' || object_name in
                     (
                      'DBMS_REPCAT_RGT.READ_CLOB',
                      'DBMS_REPCAT_RGT.SUBSTITUTE_PARAMETERS',
                      'DBMS_REPCAT_RGT.VC2_FROM_CLOB',
                      'DBMS_REPUTIL.ADDITIVE',
                      'DBMS_REPUTIL.APPEND_SEQUENCE',
                      'DBMS_REPUTIL.APPEND_SEQUENCE_NC',
                      'DBMS_REPUTIL.APPEND_SITE_NAME',
                      'DBMS_REPUTIL.APPEND_SITE_NAME_NC',
                      'DBMS_REPUTIL.AVERAGE',
                      'DBMS_REPUTIL.CANONICALIZE',
                      'DBMS_REPUTIL.DISCARD',
                      'DBMS_REPUTIL.ENSURE_NORMAL_STATUS',
                      'DBMS_REPUTIL.ENTER_STATISTICS',
                      'DBMS_REPUTIL.GET_CONSTRAINT_NAME',
                      'DBMS_REPUTIL.IMPORT_REP_TRIGGER_STRING',
                      'DBMS_REPUTIL.MAXIMUM',
                      'DBMS_REPUTIL.MINIMUM',
                      'DBMS_REPUTIL.OVERWRITE',
                      'DBMS_REPUTIL.RAW_TO_VARCHAR2',
                      'DBMS_REPUTIL.RECURSION_OFF',
                      'DBMS_REPUTIL.RECURSION_ON',
                      'DBMS_REPUTIL.REP_BEGIN',
                      'DBMS_REPUTIL.REP_END',
                      'DBMS_REPUTIL.SET_GLOBAL_NAME',
                      'DBMS_RESCONFIG.APPENDRESCONFIG',
                      'DBMS_RESULT_CACHE.DELETE_DEPENDENCY',
                      'DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER',
                      'DBMS_SCHEDULER.ANALYZE_CHAIN',
                      'DBMS_SCHEDULER.AUTO_PURGE',
                      'DBMS_SCHEDULER.CHECK_SYS_PRIVS',
                      'DBMS_SCHEDULER.CREATE_CALENDAR_STRING',
                      'DBMS_SCHEDULER.CREATE_WINDOW_GROUP',
                      'DBMS_SCHEDULER.DISABLE1_CALENDAR_CHECK',
                      'DBMS_SCHEDULER.DROP_WINDOW_GROUP',
                      'DBMS_SCHEDULER.FILE_WATCH_FILTER',
                      'DBMS_SCHEDULER.GENERATE_EVENT_LIST',
                      'DBMS_SCHEDULER.GET_CHAIN_RULE_ACTION',
                      'DBMS_SCHEDULER.GET_CHAIN_RULE_CONDITION',
                      'DBMS_SCHEDULER.GET_DEFAULT_VALUE',
                      'DBMS_SCHEDULER.GET_JOB_STEP_CF',
                      'DBMS_SCHEDULER.GET_SYS_TIME_ZONE_NAME',
                      'DBMS_SCHEDULER.GET_VARCHAR2_VALUE',
                      'DBMS_SCHEDULER.REMOVE_WINDOW_GROUP_MEMBER',
                      'DBMS_SCHEDULER.RESOLVE_CALENDAR_STRING',
                      'DBMS_SCHEDULER.RESOLVE_NAME',
                      'DBMS_SCHEDULER.SHOW_ERRORS',
                      'DBMS_SCHEDULER.STIME',
                      'DBMS_SCHEDULER.SUBMIT_REMOTE_EXTERNAL_JOB',
                      'DBMS_SERVER_ALERT.VIEW_THRESHOLDS',
                      'DBMS_SESSION.LIST_CONTEXT',
                      'DBMS_SESSION.SET_CLOSE_CACHED_OPEN_CURSORS',
                      'DBMS_SPACE.AUTO_SPACE_ADVISOR_JOB_PROC',
                      'DBMS_SPACE.DBFS_DF',
                      'DBMS_SPACE.OBJECT_GROWTH_TREND_CUR',
                      'DBMS_SPACE.OBJECT_GROWTH_TREND_CURTAB',
                      'DBMS_SPACE.OBJECT_GROWTH_TREND_I_TO_S',
                      'DBMS_SPACE.OBJECT_GROWTH_TREND_SWRF',
                      'DBMS_SPACE.OBJECT_GROWTH_TREND_S_TO_I',
                      'DBMS_SPACE.OBJECT_SPACE_USAGE',
                      'DBMS_SPACE.OBJECT_SPACE_USAGE_TBF',
                      'DBMS_SPACE.PARSE_SPACE_ADV_INFO',
                      'DBMS_SPACE.VERIFY_SHRINK_CANDIDATE',
                      'DBMS_SPACE.VERIFY_SHRINK_CANDIDATE_TBF',
                      'DBMS_SPACE_ADMIN.ASSM_SEGMENT_SYNCHWM',
                      'DBMS_SPACE_ADMIN.FLUSH_LOBSEGMENT_STATS',
                      'DBMS_SPACE_ADMIN.MATERIALIZE_DEFERRED_WITH_OPT',
                      'DBMS_SPACE_ADMIN.NGLOB_SEGMENT_VERIFY',
                      'DBMS_SPACE_ADMIN.PURGE_LOBSEGMENT_STATS',
                      'DBMS_SPACE_ADMIN.SEGMENT_EXTEND',
                      'DBMS_SPACE_ADMIN.SEGMENT_MOVEBLOCKS',
                      'DBMS_SPACE_ADMIN.SEGMENT_NUMBER_BLOCKS',
                      'DBMS_SPACE_ADMIN.SEGMENT_NUMBER_EXTENTS',
                      'DBMS_SPACE_ADMIN.SEGMENT_REPAIR',
                      'DBMS_SPACE_ADMIN.TABLESPACE_DUMP_BITMAPS',
                      'DBMS_SPACE_ADMIN.TABLESPACE_FIX_SEGMENT_EXTBLKS',
                      'DBMS_SPM.DROP_MIGRATED_STORED_OUTLINE',
                      'DBMS_SQL.BIND_VARIABLE_CHAR',
                      'DBMS_SQL.BIND_VARIABLE_RAW',
                      'DBMS_SQL.BIND_VARIABLE_ROWID',
                      'DBMS_SQL.COLUMN_VALUE_CHAR',
                      'DBMS_SQL.COLUMN_VALUE_RAW',
                      'DBMS_SQL.COLUMN_VALUE_ROWID',
                      'DBMS_SQL.VARIABLE_VALUE_CHAR',
                      'DBMS_SQL.VARIABLE_VALUE_RAW',
                      'DBMS_SQL.VARIABLE_VALUE_ROWID',
                      'DBMS_SQLDIAG.DUMP_TRACE',
                      'DBMS_SQLDIAG.GETSQL',
                      'DBMS_SQLDIAG.PACK_STGTAB_SQLPATCH',
                      'DBMS_SQLDIAG.SET_TCB_TRACING',
                      'DBMS_SQLDIAG.UNPACK_STGTAB_SQLPATCH',
                      'DBMS_SQLPA.GET_SESS_OPTIMIZER_ENV',
                      'DBMS_SQLPA.REMOTE_PROCESS_SQL',
                      'DBMS_SQLTUNE.BUILD_STASH_XML',
                      'DBMS_SQLTUNE.CAP_STS_CBK',
                      'DBMS_SQLTUNE.CHECK_SQLSET_PRIVS',
                      'DBMS_SQLTUNE.CHECK_SQL_PROFILE_PRIV',
                      'DBMS_SQLTUNE.EXAMINE_STGTAB',
                      'DBMS_SQLTUNE.EXTRACT_BIND',
                      'DBMS_SQLTUNE.EXTRACT_BINDS',
                      'DBMS_SQLTUNE.IMPORT_SQL_PROFILE',
                      'DBMS_SQLTUNE.PREPARE_AWR_STATEMENT',
                      'DBMS_SQLTUNE.PREPARE_SQLSET_STATEMENT',
                      'DBMS_SQLTUNE.REPORT_SQL_DETAIL_XML',
                      'DBMS_SQLTUNE.REPORT_SQL_MONITOR_LIST_XML',
                      'DBMS_SQLTUNE.REPORT_SQL_MONITOR_XML',
                      'DBMS_SQLTUNE.SET_AUTO_TUNING_TASK_PARAMETER',
                      'DBMS_SQLTUNE.SQLSET_PROGRESS_STATS',
                      'DBMS_SQLTUNE.TRANSFORM_SQLSET_CURSOR',
                      'DBMS_STATS.ALTER_DATABASE_TAB_MONITORING',
                      'DBMS_STATS.ALTER_SCHEMA_TAB_MONITORING',
                      'DBMS_STATS.CLEANUP_STATS_JOB_PROC',
                      'DBMS_STATS.GATHER_DATABASE_STATS_JOB_PROC',
                      'DBMS_STATS.INIT_PACKAGE',
                      'DBMS_STATS.RESET_COL_USAGE',
                      'DBMS_STATS.RESTORE_DATABASE_STATS',
                      'DBMS_STATS.RESTORE_SYSTEM_STATS',
                      'DBMS_STATS.RESUME_GATHER_STATS',
                      'DBMS_STATS.TO_CASCADE_TYPE',
                      'DBMS_STATS.TO_DEGREE_TYPE',
                      'DBMS_STATS.TO_ESTIMATE_PERCENT_TYPE',
                      'DBMS_STATS.TO_NO_INVALIDATE_TYPE',
                      'DBMS_STATS.TO_PUBLISH_TYPE',
                      'DBMS_TDB.EXIT_TRANSPORT_SCRIPT',
                      'DBMS_TRACE.COMMENT_PLSQL_TRACE',
                      'DBMS_TRACE.GET_PLSQL_TRACE_RUNNUMBER',
                      'DBMS_TRACE.INTERNAL_VERSION_CHECK',
                      'DBMS_TRACE.LIMIT_PLSQL_TRACE',
                      'DBMS_TRACE.PAUSE_PLSQL_TRACE',
                      'DBMS_TRACE.RESUME_PLSQL_TRACE',
                      'DBMS_TRANSACTION.BEGIN_DISCRETE_TRANSACTION',
                      'DBMS_TRANSFORM.COMPUTE_TRANSFORMATION',
                      'DBMS_TTS.CHECKTABLESPACE',
                      'DBMS_TTS.INSERT_ERROR',
                      'DBMS_TTS.ISSELFCONTAINED',
                      'DBMS_TTS.TRANSPORT_CHAR_SET_CHECK',
                      'DBMS_TTS.TRANSPORT_CHAR_SET_CHECK_MSG',
                      'DBMS_WORKLOAD_CAPTURE.EXPORT_PERFORMANCE_DATA',
                      'DBMS_WORKLOAD_CAPTURE.EXPORT_UC_GRAPH',
                      'DBMS_WORKLOAD_CAPTURE.GET_CAPTURE_PATH',
                      'DBMS_WORKLOAD_CAPTURE.GET_PERF_DATA_EXPORT_STATUS',
                      'DBMS_WORKLOAD_CAPTURE.IMPORT_PERFORMANCE_DATA',
                      'DBMS_WORKLOAD_CAPTURE.IMPORT_UC_GRAPH',
                      'DBMS_WORKLOAD_CAPTURE.USER_CALLS_GRAPH',
                      'DBMS_WORKLOAD_REPLAY.CLIENT_CONNECT',
                      'DBMS_WORKLOAD_REPLAY.CLIENT_VITALS',
                      'DBMS_WORKLOAD_REPLAY.DELETE_ATTRIBUTE',
                      'DBMS_WORKLOAD_REPLAY.DIVERGING_STATEMENT_STATUS',
                      'DBMS_WORKLOAD_REPLAY.EXPORT_PERFORMANCE_DATA',
                      'DBMS_WORKLOAD_REPLAY.EXPORT_UC_GRAPH',
                      'DBMS_WORKLOAD_REPLAY.GET_ADVANCED_PARAMETER',
                      'DBMS_WORKLOAD_REPLAY.GET_ATTRIBUTE',
                      'DBMS_WORKLOAD_REPLAY.GET_CAPTURED_TABLES',
                      'DBMS_WORKLOAD_REPLAY.GET_PERF_DATA_EXPORT_STATUS',
                      'DBMS_WORKLOAD_REPLAY.GET_PROCESSING_PATH',
                      'DBMS_WORKLOAD_REPLAY.GET_REPLAY_PATH',
                      'DBMS_WORKLOAD_REPLAY.IMPORT_PERFORMANCE_DATA',
                      'DBMS_WORKLOAD_REPLAY.IMPORT_UC_GRAPH',
                      'DBMS_WORKLOAD_REPLAY.INITIALIZE_REPLAY_INTERNAL',
                      'DBMS_WORKLOAD_REPLAY.PERSIST_ATTRIBUTES',
                      'DBMS_WORKLOAD_REPLAY.POPULATE_DIVERGENCE_STATUS',
                      'DBMS_WORKLOAD_REPLAY.PROCESS_CAPTURE_COMPLETION',
                      'DBMS_WORKLOAD_REPLAY.PROCESS_CAPTURE_REMAINING_TIME',
                      'DBMS_WORKLOAD_REPLAY.PROCESS_REPLAY_GRAPH',
                      'DBMS_WORKLOAD_REPLAY.RESET_ADVANCED_PARAMETERS',
                      'DBMS_WORKLOAD_REPLAY.SET_ATTRIBUTE',
                      'DBMS_WORKLOAD_REPLAY.STOP_STS_C',
                      'DBMS_WORKLOAD_REPLAY.SYNCPOINT_WAIT_TO_POST',
                      'DBMS_WORKLOAD_REPLAY.SYNC_ATTRIBUTES_FROM_FILE',
                      'DBMS_WORKLOAD_REPLAY.USER_CALLS_GRAPH',
                      'DBMS_WORKLOAD_REPOSITORY.CONTROL_RESTRICTED_SNAPSHOT',
                      'DBMS_WORKLOAD_REPOSITORY.SELECT_BASELINE_DETAILS',
                      'DBMS_XDB.ADDAUTHENTICATIONMAPPING',
                      'DBMS_XDB.ADDAUTHENTICATIONMETHOD',
                      'DBMS_XDB.ADDDEFAULTTYPEMAPPINGS',
                      'DBMS_XDB.ADDRESOURCE',
                      'DBMS_XDB.ADDTOLOCKTOKENLIST',
                      'DBMS_XDB.ADDTRUSTMAPPING',
                      'DBMS_XDB.ADDTRUSTSCHEME',
                      'DBMS_XDB.DELETEAUTHENTICATIONMAPPING',
                      'DBMS_XDB.DELETEAUTHENTICATIONMETHOD',
                      'DBMS_XDB.DELETEDEFAULTTYPEMAPPINGS',
                      'DBMS_XDB.DELETEFROMLOCKTOKENLIST',
                      'DBMS_XDB.DELETETRUSTMAPPING',
                      'DBMS_XDB.DELETETRUSTSCHEME',
                      'DBMS_XDB.ENABLECUSTOMAUTHENTICATION',
                      'DBMS_XDB.ENABLECUSTOMTRUST',
                      'DBMS_XDB.GETLOCKTOKENLIST',
                      'DBMS_XDB.GETRESOURCE',
                      'DBMS_XDB.LOCKDISCOVERY',
                      'DBMS_XDB.MOVEXDB_TABLESPACE',
                      'DBMS_XDB.PROCESSLINKS',
                      'DBMS_XDB.REBUILDHIERARCHICALINDEX',
                      'DBMS_XDB.REFRESHCONTENTSIZE',
                      'DBMS_XDB.REFRESHLOCK',
                      'DBMS_XDB.SETDEFAULTTYPEMAPPINGS',
                      'DBMS_XDB.SETDYNAMICGROUPSTORE',
                      'DBMS_XDBRESOURCE.FREERESOURCE',
                      'DBMS_XDBRESOURCE.GETACL',
                      'DBMS_XDBRESOURCE.GETACLDOCFROMRES',
                      'DBMS_XDBRESOURCE.GETAUTHOR',
                      'DBMS_XDBRESOURCE.GETCHARACTERSET',
                      'DBMS_XDBRESOURCE.GETCOMMENT',
                      'DBMS_XDBRESOURCE.GETCONTENTBLOB',
                      'DBMS_XDBRESOURCE.GETCONTENTCLOB',
                      'DBMS_XDBRESOURCE.GETCONTENTREF',
                      'DBMS_XDBRESOURCE.GETCONTENTTYPE',
                      'DBMS_XDBRESOURCE.GETCONTENTVARCHAR2',
                      'DBMS_XDBRESOURCE.GETCONTENTXML',
                      'DBMS_XDBRESOURCE.GETCREATIONDATE',
                      'DBMS_XDBRESOURCE.GETCREATOR',
                      'DBMS_XDBRESOURCE.GETCUSTOMMETADATA',
                      'DBMS_XDBRESOURCE.GETDISPLAYNAME',
                      'DBMS_XDBRESOURCE.GETLANGUAGE',
                      'DBMS_XDBRESOURCE.GETLASTMODIFIER',
                      'DBMS_XDBRESOURCE.GETMODIFICATIONDATE',
                      'DBMS_XDBRESOURCE.GETOWNER',
                      'DBMS_XDBRESOURCE.GETREFCOUNT',
                      'DBMS_XDBRESOURCE.GETVERSIONID',
                      'DBMS_XDBRESOURCE.HASACLCHANGED',
                      'DBMS_XDBRESOURCE.HASAUTHORCHANGED',
                      'DBMS_XDBRESOURCE.HASCHANGED',
                      'DBMS_XDBRESOURCE.HASCHARACTERSETCHANGED',
                      'DBMS_XDBRESOURCE.HASCOMMENTCHANGED',
                      'DBMS_XDBRESOURCE.HASCONTENTCHANGED',
                      'DBMS_XDBRESOURCE.HASCONTENTTYPECHANGED',
                      'DBMS_XDBRESOURCE.HASCREATIONDATECHANGED',
                      'DBMS_XDBRESOURCE.HASCREATORCHANGED',
                      'DBMS_XDBRESOURCE.HASCUSTOMMETADATACHANGED',
                      'DBMS_XDBRESOURCE.HASDISPLAYNAMECHANGED',
                      'DBMS_XDBRESOURCE.HASLANGUAGECHANGED',
                      'DBMS_XDBRESOURCE.HASLASTMODIFIERCHANGED',
                      'DBMS_XDBRESOURCE.HASMODIFICATIONDATECHANGED',
                      'DBMS_XDBRESOURCE.HASOWNERCHANGED',
                      'DBMS_XDBRESOURCE.HASREFCOUNTCHANGED',
                      'DBMS_XDBRESOURCE.HASVERSIONIDCHANGED',
                      'DBMS_XDBRESOURCE.ISFOLDER',
                      'DBMS_XDBRESOURCE.ISNULL',
                      'DBMS_XDBRESOURCE.MAKEDOCUMENT',
                      'DBMS_XDBRESOURCE.SAVE',
                      'DBMS_XDBRESOURCE.SETACL',
                      'DBMS_XDBRESOURCE.SETAUTHOR',
                      'DBMS_XDBRESOURCE.SETCHARACTERSET',
                      'DBMS_XDBRESOURCE.SETCOMMENT',
                      'DBMS_XDBRESOURCE.SETCONTENT',
                      'DBMS_XDBRESOURCE.SETCONTENTTYPE',
                      'DBMS_XDBRESOURCE.SETCUSTOMMETADATA',
                      'DBMS_XDBRESOURCE.SETDISPLAYNAME',
                      'DBMS_XDBRESOURCE.SETLANGUAGE',
                      'DBMS_XDBRESOURCE.SETOWNER',
                      'DBMS_XDBT.AUTOSYNCJOBBYCOUNT',
                      'DBMS_XDBT.AUTOSYNCJOBBYTIME',
                      'DBMS_XDBT.OPTIMIZEINDEX',
                      'DBMS_XDBT.SETSYNCTIMEOUT',
                      'DBMS_XDBT.SYNCINDEX',
                      'DBMS_XDBT.XDB_DATASTORE_PROC',
                      'DBMS_XDBZ.ADD_APPLICATION_PRINCIPAL',
                      'DBMS_XDBZ.CHANGE_APPLICATION_MEMBERSHIP',
                      'DBMS_XDBZ.DELETE_APPLICATION_PRINCIPAL',
                      'DBMS_XDBZ.PURGEAPPLICATIONCACHE',
                      'DBMS_XDBZ.RESET_APPLICATION_PRINCIPAL',
                      'DBMS_XDBZ.SET_APPLICATION_PRINCIPAL',
                      'DBMS_XDBZ.VALIDATEACL',
                      'DBMS_XDBZ.VALIDATEFUSIONACL',
                      'DBMS_XDB_ADMIN.CLEARREPOSITORYXMLINDEX',
                      'DBMS_XDB_VERSION.CREATEBRANCH',
                      'DBMS_XDB_VERSION.CREATEREALWORKSPACE',
                      'DBMS_XDB_VERSION.CREATEVCR',
                      'DBMS_XDB_VERSION.CREATEVIRTUALWORKSPACE',
                      'DBMS_XDB_VERSION.DELETEVERSION',
                      'DBMS_XDB_VERSION.DELETEVERSIONHISTORY',
                      'DBMS_XDB_VERSION.DELETEWORKSPACE',
                      'DBMS_XDB_VERSION.GETCONTENTSBLOBBYRESID',
                      'DBMS_XDB_VERSION.GETCONTENTSCLOBBYRESID',
                      'DBMS_XDB_VERSION.GETVERSIONHISTORY',
                      'DBMS_XDB_VERSION.GETVERSIONHISTORYID',
                      'DBMS_XDB_VERSION.GETVERSIONHISTORYROOT',
                      'DBMS_XDB_VERSION.GETWORKSPACE',
                      'DBMS_XDB_VERSION.ISCHECKEDOUT',
                      'DBMS_XDB_VERSION.MAKESHARED',
                      'DBMS_XDB_VERSION.PUBLISHWORKSPACE',
                      'DBMS_XDB_VERSION.SETWORKSPACE',
                      'DBMS_XDB_VERSION.UNPUBLISHWORKSPACE',
                      'DBMS_XDB_VERSION.UPDATEVCRVERSION',
                      'DBMS_XDB_VERSION.UPDATEWORKSPACE',
                      'DBMS_XEVENT.GETDAVOWNER',
                      'DBMS_XEVENT.GETDAVTOKEN',
                      'DBMS_XEVENT.GETDEPTH',
                      'DBMS_XEVENT.GETEXPIRY',
                      'DBMS_XEVENT.GETLOCKMODE',
                      'DBMS_XEVENT.GETLOCKTYPE',
                      'DBMS_XEVENT.GETNFSNODEID',
                      'DBMS_XEVENT.GETXDBEVENT',
                      'DBMS_XMLDOM.BINARYINPUTSTREAMAVAILABLE',
                      'DBMS_XMLDOM.CHARACTERINPUTSTREAMAVAILABLE',
                      'DBMS_XMLDOM.CLOSEBINARYINPUTSTREAM',
                      'DBMS_XMLDOM.CLOSEBINARYOUTPUTSTREAM',
                      'DBMS_XMLDOM.CLOSECHARACTERINPUTSTREAM',
                      'DBMS_XMLDOM.CLOSECHARACTEROUTPUTSTREAM',
                      'DBMS_XMLDOM.CREATEXMLBINARYINPUTSTREAM',
                      'DBMS_XMLDOM.CREATEXMLBINARYOUTPUTSTREAM',
                      'DBMS_XMLDOM.CREATEXMLCHARACTERINPUTSTREAM',
                      'DBMS_XMLDOM.CREATEXMLCHARACTEROUTPUTSTREAM',
                      'DBMS_XMLDOM.FLUSHBINARYOUTPUTSTREAM',
                      'DBMS_XMLDOM.FLUSHCHARACTEROUTPUTSTREAM',
                      'DBMS_XMLDOM.FREEDOCTYPE',
                      'DBMS_XMLDOM.FREEELEMENT',
                      'DBMS_XMLDOM.FREENODELIST',
                      'DBMS_XMLDOM.GETNODEFROMFRAGMENT',
                      'DBMS_XMLDOM.READBINARYINPUTSTREAM',
                      'DBMS_XMLDOM.READBYTESFROMBIS1',
                      'DBMS_XMLDOM.READCHARACTERINPUTSTREAM',
                      'DBMS_XMLDOM.SETNODEVALUEASDEFERREDBFILE',
                      'DBMS_XMLDOM.SETNODEVALUEASDEFERREDBLOB',
                      'DBMS_XMLDOM.SETNODEVALUEASDEFERREDCLOB',
                      'DBMS_XMLDOM.STREAMISNULL',
                      'DBMS_XMLDOM.WRITEBINARYOUTPUTSTREAM',
                      'DBMS_XMLDOM.WRITECHARACTEROUTPUTSTREAM',
                      'DBMS_XMLDOM.WRITEEXTERNALDTDTOBUFFER',
                      'DBMS_XMLDOM.WRITEEXTERNALDTDTOCLOB',
                      'DBMS_XMLDOM.WRITEEXTERNALDTDTOFILE',
                      'DBMS_XMLDOM.XMLD_USEBINSTREAM',
                      'DBMS_XMLGEN.CLEARBINDVALUES',
                      'DBMS_XMLGEN.REMOVEXSLTPARAM',
                      'DBMS_XMLGEN.SETBINDVALUE',
                      'DBMS_XMLGEN.SETCHECKINVALIDCHARS',
                      'DBMS_XMLGEN.SETINDENTATIONWIDTH',
                      'DBMS_XMLGEN.SETPRETTYPRINTING',
                      'DBMS_XMLGEN.SETXSLT',
                      'DBMS_XMLGEN.SETXSLTPARAM',
                      'DBMS_XMLINDEX.DELETE_TABLE_STATS',
                      'DBMS_XMLINDEX.GATHER_TABLE_STATS',
                      'DBMS_XMLINDEX.GETPARAMETER',
                      'DBMS_XMLPARSER.GETBASEDIR',
                      'DBMS_XMLPARSER.GETERRORLOG',
                      'DBMS_XMLPARSER.PARSE',
                      'DBMS_XMLPARSER.RETAINCDATASECTION',
                      'DBMS_XMLPARSER.WRITEERRORS',
                      'DBMS_XMLSCHEMA.CONVERTTODATE',
                      'DBMS_XMLSCHEMA.CONVERTTOTS',
                      'DBMS_XMLSCHEMA.CONVERTTOTSWITHTZ',
                      'DBMS_XMLSCHEMA.GENERATEBEAN',
                      'DBMS_XMLSTORE.CLEARKEYCOLUMNLIST',
                      'DBMS_XMLSTORE.CLEARUPDATECOLUMNLIST',
                      'DBMS_XMLSTORE.CLOSECONTEXT',
                      'DBMS_XMLSTORE.DELETEXML',
                      'DBMS_XMLSTORE.INSERTXML',
                      'DBMS_XMLSTORE.NEWCONTEXT',
                      'DBMS_XMLSTORE.SETKEYCOLUMN',
                      'DBMS_XMLSTORE.SETROWTAG',
                      'DBMS_XMLSTORE.SETUPDATECOLUMN',
                      'DBMS_XMLSTORE.UPDATEXML',
                      'DBMS_XPLAN.BUILD_PLAN_XML',
                      'DBMS_XPLAN.DIFF_PLAN_AWR',
                      'DBMS_XPLAN.DIFF_PLAN_CURSOR',
                      'DBMS_XPLAN.DIFF_PLAN_OUTLINE',
                      'DBMS_XPLAN.DIFF_PLAN_SQL_BASELINE',
                      'DBMS_XPLAN.FORMAT_NUMBER',
                      'DBMS_XPLAN.FORMAT_NUMBER2',
                      'DBMS_XPLAN.FORMAT_SIZE',
                      'DBMS_XPLAN.FORMAT_SIZE2',
                      'DBMS_XPLAN.FORMAT_TIME_S',
                      'DBMS_XPLAN.GET_PLANDIFF_REPORT_XML',
                      'DBMS_XPLAN.PREPARE_PLAN_XML_QUERY',
                      'DBMS_XPLAN.PREPARE_RECORDS',
                      'DBMS_XPLAN.VALIDATE_FORMAT',
                      'DBMS_XSLPROCESSOR.CLOB2URL',
                      'DBMS_XSLPROCESSOR.URL2CLOB',
                      'HTF.HTITLE',
                      'HTF.NEXTID',
                      'HTP.ADDDEFAULTHTMLHDR',
                      'HTP.DOWNLOAD_FILE',
                      'HTP.FLUSH',
                      'HTP.FLUSH_CHARSET_CONVERT',
                      'HTP.GET_DOWNLOAD_FILES_LIST',
                      'HTP.GET_LINE',
                      'HTP.GET_PAGE',
                      'HTP.GET_PAGE_CHARSET_CONVERT',
                      'HTP.GET_PAGE_RAW',
                      'HTP.HTITLE',
                      'HTP.INIT',
                      'HTP.NEXTID',
                      'HTP.P',
                      'HTP.PRINT_HEADER',
                      'HTP.PUTRAW',
                      'HTP.RESET_GET_PAGE',
                      'HTP.SETHTTPCHARSET',
                      'HTP.SET_TRANSFER_MODE',
                      'HTP.SHOWPAGE',
                      'OWA_CACHE.INIT',
                      'OWA_COOKIE.INIT',
                      'OWA_TEXT.NEW_MULTI',
                      'OWA_UTIL.COMMA_TO_IDENT_ARR',
                      'OWA_UTIL.DESCRIBE_COLS',
                      'OWA_UTIL.GET_VERSION',
                      'OWA_UTIL.ITE',
                      'OWA_UTIL.NAME_RESOLVE',
                      'OWA_UTIL.PATH_TO_ME',
                      'OWA_UTIL.PRINT_VERSION',
                      'OWA_UTIL.RESOLVE_TABLE',
                      'OWA_UTIL.SHOW_QUERY_COLUMNS',
                      'OWA_UTIL.TABLECAPTION',
                      'OWA_UTIL.TABLECLOSE',
                      'OWA_UTIL.TABLEDATA',
                      'OWA_UTIL.TABLEHEADER',
                      'OWA_UTIL.TABLEHEADERROWCLOSE',
                      'OWA_UTIL.TABLEHEADERROWOPEN',
                      'OWA_UTIL.TABLENODATA',
                      'OWA_UTIL.TABLEOPEN',
                      'OWA_UTIL.TABLEROWCLOSE',
                      'OWA_UTIL.TABLEROWOPEN',
                      'SDO_CS.ADD_PREFERENCE_FOR_OP',
                      'SDO_CS.CONVERT_2D_SRID_TO_3D',
                      'SDO_CS.CONVERT_2D_TO_3D',
                      'SDO_CS.CONVERT_MIXED_AXES_UNITS',
                      'SDO_CS.CONVERT_NADCON_TO_XML',
                      'SDO_CS.CONVERT_NTV2_TO_XML',
                      'SDO_CS.CONVERT_NTV2_TO_XML_TABLE',
                      'SDO_CS.CONVERT_XML_TABLE_TO_NTV2',
                      'SDO_CS.CONVERT_XML_TO_NADCON',
                      'SDO_CS.CONVERT_XML_TO_NTV2',
                      'SDO_CS.CREATE_CONCATENATED_OP',
                      'SDO_CS.CREATE_CRS_USING_LEGACY_PROJ',
                      'SDO_CS.CREATE_OBVIOUS_EPSG_RULES',
                      'SDO_CS.CREATE_PREF_CONCATENATED_OP',
                      'SDO_CS.DELETE_ALL_EPSG_RULES',
                      'SDO_CS.DELETE_NTV2_XML_DATA',
                      'SDO_CS.DELETE_OP',
                      'SDO_CS.DETERMINE_CHAIN',
                      'SDO_CS.DETERMINE_DEFAULT_CHAIN',
                      'SDO_CS.DETERMINE_NADCON_COVERAGE',
                      'SDO_CS.DETERMINE_SRID_UNITS',
                      'SDO_CS.DISAMBIGUATE_PROJ_NAME',
                      'SDO_CS.FILL_IN_DEFAULT_UNITS',
                      'SDO_CS.FIND_EPSG_PARAMS',
                      'SDO_CS.FIND_GEOG_CRS',
                      'SDO_CS.FIND_PROJ_CRS',
                      'SDO_CS.FIND_SRID',
                      'SDO_CS.FROM_OGC_SIMPLEFEATURE_SRS',
                      'SDO_CS.FROM_USNG',
                      'SDO_CS.GENERATE_CRS_FROM_WKT',
                      'SDO_CS.GENERATE_EPSG_RULE_FOR_3785',
                      'SDO_CS.GET_3D_WKT',
                      'SDO_CS.GET_CRS_DIMENSIONALITY',
                      'SDO_CS.GET_EPSG_DATA_VERSION',
                      'SDO_CS.GET_SRID_FOR_NAMESPACE',
                      'SDO_CS.GET_SRSNAME_FOR_NAMESPACE',
                      'SDO_CS.GET_WKT_PATH',
                      'SDO_CS.INTERNAL_DENSIFY_PRIOR_TO_TFM',
                      'SDO_CS.INTERNAL_DET_CHAIN',
                      'SDO_CS.INTERNAL_DET_CHAIN_VARCHAR',
                      'SDO_CS.INTERNAL_DET_SRID_WKT',
                      'SDO_CS.INTERNAL_EPSG_PARAM_TO_LEGACY',
                      'SDO_CS.INTERNAL_GET_DENSIFICATION_RES',
                      'SDO_CS.INTERNAL_READ_PROJ_FROM_WKT',
                      'SDO_CS.INTL_POPULATE_DATUM_3PARAMS',
                      'SDO_CS.INTL_POPULATE_DATUM_7PARAMS',
                      'SDO_CS.INTL_VALIDATE_WKT',
                      'SDO_CS.IS_WITHIN_TOLERANCE',
                      'SDO_CS.LOOKUP_EPSG_PARAM',
                      'SDO_CS.MAKE_2D',
                      'SDO_CS.MAKE_3D',
                      'SDO_CS.MAP_EPSG_SRID_TO_ORACLE',
                      'SDO_CS.MAP_ORACLE_SRID_TO_EPSG',
                      'SDO_CS.REFORMAT_GTYPE',
                      'SDO_CS.REGISTER_SRSNAMESPACE',
                      'SDO_CS.REVOKE_PREFERENCE_FOR_OP',
                      'SDO_CS.TFM_AXIS_ORIENTATION_TO_WKT',
                      'SDO_CS.TO_OGC_SIMPLEFEATURE_SRS',
                      'SDO_CS.TO_USNG',
                      'SDO_CS.TRANSFORM',
                      'SDO_CS.TRANSFORM_ACROSS_DIMS',
                      'SDO_CS.TRANSFORM_LAYER',
                      'SDO_CS.TRANSFORM_LAYER_ACROSS_DIMS',
                      'SDO_CS.TRANSFORM_OGC_CS_WKT_TO_SRS',
                      'SDO_CS.TRANSFORM_ORIG',
                      'SDO_CS.TRANSFORM_ORIG_USING_RULES',
                      'SDO_CS.TRANSFORM_TO_BASE_UNIT',
                      'SDO_CS.TRANSFORM_TO_WKT_PARAM_UNIT',
                      'SDO_CS.TRANSFORM_USING_CASE_NAME',
                      'SDO_CS.TRANSFORM_USING_PLAN',
                      'SDO_CS.UPDATE_WKTS_FOR_ALL_EPSG_CRS',
                      'SDO_CS.UPDATE_WKTS_FOR_EPSG_CRS',
                      'SDO_CS.UPDATE_WKTS_FOR_EPSG_DATUM',
                      'SDO_CS.UPDATE_WKTS_FOR_EPSG_ELLIPS',
                      'SDO_CS.UPDATE_WKTS_FOR_EPSG_OP',
                      'SDO_CS.UPDATE_WKTS_FOR_EPSG_PARAM',
                      'SDO_CS.UPDATE_WKTS_FOR_EPSG_PM',
                      'SDO_CS.UPDATE_WKTS_WITH_HC_PARAMS',
                      'SDO_CS.UPDATE_WKT_WITH_7_PARAMS',
                      'SDO_CS.VALIDATE_WKT',
                      'SDO_CS.VIEWPORT_TRANSFORM',
                      'SDO_GEOM.CHECK_BOUNDS',
                      'SDO_GEOM.GET_DIM_ARRAY',
                      'SDO_GEOM.GET_ORDS',
                      'SDO_GEOM.INIT_ELEMENT',
                      'SDO_GEOM.INTERACT',
                      'SDO_GEOM.RELATE',
                      'SDO_GEOM.SDO_ALPHA_SHAPE',
                      'SDO_GEOM.SDO_ARC_DENSIFY',
                      'SDO_GEOM.SDO_AREA',
                      'SDO_GEOM.SDO_BUFFER',
                      'SDO_GEOM.SDO_CENTROID',
                      'SDO_GEOM.SDO_CLOSEST_POINTS',
                      'SDO_GEOM.SDO_CONCAVEHULL',
                      'SDO_GEOM.SDO_CONCAVEHULL_BOUNDARY',
                      'SDO_GEOM.SDO_CONVEXHULL',
                      'SDO_GEOM.SDO_DIFFERENCE',
                      'SDO_GEOM.SDO_DISTANCE',
                      'SDO_GEOM.SDO_G3DCONV',
                      'SDO_GEOM.SDO_INSERT_LOG_FILTER',
                      'SDO_GEOM.SDO_INTERSECTION',
                      'SDO_GEOM.SDO_LENGTH',
                      'SDO_GEOM.SDO_MAX_MBR_ORDINATE',
                      'SDO_GEOM.SDO_MBR',
                      'SDO_GEOM.SDO_MIN_MBR_ORDINATE',
                      'SDO_GEOM.SDO_POINTONSURFACE',
                      'SDO_GEOM.SDO_POLY_DIFFERENCE',
                      'SDO_GEOM.SDO_POLY_INTERSECTION',
                      'SDO_GEOM.SDO_POLY_UNION',
                      'SDO_GEOM.SDO_POLY_XOR',
                      'SDO_GEOM.SDO_TRIANGULATE',
                      'SDO_GEOM.SDO_UNION',
                      'SDO_GEOM.SDO_VOLUME',
                      'SDO_GEOM.SDO_XOR',
                      'SDO_GEOM.VALIDATE_GEOMETRY',
                      'SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT',
                      'SDO_GEOM.VALIDATE_LAYER',
                      'SDO_GEOM.VALIDATE_LAYER_WITH_CONTEXT',
                      'SDO_GEOM.WITHIN_DISTANCE',
                      'SDO_LRS.CLIP_GEOM_SEGMENT',
                      'SDO_LRS.CLIP_GEOM_SEGMENT_3D',
                      'SDO_LRS.CONCATENATE_GEOM_SEGMENTS',
                      'SDO_LRS.CONCATENATE_GEOM_SEGMENTS_3D',
                      'SDO_LRS.CONNECTED_GEOM_SEGMENTS',
                      'SDO_LRS.CONNECTED_GEOM_SEGMENTS_3D',
                      'SDO_LRS.CONVERT_TO_LRS_DIM_ARRAY',
                      'SDO_LRS.CONVERT_TO_LRS_DIM_ARRAY_3D',
                      'SDO_LRS.CONVERT_TO_LRS_GEOM',
                      'SDO_LRS.CONVERT_TO_LRS_GEOM_3D',
                      'SDO_LRS.CONVERT_TO_LRS_LAYER',
                      'SDO_LRS.CONVERT_TO_LRS_LAYER_3D',
                      'SDO_LRS.CONVERT_TO_STD_DIM_ARRAY',
                      'SDO_LRS.CONVERT_TO_STD_DIM_ARRAY_3D',
                      'SDO_LRS.CONVERT_TO_STD_GEOM',
                      'SDO_LRS.CONVERT_TO_STD_GEOM_3D',
                      'SDO_LRS.CONVERT_TO_STD_LAYER',
                      'SDO_LRS.CONVERT_TO_STD_LAYER_3D',
                      'SDO_LRS.DEFINE_GEOM_SEGMENT',
                      'SDO_LRS.DEFINE_GEOM_SEGMENT_3D',
                      'SDO_LRS.DYNAMIC_SEGMENT',
                      'SDO_LRS.DYNAMIC_SEGMENT_3D',
                      'SDO_LRS.FIND_LRS_DIM_POS',
                      'SDO_LRS.FIND_MEASURE',
                      'SDO_LRS.FIND_MEASURE_3D',
                      'SDO_LRS.FIND_OFFSET',
                      'SDO_LRS.GEOM_SEGMENT_END_MEASURE',
                      'SDO_LRS.GEOM_SEGMENT_END_MEASURE_3D',
                      'SDO_LRS.GEOM_SEGMENT_END_PT',
                      'SDO_LRS.GEOM_SEGMENT_END_PT_3D',
                      'SDO_LRS.GEOM_SEGMENT_LENGTH',
                      'SDO_LRS.GEOM_SEGMENT_LENGTH_3D',
                      'SDO_LRS.GEOM_SEGMENT_START_MEASURE',
                      'SDO_LRS.GEOM_SEGMENT_START_MEASURE_3D',
                      'SDO_LRS.GEOM_SEGMENT_START_PT',
                      'SDO_LRS.GEOM_SEGMENT_START_PT_3D',
                      'SDO_LRS.GET_MEASURE',
                      'SDO_LRS.GET_MEASURE_3D',
                      'SDO_LRS.GET_NEXT_SHAPE_PT',
                      'SDO_LRS.GET_NEXT_SHAPE_PT_3D',
                      'SDO_LRS.GET_NEXT_SHAPE_PT_MEASURE',
                      'SDO_LRS.GET_NEXT_SHAPE_PT_MEASURE_3D',
                      'SDO_LRS.GET_PREV_SHAPE_PT',
                      'SDO_LRS.GET_PREV_SHAPE_PT_3D',
                      'SDO_LRS.GET_PREV_SHAPE_PT_MEASURE',
                      'SDO_LRS.GET_PREV_SHAPE_PT_MEASURE_3D',
                      'SDO_LRS.IS_GEOM_SEGMENT_DEFINED',
                      'SDO_LRS.IS_GEOM_SEGMENT_DEFINED_3D',
                      'SDO_LRS.IS_MEASURE_DECREASING',
                      'SDO_LRS.IS_MEASURE_DECREASING_3D',
                      'SDO_LRS.IS_MEASURE_INCREASING',
                      'SDO_LRS.IS_MEASURE_INCREASING_3D',
                      'SDO_LRS.IS_SHAPE_PT_MEASURE',
                      'SDO_LRS.IS_SHAPE_PT_MEASURE_3D',
                      'SDO_LRS.LOCATE_PT',
                      'SDO_LRS.LOCATE_PT_3D',
                      'SDO_LRS.LRS_INTERSECTION',
                      'SDO_LRS.MEASURE_RANGE',
                      'SDO_LRS.MEASURE_RANGE_3D',
                      'SDO_LRS.MEASURE_TO_PERCENTAGE',
                      'SDO_LRS.OFFSET_GEOM_SEGMENT',
                      'SDO_LRS.PERCENTAGE_TO_MEASURE',
                      'SDO_LRS.PROJECT_PT',
                      'SDO_LRS.PROJECT_PT_3D',
                      'SDO_LRS.REDEFINE_GEOM_SEGMENT',
                      'SDO_LRS.REDEFINE_GEOM_SEGMENT_3D',
                      'SDO_LRS.RESET_MEASURE',
                      'SDO_LRS.REVERSE_GEOMETRY',
                      'SDO_LRS.REVERSE_MEASURE',
                      'SDO_LRS.REVERSE_MEASURE_3D',
                      'SDO_LRS.SCALE_GEOM_SEGMENT',
                      'SDO_LRS.SET_PT_MEASURE',
                      'SDO_LRS.SET_PT_MEASURE_3D',
                      'SDO_LRS.SPLIT_GEOM_SEGMENT',
                      'SDO_LRS.SPLIT_GEOM_SEGMENT_3D',
                      'SDO_LRS.TRANSLATE_MEASURE',
                      'SDO_LRS.TRANSLATE_MEASURE_3D',
                      'SDO_LRS.VALIDATE_LRS_GEOMETRY',
                      'SDO_LRS.VALIDATE_LRS_GEOMETRY_3D',
                      'SDO_LRS.VALID_GEOM_SEGMENT',
                      'SDO_LRS.VALID_GEOM_SEGMENT_3D',
                      'SDO_LRS.VALID_LRS_PT',
                      'SDO_LRS.VALID_LRS_PT_3D',
                      'SDO_LRS.VALID_MEASURE',
                      'SDO_LRS.VALID_MEASURE_3D',
                      'SDO_MIGRATE.FROM_815_TO_81X',
                      'SDO_MIGRATE.OGIS_METADATA_FROM',
                      'SDO_MIGRATE.OGIS_METADATA_TO',
                      'SDO_MIGRATE.TO_81X',
                      'SDO_MIGRATE.TO_CURRENT',
                      'SDO_TUNE.ANALYZE_RTREE',
                      'SDO_TUNE.AVERAGE_MBR',
                      'SDO_TUNE.ESTIMATE_RTREE_INDEX_SIZE',
                      'SDO_TUNE.EXTENT_OF',
                      'SDO_TUNE.MIX_INFO',
                      'SDO_TUNE.QUALITY_DEGRADATION',
                      'SDO_TUNE.RTREE_QUALITY',
                      'SDO_UTIL.APPEND',
                      'SDO_UTIL.BEARING_TILT_FOR_POINTS',
                      'SDO_UTIL.CIRCLE_POLYGON',
                      'SDO_UTIL.CONCAT_LINES',
                      'SDO_UTIL.CONVERT_DISTANCE',
                      'SDO_UTIL.CONVERT_UNIT',
                      'SDO_UTIL.DROP_WORK_TABLES',
                      'SDO_UTIL.ELLIPSE_POLYGON',
                      'SDO_UTIL.EXPAND_GEOM',
                      'SDO_UTIL.EXPAND_MULTI_POINT',
                      'SDO_UTIL.EXTRACT',
                      'SDO_UTIL.EXTRACTVOIDS',
                      'SDO_UTIL.EXTRACT_ALL',
                      'SDO_UTIL.EXTRUDE',
                      'SDO_UTIL.FROM_CLOB',
                      'SDO_UTIL.FROM_WKBGEOMETRY',
                      'SDO_UTIL.FROM_WKTGEOMETRY',
                      'SDO_UTIL.GETNUMELEM',
                      'SDO_UTIL.GETNUMRINGS',
                      'SDO_UTIL.GETNUMVERTICES',
                      'SDO_UTIL.GETVERTICES',
                      'SDO_UTIL.GET_2D_FOOTPRINT',
                      'SDO_UTIL.INITIALIZE_INDEXES_FOR_TTS',
                      'SDO_UTIL.INTERIOR_POINT',
                      'SDO_UTIL.INTERNAL_MAKE_LINE_OUT_OF_ELEM',
                      'SDO_UTIL.INTERNAL_MERGE_LINESTRINGS',
                      'SDO_UTIL.INTERNAL_ORDINATE_COPY',
                      'SDO_UTIL.INTERNAL_REVERSE_LINE_POINTS',
                      'SDO_UTIL.NUMBER_OF_COMPONENTS',
                      'SDO_UTIL.OUTERLN',
                      'SDO_UTIL.PARTITION_TABLE',
                      'SDO_UTIL.POINT_AT_BEARING',
                      'SDO_UTIL.POINT_TO_LINE',
                      'SDO_UTIL.POLYGONTOLINE',
                      'SDO_UTIL.PREPARE_FOR_TTS',
                      'SDO_UTIL.QUAD_TILES',
                      'SDO_UTIL.RECTIFY_GEOMETRY',
                      'SDO_UTIL.REFINEMGON',
                      'SDO_UTIL.REMOVE_DUPLICATES',
                      'SDO_UTIL.REMOVE_DUPLICATE_VERTICES',
                      'SDO_UTIL.REMOVE_INNER_RINGS',
                      'SDO_UTIL.REVERSE_LINESTRING',
                      'SDO_UTIL.SIMPLIFY',
                      'SDO_UTIL.TO_CLOB',
                      'SDO_UTIL.TO_WKBGEOMETRY',
                      'SDO_UTIL.TO_WKTGEOMETRY',
                      'SDO_UTIL.TO_WKTGEOMETRY_VARCHAR',
                      'SDO_UTIL.TRUNCATE_NUMBER',
                      'UTL_HTTP.REQUEST_PIECES',
                      'UTL_HTTP.SET_PROPERTY',
                      'UTL_I18N.ENCODE_SQL_XML',
                      'UTL_I18N.VALIDATE_SQLNAME',
                      'UTL_MATCH.JARO_WINKLER_SIMILARITY',
                      'UTL_NLA.BLAS_GBMV',
                      'UTL_NLA.UNIT_TEST_BLAS',
                      'UTL_NLA.UNIT_TEST_LAPACK',
                      'UTL_RECOMP.PARALLEL_SLAVE',
                      'UTL_REF.SELECT_OBJECT_WITH_CR',
                      'WPG_DOCLOAD.GET_CONTENT_LENGTH',
                      'WPG_DOCLOAD.GET_DOWNLOAD_BFILE',
                      'WPG_DOCLOAD.GET_DOWNLOAD_BLOB',
                      'WPG_DOCLOAD.GET_DOWNLOAD_FILE',
                      'WPG_DOCLOAD.IS_FILE_DOWNLOAD'
                     )
                order by package_name, proc_name,position,data_type)
      loop
        
        writeNonDocProcLine(
                           row.package_name,
                           row.proc_name,
                           row.argument_name,
                           row.position,
                           row.data_type,
                           row.in_out,
                           row.defaulted
                          );
        
      
      end loop;


    end nondocumentedprocsdatabuilder;

end provider_data;
