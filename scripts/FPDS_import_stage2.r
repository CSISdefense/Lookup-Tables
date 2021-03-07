#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)

###### From Stage 2 to Contract.FPDS #########
#Match up Errorlogging.FPDSstage2 to Contract.FPDS 
Stage2TableType.df<-read_create_table("ErrorLogging.FPDSstage2.Table.sql",
                                      dir="SQL")
Stage2TableType.df<-translate_name(Stage2TableType.df)

DestinationTable.df<-read_create_table("Contract.FPDS.Table.sql",
                                       dir="SQL")
translate_name(DestinationTable.df,test_only=TRUE)

MergeStage2.df<-merge_source_and_csis_name_tables(Stage2TableType.df,DestinationTable.df)

#Try converts shouldn't be necessary unless there's been a change in contract.fpds
#That said, the differences in date format mean some will be generated.
TryConvertList<-create_try_converts(MergeStage2.df,"Errorlogging","FPDSstage2"
                                    ,IncludeAlters=TRUE)
write(TryConvertList,"Output\\Stage2TryConvertList.txt")

#Create Foreign Key Assignments
# undebug(get_CSISvariableNameToPrimaryKey)
# debug(create_foreign_key_assigments)
skip_list<-c("[contract_award_unique_key]",
             "[CSIStransactionID]",
             "[vendorcountrycode]") #Handled via chain insert manually written

select_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                        "FPDSstage2",
                                        dir="sql",
                              suppress_alter = TRUE,
                              suppress_insert = TRUE,
                              skip_list = skip_list) 
write(select_missing_code,
      file=file.path("Output","ErrorLogging_FPDSstage2_select_foreign_key.txt"), 
      append=FALSE)  


input_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                                     "FPDSstage2",
                                                     dir="sql",
                                                     suppress_select = TRUE,
                                                    suppress_alter = TRUE,
                                                    skip_list = skip_list)
write(input_missing_code,
      file=file.path("Output","ErrorLogging_FPDSstage2_input_foreign_key.txt"),  
      append=FALSE) 






#Create the code to count empty rows by variable.
count_list<-count_empties(Stage2TableType.df,"ErrorLogging","FPDSstage2")
write(count_list,"Output//ErrorLogging_FPDSstage2_count_empties.txt")




#Transfer from Errorlogging.FPDSstage2 to Contract.FPDS
if(nrow(MergeStage2.df[is.na(MergeStage2.df$CSISvariableType)&is.na(MergeStage2.df$IsDroppedNameField),])>1){
  write.csv(MergeStage2.df[is.na(MergeStage2.df$CSISvariableType)&is.na(MergeStage2.df$IsDroppedNameField),],
            file="Output/Unmatched_NameConversion.csv")
  stop("Update ImportAides/NameList.csv using Output/Unmatched_NameConversion.csv")
}
MergeStage2.df$IsDroppedNameField[is.na(MergeStage2.df$IsDroppedNameField)]<-FALSE

#Remove CSISstage2ID, it's entirely for internal purposes
MergeStage2.df<-MergeStage2.df %>% filter(SourceVariableName!="[CSISstage2id]")
#Check that all dropped fields correspond with a preserved field
pair_kept<-left_join(MergeStage2.df %>% filter(IsDroppedNameField==TRUE)%>% select(SourceVariableName,Pair),
          MergeStage2.df %>% filter(IsDroppedNameField==FALSE) %>% select(SourceVariableName,IsDroppedNameField),
          by=c("Pair"="SourceVariableName"))

if(any(is.na(pair_kept$IsDroppedNameField))){
  stop(paste("We drop name field(s) that does not have a corresponding kept code field:\n",
             paste(pair_kept$SourceVariableName[is.na(pair_kept$IsDroppedNameField)],collapse=", ")))
}
rm(pair_kept)



InsertList<-create_insert(MergeStage2.df,
                         "ErrorLogging",
                         "FPDSstage2",
                         "Contract",
                         "FPDS",
                         DateType=120,
                         FPDS=TRUE)
write(InsertList,"Output/ErrorLogging_FPDSstage2_insert_destination.txt")

#Create Updates
update_list<-create_update_FPDS(MergeStage2.df,
  "ErrorLogging",
  "FPDSstage2",
  "Contract",
  "FPDS",
  DateType=101,
  drop_name=TRUE)
write(update_list,"Output/ErrorLogging_FPDSstage2_update_destination.txt")