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



#Download was way faster than I expected. Took roughly 2m for 4.9m rows. 
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


#### Upload contract_fpds_ctu list to Postgres database #####

if(dir.exists("C:\\Users\\grego\\Repositories\\USAspending-local\\")){
  path<-"C:\\Users\\grego\\Repositories\\USAspending-local\\"
} else if(dir.exists("D:\\Users\\Greg\\Repositories\\USAspending-local\\")) {
  path<-"D:\\Users\\Greg\\Repositories\\USAspending-local\\"
} else if(dir.exists("F:\\Users\\Greg\\Repositories\\USAspending-local\\")) {
  path<-"F:\\Users\\Greg\\Repositories\\USAspending-local\\"
} else if(dir.exists("C:\\Users\\grego\\Repos\\USAspending-local\\")) {
  path<-"C:\\Users\\grego\\Repos\\USAspending-local\\"
} else{
  stop("USAspending-local dir location unknown")
}
postgresdir<-"Postgres_2025_04_08"

  #Ideally this should pull down automatically. 
  sql_fpds<-read_delim(file.path(path,"contract_fpds_ctu_list_2025_04_13.txt"),delim="\t",col_types="iciT") #T or c for last_modified?
  
  #necessary?
sql_fpds$last_modified_date<-as.Date(sql_fpds$last_modified_date,format="%Y-%m%-%d 00:00:00.0000000")

sql_fpds<-sql_fpds %>% filter(contract_transaction_unique_key!="NULL")

