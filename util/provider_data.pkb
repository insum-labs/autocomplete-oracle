create or replace PACKAGE BODY PROVIDER_DATA
AS

    type t_keyword_list is table of varchar2(50)
        index by PLS_INTEGER;

    type t_package_list is table of all_procedures.object_name%type
        index by PLS_INTEGER;

    type t_procedure_list is table of all_procedures.procedure_name%type
        index by PLS_INTEGER;

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
        p_num_tabs in NUMBER,
        p_chars_per_tab in NUMBER default 4,
        p_replace_with in VARCHAR2 default ' '
    ) return varchar2
    as
        l_return_chars varchar2(100);
    begin

        for tabIndex in 1..p_num_tabs
        loop
            for charIndex in 1..p_chars_per_tab
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

        select
            '"'||keyword||'",'
        bulk collect into
            l_keys
        from
            v$reserved_words res_words
            left outer join all_procedures procs on (procs.owner = 'SYS' and procs.object_name = 'STANDARD' and procs.procedure_name = res_words.keyword)
        where
            res_words.keyword not in (
                '!',
                '!=',
                '&',
                '(',
                ')',
                '*',
                '+',
                ',',
                '-',
                '.',
                '/',
                ':',
                ';',
                '<',
                '<<',
                '<=',
                '=',
                '=>',
                '>',
                '>=',
                '@',
                'A',
                '[',
                ']',
                '^',
                '{',
                '|',
                '}'
            )
            and procs.object_id is NULL
            and length(res_words.keyword) >= 2
        order by keyword;

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
                and all_synonyms.table_owner = apex_application.G_FLOW_SCHEMA_OWNER
                and all_procedures.procedure_name is not null
            order by 1;

        end if;


        return l_procs;
    end get_procedures;


    procedure dataBuilder AS
        l_keys t_keyword_list;
        l_pks t_package_list;
        l_procs t_procedure_list;
    BEGIN

        l_keys := get_keywords();
        l_pks := get_packages();

        dbms_output.put_line('{');
        dbms_output.put_line(get_tab_chars(1) || '"keywords": [');

        for i in 1..l_keys.COUNT
        loop


            if i = l_keys.COUNT
            then
                dbms_output.put_line(get_tab_chars(2) || rtrim(l_keys(i), ','));
            else
                dbms_output.put_line(get_tab_chars(2) || l_keys(i));
            end if;

        end loop;

        dbms_output.put_line(get_tab_chars(1) || '],');
        dbms_output.put_line(get_tab_chars(1) || '"packages" : {');

        for i in 1..l_pks.COUNT
        loop

            l_procs := get_procedures(l_pks(i));

            dbms_output.put_line(get_tab_chars(2) || '"'||l_pks(i)||'": {');


            dbms_output.put_line(get_tab_chars(3) || '"procedures": [');

            for i in 1..l_procs.COUNT
            loop

                if i = l_procs.COUNT
                then
                    dbms_output.put_line(get_tab_chars(4) || '"' || l_procs(i) || '"');
                else
                    dbms_output.put_line(get_tab_chars(4) || '"' || l_procs(i) || '",');
                end if;

            end loop;

            dbms_output.put_line(get_tab_chars(3) || ']');


            if i = l_pks.COUNT
            then
                dbms_output.put_line(get_tab_chars(2) || '}');
            else
                dbms_output.put_line(get_tab_chars(2) || '},');
            end if;
        end loop;

        dbms_output.put_line(get_tab_chars(1) || '}');
        dbms_output.put_line('}');


    END dataBuilder;

END PROVIDER_DATA;
