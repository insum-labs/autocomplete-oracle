/*
    Package: provider_data
    Purpose: Generate the data as a JSON feed that Atom will use to aid in
    its code completions.
    Notes: Must be run as sys to gain access to DBA dictionary views
    Status:
        [*] - keywords
        [ ] - Packages
        [ ] - Package procedures
        [ ] - Procedure arguments
        [ ] - Package types


*/
create or replace package provider_data
as

    procedure keywords;

end provider_data;
/
