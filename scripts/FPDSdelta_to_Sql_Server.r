#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


# Matching FPDSdelta to Contract.FPDS #########
#Match up ETL.FPDSdelta to Contract.FPDS 
Import.df<-read_create_table("ETL.FPDSdelta.Table.sql",
                                      dir="SQL")

Import.df<-translate_name(Import.df)#,#file="PostgresNameConversion.csv")#,file="USAspendingNameMirror.csv",
                          # DestVariableNamefile="USAspendingVariableName.csv")

# Import.df<-translate_name(Import.df,file="USAspendingNameMirror.csv",
#                           DestVariableNamefile="USAspendingVariableName.csv")
# write.csv(Import.df,file="Import.csv")
DestinationTable.df<-read_create_table("Contract.FPDS",
                                       dir="SQL")



translate_name(DestinationTable.df,test_only=TRUE)
# debug(merge_source_and_csis_name_tables)
MergeDestination.df<-merge_source_and_csis_name_tables(Import.df,DestinationTable.df)

#####1) Error Checking ####
#Transfer from ETL.FPDSdelta to Contract.FPDS
if(nrow(MergeDestination.df[is.na(MergeDestination.df$CSISvariableType)&is.na(MergeDestination.df$IsDroppedNameField),])>1){
  write.csv(MergeDestination.df[is.na(MergeDestination.df$CSISvariableType)&is.na(MergeDestination.df$IsDroppedNameField),],
            file="Output/Unmatched_NameConversion.csv",row.names = FALSE)
  stop("Update ImportAids/NameList.csv using Output/Unmatched_NameConversion.csv")
}
DroppedField<-MergeDestination.df %>% filter(IsDroppedNameField)
fklist<-read.csv("ImportAids//ETL_ForeignKeyList.csv") %>% 
  filter(FKSchema=="Contract" & FKTableName=="FPDS")
DroppedField$Pair<-gsub("[\\],\\[]","",DroppedField$Pair,perl=T) #https://stackoverflow.com/questions/32041265/how-to-escape-closed-bracket-in-regex-in-r
DroppedFieldFK<-left_join(DroppedField,fklist,by=c("Pair"="FKColumnName")) %>%filter(is.na(ConstraintName))
DroppedFieldFK<-DroppedFieldFK  %>% filter(!SourceVariableName %in% c("[USAspending_file_name]"))
#Drop bit fields now being checked for in Select
DroppedFieldFK<-DroppedFieldFK  %>% filter(!Pair %in% c("a76action", "clingercohenact", "multiyearcontract", "purchasecardaspaymentmethod"))
#correction_delete_ind is used for processing the delta file, we do not add it to contract.fpds
DroppedFieldFK<-DroppedFieldFK  %>% filter(!SourceVariableName %in% c("[correction_delete_ind]","[IsTransferred]","[temp_uei]"))
if(nrow(DroppedFieldFK>1)){
  write.csv(DroppedFieldFK,
            file="Output/NameConversion_Missing_ForeignKey.csv")
  stop("Missing a foreign key assignment for a code / dropped name field combination")
}
rm(DroppedField,DroppedFieldFK,fklist)

#Most are misaligned names 
#a76action, clingercohenact, multiyearcontract, purchasecardaspaymentmethod are bits


MergeDestination.df$IsDroppedNameField[is.na(MergeDestination.df$IsDroppedNameField)]<-FALSE

#Check that all dropped fields correspond with a preserved field

pair_kept<-left_join(MergeDestination.df %>% filter(IsDroppedNameField==TRUE)%>% select(SourceVariableName,SourcePairName),
                     MergeDestination.df %>% filter(IsDroppedNameField==FALSE) %>% select(SourceVariableName,IsDroppedNameField),
                     by=c("SourcePairName"="SourceVariableName"))
#Drop correction_delete_ind as it is unmatched but not kept
pair_kept<-pair_kept %>% filter(!SourceVariableName %in% c("[correction_delete_ind]","[USAspending_file_name]","[IsTransferred]","[temp_uei]"))

if(any(is.na(pair_kept$IsDroppedNameField))){
  write.csv(pair_kept %>% filter(is.na(IsDroppedNameField)),file="output//FPDS_delta_dropped_name_without_kept_pair.csv",row.names = FALSE)
  stop(paste("We drop name field(s) that does not have a corresponding kept code field:\n",
             paste(pair_kept$SourceVariableName[is.na(pair_kept$IsDroppedNameField)],collapse=", ")))
  
}
rm(pair_kept)


