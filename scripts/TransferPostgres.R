###############################################################
# Get Top 10 rows of aggregated Amount and # of action
################################################################
library(dplyr)
library(tidyr)
library(tidyverse)
library(csis360)
library(readr)
library(sqldf)
library(odbc)
library(askpass)
library(DBI)



#Download was way faster than I expected. Took roughly 2m for 4,9m rows. 
# 3 minutes per 10k rows, so about 3h18m for 6.6m rows.
#6,665,969 row, started 23:03:31, finished 0:23:54
#This suggests an entire file in around 3d4h (not counting download time)
#But this is just 11 of the fields. 
# 2017 4912947 started 08:07, finished 11:08
# 2018 5618756 started 11:08, finished 14:05
pgpwd<-askpass("Please enter the Postgres account password")
login<-askpass("Please enter the SQL login account")
pwd<-askpass("Please enter the SQL account password")

pgcon <- dbConnect(odbc(),
                   Driver = "PostgreSQL Unicode(x64)",
                   Server = "127.0.0.1",
                   Database = "raw",
                   UID = "postgres",
                   PWD =pgpwd)

fy<-2023
m<-10


   #          and s
   # 	action_date<=to_date('",fy,"-09-30','yyyy-mm-dd');")
print(c("Fiscal Year",fy,"Download Start", format(Sys.time(), "%c")))
#October to end of december 19:48 to 20:13
# latest_fpds<-dbGetQuery(pgcon,  sql)
#Error: Query needs to be bound before fetching
cy<-2023
quarter_dates<-c("01-01","04-01","07-01","10-01")
for (q in 1:4){
  sql<-paste0(" SELECT *
   FROM raw.source_procurement_transaction
    WHERE to_date(action_date, 'yyyy-mm-dd') >=to_date('",cy,"-",quarter_dates[q],"','yyyy-mm-dd') and 
          to_date(action_date, 'yyyy-mm-dd') <to_date('",cy,"-",quarter_dates[numbers::mod(q,4)+1],"','yyyy-mm-dd');")
  print(c("Download start",cy,quarter_dates[q], format(Sys.time(), "%c")))
  latest_fpds<-dbGetQuery(pgcon, sql)
  print(c("Download complete",cy,quarter_dates[q],nrow(latest_fpds), format(Sys.time(), "%c")))
  
  save(latest_fpds,file= file.path("data","semi_clean",paste("fpds_cy",cy,"_q",q,".rda")))
  print(c("Save complete",cy,quarter_dates[q],nrow(latest_fpds), format(Sys.time(), "%c")))
}
   # WHERE  substring(action_date,1,4)='",fy,"' and substring(action_date,6,7)=?")



# fpds_2023<-dbGetQuery(pgcon, sql, params=list(stringi::stri_sub(paste0(0,1:12),-2,-1)))



# proc<-dbReadTable(pgcon,  name = SQL('"raw"."detached_award_2023"'))
#1977-2024 2024-02-08 YTD. NOte that probably everything pre-1990 I should probably capture in one single query.
for (fy in 2004:2005){
  vmcon <- dbConnect(odbc(),
                     Driver = "SQL Server",
                     Server = "vmsqldiig.database.windows.net",
                     Database = "CSIS360",
                     UID = login,
                     PWD =pwd)
  print(c("Fiscal Year",fy,"Download Start", format(Sys.time(), "%c")))
  sql<-paste0(" SELECT detached_award_proc_unique,
    detached_award_procurement_id,
    unique_award_key,
    agency_id,
    piid,
    award_modification_amendme,
    referenced_idv_agency_iden,
    parent_award_id,
    referenced_idv_modificatio,
    transaction_number,
    award_or_idv_flag,
    action_date,
    last_modified,
    ultimate_parent_uei,
    awardee_or_recipient_uei,
    entity_data_source
   FROM raw.detached_award_proc_unique_csis
   WHERE action_date>=to_date('",fy-1,"-10-01','yyyy-mm-dd') and 
   	action_date<=to_date('",fy,"-09-30','yyyy-mm-dd');")
  
  proc<-dbGetQuery(pgcon,  sql)
  print(c("Download complete",fy,nrow(proc), format(Sys.time(), "%c")))
  
  # print(file.list[file.name])
  # i<-read_csv(file.path(path,dir,agency,file.list[file.name]),n_max=1000000,guess_max=1000000)
  # #Only loans, using code because the name field is often blank
  # 
  # if(nrow(i)==0)
  #   next
  # i<- as.data.frame(i)
  # i$USAspending_file_name<-file.list[file.name]
  # filecheck<-data.frame(colname=colnames(i))
  # filecheck$maxlen<-NULL
  # for(c in 1:nrow(filecheck)){
  #   if (numbers::mod(c,10) == 0) print(c)
  #   filecheck$maxlen[c]<-max(sapply(i[,filecheck$colname[c]],nchar),na.rm=TRUE)
  # }
  # filecheck$importtype<-sapply(i,class)
  # t<-read_and_join_experiment(filecheck,"ErrorLogging_FAADCstage1_size.csv",directory="ImportAids//",skip_check_var = "stage1size")
  # t$stage1size<-text_to_number(t$stage1size)
  # if(nrow(t %>% filter (maxlen>=stage1size))>0){
  #   t %>% filter (maxlen>=stage1size)
  #   # stop("Column length will lead to truncation")
  # }
  # distinct(t %>% select(stage1type,importtype))
  # if(nrow(t %>% filter (stage1type %in% c("decimal","date")&importtype=="character" ))){
  #   t %>% filter (stage1type %in% c("decimal","date")&importtype=="character" )
  #   stop("Column type mismatch")
  # }
  
  for (r in 0:floor(nrow(proc)/100000)){
    start<-(r*100000)+1
    end<-((r+1)*100000)
    #Stop when we've reached the end of imports
    if(start>nrow(proc)) {break}
    if(end>nrow(proc)) {end<-nrow(proc)}
    print(c(start,end, format(Sys.time(), "%c")))
    dbAppendTable(conn = vmcon, 
                  name = SQL('"ErrorLogging"."detached_award_proc_unique_csis"'), 
                  value = proc[start:end,])  ## x is any data frame
    #https://stackoverflow.com/questions/66864660/r-dbi-sql-server-dbwritetable-truncates-rows-field-types-parameter-does-not-w
    # values <- DBI::sqlAppendTable(
    #   vmcon = vmcon,
    #   table = Id(database = "CSIS360", schema = "ErrorLogging", table = "FPDSstage1"),
    #   values = i[start:end,])
    # DBI::dbExecute(conn = vmcon, values)
  }
  #Note, transactions will not commit until you disconnect! Whether or not
  #the computer maintains this connection in the meantime doesn't matter,
  #formal disconnection is required.
  dbDisconnect(vmcon)
}


#https://stackoverflow.com/questions/14334840/how-to-insert-a-dataframe-into-a-sql-server-table
#https://stackoverflow.com/questions/54692733/how-to-insert-r-dataframe-into-existing-table-in-sql-server
#https://stackoverflow.com/questions/1402001/ms-sql-bulk-insert-with-rodbc/42489082#42489082


#https://usaspending-help.zendesk.com/hc/en-us/community/posts/360033231714-Unique-Transaction-Keys-Added-to-Contract-and-Financial-Assistance-Downloads-
# The following Unique Transaction IDs have been added to the downloads across USAspending.gov. 
# 
# 1. For Contract Award records:
#   
#   A concatenation of agencyID, parent_award_agency_id, award_id_piid, modification_number, parent_award_id, and transaction_number, with a single underscore ('_') character inserted in between each. If a field is blank, it is recorded as "-NONE-". agencyID is an FPDS field that captures the SubTier Agency that submitted the transaction to FPDS (often distinct from the awarding agency). These same six fields are part of the unique key for contract awards in FPDS.

# 3. Contract IDV Award records:
  
# The same format as Contract Award is used, but only agencyID, award_id_piid, and modification_number are filled in, even if additional fields in the key are present in the IDV record; the rest of the fields are recorded as "- NONE-" for unique key purposes, even when present. This follows the unique key model for contract IDVs in FPDS.

