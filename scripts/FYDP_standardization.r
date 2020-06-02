#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


error_p1_long_table<-read_create_table("ErrorLogging.p1_long.Table.sql",
                                 dir="SQL")


len_check<-paste("SELECT \n",
                 paste("max(len(",error_p1_long_table$VariableName     ,")) as ",error_p1_long_table$VariableName     ,collapse=",\n"),
                 "\nFROM ErrorLogging.p1_long.Table.sql",sep=""
)
write(file=file.path("Output","ErrorLogging_p1_long_column_max_length.txt"),len_check)


##### From Stage 1 to Stage 2, Taking Advantage of Newly Added Coluns in Contract.FPDS####### 
p1_long_table<-read_create_table("Budget.p1_long.Table.sql",
                                      dir="SQL")


p1_long_table<-translate_name(p1_long_table)


dba_p1_table<-read_create_table("Budget.DBAp1.Table.sql",
                                       dir="SQL")
translate_name(dba_p1_table,test_only=TRUE)

p1_dba_long<-merge_source_and_csis_name_tables(p1_long_table,dba_p1_table)

Create_Constraint_List<-paste(p1_dba_long$CSISvariableName,
                              p1_dba_long$CSISvariableType,
                              p1_dba_long$CSISnullable,",")

TryConvertList<-create_try_converts(p1_dba_long,"Budget","p1_long",
                                          IncludeAlters=TRUE,
                                          Add_Colon_Split=FALSE,
                                          Apply_Drop=FALSE,
                                          DateType = 120,
                                          IncludeMultiple = FALSE)

write(TryConvertList,"Output\\FYDP_Stage1_Try_Convert_Single.txt")


# At some point, add checking for varchar(255) or missing from Contract.FPDS
missing_column<-p1_dba_long %>% filter(
  (is.na(IsDroppedNameField) | IsDroppedNameField==FALSE) &
    (is.na(CSISvariableType )| is.null(CSISvariableType)))#&
    # !SourceVariableName %in% ignore_cols)

len_check<-paste("SELECT \n",
                 paste("max(len(",missing_column$SourceVariableName,")) as ",missing_column$SourceVariableName,collapse=",\n"),
                 "\nFROM Budget.p1_long",sep=""
)
write(file=file.path("Output","Budget_p1_long_new_column_max_length.txt"),len_check)
