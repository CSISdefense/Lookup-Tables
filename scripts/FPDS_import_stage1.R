#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


###### Align the Stage 1 and subsequent tables #####
#Creating Stage 2 database from Stage 1 database and Final Destination
#This adds value when new columns have been added to the source tables
#Code is not included to help add columns to stage 1

Stage1TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesType.Table.sql",
                                      dir="SQL")
Stage1TableType.df<-translate_name(Stage1TableType.df)


DestinationTable.df<-read_create_table("Contract.FPDS.Table.sql",
                                       dir="SQL")
translate_name(DestinationTable.df,test_only=TRUE)

NewConstraintTableType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,DestinationTable.df,
                                                             drop_unmatched=FALSE
)

#Create a list of variables to be copied into a query to create the stage 2 database.
#This already exists Errorlogging.ErrorLogging_FPDSbetaViolatesConstraint
#We should probably convert this to check for any existing misisng columns and then 
#to add them.
Create_Constraint_List<-paste(NewConstraintTableType.df$CSISvariableName,
                              NewConstraintTableType.df$CSISvariableType,
                              NewConstraintTableType.df$CSISnullable,",")

if(!file.exists("sql\\ErrorLogging.FPDSbetaViolatesConstraint.table.sql")){
  write(Create_Constraint_List,
        file="Output\\Starter_ErrorLogging_FPDSbetaViolatesConstraint.txt")
  write(create_csis_dates("ErrorLogging","FPDSbetaViolatesConstraint"),"Output//CSISdates.txt")
} else{
  warning("Should be doing new column processing here")
  Stage2TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesConstraint.Table.sql",
                                        dir="SQL")
}

rm(NewConstraintTableType.df)
