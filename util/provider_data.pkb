create or replace PACKAGE BODY PROVIDER_DATA
AS

    type t_keyword_list is table of varchar2(50)
        index by PLS_INTEGER;

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
        order by keyword;

        return l_keys;
    end get_keywords;


    procedure keywords AS
        l_keys t_keyword_list;
    BEGIN
        l_keys := get_keywords();

        dbms_output.put_line('{');
        dbms_output.put_line(chr(9) || '"keywords": [');

        for i in 1..l_keys.COUNT
        loop


            if i = l_keys.COUNT
            then
                dbms_output.put_line(chr(9)||chr(9) || rtrim(l_keys(i), ','));
            else
                dbms_output.put_line(chr(9)||chr(9) || l_keys(i));
            end if;

        end loop;

        dbms_output.put_line(chr(9) || ']');
        dbms_output.put_line('}');


    END keywords;

END PROVIDER_DATA;
/
