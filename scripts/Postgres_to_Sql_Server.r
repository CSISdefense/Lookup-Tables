#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


###### From Stage 2 to Contract.FPDS #########
#Match up Errorlogging.source_procurement_transaction to Contract.FPDS 
Import.df<-read_create_table("ErrorLogging.source_procurement_transaction.Table.sql",
                                      dir="SQL")
Import.df<-translate_name(Import.df,file="PostgresNameConversion.csv")

Stage2Table.df<-read_create_table("ErrorLogging.source_procurement_transaction.Table.sql",
                                       dir="SQL")


DestinationTable.df<-read_create_table("Contract.FPDS.Table.sql",
                                       dir="SQL")


translate_name(DestinationTable.df,test_only=TRUE)

MergeDestination.df<-merge_source_and_csis_name_tables(Import.df,DestinationTable.df)
MergeStage2.df<-merge_source_and_csis_name_tables(Import.df,Stage2Table.df)

#Check for size mismatch
# View(MergeStage2.df %>% filter(SourceVariableType!=CSISvariableType))
# MergeStage2.df %>% filter(substr(MergeStage2.df$SourceVariableType,2,6)=="nv")

#Try converts shouldn't be necessary unless there's been a change in contract.fpds
#That said, the differences in date format mean some will be generated.


TryConvertList<-create_try_converts(MergeStage2.df,"Errorlogging","source_procurement_transaction"
                                    ,IncludeAlters=TRUE,
                                    Apply_Drop = FALSE,
                                    IncludeSingle = FALSE)
TryConvertList<-create_try_converts(MergeStage2.df,"Errorlogging","source_procurement_transaction"
                                    ,IncludeAlters=TRUE
                                    ,IncludeSingle = FALSE
                                    ,IncludeMultiple = FALSE
                                    ,Apply_Drop = FALSE
                                    )
write(TryConvertList,"Output\\PostgresTryConvertList.txt")
write_delim(MergeStage2.df %>% select(SourceVariableName,SourceVariableType,CSISvariableType)%>%
        mutate(SourceVariableType=ifelse(!is.na(CSISvariableType),CSISvariableType,SourceVariableType),
               comma=",") %>%
        select(-CSISvariableType),"Output\\PostgresCreateTable.txt",delim = " ")
#Create Foreign Key Assignments
# undebug(get_CSISvariableNameToPrimaryKey)
# debug(create_foreign_key_assigments)
# Skip list for select
skip_list<-c("[unique_award_key]",
             "[CSIStransactionID]",
             "[legal_entity_country_code]",#Handled via chain insert manually written
             "[awardee_or_recipient_uei]",
             "[ultimate_parent_uei]",
             "[recipient_country_name]",
             "[awardee_or_recipient_legal]",
             "[vendor_doing_as_business_n]"
             ) #Handled via chain insert manually written

# debug(get_CSISvariableNameToPrimaryKey)
select_missing_code <- create_foreign_key_assigments("ErrorLogging",
                                        "source_procurement_transaction",
                                        "Contract",
                                        "FPDS",
                                        dir="sql",
                              suppress_alter = TRUE,
                              suppress_insert = TRUE,
                              skip_list = skip_list,
                              file="PostgresNameConversion.csv") 
write(select_missing_code,
      file=file.path("Output","ErrorLogging_source_procurement_transaction_select_foreign_key.txt"), 
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
                                                     "source_procurement_transaction",
                                                    "Contract",
                                                    "FPDS",
                                                     dir="sql",
                                                     suppress_select = TRUE,
                                                    suppress_alter = TRUE,
                                                    suppress_update= TRUE,
                                                    skip_list = skip_list,
                                                    file="PostgresNameConversion.csv"
                                                    )
write(input_missing_code,
      file=file.path("Output","ErrorLogging_source_procurement_transaction_input_foreign_key.txt"),  
      append=FALSE) 






#Create the code to count empty rows by variable.
count_list<-count_empties(Import.df,"ErrorLogging","source_procurement_transaction")
write(count_list,"Output//ErrorLogging_source_procurement_transaction_count_empties.txt")


#Transfer from Errorlogging.source_procurement_transaction to Contract.FPDS
if(nrow(MergeStage2.df[is.na(MergeStage2.df$CSISvariableType)&is.na(MergeStage2.df$IsDroppedNameField),])>1){
  write.csv(MergeStage2.df[is.na(MergeStage2.df$CSISvariableType)&is.na(MergeStage2.df$IsDroppedNameField),],
            file="Output/Unmatched_NameConversion.csv")
  stop("Update ImportAids/NameList.csv using Output/Unmatched_NameConversion.csv")
}
DroppedField<-MergeStage2.df %>% filter(IsDroppedNameField)
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


MergeStage2.df$IsDroppedNameField[is.na(MergeStage2.df$IsDroppedNameField)]<-FALSE

#Remove CSISstage2ID, it's entirely for internal purposes
MergeStage2.df<-MergeStage2.df %>% filter(!SourceVariableName %in% c("[CSISstage2id]","[USAspending_file_name]"))
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
                         "source_procurement_transaction",
                         "Contract",
                         "FPDS",
                         DateType=120,
                         FPDS=TRUE)
write(InsertList,"Output/ErrorLogging_source_procurement_transaction_insert_destination.txt")

#Create Updates
update_list<-create_update_FPDS(MergeStage2.df,
  "ErrorLogging",
  "source_procurement_transaction",
  "Contract",
  "FPDS",
  DateType=101,
  drop_name=TRUE)
write(update_list,"Output/ErrorLogging_source_procurement_transaction_update_destination.txt")
MergeStage2.df %>% filter(substr(CSISvariableType,2,3) %in% c("NV","nv")) %>% select(SourceVariableName)
substr(MergeStage2.df$CSISvariableType,2,3)
###### From Stage 2 to Contract.FPDS #########
#Match up Errorlogging.source_procurement_transaction to Contract.FPDS 
Import.df<-read_create_table("ErrorLogging.source_procurement_transaction.Table.sql",
                                      dir="SQL")
Import.df<-translate_name(Import.df)

DupTable.df<-read_create_table("ErrorLogging.FPDSdeleted.Table.sql",
                                       dir="SQL")
translate_name(DupTable.df,test_only=TRUE)
MergeStage2.df<-merge_source_and_csis_name_tables(Import.df,DupTable.df)
