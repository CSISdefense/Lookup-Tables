#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)

###### From Stage 2 to Contract.FPDS #########
#Match up Contract.FPDS to Errorlogging.FPDSdeleted
Source.df<-read_create_table("Contract.FPDS.Table.sql",
                                      dir="SQL")
Source.df<-translate_name(Source.df)

DestinationTable.df<-read_create_table("Errorlogging.FPDSdeleted.Table.sql",
                                       dir="SQL")
translate_name(DestinationTable.df,test_only=TRUE)

MergeFPDSdel.df<-merge_source_and_csis_name_tables(Source.df,DestinationTable.df)

#Try converts shouldn't be necessary unless there's been a change in contract.fpds
#That said, the differences in date format mean some will be generated.
TryConvertList<-create_try_converts(MergeFPDSdel.df,"Errorlogging","FPDSdeleted"
                                    ,IncludeAlters=TRUE)
write(TryConvertList,"Output\\FPDSdelTryConvertList.txt")

#Create Foreign Key Assignments
# undebug(get_CSISvariableNameToPrimaryKey)
# debug(create_foreign_key_assigments)
skip_list<-c("[contract_award_unique_key]",
             "[CSIStransactionID]",
             "[vendorcountrycode]") #Handled via chain insert manually written

select_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                        "FPDSdeleted",
                                        dir="sql",
                              suppress_alter = TRUE,
                              suppress_insert = TRUE,
                              skip_list = skip_list) 
write(select_missing_code,
      file=file.path("Output","ErrorLogging_FPDSdeleted_select_foreign_key.txt"), 
      append=FALSE)  


input_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                                     "FPDSdeleted",
                                                     dir="sql",
                                                     suppress_select = TRUE,
                                                    suppress_alter = TRUE,
                                                    skip_list = skip_list)
write(input_missing_code,
      file=file.path("Output","ErrorLogging_FPDSdeleted_input_foreign_key.txt"),  
      append=FALSE) 






#Create the code to count empty rows by variable.
count_list<-count_empties(Source.df,"ErrorLogging","FPDSdeleted")
write(count_list,"Output//ErrorLogging_FPDSdeleted_count_empties.txt")




#Transfer fromContract.FPDS to Errorlogging.FPDSdeleted
if(nrow(MergeFPDSdel.df[is.na(MergeFPDSdel.df$CSISvariableType)&is.na(MergeFPDSdel.df$IsDroppedNameField),])>1){
  write.csv(MergeFPDSdel.df[is.na(MergeFPDSdel.df$CSISvariableType)&is.na(MergeFPDSdel.df$IsDroppedNameField),],
            file="Output/Unmatched_NameConversion.csv")
  stop("Update ImportAides/NameList.csv using Output/Unmatched_NameConversion.csv")
}
MergeFPDSdel.df$IsDroppedNameField[is.na(MergeFPDSdel.df$IsDroppedNameField)]<-FALSE

# #Remo_updat's entirely for internal purposes
# MergeStage2.df<-MergeStage2.df %>% filter(SourceVariableName!="[CSISstage2id]")
# #Check that all dropped fields correspond with a preserved field
# pair_kept<-left_join(MergeStage2.df %>% filter(IsDroppedNameField==TRUE)%>% select(SourceVariableName,Pair),
#           MergeStage2.df %>% filter(IsDroppedNameField==FALSE) %>% select(SourceVariableName,IsDroppedNameField),
#           by=c("Pair"="SourceVariableName"))

if(any(is.na(pair_kept$IsDroppedNameField))){
  stop(paste("We drop name field(s) that does not have a corresponding kept code field:\n",
             paste(pair_kept$SourceVariableName[is.na(pair_kept$IsDroppedNameField)],collapse=", ")))
}
rm(pair_kept)



InsertList<-create_insert(MergeFPDSdel.df,
                         "ErrorLogging",
                         "FPDSdeleted",
                         "Contract",
                         "FPDS",
                         DateType=120,
                         FPDS=TRUE)
write(InsertList,"Output/ErrorLogging_FPDSdeleted_insert_destination.txt")

#Create Updates
update_list<-create_update_FPDS(MergeFPDSdel.df,
  "Contract",
  "FPDS",
  "ErrorLogging",
  "FPDSdeleted",
  DateType=101,
  drop_name=TRUE)
write(update_list,"Output/ErrorLogging_FPDSdeleted_update_destination.txt")