#Check for size mismatch
# View(MergeStage2.df %>% filter(SourceVariableType!=CSISvariableType))
# MergeStage2.df %>% filter(substr(MergeStage2.df$SourceVariableType,2,6)=="nv")

#Try converts shouldn't be necessary unless there's been a change in contract.fpds
#That said, the differences in date format mean some will be generated.

##2) The Try_Converts select files  ####
TryConvertList<-create_try_converts(MergeDestination.df,"ETL","FPDSdelta"
                                    ,IncludeAlters=FALSE
                                    ,Apply_Drop = FALSE
                                    ,IncludeSingle = FALSE
                                    ,IncludeMultiple = TRUE)
if(!is.null(TryConvertList))
  write(TryConvertList,"Output\\FPDSdeltaTryConvertList.txt")
#Then the alters.
TryConvertList<-create_try_converts(MergeDestination.df,"ETL","FPDSdelta"
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
#                           "ETL",
#                           "FPDSdelta2",
#                           "ETL",
#                           "FPDSdelta",
#                           DateType=23,
#                           FPDS=TRUE,
#                           Apply_Drop=FALSE)
# write(InsertList,"Output/ETL_FPDSdelta_insert_destination.txt")

skip_list<-c("[unique_award_key]",
             "[CSIStransactionID]",
             "[legal_entity_country_code]",#Handled via chain insert manually written
             "[awardee_or_recipient_uei]",
             "[ultimate_parent_uei]",
             
             "[recipient_country_code]",
             "[recipient_country_name]",
             "[awardee_or_recipient_legal]",
             "[vendor_doing_as_business_n]"
             
             ) #Handled via chain insert manually written
##3) Create missing foreign key assignments#####
# debug(create_foreign_key_assigments)
select_missing_code <- create_foreign_key_assigments("ETL",
                                        "FPDSdelta",
                                        "Contract",
                                        "FPDS",
                                        dir="sql",
                              suppress_alter = TRUE,
                              suppress_insert = TRUE,
                              skip_list = skip_list,
                              file="NameConversion.csv") 
write(select_missing_code,
      file=file.path("Output","ETL_FPDSdelta_select_foreign_key.txt"), 
      append=FALSE)  

skip_list<-c("[unique_award_key]",
             "[CSIStransactionID]",
             "[legal_entity_country_code]",#Handled via chain insert manually written
             "[awardee_or_recipient_uei]",
             "[ultimate_parent_uei]",
             "[recipient_country_name]",
             "") 
# debug(convert_field_to_foreign_key)

input_missing_code <- create_foreign_key_assigments("ETL",
                                                     "FPDSdelta",
                                                    "Contract",
                                                    "FPDS",
                                                     dir="sql",
                                                     suppress_select = TRUE,
                                                    suppress_alter = TRUE,
                                                    suppress_update= TRUE,
                                                    skip_list = skip_list,
                                                    file="NameConversion.csv"
                                                    )

write(input_missing_code,
      file=file.path("Output","ETL_FPDSdelta_input_foreign_key.txt"),  
      append=FALSE) 

#####4) Count Empties####
#Create the code to count empty rows by variable.
count_list<-count_empties(Import.df,"ETL","FPDSdelta")
write(count_list,"Output//ETL_FPDSdelta_count_empties.txt")



##5) Inserts into destination####
InsertList<-create_insert(MergeDestination.df,
                         "ETL",
                         "FPDSdelta",
                         "Contract",
                         "FPDS",
                         DateType=120,
                         FPDS=TRUE)
write(InsertList,"Output/ETL_FPDSdelta_insert_destination.txt")


#Create Compare Values (double checking that column matches are good)
colnames(MergeDestination.df)
MergeDestination.df %>% filter(SourceVariableType!=CSISvariableType)


##6) Compare and update destination#####
compare_list<-create_compare_cols(MergeDestination.df,
                                "ETL",
                                "FPDSdelta",
                                "Contract",
                                "FPDS",
                                source_primary_key="detached_award_proc_unique",
                                target_primary_key="contract_transaction_unique_key",
                                drop_unmatched=TRUE)
write(compare_list,"Output/ETL_FPDSdelta_compare_destination.txt")


#Create Updates
update_list<-create_update_FPDS(MergeDestination.df,
  "ETL",
  "FPDSdelta",
  "Contract",
  "FPDS",
  DateType=101,
  drop_name=TRUE)
write(update_list,"Output/ETL_FPDSdelta_update_destination.txt")
MergeDestination.df %>% filter(substr(CSISvariableType,2,3) %in% c("NV","nv")) %>% select(SourceVariableName)
substr(MergeDestination.df$CSISvariableType,2,3)
