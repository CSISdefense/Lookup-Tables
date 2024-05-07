#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


###### From Stage 2 to Contract.FPDS #########
#Match up Errorlogging.FPDSdelta to Contract.FPDS 
Import.df<-read_create_table("ErrorLogging.FPDSdelta.Table.sql",
                                      dir="SQL")
# write.csv(Import.df,file="Import.csv")
Import.df<-translate_name(Import.df,file="USAspendingNameMirror.csv",
                          DestVariableNamefile="USAspendingVariableName.csv")

DestinationTable.df<-read_create_table("Contract.FPDS",
                                       dir="SQL")



translate_name(DestinationTable.df,test_only=TRUE)

MergeDestination.df<-merge_source_and_csis_name_tables(Import.df,DestinationTable.df)

#Check for size mismatch
# View(MergeStage2.df %>% filter(SourceVariableType!=CSISvariableType))
# MergeStage2.df %>% filter(substr(MergeStage2.df$SourceVariableType,2,6)=="nv")

#Try converts shouldn't be necessary unless there's been a change in contract.fpds
#That said, the differences in date format mean some will be generated.

#First the sellect files
TryConvertList<-create_try_converts(MergeDestination.df,"Errorlogging","FPDSdelta"
                                    ,IncludeAlters=FALSE
                                    ,Apply_Drop = FALSE
                                    ,IncludeSingle = FALSE
                                    ,IncludeMultiple = TRUE)
if(!is.null(TryConvertList))
  write(TryConvertList,"Output\\FPDSdeltaTryConvertList.txt")
#Then the alters.
TryConvertList<-create_try_converts(MergeDestination.df,"Errorlogging","FPDSdelta"
                                    ,IncludeAlters=TRUE
                                    ,IncludeSingle = FALSE
                                    ,IncludeMultiple = FALSE
                                    ,Apply_Drop = TRUE
                                    )
if(!is.null(TryConvertList))
  write(TryConvertList,"Output\\FPDSdeltaAlterColumnList.txt")
# write_delim(MergeDestination.df %>% select(SourceVariableName,SourceVariableType,CSISvariableType)%>%
#         mutate(SourceVariableType=ifelse(!is.na(CSISvariableType),CSISvariableType,SourceVariableType),
#                comma=",") %>%
#         select(-CSISvariableType),"Output\\FPDSdeltaCreateTable.txt",delim = " ")
#Create Foreign Key Assignments
# undebug(get_CSISvariableNameToPrimaryKey)
# debug(create_foreign_key_assigments)
# Skip list for select


# InsertList<-create_insert(MergeDestination.df,
#                           "ErrorLogging",
#                           "FPDSdelta2",
#                           "ErrorLogging",
#                           "FPDSdelta",
#                           DateType=23,
#                           FPDS=TRUE,
#                           Apply_Drop=FALSE)
# write(InsertList,"Output/ErrorLogging_FPDSdelta_insert_destination.txt")

skip_list<-c("[unique_award_key]",
             "[CSIStransactionID]",
             "[legal_entity_country_code]",#Handled via chain insert manually written
             "[awardee_or_recipient_uei]",
             "[ultimate_parent_uei]",
             
             "[recipient_country_code]",
             "[recipient_country_name]",
             "[awardee_or_recipient_legal]",
             "[vendor_doing_as_business_n]",
             
             ) #Handled via chain insert manually written

# debug(create_foreign_key_assigments)
select_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                        "FPDSdelta",
                                        "Contract",
                                        "FPDS",
                                        dir="sql",
                              suppress_alter = TRUE,
                              suppress_insert = TRUE,
                              skip_list = skip_list,
                              file="NameConversion.csv") 
write(select_missing_code,
      file=file.path("Output","ErrorLogging_FPDSdelta_select_foreign_key.txt"), 
      append=FALSE)  

skip_list<-c("[unique_award_key]",
             "[CSIStransactionID]",
             "[legal_entity_country_code]",#Handled via chain insert manually written
             "[awardee_or_recipient_uei]",
             "[ultimate_parent_uei]",
             "[recipient_country_name]",
             "") 
# debug(convert_field_to_foreign_key)
input_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                                     "FPDSdelta",
                                                    "Contract",
                                                    "FPDS",
                                                     dir="sql",
                                                     suppress_select = TRUE,
                                                    suppress_alter = TRUE,
                                                    suppress_update= TRUE,
                                                    skip_list = skip_list,
                                                    file="FPDSdeltaNameConversion.csv"
                                                    )
write(input_missing_code,
      file=file.path("Output","ErrorLogging_FPDSdelta_input_foreign_key.txt"),  
      append=FALSE) 


  



#Create the code to count empty rows by variable.
count_list<-count_empties(Import.df,"ErrorLogging","FPDSdelta")
write(count_list,"Output//ErrorLogging_FPDSdelta_count_empties.txt")


