#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)

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
write(TryConvertList,"Output\\Stage2TryConvertList.txt")

#Create Foreign Key Assignments

select_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                        "FPDSbetaViolatesConstraint",
                                        dir="sql",
                              suppress_alter = TRUE,
                              suppress_insert = TRUE)
write(select_missing_code,
      file=file.path("Output","ErrorLogging_FPDSbetaViolatesConstraint_select_foreign_key.txt"), 
      append=FALSE)  


input_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                                     "FPDSbetaViolatesConstraint",
                                                     dir="sql",
                                                     suppress_select = TRUE,
                                                    suppress_alter = TRUE)
write(input_missing_code,
      file=file.path("Output","ErrorLogging_FPDSbetaViolatesConstraint_input_foreign_key.txt"),  
      append=FALSE) 






#Create the code to count empty rows by variable.
count_list<-count_empties(Stage2TableType.df,"ErrorLogging","FPDSbetaviolatesConstraint")
write(count_list,"Output//count_list.txt")




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