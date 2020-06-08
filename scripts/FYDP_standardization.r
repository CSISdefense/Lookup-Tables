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


##### From P1 to DBA #####
table_compare<-function(x_file,y_file,source_schema,source_table,target_schema=source_schema, target_table,dir="SQL",reverse=FALSE){
  x<-read_create_table(x_file,dir)
  x<-translate_name(x)
  y<-read_create_table(y_file,dir)
  translate_name(y,test_only=TRUE)
  
  merge_xy<-merge_source_and_csis_name_tables(x,y)
  Create_Constraint_List<-paste(merge_xy$CSISvariableName,
                                merge_xy$CSISvariableType,
                                merge_xy$CSISnullable,",")
  
  try_convert<-create_try_converts(merge_xy,source_schema,source_table,
                      IncludeAlters=TRUE,
                      Add_Colon_Split=FALSE,
                      Apply_Drop=FALSE,
                      DateType = 120,
                      IncludeMultiple = FALSE)
  if(any(try_convert!=0))
    write(try_convert,file.path("Output",
                    paste(source_schema,source_table,"to",target_table,"Try_Convert_Single.txt",sep="_")))
  if(reverse){
    table_compare(y_file,x_file,target_schema,target_table,source_schema,source_table,dir="SQL",reverse=FALSE)
  }
}


####Comparing within RDT&E####
table_compare("Budget.r1_long.Table.sql",
              "Budget.DBAr1.Table.sql",
              source_schema="Budget",
              source_table="r1_long",
              target_table="DBAr1",reverse=TRUE)

table_compare("Budget.r1_long.Table.sql",
              "Budget.r2_long.Table.sql",
              source_schema="Budget",
              source_table="r1_long",
              target_table="r2_long",reverse=TRUE)

table_compare("Budget.r2_long.Table.sql",
              "Budget.DBAr1.Table.sql",
              source_schema="Budget",
              source_table="r2_long",
              target_table="DBAr1",reverse=TRUE)

#####Comparing within Procurement####
table_compare("Budget.p1_long.Table.sql",
              "Budget.DBAp1.Table.sql",
              source_schema="Budget",
              source_table="p1_long",
              target_table="DBAp1",reverse=TRUE)

table_compare("Budget.p1_long.Table.sql",
              "Budget.P40_long.Table.sql",
              source_schema="Budget",
              source_table="p1_long",
              target_table="p40_long",reverse=TRUE)


table_compare("Budget.P40_long.Table.sql",
              "Budget.DBAp1.Table.sql",
              source_schema="Budget",
              source_table="p40_long",
              target_table="DBAp1",reverse=TRUE)



#####Comparing across accounts####
table_compare("Budget.r1_long.Table.sql",
              "Budget.p1_long.Table.sql",
              source_schema="Budget",
              source_table="r1_long",
              target_table="p1_long",reverse=TRUE)

table_compare("Budget.r2_long.Table.sql",
              "Budget.P40_long.Table.sql",
              source_schema="Budget",
              source_table="r2_long",
              target_table="p40_long",reverse=TRUE)


table_compare("Budget.DBAr1.Table.sql",
              "Budget.DBAp1.Table.sql",
              source_schema="Budget",
              source_table="DBAr1",
              target_table="DBAp1",reverse=TRUE)


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

create_try_converts(p1_dba_long,"Budget","p1_long",
                                          IncludeAlters=TRUE,
                                          Add_Colon_Split=FALSE,
                                          Apply_Drop=FALSE,
                                          DateType = 120,
                                          IncludeMultiple = FALSE)%>%
  write("Output\\FYDP_p1_DBA_Try_Convert_Single.txt")

### DBA to P1 ######
p1_long_table<-read_create_table("Budget.p1_long.Table.sql",
                                 dir="SQL")


dba_p1_table<-read_create_table("Budget.DBAp1.Table.sql",
                                dir="SQL")

dba_p1_table<-translate_name(dba_p1_table)

#### Foreign Key Assignments 
#undebug(create_foreign_key_assigments)

output<-create_foreign_key_assigments("Budget","p1_long")
if(length(output)>0)
  write(output,file.path("Output","Budget_p1_long_foreign_key_assignments.txt"))

output<-create_foreign_key_assigments("Budget","p40_long")
if(length(output)>0)
  write(output,file.path("Output","Budget_p40_long_foreign_key_assignments.txt"))

output<-create_foreign_key_assigments("Budget","r1_long")
if(length(output)>0)
  write(output,file.path("Output","Budget_r1_long_foreign_key_assignments.txt"))

output<-create_foreign_key_assigments("Budget","r2_long")
if(length(output)>0)
  write(output,file.path("Output","Budget_r2_long_foreign_key_assignments.txt"))