create or replace PACKAGE BODY PROVIDER_DATA
AS

    type t_keyword_list is table of varchar2(50)
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


    procedure keywords AS
        l_keys t_keyword_list;
    BEGIN

        --dbms_output.put_line(get_tab_chars(1, 4, 'a'));


        l_keys := get_keywords();

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

        dbms_output.put_line(get_tab_chars(1) || ']');
        dbms_output.put_line('}');


    END keywords;

END PROVIDER_DATA;
