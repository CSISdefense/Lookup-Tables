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


ignore_cols<-c("[IsDuplicateUTI]","[Transaction_Number_bigint]","[last_modified_date_datetime2]")

##### From Stage 1 to Destination, Creating Try Converts ####### 
MergeType.df<-merge_source_and_csis_name_tables(Stage1TableType.df,DestinationTable.df)

# At some point, add checking for varchar(255) or missing from Contract.FPDS
missing_column<-MergeType.df %>% filter(
  (is.na(IsDroppedNameField) | IsDroppedNameField==FALSE) &
    (is.na(CSISvariableType )| is.null(CSISvariableType))&
    !SourceVariableName %in% ignore_cols)

if(nrow(missing_column)>0){
  print(missing_column[,c("SourceVariableName","SourceVariableType","SourceNullable")])

  
  write(file=file.path("Output","Contract_FPDS_new_column_alter_table.txt"),
        paste("ALTER TABLE Errorlogging.FPDSbetaViolatesConstraint\nADD",
              paste(missing_column$SourceVariableName,
                    missing_column$SourceVariableType,
                    missing_column$SourceNullable,",\n",collapse=" ")))
  
  
  
  
  len_check<-paste("SELECT \n",
    paste("max(len(",missing_column$SourceVariableName,")) as ",missing_column$SourceVariableName,collapse=",\n"),
    "\nFROM ErrorLogging.FPDSbetaViolatesType",sep=""
    )
  write(file=file.path("Output","Contract_FPDS_new_column_max_length.txt"),len_check)
  
  stop("Columns need to be added to the destination database")
  # stop("Columns need to be added to the destination database")
} 


##### From Stage 1 to Stage 2 ####### 
if(!file.exists("sql\\ErrorLogging.FPDSbetaViolatesConstraint.table.sql")){
  write(Create_Constraint_List,
        file="Output\\Starter_ErrorLogging_FPDSbetaViolatesConstraint.txt")
  write(create_csis_dates("ErrorLogging","FPDSbetaViolatesConstraint"),"Output//CSISdates.txt")
} else{

  
##### From Stage 1 to Stage 2, Taking Advantage of Newly Added Columns in Contract.FPDS####### 
  Stage2TableType.df<-read_create_table("ErrorLogging.FPDSbetaViolatesConstraint.Table.sql",
                                        dir="SQL")
  
  Merge1to2.df<-merge_source_and_csis_name_tables(Stage1TableType.df,Stage2TableType.df)
  
  missing_in_stage2<-Merge1to2.df %>% filter(
    (is.na(CSISvariableType )| is.null(CSISvariableType))&
      !SourceVariableName %in% ignore_cols) %>% 
    select(SourceVariableName ,SourceVariableType,SourceNullable) %>%
    translate_name() %>% merge_source_and_csis_name_tables(DestinationTable.df)
  
  if(nrow(missing_in_stage2)>0){
    warning("Be sure to generate scripts after adding any new columns to Contract.FPDS")  
    missing_in_stage2$SourceVariableName[!is.na(missing_in_stage2$CSISvariableName)]<-
      missing_in_stage2$CSISvariableName[!is.na(missing_in_stage2$CSISvariableName)]
    missing_in_stage2$SourceVariableType[!is.na(missing_in_stage2$CSISvariableName)]<-
      missing_in_stage2$CSISvariableType[!is.na(missing_in_stage2$CSISvariableName)]
    missing_in_stage2$SourceNullable[!is.na(missing_in_stage2$CSISvariableName)]<-
      missing_in_stage2$CSISnullable[!is.na(missing_in_stage2$CSISvariableName)]
   
    print(missing_in_stage2[,c("SourceVariableName","SourceVariableType","SourceNullable")])

    
    
    
    write(file=file.path("Output","ErrorLogging_FPDSbetaViolatesConstraint_new_column_alter_table.txt"),
          paste("ALTER TABLE Errorlogging.FPDSbetaViolatesConstraint\nADD",
                paste(missing_in_stage2$SourceVariableName,
                      missing_in_stage2$SourceVariableType,
                      missing_in_stage2$SourceNullable,",\n",collapse=" ")))
    
    
    
    len_check<-paste("SELECT \n",
                     paste("max(len(",missing_in_stage2$SourceVariableName[is.na(missing_in_stage2$CSISvariableName)],
                           ")) as ",missing_in_stage2$SourceVariableName[is.na(missing_in_stage2$CSISvariableName)],collapse=",\n"),
                     "\nFROM ErrorLogging.FPDSbetaViolatesType",sep=""
    )
    write(file=file.path("Output","ErrorLogging_FPDSbetaViolatesConstraint_new_column_max_length.txt"),len_check)
    
    missing_in_stage2<-missing_in_stage2 %>% select(-CSISvariableName ,-CSISvariableType,-CSISnullable)
    
    stop("Columns need to be added to the stage 2 database") 
  } else {
      #Create Try Convert
    
    Merge1to2.df<-Merge1to2.df%>% dplyr::filter(!SourceVariableName %in% ignore_cols)  
    
     
     # debug(length_check)
      TryConvertListSingle<-create_try_converts(Merge1to2.df,"Errorlogging","FPDSbetaViolatesType",
                                          IncludeAlters=FALSE,
                                          Add_Colon_Split=FALSE,
                                          Apply_Drop=FALSE,
                                          DateType = 120,
                                          IncludeMultiple = FALSE)
      
      write(TryConvertListSingle,"Output\\FPDS_Stage1_Try_Convert_Single.txt")
      
      TryConvertListMultiple<-create_try_converts(Merge1to2.df,"Errorlogging","FPDSbetaViolatesType",
                                                IncludeAlters=FALSE,
                                                Add_Colon_Split=FALSE,
                                                Apply_Drop=FALSE,
                                                DateType = 120,
                                                IncludeSingle = FALSE)
      
      write(TryConvertListMultiple,"Output\\FPDS_Stage1_Try_Convert_Multiple.txt")
    
    #Transfer from Errorlogging.FPDSbetaViolatesType to Errorlogging.FPDSbetaViolatesConstraint
    InsertList<-create_insert(Merge1to2.df,
                              "ErrorLogging",
                              "FPDSbetaViolatesType",
                              "ErrorLogging",
                              "FPDSbetaViolatesConstraint",
                              DateType=120,
                              allow_missing=FALSE,
                              Apply_Drop=FALSE) #This should be redundant with the missing check above
    write(InsertList,"Output\\FPDS_Insert_from_Stage1_to_Stage2.txt")
  }
}

