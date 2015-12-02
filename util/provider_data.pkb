create or replace PACKAGE BODY     PROVIDER_DATA
AS

    type t_keyword_list is table of varchar2(50)
        index by PLS_INTEGER;

    type t_package_list is table of all_procedures.object_name%type
        index by PLS_INTEGER;

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

        select distinct object_name
        bulk collect into l_pkg_list
        from all_procedures
        where procedure_name is not null
        and object_name in (
            'APEX_CUSTOM_AUTH',
            'APEX_APPLICATION',
            'APEX_ITEM',
            'APEX_UTIL',
            'CTX_ADM',
            'CTX_CLS',
            'CTX_DDL',
            'CTX_DOC',
            'CTX_ENTITY',
            'CTX_OUTPUT',
            'CTX_QUERY',
            'CTX_REPORT',
            'CTX_THES',
            'CTX_ULEXER',
            'DBMS_ADDM',
            'DBMS_ADVANCED_REWRITE',
            'DBMS_ADVISOR',
            'DBMS_ALERT',
            'DBMS_APPLICATION_INFO',
            'DBMS_APPLY_ADM',
            'DBMS_AQ',
            'DBMS_AQADM',
            'DBMS_AQELM',
            'DBMS_AQIN',
            'DBMS_ASSERT',
            'DBMS_AUDIT_MGMT',
            'DBMS_AUTO_SQLTUNE',
            'DBMS_AUTO_TASK_ADMIN',
            'DBMS_AUTO_TASK_IMMEDIATE',
            'DBMS_AW_STATS',
            'DBMS_CAPTURE_ADM',
            'DBMS_CDC_PUBLISH',
            'DBMS_CDC_SUBSCRIBE',
            'DBMS_COMPARISON',
            'DBMS_COMPRESSION',
            'DBMS_CONNECTION_POOL',
            'DBMS_CQ_NOTIFICATION',
            'DBMS_CRYPTO',
            'DBMS_CSX_ADMIN',
            'DBMS_CUBE',
            'DBMS_CUBE_ADVISE',
            'DBMS_CUBE_LOG',
            'DBMS_DATA_MINING',
            'DBMS_DATA_MINING_TRANSFORM',
            'DBMS_DATAPUMP',
            'DBMS_DBFS_CONTENT',
            'DBMS_DBFS_CONTENT_SPI',
            'DBMS_DBFS_HS',
            'DBMS_DBFS_SFS',
            'DBMS_DB_VERSION',
            'DBMS_DEBUG',
            'DBMS_DDL',
            'DBMS_DEFER',
            'DBMS_DEFER_QUERY',
            'DBMS_DEFER_SYS',
            'DBMS_DESCRIBE',
            'DBMS_DG',
            'DBMS_DIMENSION',
            'DBMS_DST',
            'DBMS_DISTRIBUTED_TRUST_ADMIN',
            'DBMS_EDITIONS_UTILITIES',
            'DBMS_EPG',
            'DBMS_ERRLOG',
            'DBMS_EXPFIL',
            'DBMS_FGA',
            'DBMS_FILE_GROUP',
            'DBMS_FILE_TRANSFER',
            'DBMS_FLASHBACK',
            'DBMS_FLASHBACK_ARCHIVE',
            'DBMS_FREQUENT_ITEMSET',
            'DBMS_HM',
            'DBMS_HPROF',
            'DBMS_HS_PARALLEL',
            'DBMS_HS_PASSTHROUGH',
            'DBMS_IOT',
            'DBMS_JAVA',
            'DBMS_JOB',
            'DBMS_LDAP',
            'DBMS_LDAP_UTL',
            'DBMS_LIBCACHE',
            'DBMS_LOB',
            'DBMS_LOCK',
            'DBMS_LOGMNR',
            'DBMS_LOGMNR_D',
            'DBMS_LOGSTDBY',
            'DBMS_METADATA',
            'DBMS_METADATA_DIFF',
            'DBMS_MGD_ID_UTL',
            'DBMS_MGWADM',
            'DBMS_MGWMSG',
            'DBMS_MONITOR',
            'DBMS_MVIEW',
            'DBMS_NETWORK_ACL_ADMIN',
            'DBMS_NETWORK_ACL_UTILITY',
            'DBMS_OBFUSCATION_TOOLKIT',
            'DBMS_ODCI',
            'DBMS_OFFLINE_OG',
            'DBMS_OUTLN',
            'DBMS_OUTPUT',
            'DBMS_PARALLEL_EXECUTE',
            'DBMS_PCLXUTIL',
            'DBMS_PIPE',
            'DBMS_PREDICTIVE_ANALYTICS',
            'DBMS_PREPROCESSOR',
            'DBMS_PROFILER',
            'DBMS_PROPAGATION_ADM',
            'DBMS_RANDOM',
            'DBMS_RECTIFIER_DIFF',
            'DBMS_REDEFINITION',
            'DBMS_REDACT',
            'DBMS_REFRESH',
            'DBMS_REPAIR',
            'DBMS_REPCAT',
            'DBMS_REPCAT_ADMIN',
            'DBMS_REPCAT_INSTANTIATE',
            'DBMS_REPCAT_RGT',
            'DBMS_REPUTIL',
            'DBMS_RESCONFIG',
            'DBMS_RESOURCE_MANAGER',
            'DBMS_RESOURCE_MANAGER_PRIVS',
            'DBMS_RESULT_CACHE',
            'DBMS_RESUMABLE',
            'DBMS_RLMGR',
            'DBMS_RLS',
            'DBMS_ROWID',
            'DBMS_RULE',
            'DBMS_RULE_ADM',
            'DBMS_SCHEDULER',
            'DBMS_SERVER_ALERT',
            'DBMS_SERVICE',
            'DBMS_SESSION',
            'DBMS_SHARED_POOL',
            'DBMS_SPACE',
            'DBMS_SPACE_ADMIN',
            'DBMS_SPM',
            'DBMS_SQL',
            'DBMS_SQLDIAG',
            'DBMS_SQLPA',
            'DBMS_SQLTUNE',
            'DBMS_STAT_FUNCS',
            'DBMS_STATS',
            'DBMS_STORAGE_MAP',
            'DBMS_STREAMS',
            'DBMS_STREAMS_ADM',
            'DBMS_STREAMS_ADVISOR_ADM',
            'DBMS_STREAMS_AUTH',
            'DBMS_STREAMS_HANDLER_ADM',
            'DBMS_STREAMS_MESSAGING',
            'DBMS_STREAMS_TABLESPACE_ADM',
            'DBMS_TDB',
            'DBMS_TRACE',
            'DBMS_TRANSACTION',
            'DBMS_TRANSFORM',
            'DBMS_TTS',
            'DBMS_TYPES',
            'DBMS_UTILITY',
            'DBMS_WARNING',
            'DBMS_WM',
            'DBMS_WORKLOAD_CAPTURE',
            'DBMS_WORKLOAD_REPLAY',
            'DBMS_WORKLOAD_REPOSITORY',
            'DBMS_XA',
            'DBMS_XDB',
            'DBMS_XDB_ADMIN',
            'DBMS_XDB_VERSION',
            'DBMS_XDBRESOURCE',
            'DBMS_XDBT',
            'DBMS_XDBZ',
            'DBMS_XEVENT',
            'DBMS_XMLDOM',
            'DBMS_XMLGEN',
            'DBMS_XMLINDEX',
            'DBMS_XMLPARSER',
            'DBMS_XMLQUERY',
            'DBMS_XMLSAVE',
            'DBMS_XMLSCHEMA',
            'DBMS_XMLSTORE',
            'DBMS_XMLTRANSLATIONS',
            'DBMS_XPLAN',
            'DBMS_XSLPROCESSOR',
            'DEBUG_EXTPROC',
            'HTF',
            'HTP',
            'ORD_DICOM',
            'ORD_DICOM_ADMIN',
            'OWA_CACHE',
            'OWA_COOKIE',
            'OWA_CUSTOM',
            'OWA_IMAGE',
            'OWA_OPT_LOCK',
            'OWA_PATTERN',
            'OWA_SEC',
            'OWA_TEXT',
            'OWA_UTIL',
            'SDO_CS',
            'SDO_CSW_PROCESS',
            'SDO_GCDR',
            'SDO_GEOM',
            'SDO_GEOR',
            'SDO_GEOR_ADMIN',
            'SDO_GEOR_UTL',
            'SDO_LRS',
            'SDO_MIGRATE',
            'SDO_NET',
            'SDO_NET_MEM',
            'SDO_OLS',
            'SDO_PC_PKG',
            'SDO_SAM',
            'SDO_TIN_PKG',
            'SDO_TOPO',
            'SDO_TOPO_MAP',
            'SDO_TUNE',
            'SDO_UTIL',
            'SDO_WFS_LOCK',
            'SDO_WFS_PROCESS',
            'SEM_APIS',
            'SEM_PERF',
            'SEM_RDFCTX',
            'SEM_RDFSA',
            'UTL_COLL',
            'UTL_COMPRESS',
            'UTL_ENCODE',
            'UTL_FILE',
            'UTL_HTTP',
            'UTL_I18N',
            'UTL_INADDR',
            'UTL_IDENT',
            'UTL_LMS',
            'UTL_MAIL',
            'UTL_MATCH',
            'UTL_NLA',
            'UTL_RAW',
            'UTL_RECOMP',
            'UTL_REF',
            'UTL_SMTP',
            'UTL_SPADV',
            'UTL_TCP',
            'UTL_URL',
            'WPG_DOCLOAD'
        )
        order by  1;

        return l_pkg_list;

    end get_packages;


    procedure dataBuilder AS
        l_keys t_keyword_list;
        l_pks t_package_list;
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
            if i = l_pks.COUNT
            then
                dbms_output.put_line(get_tab_chars(2) || '"'||l_pks(i)||'": { }');
            else
                dbms_output.put_line(get_tab_chars(2) || '"'||l_pks(i)||'": { },');
            end if;
        end loop;

        dbms_output.put_line(get_tab_chars(1) || '}');
        dbms_output.put_line('}');


    END dataBuilder;

END PROVIDER_DATA;