#Transfer from Errorlogging.FPDSdelta to Contract.FPDS
if(nrow(MergeDestination.df[is.na(MergeDestination.df$CSISvariableType)&is.na(MergeDestination.df$IsDroppedNameField),])>1){
  write.csv(MergeDestination.df[is.na(MergeDestination.df$CSISvariableType)&is.na(MergeDestination.df$IsDroppedNameField),],
            file="Output/Unmatched_NameConversion.csv")
  stop("Update ImportAids/NameList.csv using Output/Unmatched_NameConversion.csv")
}
DroppedField<-MergeDestination.df %>% filter(IsDroppedNameField)
fklist<-read.csv("ImportAids//ErrorLogging_ForeignKeyList.csv") %>% 
  filter(FKSchema=="Contract" & FKTableName=="FPDS")
DroppedField$Pair<-gsub("[\\],\\[]","",DroppedField$Pair,perl=T) #https://stackoverflow.com/questions/32041265/how-to-escape-closed-bracket-in-regex-in-r
DroppedFieldFK<-left_join(DroppedField,fklist,by=c("Pair"="FKColumnName")) %>%filter(is.na(ConstraintName))
DroppedFieldFK<-DroppedFieldFK  %>% filter(!SourceVariableName %in% c("[USAspending_file_name]"))
#Drop bit fields now being checked for in Select
DroppedFieldFK<-DroppedFieldFK  %>% filter(!Pair %in% c("a76action", "clingercohenact", "multiyearcontract", "purchasecardaspaymentmethod"))
#CSISstage2id is just for internal checks
DroppedFieldFK<-DroppedFieldFK  %>% filter(SourceVariableType != "[int] IDENTITY(1,1)")
if(nrow(DroppedFieldFK>1)){
  write.csv(DroppedFieldFK,
            file="Output/NameConversion_Missing_ForeignKey.csv")
  stop("Missing a foreign key assignment for a code / dropped name field combination")
}
rm(DroppedField,DroppedFieldFK,fklist)

#Most are misaligned names 
#a76action, clingercohenact, multiyearcontract, purchasecardaspaymentmethod are bits


MergeDestination.df$IsDroppedNameField[is.na(MergeDestination.df$IsDroppedNameField)]<-FALSE

#Remove CSISstage2ID, it's entirely for internal purposes
MergeDestination.df<-MergeDestination.df %>% filter(!SourceVariableName %in% c("[CSISstage2id]","[USAspending_file_name]"))
#Check that all dropped fields correspond with a preserved field
pair_kept<-left_join(MergeDestination.df %>% filter(IsDroppedNameField==TRUE)%>% select(SourceVariableName,Pair),
          MergeDestination.df %>% filter(IsDroppedNameField==FALSE) %>% select(SourceVariableName,IsDroppedNameField),
          by=c("Pair"="SourceVariableName"))

if(any(is.na(pair_kept$IsDroppedNameField))){
  stop(paste("We drop name field(s) that does not have a corresponding kept code field:\n",
             paste(pair_kept$SourceVariableName[is.na(pair_kept$IsDroppedNameField)],collapse=", ")))
}
rm(pair_kept)



InsertList<-create_insert(MergeDestination.df,
                         "ErrorLogging",
                         "FPDSdelta",
                         "Contract",
                         "FPDS",
                         DateType=120,
                         FPDS=TRUE)
write(InsertList,"Output/ErrorLogging_FPDSdelta_insert_destination.txt")


#Create Compare Values (double checking that column matches are good)
colnames(MergeDestination.df)
MergeDestination.df %>% filter(SourceVariableType!=CSISvariableType)

compare_list<-create_compare_cols(MergeDestination.df,
                                "ErrorLogging",
                                "FPDSdelta",
                                "Contract",
                                "FPDS",
                                source_primary_key="detached_award_proc_unique",
                                target_primary_key="contract_transaction_unique_key",
                                drop_unmatched=TRUE)
write(compare_list,"Output/ErrorLogging_FPDSdelta_compare_destination.txt")


#Create Updates
update_list<-create_update_FPDS(MergeDestination.df,
  "ErrorLogging",
  "FPDSdelta",
  "Contract",
  "FPDS",
  DateType=101,
  drop_name=TRUE)
write(update_list,"Output/ErrorLogging_FPDSdelta_update_destination.txt")
MergeDestination.df %>% filter(substr(CSISvariableType,2,3) %in% c("NV","nv")) %>% select(SourceVariableName)
substr(MergeDestination.df$CSISvariableType,2,3)
###### From Stage 2 to Contract.FPDS #########
#Match up Errorlogging.FPDSdelta to Contract.FPDS 
Import.df<-read_create_table("ErrorLogging.FPDSdelta.Table.sql",
                                      dir="SQL")
Import.df<-translate_name(Import.df)

DupTable.df<-read_create_table("ErrorLogging.FPDSdeleted.Table.sql",
                                       dir="SQL")
translate_name(DupTable.df,test_only=TRUE)
MergeDestination.df<-merge_source_and_csis_name_tables(Import.df,DupTable.df)