##Took roughly 24 hours
for (fy in 1962:2025){
  pgcon <- dbConnect(odbc(),
                     Driver = "PostgreSQL Unicode(x64)",
                     Server = "127.0.0.1",
                     Database = "raw",
                     UID = "postgres",
                     PWD =pgpwd)
  print(c("Fiscal Year",fy,"Upload Start", format(Sys.time(), "%c")))
  sql_fpds_fy<-sql_fpds %>%filter(fiscal_year==fy) %>%as.data.frame()
    for (r in 0:floor(nrow(sql_fpds_fy)/1000000)){
    start<-(r*1000000)+1
    end<-((r+1)*1000000)
    #Stop when we've reached the end of imports
    if(start>nrow(sql_fpds_fy)) {break}
    if(end>nrow(sql_fpds_fy)) {end<-nrow(sql_fpds_fy)}
    print(c(start,end, format(Sys.time(), "%c")))
    dbAppendTable(conn = pgcon, 
                  name = SQL('"helper"."contract_fpds_ctu_list"'), 
                  value = sql_fpds_fy[start:end,])  ## x is any data frame
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
  dbDisconnect(pgcon)
}


#### Download new or changed rows from Postgres database #####
#Takes 20-40 minutes for the each of the early years. Grouping those up to 2000
#to reduce query fixed costs.
#Subseqeuntly they start to scale up in duration when mre rows show up. Raising to
#something like an hour per million rows.

for (fy in 2000:2025){
  pgcon <- dbConnect(odbc(),
                     Driver = "PostgreSQL Unicode(x64)",
                     Server = "127.0.0.1",
                     Database = "raw",
                     UID = "postgres",
                     PWD =pgpwd)
  sql<-paste0(" SELECT p.*
   FROM raw.source_procurement_transaction p
   LEFT OUTER JOIN helper.contract_fpds_ctu_list c
   on p.detached_award_proc_unique=c.contract_transaction_unique_key
   LEFT OUTER JOIN helper.date_list ad
   on p.action_date=ad.action_date
   LEFT OUTER JOIN helper.date_list lm
   on p.last_modified=lm.action_date ")
  if (fy==1989 ){
    sql<-paste0(sql,"WHERE ad.fiscal_year <= ",fy," and ")
  } else 
    sql<-paste0(sql,"WHERE ad.fiscal_year = ",fy," and ")
  sql<-paste0(sql,"(c.contract_transaction_unique_key is null or ",
              "(lm.t_date > ad.t_date and ad.fiscal_year>2023));")
  #Last modified date wasn't properly imported, so using the kludge since everything was updated in 2024_02
  print(c("Download start",fy, format(Sys.time(), "%c")))
  latest_fpds<-dbGetQuery(pgcon, sql)
  print(c("Download complete",fy,nrow(latest_fpds), format(Sys.time(), "%c")))
  if(nrow(latest_fpds)==0)     next
  if (fy==2000 )
    save(latest_fpds,file= file.path(path,postgresdir,paste0("fpds_fy_",fy,"and_before.rda")))
  else 
    save(latest_fpds,file= file.path(path,postgresdir,paste0("fpds_fy_",fy,".rda")))
}





#### Upload new or changed rows to SQL server #####

# Dupes to delete, 2023 spt fiscal_year between 22:42:03 and 22:53:35 
# I keep encountering this error on my lpatop and I don't know why. 
#Solution might be to just allow some way of recovering from an error and tracking what already went in.
#Perhaps via the dbappedn function. I could kludge it to just say what row to start on, but that annoys me.
# I'm still hoping this will go away when I can just run it on the desktop.
# Error: nanodbc/nanodbc.cpp:1771: 08S01
# [Microsoft][ODBC SQL Server Driver][DBNETLIB]ConnectionRead (recv()). 
# [Microsoft][ODBC SQL Server Driver][DBNETLIB]General network error. Check your network documentation. 
# proc<-dbReadTable(pgcon,  name = SQL('"raw"."detached_award_2023"'))
#1977-2024 2024-02-08 YTD. 
file.list<-list.files(file.path(path,postgresdir))
file.list[15]
for (f in 19:length(file.list)){
  vmcon <- dbConnect(odbc(),
                     Driver = "SQL Server",
                     Server = "vmsqldiig.database.windows.net",
                     Database = "CSIS360",
                     UID = login,
                     PWD =pwd)
  
  load(file.path(path,postgresdir,file.list[f]))
  #I've sometimes added an entirely empty fiscal_year folde. Remove it.
  if("fiscal_year" %in% colnames(latest_fpds)){
    if(all(is.na(latest_fpds$fiscal_year)))
      latest_fpds<-latest_fpds[colnames(latest_fpds) !="fiscal_year"]
  }
  
  print(c("File",file.list[f],"Upload Start", format(Sys.time(), "%c")))
  
  if(nrow(latest_fpds)==0)
    next
  latest_fpds<- as.data.frame(latest_fpds)
  filecheck<-data.frame(colname=colnames(latest_fpds))
  filecheck$maxlen<-NULL
  for(c in 1:nrow(filecheck)){
    if (numbers::mod(c,50) == 0) print(c)
    filecheck$maxlen[c]<-max(sapply(latest_fpds[,filecheck$colname[c]],nchar),na.rm=TRUE)
  }
  filecheck$importtype<-sapply(latest_fpds,class)
  t<-read_and_join_experiment(filecheck,"ErrorLogging_Postgres_sizetype.csv",directory="ImportAids//",skip_check_var = "varcharsize",
                              path="offline")
  # t$varcharsize<-text_to_number(t$varcharsize)
  if(nrow(t %>% filter (destinationtype %in% c("varchar","nvarchar") & maxlen>varcharsize))>0){
    View(t %>% filter (destinationtype %in% c("varchar","nvarchar") & maxlen>varcharsize))
    stop("Column length will lead to truncation")
  }
  # Handle numerical formats
  for(c in t$colname[t$destinationtype %in% c("decimal","int","bigint","smallint")& t$importtype=="character"]){
    if(any(!is.na(latest_fpds[,c])& 
           is.na(text_to_number(latest_fpds[,c]))))
      stop(paste("Conversion to number failed for",c))
    latest_fpds[,c]<-text_to_number(latest_fpds[,c])
    t$importtype[t$colname==c]<-t$destinationtype[t$colname==c]
  }
  #Handle dates
  for(c in t$colname[t$destinationtype %in% c("date","datetime2")& t$importtype=="character"]){
    if(any(!is.na(latest_fpds[,c])& 
           is.na(as.Date(latest_fpds[,c]))))
      stop(paste("Conversion to date failed for",c))
    latest_fpds[,c]<-as.Date(latest_fpds[,c])
    t$importtype[t$colname==c]<-t$destinationtype[t$colname==c]
  }
  #Handle bits
  for(c in t$colname[t$destinationtype %in% c("bit")& t$importtype!="bit"]){
    newval<-text_to_bit(latest_fpds[,c])
    if(any(!is.na(latest_fpds[,c])&  !latest_fpds[,c] %in% c("",":") &
           is.na(newval))){
      summary(factor(latest_fpds[,c]))
      View(latest_fpds[!is.na(latest_fpds[,c])&is.na(newval),c])
      stop(paste("Conversion to bit failed for",c))
    }
    latest_fpds[,c]<-newval
    t$importtype[t$colname==c]<-t$destinationtype[t$colname==c]
  }
  t$importtype<-sapply(latest_fpds,class)
  interval<-25000
  for (r in 0:floor(nrow(latest_fpds)/interval)){
    start<-(r*interval)+1
    end<-((r+1)*interval)
    #Stop when we've reached the end of imports
    if(start>nrow(latest_fpds)) {break}
    if(end>nrow(latest_fpds)) {end<-nrow(latest_fpds)}
    print(c(start,end, format(Sys.time(), "%c")))
    dbAppendTable(conn = vmcon, 
                  name = SQL('"ErrorLogging"."source_procurement_transaction"'), 
                  value = latest_fpds[start:end,])  ## x is any data frame
    #https://stackoverflow.com/questions/66864660/r-dbi-sql-server-dbwritetable-truncates-rows-field-types-parameter-does-not-w
    # values <- DBI::sqlAppendTable(
    #   vmcon = vmcon,
    #   table = Id(database = "CSIS360", schema = "ErrorLogging", table = "FPDSstage1"),
    #   values = latest_fpds[start:end,])
    # DBI::dbExecute(conn = vmcon, values)
  }
  #Note, transactions will not commit until you disconnect! Whether or not
  #the computer maintains this connection in the meantime doesn't matter,
  #formal disconnection is required.
  dbDisconnect(vmcon)
}


#### Download all rows from Postgres database #####

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


#### Transfer selected fields from Postgres database to fill in gaps #####

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

