
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

newcols<-colnames(sqlPSC)[!colnames(sqlPSC) %in% colnames(repoPSC)]
if(length(newcols)>0){
  newcolsPSC<-sqlPSC[,c(newcols,"ProductOrServiceCode")]
  repoPSC<-left_join(repoPSC, newcolsPSC)
}

update_col<-function(repo,sql,colname){
  order<-colnames(repo)
  sql<-sql[,c(colname,"ProductOrServiceCode")]
  repo<-repo[,colnames(repo)!=colname]
  repo<-left_join(repo,sql)
  repo[,order]
}

code<-"7435"
repoPSC$ProductOrServiceArea[repoPSC$ProductOrServiceCode==code]<-'Electronics & Communications'
repoPSC$ProductsCategory[repoPSC$ProductOrServiceCode==code]<-'Electronics & Communications'
repoPSC$ProductServiceOrRnDarea[repoPSC$ProductOrServiceCode==code]<-'Electronics & Communications'
repoPSC$PlatformPortfolio[repoPSC$ProductOrServiceCode==code]<-'Electronics, Comms, & Sensors'

repoPSC$PlatformPortfolio[repoPSC$IsPossibleSoftwareEngineering=="Other Communication"]<-'Other Comms and Sensors'
colnames(repoPSC)
repoPSC<-update_col(repoPSC,sqlPSC,"PlatformPortfolio")
repoPSC<-update_col(repoPSC,sqlPSC,"Simple")
repoPSC<-update_col(repoPSC,sqlPSC,"PlatformPortfolio")
repoPSC<-update_col(repoPSC,sqlPSC,"ProductOrServiceArea")
repoPSC<-update_col(repoPSC,sqlPSC,"ServicesCategory")
repoPSC<-update_col(repoPSC,sqlPSC,"ProductServiceOrRnDarea")
repoPSC<-update_col(repoPSC,sqlPSC,"RnD_BudgetActivity")

repoPSC<-update_col(repoPSC,sqlPSC,"IsPossibleSoftwareEngineering")

summary(factor(sqlPSC$ProductOrServiceCode[sqlPSC$IsPossibleSoftwareEngineering==1]))
summary(factor(repoPSC$ProductOrServiceCode[repoPSC$IsPossibleSoftwareEngineering==1]))
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

ProductOrServiceCode.PSCAtransition
sqlPSCA<-dbReadTable(con,  name = SQL('"ProductOrServiceCode"."PSCAtransition"'))
write_csv(sqlPSC,file = file.path("productorservice","PSCAtransition.csv"))