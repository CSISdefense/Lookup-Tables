#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


#******Importing into Errorlogging.FPDSviolatesConstraint Beta
#Creating Stage 2 database from Stage 1 database and Final Destination
#No Need to rerun this, but good to have the code for the future


Stage1TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesType.Table.sql",
                                          dir="SQL")
Stage1TableType.df<-translate_name(Stage1TableType.df)



Stage2TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesConstraint.Table.sql",
                                          dir="SQL")
translate_name(Stage2TableType.df,test_only = TRUE)


debug(read_create_table)
FinalTableType.df<-read_create_table("Contract.FPDS.Table.sql",
                                     dir="SQL")
translate_name(FinalTableType.df,test_only=TRUE)
  
  
  read_create_table("Contract_FPDS.txt")
NewConstraintTableType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,FinalTableType.df,
                                                             drop_unmatched=FALSE)


#Create a list of variables to be copied into a query to create the stage 2 database.
Create_Constraint_List<-paste(NewConstraintTableType.df$CSISvariableName,
                              NewConstraintTableType.df$CSISvariableType,
                              NewConstraintTableType.df$CSISnullable,",")
write(Create_Constraint_List,
      file="ImportAids\\Starter_ErrorLogging_FPDSbetaViolatesConstraint.txt")

Create_Foreign_Key_Assignments<-create_foreign_key_assigments("ErrorLogging","FPDSbetaViolatesConstraint")
write(Create_Foreign_Key_Assignments,
      file="ImportAids\\FPDS_foreign_key_assignments.txt")


MergeType.df<-merge_source_and_csis_name_tables(OriginTableType.df,DestTableType.df)


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

#******Importing into Contract.FPDS 
#Match up Errorlogging.FPDSviolatesConstraint to Contract.FPDS 
DestTableConstraint.df<-read_create_table("Contract_FPDS.txt")
OriginTableConstraint.df<-read_create_table("ErrorLogging_FPDSbetaviolatesConstraint.txt")
OriginTableConstraint.df<-translate_name(OriginTableConstraint.df)
MergeConstraint.df<-merge_source_and_csis_name_tables(OriginTableConstraint.df,DestTableConstraint.df)

count_list<-count_empties(OriginTableConstraint.df,"ErrorLogging","FPDSbetaviolatesConstraint")
write(count_list,"ImportAids//count_list.txt")


#Transfer from Errorlogging.FPDSviolatesConstraint to Contract.FPDS
ConstTable.df<-translate_name(OriginTableConstraint.df)
MergeConst<-merge_source_and_csis_name_tables(ConstTable.df,DestTableConstraint.df)

if(nrow(MergeConst[is.na(MergeConst$CSISvariableType)&is.na(MergeConst$IsDroppedNameField),])>1){
  write.csv(MergeConst[is.na(MergeConst$CSISvariableType)&is.na(MergeConst$IsDroppedNameField),],
            file="ImportAids/Unmatched_NameConversion.csv")
  stop("Update ImportAides/NameList.csv using ImportAids/Unmatched_NameConversion.csv")
}
InsertList<-create_insert(MergeConst,
                         "ErrorLogging",
                         "FPDSbetaviolatesConstraint",
                         "Contract",
                         "FPDS",
                         DateType=120)
write(InsertList,"ImportAids/Insert2.txt")
update_list<-create_update_FPDS(MergeConst,
  "ErrorLogging",
  "FPDSviolatesConstraint",
  "Contract",
  "FPDS",
  DateType=101)
write(update_list,"ImportAids/update_list.txt")

