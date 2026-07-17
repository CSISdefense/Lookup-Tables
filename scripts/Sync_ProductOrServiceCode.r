
###############################################################
# Sync FPDStypetable.ProductOrServiceCode with repo version
################################################################
library(dplyr)
library(tidyr)
library(tidyverse)
library(csis360)
library(readr)
library(sqldf)
library(odbc)
library(askpass)
library(DBI)
library(askpass)


login<-askpass("Please enter the login account")
pwd<-askpass("Please enter the account password")

con <- dbConnect(odbc(),
                 Driver = "SQL Server",
                 Server = "vmsqldiig.database.windows.net",
                 Database = "CSIS360",
                 UID = login,
                 PWD =pwd)


repoPSC<-read_csv("ProductOrServiceCodes.csv",na = "NULL")
sqlPSC<-dbReadTable(con,  name = SQL('"FPDSTypeTable"."ProductOrServiceCode"'))

#New Columns
newcols<-colnames(sqlPSC)[!colnames(sqlPSC) %in% colnames(repoPSC)]
if(length(newcols)>0){
  newcolsPSC<-sqlPSC[,c(newcols,"ProductOrServiceCode")]
  repoPSC<-left_join(repoPSC, newcolsPSC)
}

newcols<-colnames(repoPSC)[!colnames(repoPSC) %in% colnames(sqlPSC)]
if(length(newcols)>0){
  newcolsPSC<-repoPSC[,c(newcols,"ProductOrServiceCode")]
  sqlPSC<-left_join(sqlPSC, newcolsPSC)
}


colnames(repoPSC)[!colnames(repoPSC) %in% colnames(sqlPSC)]

repoPSC<-rbind(repoPSC,sqlPSC[!sqlPSC$ProductOrServiceCode %in% repoPSC$ProductOrServiceCode,])
repoPSC<-repoPSC[order(repoPSC$ProductOrServiceCode),]

write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

