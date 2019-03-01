#Setup
source("SQLimportTools.r")
library(tidyverse)

#Importing from ErrorLogging_GSAprimeStage1 to ErrorLogging_GSAprimeStage1
Stage1<-read_create_table("ErrorLogging_GSAprimeStage1.txt")

rm(OriginStage1)
#Importing from ErrorLogging_GSAsubStage1 to ErrorLogging_GSAsubStage1


#Match up Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint





OriginTableType.df<-read_create_table("ErrorLogging_FPDSviolatesType.txt")
DestTableType.df<-read_create_table("ErrorLogging_FPDSviolatesConstraint.txt")
OriginTableType.df<-translate_name(OriginTableType.df)
MergeType.df<-merge_source_and_csis_name_tables(OriginTableType.df,DestTableType.df)


#Join up the files
MergeType.df$column<-MergeType.df$SourceVariableName
MergeType.df$column<-substring(MergeType.df$column,2,nchar(MergeType.df$column)-1)


#Create Try Convert
# undebug(create_try_converts)
TryConvertList<-create_try_converts(MergeType.df,"Errorlogging","FPDSviolatesType"
  ,IncludeAlters=FALSE)
write(TryConvertList,"FPDStryConvertList.txt")

#Transfer from Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
InsertList<-create_insert(MergeType.df,
  "ErrorLogging",
  "FPDSviolatesType",
  "ErrorLogging",
  "FPDSviolatesConstraint",
  DateType=120)
write(InsertList,"Insert.txt")
write(create_csis_dates("Contract","FPDS"),"CSISdates.txt")

#******Importing into Errorlogging.FPDSviolatesConstraint Beta
#Creating Errorlogging.FPDSbetaviolatesConstraint from Errorlogging.FPDSbetaviolatesType and Contract.FPDS
#No Need to rerun this, but good to have the code for the future
OriginBetaTableType.df<-read_create_table("ErrorLogging_FPDSbetaViolatesType.txt")
OriginBetaTableType.df<-translate_name(OriginBetaTableType.df)
FinalTableType.df<-read_create_table("Contract_FPDS.txt")
NewConstraintTableType.df<-merge_source_and_csis_name_tables(OriginBetaTableType.df,FinalTableType.df,
  drop_unmatched=FALSE)
Create_Constraint_List<-paste(NewConstraintTableType.df$CSISvariableName,
  NewConstraintTableType.df$CSISvariableType,
  NewConstraintTableType.df$CSISnullable,",")
write(Create_Constraint_List,
  file="ImportAids\\Starter_ErrorLogging_FPDSbetaViolatesConstraint.txt")

debug(create_foreign_key_assigments)
create_foreign_key_assigments("ErrorLogging","FPDSbetaViolatesConstraint")
#Match up Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
OriginTableType.df<-read_create_table("ErrorLogging_FPDSbetaViolatesType.txt")
DestTableType.df<-read_create_table("ErrorLogging_FPDSbetaViolatesConstraint.txt")
OriginTableType.df<-translate_name(OriginTableType.df)
MergeType.df<-merge_source_and_csis_name_tables(OriginTableType.df,DestTableType.df)


#Manual fixes
#[small_business_competitiveness_demonstration _program]
#[historically_underutilized_business_zone _hubzone_firm]


  #Join up the files
MergeType.df$column<-MergeType.df$SourceVariableName
MergeType.df$column<-substring(MergeType.df$column,2,nchar(MergeType.df$column)-1)
  

#Create Try Convert
# undebug(create_try_converts)
TryConvertList<-create_try_converts(MergeType.df,"Errorlogging","FPDSbetaViolatesType"
                                    ,IncludeAlters=FALSE)
write(TryConvertList,"FPDSbetatryConvertList.txt")

#Transfer from Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
InsertList<-create_insert(MergeType.df,
             "ErrorLogging",
             "FPDSbetaViolatesType",
             "ErrorLogging",
             "FPDSbetaViolatesConstraint",
             DateType=101)
write(InsertList,"BetaInsert.txt")
write(create_csis_dates("Contract","FPDS"),"CSISdates.txt")

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

