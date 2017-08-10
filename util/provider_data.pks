create or replace package                         provider_data
/*
    Package: provider_data
    Purpose: Generate the data as a JSON feed that Atom will use to aid in
    its code completions.
    Notes: Must be run as sys to gain access to DBA dictionary views
    Status:
        [*] - keywords
        [*] - Packages
        [*] - Package procedures
        [ ] - Procedure arguments
        [ ] - Package types


*/
as

    type t_varchar2_table is table of varchar2(30);

    procedure dataBuilder;

    function get_packs return t_varchar2_table pipelined;

    procedure nonDocumentedProcsDataBuilder;

end provider_data;