update_repo_cols<-function(repo,sql,pk,colnames=NA,fill_SQL_na=TRUE){
  order<-colnames(repo)
if(is.na(colnames))
  colnames <- colnames(df)[colnames(df) != pk]

for(i in colnames){
  sql<-sql[,c(i,pk)]
  repo$TemporaryHolder<-repo[,colnames(repo)==i]
  repo<-repo[,colnames(repo)!=i]
  repo<-left_join(repo,sql)
  if(fill_SQL_na & any(is.na(repo[,colnames(repo)==i]))){
    repo[is.na(repo[,colnames(repo)==i]),colnames(repo)==i]<-
      repo$TemporaryHolder[is.na(repo[,colnames(repo)==i])]
  }
  repo<-repo %>% select(-TemporaryHolder)
  repo[,order]
}

# code<-"7435"
#  repoPSC$ProductOrServiceArea[repoPSC$ProductOrServiceCode==code]<-'Electronics & Communications'
# repoPSC$ProductsCategory[repoPSC$ProductOrServiceCode==code]<-'Electronics & Communications'
# repoPSC$ProductServiceOrRnDarea[repoPSC$ProductOrServiceCode==code]<-'Electronics & Communications'
# repoPSC$PlatformPortfolio[repoPSC$ProductOrServiceCode==code]<-'Electronics, Comms, & Sensors'
# 
# repoPSC$PlatformPortfolio[repoPSC$IsPossibleSoftwareEngineering=="Other Communication"]<-'Other Comms and Sensors'
colnames(repoPSC)

repoPSC<-update_repo_cols(repoPSC,sqlPSC,"PlatformPortfolio")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

# summary(factor(sqlPSC$ProductOrServiceCode[sqlPSC$IsPossibleSoftwareEngineering==1]))
# summary(factor(repoPSC$ProductOrServiceCode[repoPSC$IsPossibleSoftwareEngineering==1]))
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

sqlPSCA<-dbReadTable(con,  name = SQL('"ProductOrServiceCode"."PSCAtransition"'))

update_sql_table<-function(schemaname,tablename,con,df,pk){
# Code initially provided by POSIT Assistant

# Upload repoPSC to a staging table, overwriting any prior run
upload_name<-paste(tablename,"R","Upload",sep="_")
DBI::dbWriteTable(
  conn      = con,
  name      = DBI::Id(schema = schemaname, table = uploadname),
  value     = df,
  overwrite = TRUE,
  row.names = FALSE
)

# Check for columns in the upload table not present in the target table,
# and ALTER the target to add any that are missing.
target_cols <- dbGetQuery(con, paste("
  SELECT COLUMN_NAME, DATA_TYPE
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = '%s'
    AND TABLE_NAME   = '%s'",
  schemaname, tablename)
)

upload_cols <- dbGetQuery(con, paste("
  SELECT COLUMN_NAME, DATA_TYPE
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA = '%s'
    AND TABLE_NAME   = '%s'",
  schemaname, tablename)
)

missing_in_target <- upload_cols[
  !upload_cols$COLUMN_NAME %in% target_cols$COLUMN_NAME, ]

if (nrow(missing_in_target) > 0) {
  for (i in seq_len(nrow(missing_in_target))) {
    col   <- missing_in_target$COLUMN_NAME[i]
    dtype <- missing_in_target$DATA_TYPE[i]

    # Map SQL Server base types to safe ALTER TABLE types
    sql_type <- switch(dtype,
      int      = "INT",
      bigint   = "BIGINT",
      float    = "FLOAT",
      real     = "REAL",
      bit      = "BIT",
      date     = "DATE",
      datetime = "DATETIME",
      "NVARCHAR(255)"   # default for character types
    )

    alter_sql <- sprintf(
      "ALTER TABLE [%s].[%s] ADD [%s] %s NULL",
      schemaname,tablename, col, sql_type
    )
    message("Adding missing column to target: ", col, " (", sql_type, ")")
    dbExecute(con, alter_sql)
  }
} else {
  message("No missing columns — target table is up to date.")
}

# Build the UPDATE ... FROM statement dynamically from column names
update_cols <- colnames(df)[colnames(df) != pk]

set_clause <- paste(
  sprintf("t.[%s] = u.[%s]", update_cols, update_cols),
  collapse = ",\n  "
)

sql_update <- sprintf(
  "UPDATE t
SET
  %s
FROM ",schemaname,".",tablename," t
INNER JOIN [%s].[%s] u
  ON t.[%s] = u.[%s]",
  set_clause, schemaname,update_name, pk, pk
)

dbExecute(con, sql_update)
}

repoAgency<-read_csv("Agency_AgencyID.csv",na = "NULL")
sqlAgency<-dbReadTable(con,  name = SQL('"FPDSTypeTable"."AgencyID"')) 
sqlAgency<-sqlAgency[,!colnames(sqlAgency)%in% "Unseperated"]

if(any(duplicated(str_trim(sqlAgency$AgencyID))))
  stop("Duplicate AgencyID")

#New Columns
newcols<-colnames(sqlAgency)[!colnames(sqlAgency) %in% colnames(repoAgency) ]
if(length(newcols)>0){
  newcolsAgency<-sqlAgency[,c(newcols,"AgencyID")]
  repoAgency<-left_join(repoAgency, newcolsAgency)
}

newcols<-colnames(repoAgency)[!colnames(repoAgency) %in% colnames(sqlAgency)]
if(length(newcols)>0){
  newcolsAgency<-repoAgency[,c(newcols,"AgencyID")]
  sqlAgency<-left_join(sqlAgency, newcolsAgency)
}
write_csv(repoAgency,file = "Agency_AgencyID.csv", na="NULL")
repoAgency<-rbind(repoAgency,sqlAgency[!sqlAgency$AgencyID %in% repoAgency$AgencyID,])
repoAgency<-repoAgency[order(repoAgency$AgencyID),]
write_csv(repoAgency,file = "Agency_AgencyID.csv", na="NULL")

repoAgency<-update_col(repoAgency,sqlAgency,"Customer",pk="AgencyID")
write_csv(repoAgency,file = "Agency_AgencyID.csv", na="NULL")

repoAgency<-update_col(repoAgency,sqlAgency,"SubCustomer",pk="AgencyID")
write_csv(repoAgency,file = "Agency_AgencyID.csv", na="NULL")

repoAgency<-update_col(repoAgency,sqlAgency,"maj_agency_cat",pk="AgencyID")
write_csv(repoAgency,file = "Agency_AgencyID.csv", na="NULL")
  