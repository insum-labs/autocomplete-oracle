## 1.3.1
 * Removed excessive keywords/reserved worrds. They now come from https://docs.oracle.com/cd/B19306_01/appdev.102/b14261/reservewords.htm

## 1.3.0

* Updated the readme to include a demo of the new features since 1.0.0
* Added option to seed parameters with a placeholder

## 1.2.0

* The scraper in the util folder now also scrapes Oracle SYS functions (e.g. to_date)
* Users can now type a Sys function and see it's description, url, and syntax

## 1.1.0

* Simplified the size of allFuncProcsOracl12CApex51.json so that the package uses less memory
* Added git ignore / deleted files that were taking up too much space and aren't used by atom

## 1.0.0

* Added descriptions to functions/procedures
* Added Url to functions/procedures
* Updated the util folder to include files which scrape this information from oracle's documentation
* A pop-up now appears when the user accepts a func/proc that shows the parameters / documentation url

## 0.5.0

* Transfer ownership to `insum-labs`

## 0.4.0

* Add package identifiers (package types)
* Resolve issue with procedure names not resolving on like packages (e.g. dms_sql, dbms_sqlpa, etc)

## 0.3.0

* Disable for comment sections
* Add package procedure
* Add apex packages

## 0.2.0

* Added an oracle package to generate dataStore.json contents
* Included package names in completions (with the `class` type)
* Updated dataStore.json to reflect

## 0.1.0

* Include Oracle keywords as from v$reserved_words
