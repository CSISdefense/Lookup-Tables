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


ignore_cols<-c("[IsDuplicateUTI]","[Transaction_Number_bigint]","[last_modified_date_datetime2]")

##### From Stage 1 to Destination, Creating Try Converts ####### 
MergeType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,DestinationTable.df)

# At some point, add checking for varchar(255) or missing from Contract.FPDS
missing_column<-MergeType.df %>% filter(
  (is.na(IsDroppedNameField) | IsDroppedNameField==FALSE) &
    (is.na(CSISvariableType )| is.null(CSISvariableType))&
    !SourceVariableName %in% ignore_cols)

if(nrow(missing_column)>0){
  print(missing_column[,c("SourceVariableName","SourceVariableType")])
  
  len_check<-paste("SELECT \n",
    paste("max(len(",missing_column$SourceVariableName,")) as ",missing_column$SourceVariableName,collapse=",\n"),
    "\nFROM ErrorLogging.FPDSbetaViolatesType",sep=""
    )
  write(file=file.path("Output","FPDSbetaViolatesType_new_column_max_length.txt"),len_check)
  
  stop("Columns need to be added to the destination database")
  # stop("Columns need to be added to the destination database")
} else{
  #Create Try Convert
  
  TryConvertList<-create_try_converts(MergeType.df,"Errorlogging","FPDSviolatesType",
                                      IncludeAlters=FALSE,
                                      Add_Colon_Split=TRUE)
  write(TryConvertList,"Output\\FPDStryConvertList.txt")
  
  
  
  #Transfer from Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
  InsertList<-create_insert(MergeType.df,
                            "ErrorLogging",
                            "FPDSviolatesType",
                            "ErrorLogging",
                            "FPDSviolatesConstraint",
                            DateType=120,
                            allow_missing=FALSE) #This should be redundant with the missing check above
  write(InsertList,"Output\\FPDS_Insert_from_Stage1_to_Stage2.txt")
}






##### From Stage 1 to Stage 2 ####### 
if(!file.exists("sql\\ErrorLogging.FPDSbetaViolatesConstraint.table.sql")){
  write(Create_Constraint_List,
        file="Output\\Starter_ErrorLogging_FPDSbetaViolatesConstraint.txt")
  write(create_csis_dates("ErrorLogging","FPDSbetaViolatesConstraint"),"Output//CSISdates.txt")
} else{
  warning("Should be doing new column processing here")
  
  ##### From Stage 1 to Stage 2 ####### 
  Stage2TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesConstraint.Table.sql",
                                        dir="SQL")
  
  MergeType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,Stage2TableType.df)
  
  missing_column<-MergeType.df %>% filter(
    (is.na(CSISvariableType )| is.null(CSISvariableType)))
  
  
}

rm(NewConstraintTableType.df)