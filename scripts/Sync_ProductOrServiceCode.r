
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

update_col<-function(repo,sql,colname,fill_SQL_na=TRUE){
  order<-colnames(repo)
  sql<-sql[,c(colname,"ProductOrServiceCode")]
  repo$TemporaryHolder<-repo[,colnames(repo)==colname]
  repo<-repo[,colnames(repo)!=colname]
  repo<-left_join(repo,sql)
  if(fill_SQL_na & any(is.na(repo[,colnames(repo)==colname]))){
    repo[is.na(repo[,colnames(repo)==colname]),colnames(repo)==colname]<-
      repo$TemporaryHolder[is.na(repo[,colnames(repo)==colname])]
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
undebug(update_col)
repoPSC<-update_col(repoPSC,sqlPSC,"PlatformPortfolio")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

repoPSC<-update_col(repoPSC,sqlPSC,"Simple")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

repoPSC<-update_col(repoPSC,sqlPSC,"PlatformPortfolio")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

repoPSC<-update_col(repoPSC,sqlPSC,"ProductOrServiceArea")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

repoPSC<-update_col(repoPSC,sqlPSC,"ServicesCategory")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

repoPSC<-update_col(repoPSC,sqlPSC,"ProductServiceOrRnDarea")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")


repoPSC<-update_col(repoPSC,sqlPSC,"RnD_BudgetActivity")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")


repoPSC<-update_col(repoPSC,sqlPSC,"CrisisProductOrServiceArea")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

repoPSC<-update_col(repoPSC,sqlPSC,"IsPossibleSoftwareEngineering")
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

summary(factor(sqlPSC$ProductOrServiceCode[sqlPSC$IsPossibleSoftwareEngineering==1]))
summary(factor(repoPSC$ProductOrServiceCode[repoPSC$IsPossibleSoftwareEngineering==1]))
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

sqlPSCA<-dbReadTable(con,  name = SQL('"ProductOrServiceCode"."PSCAtransition"'))
 