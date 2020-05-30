#Setup
source("scripts//SQLimportTools.r")
library(tidyverse)


##### From Stage 1 to Stage 2, Taking Advantage of Newly Added Coluns in Contract.FPDS####### 
p1_long_table<-read_create_table("Budget.p1_long.Table.sql",
                                      dir="SQL")


p1_long_table<-translate_name(p1_long)


dba_p1_table<-read_create_table("Budget.DBAp1.Table.sql",
                                       dir="SQL")
translate_name(dba_p1_table,test_only=TRUE)

MergeStage2.df<-merge_source_and_csis_name_tables(p1_long_table,dba_p1_table)

