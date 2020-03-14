#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


#******Importing into Errorlogging.FPDSviolatesConstraint Beta
#Creating Stage 2 database from Stage 1 database and Final Destination
#No Need to rerun this, but good to have the code for the future

Stage1TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesType.Table.sql",
                                          dir="SQL")
Stage1TableType.df<-translate_name(Stage1TableType.df)


DestinationTable.df<-read_create_table("Contract.FPDS.Table.sql",
                                     dir="SQL")
translate_name(DestinationTable.df,test_only=TRUE)

NewConstraintTableType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,DestinationTable.df,
                                                             drop_unmatched=FALSE)


#Create a list of variables to be copied into a query to create the stage 2 database.
Create_Constraint_List<-paste(NewConstraintTableType.df$CSISvariableName,
                              NewConstraintTableType.df$CSISvariableType,
                              NewConstraintTableType.df$CSISnullable,",")
write(Create_Constraint_List,
      file="ImportAids\\Starter_ErrorLogging_FPDSbetaViolatesConstraint.txt")

#ERROR 
Create_Foreign_Key_Assignments<-create_foreign_key_assigments("ErrorLogging","FPDSbetaViolatesConstraint")
write(Create_Foreign_Key_Assignments,
      file="ImportAids\\FPDS_foreign_key_assignments.txt")


MergeType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,DestinationTable.df)


#Join up the files
MergeType.df$column<-MergeType.df$SourceVariableName
MergeType.df$column<-substring(MergeType.df$column,2,nchar(MergeType.df$column)-1)


#Create Try Convert
# undebug(create_try_converts)
TryConvertList<-create_try_converts(MergeType.df,"Errorlogging","FPDSviolatesType"
  ,IncludeAlters=FALSE)
write(TryConvertList,"ImportAids\\FPDStryConvertList.txt")

#Transfer from Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
InsertList<-create_insert(MergeType.df,
  "ErrorLogging",
  "FPDSviolatesType",
  "ErrorLogging",
  "FPDSviolatesConstraint",
  DateType=120)
write(InsertList,"ImportAids\\Insert.txt")
write(create_csis_dates("Contract","FPDS"),"ImportAids//CSISdates.txt")

###### From Stage 2 to Contract.FPDS #########



#Match up Errorlogging.FPDSviolatesConstraint to Contract.FPDS 
Stage2TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesConstraint.Table.sql",
                                      dir="SQL")
Stage2TableType.df<-translate_name(Stage2TableType.df)
MergeStage2.df<-merge_source_and_csis_name_tables(Stage2TableType.df,DestinationTable.df)

#Try converts shouldn't be necesary unless there's been a change in contract.fpds
#That said, the differences in date format mean some will be generated.
TryConvertList<-create_try_converts(MergeStage2.df,"Errorlogging","FPDSbetaviolatesConstraint"
                                    ,IncludeAlters=TRUE)
write(TryConvertList,"ImportAids\\Stage2TryConvertList.txt")

#Create Foreign Key Assignments
undebug(create_foreign_key_assigments)
create_foreign_key_assigments("ErrorLogging",
                                        "FPDSbetaViolatesConstraint",
                                        dir="sql",
                              suppress_alter = TRUE)

#Create the code to count empty rows by variable.
count_list<-count_empties(Stage2TableType.df,"ErrorLogging","FPDSbetaviolatesConstraint")
write(count_list,"ImportAids//count_list.txt")




#Transfer from Errorlogging.FPDSviolatesConstraint to Contract.FPDS
if(nrow(MergeStage2.df[is.na(MergeStage2.df$CSISvariableType)&is.na(MergeStage2.df$IsDroppedNameField),])>1){
  write.csv(MergeStage2.df[is.na(MergeStage2.df$CSISvariableType)&is.na(MergeStage2.df$IsDroppedNameField),],
            file="ImportAids/Unmatched_NameConversion.csv")
  stop("Update ImportAides/NameList.csv using ImportAids/Unmatched_NameConversion.csv")
}
InsertList<-create_insert(MergeStage2.df,
                         "ErrorLogging",
                         "FPDSbetaviolatesConstraint",
                         "Contract",
                         "FPDS",
                         DateType=120)
write(InsertList,"ImportAids/Insert2.txt")

#Create Updates
update_list<-create_update_FPDS(MergeStage2.df,
  "ErrorLogging",
  "FPDSbetaviolatesConstraint",
  "Contract",
  "FPDS",
  DateType=101,
  drop_name=TRUE)
write(update_list,"ImportAids/update_list.txt")