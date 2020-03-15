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

if(!file.exists("sql\\ErrorLogging.FPDSbetaViolatesConstraint.table.sql")){
  write(Create_Constraint_List,
        file="Output\\Starter_ErrorLogging_FPDSbetaViolatesConstraint.txt")
  write(create_csis_dates("ErrorLogging","FPDSbetaViolatesConstraint"),"Output//CSISdates.txt")
} else{
  warning("Should be doing new column processing here")
  Stage2TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesConstraint.Table.sql",
                                        dir="SQL")
}

rm(NewConstraintTableType.df)

##### From Stage 1 to Stage 2 ####### 
MergeType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,DestinationTable.df)

# At some point, add checking for varchar(255) or missing from Contract.FPDS
missing_column<-MergeType.df %>% filter(
  (is.na(IsDroppedNameField) | IsDroppedNameField==FALSE) &
    (is.na(CSISvariableType )| is.null(CSISvariableType)))

if(nrow(missing_column)>0){
  warning("Columns need to be added to the destination database")
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
  write(InsertList,"Output\\Insert.txt")

}

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
      file=file.path("Output","ErrorLogging_FPDSbetaViolatesConstraint_select_foreign_key.txt"),  
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