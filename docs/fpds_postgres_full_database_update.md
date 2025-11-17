Note that you'll need a local install of Postgres for this to work.
https://www.postgresql.org/


This should hopefully not be routinely necessary because monthly delta files are much faster.


Save a complete download of current CTU files. This cn be done in
Lookup_Tables/SQL/postgres_exploration,sql 

Or use the code below. 
SET QUERY_GOVERNOR_COST_LIMIT 0
--1h31 m
--2h15m at 47%
SET ANSI_WARNINGS OFF;
SET NOCOUNT ON;
select fiscal_year, contract_transaction_unique_key, csistransactionid, last_modified_date
from contract.FPDS

Export to a file in a USAspending-local folder, e.g. USAspending-local\\contract_fpds_ctu_list_2024_03_19.txt



Once it is downloaded, the Lookup\\scripts\\TransferPostgres.R file can be used to upload to your local postgres database





::### Connection Variables REM ####
cd D:\Program Files\PostgreSQL\16\bin

SET DBUSER=postgres
SET DBPASSWORD=--Add password here
SET DBHOST=127.0.0.1
SET DBPORT=5432
set CONN="postgresql://%DBUSER%:%DBPASSWORD%@%DBHOST%:%DBPORT%"
set DBNAME=data_store_api
set DBNAME=raw


``
Create a 32 bit DSN connection using the instruction here
https://learn.microsoft.com/en-us/sql/integration-services/import-export-data/connect-to-an-odbc-data-source-sql-server-import-and-export-wizard?view=sql-server-ver16
Driver={PostgreSQL ANSI(x64)};Server=127.0.0.1;Port=5432;Database=data_store_api;UID=postgres;PWD=BqrM?s5D$LSjshHP
https://learn.microsoft.com/en-us/sql/integration-services/import-export-data/connect-to-a-postgresql-data-source-sql-server-import-and-export-wizard?view=sql-server-ver16
https://dba.stackexchange.com/questions/323444/postgres-what-is-a-vacuum-delay
::### Dump Variables REM ####
set DUMP_DIR=D:/Users/Greg/Repositories
set DUMP=%DUMP_DIR%/usaspending-db_20240208
::### Database Restore REM ####
:: DROP and CREATE the database, if it exists
psql %CONN%/postgres 
DROP DATABASE IF EXISTS data_store_api;
CREATE DATABASE data_store_api;
DROP DATABASE IF EXISTS raw;
CREATE DATABASE raw;

create role api_user;
create role root;
\c data_store_api
\dt
\q 
:: Create list of ALL EXCEPT materialized views data (defer them), to restore
:: Set isn't a windows command, so i just copy the full dump over into restore.list
pg_restore --list %DUMP% ::| sed '/MATERIALIZED VIEW DATA/d' > %DUMP_DIR%/restore.list 
:: I reconstruct retore_raw.list, copying over the equivalent lines from restore.list for the half-dozen items.
:: Note, it will sit for a while on the final skip before going into the index. 
:; e.g. pg_restore: finished item 5809 TABLE DATA source_procurement_transaction
pg_restore --jobs 16 --dbname %CONN%/%DBNAME% --verbose --exit-on-error --use-list %DUMP_DIR%/restore_raw.list %DUMP%
:: Restore all but materialized view data
::pg_restore --jobs 16 --dbname %CONN%/%DBNAME% --verbose --exit-on-error --use-list %DUMP_DIR%/restore.list %DUMP%
:: Perform an ANALYZE to optimize query performance in view materialization
psql --dbname %CONN%/%DBNAME% --command 'ANALYZE VERBOSE;' --echo-all --set ON_ERROR_STOP=on --set VERBOSITY=verbose --set SHOW_CONTEXT=always
:: =========================================================================
:: ==== Comment or remove below if you do not want to materialize views ====
:: =========================================================================
::### Materialized View Refresh REM ####
:: Create list of ONLY materialized views data to refresh
pg_restore --list %DUMP% | grep "MATERIALIZED VIEW DATA" > %DUMP_DIR%/refresh.list
:: Refresh materialized view data
pg_restore --jobs 16 --dbname %CONN%/%DBNAME% --verbose --exit-on-error --use-list %DUMP_DIR%/refresh.list %DUMP% 
:: Do an additional ANALYZE on the materialized views after being materialized

:: Do an additional ANALYZE on the materialized views after being materialized
pg_restore --list %DUMP% \
| grep "MATERIALIZED VIEW DATA" \
| awk '{ print "ANALYZE VERBOSE", $8";" };' \
> %DUMP_DIR%/analyze_matviews.sql
psql \
--dbname %CONN%/%DBNAME% \
--echo-all \
--set ON_ERROR_STOP=on \
--set VERBOSITY=verbose \
--set SHOW_CONTEXT=always \
--file %DUMP_DIR%/analyze_matviews.sql

