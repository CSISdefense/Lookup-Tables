
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
newcolsPSC<-sqlPSC[,c(newcols,"ProductOrServiceCode")]
repoPSC<-left_join(repoPSC, newcolsPSC)

update_col<-function(repo,sql,colname){
  order<-colnames(repo)
  sql<-sql[,c(colname,"ProductOrServiceCode")]
  repo<-repo[,colnames(repo)!=colname]
  repo<-left_join(repo,sql)
  repo[,order]
}

code<-c('R413','R302','R415','R617')
repoPSC$ProductOrServiceArea[repoPSC$ProductOrServiceCode %in% code]<-'ICT'
repoPSC$ServicesCategory[repoPSC$ProductOrServiceCode  %in% code]<-'ICT'
repoPSC$ProductsCategory[repoPSC$ProductOrServiceCode  %in% code]<-'Services or R&D'
repoPSC$ProductServiceOrRnDarea[repoPSC$ProductOrServiceCode  %in% code]<-'ICT'
repoPSC$PlatformPortfolio[repoPSC$ProductOrServiceCode  %in%  code]<-'Electronics, Comms, & Sensors'


repoPSC<-update_col(repoPSC,sqlPSC,"IsPossibleSoftwareEngineering")

summary(factor(sqlPSC$ProductOrServiceCode[sqlPSC$IsPossibleSoftwareEngineering==1]))
summary(factor(repoPSC$ProductOrServiceCode[repoPSC$IsPossibleSoftwareEngineering==1]))
write_csv(repoPSC,file = "ProductOrServiceCodes.csv", na="NULL")

# write_csv(sqlPSC,file = "ProductOrServiceCodes.csv")