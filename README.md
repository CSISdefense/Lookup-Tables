Lookup-Tables
=============
These tables are used by the [Defense-Industrial Initiative Group (DIIG)](http://csis.org/diig) at the [Center for Strategic and International Studies (CSIS)](http://csis.org) for our open source government research. They are available under a creative commons license, thus please cite us if you use them. 

##Ways to access the files
* The files are stored as comma separated values (CSV). Text is delineated with double quotes (").
* If opening in Excel, choose to preserve the oiginal format, otherwise some fields will be corrupted, e.g. turning a "BE23" service code into scientific notation.
* If you want an local copy of this entire repository, you can "fork" it to your machine.
* You can open an individual file directly and copy out the contents. If you are copying into Excel you will need to use the text to columns feature.
* You can download an individual file. On Windows, this is done by right clicking on the link to the file and selecting "Save Link as"/"Save target as" or the equivalent for the browser in question.
* Please feel free to contact gsanders at csis.org if you encounter any problems with these files.

##General resources
* The Federal Procurement Data System (FPDS) provides a list of links relating to [Product Or Service Codes, North American Industrial Classification Codes (NAICS), and more](https://www.fpds.gov/wiki/index.php/PSC,_NAICS_and_more)
* [List of Contracting Offices and Agency/Department IDs (xls)](https://www.fpds.gov/downloads/top_requests/FPDSNG_Contracting_Offices.xls)

##Product Or Service Codes (PSC)
* The [official PSC manual (pdf)](http://www.acquisition.gov/psc%20manual%20-%20final%20-%2011%20august%202011.pdf)
* Spreadsheet of [PSCs and descriptions](http://www.fpdsng.com/downloads/psc_data_Oct012011.xls)

##Internal CSIS Instructions
* The [FPDS delta file import instructions](docs/fpds_delta_import.md) which must be executed every month.
* The [FPDS full postgres import instructions](docs/fpds_postgres_full_database_update.md) necessary if we miss a month or need to add a new variable to the entire database.