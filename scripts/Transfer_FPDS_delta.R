# Whole database imports from monthly delta files to Errorlogging.FPDSdelta

#### Setup #####


library(dplyr)
library(tidyr)
library(tidyverse)
library(csis360)
library(readr)
library(sqldf)
library(odbc)
library(askpass)
library(DBI)

login<-askpass("Please enter the SQL login account")
pwd<-askpass("Please enter the SQL account password")

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
deltadir<-"FY(All)_All_Contracts_Delta_20250708"


####Import from flatfiles to R #####
file.list<-list.files(file.path(path,deltadir))
file.list<-file.list[substr(file.list,nchar(file.list)-3,nchar(file.list))==".csv"]

#This should be quite fast, roughly 5 minutes per file.
#Import
for (f in 1:length(file.list)){
  print(c(deltadir,f,"Read Start", format(Sys.time(), "%c")))
  fd<-read_csv(file.path(path,deltadir,file.list[f]), guess_max = 10000000)
  print(c(deltadir,f,"Read Finish", format(Sys.time(), "%c")))
  save_file=paste0(substr(file.list[f],1,nchar(file.list)-4),".rda")
  save(fd,file=file.path(path,deltadir,save_file))
}


#### Upload from R to SQL server ####

file.list<-list.files(file.path(path,deltadir))
file.list<-file.list[substr(file.list,nchar(file.list)-3,nchar(file.list))==".rda"]

# First upload attempt, before the NaN errors, was 100k rows in a bout 12 minutes, or about 2 hours per file.
# I started hitting OBDC upload errors with no details, so I was planning to shrink down the interval.
# After discover the NaN import bug, where character columns exclusively NAN or NULL were treated as "not a number" numerics, 
# I accidentally restarted runs with a 25 row interval.
# I did switch to 25k when rerunning last night, but first it failed for a new reason. 
"Sat Jun 21 21:56:12 2025"
# Error: nanodbc/nanodbc.cpp:4616: 08S01: [Microsoft][ODBC SQL Server Driver][DBNETLIB]ConnectionWrite (send()).  [Microsoft][ODBC SQL Server Driver][DBNETLIB]General network error. Check your network documentation.
# Error occurs again on file 13 Error: nanodbc/nanodbc.cpp:4616: 08S01: [Microsoft][ODBC SQL Server Driver][DBNETLIB]ConnectionWrite (send()).  [Microsoft][ODBC SQL Server Driver][DBNETLIB]General network error. Check your network documentation. 
# To my surprise, when restarting with a 25k interval, the first file completed from 800 to 829, or about 30 minutes per. 






for (f in 1:length(file.list)){
  load(file.path(path,deltadir,file.list[f]))
  fd<-as.data.frame(fd)

  print(c("File",file.list[f],"Processing Start", format(Sys.time(), "%c")))
  print(summary(factor(fd$correction_delete_ind)))
  print(summary(factor(fd$action_date_fiscal_year)))
  filecheck<-data.frame(colname=colnames(fd))
  filecheck$maxlen<-NULL
  for(c in 1:nrow(filecheck)){
    if (numbers::mod(c,50) == 0) print(c)
    filecheck$maxlen[c]<-max(sapply(fd[,filecheck$colname[c]],nchar),na.rm=TRUE)
  }
  filecheck$importtype<-sapply(fd,class)
  t<-read_and_join_experiment(filecheck,"ErrorLogging_FPDS_delta_sizetype.csv",directory="ImportAids//",skip_check_var = "varcharsize",
                              path="offline",missing_file = "output//missing_fpds_delta_matches.csv")
  # t$varcharsize<-text_to_number(t$varcharsize)
  if(nrow(t %>% filter (destinationtype %in% c("varchar","nvarchar") & maxlen>varcharsize))>0){
    View(t %>% filter (destinationtype %in% c("varchar","nvarchar") & maxlen>varcharsize))
    stop("Column length will lead to truncation")
  }
  # Handle a misinterpretation by read_csv of NAN
  for(c in t$colname[t$importtype %in% c("numeric") & t$destinationtype %in% c("varchar","nvarchar")]){
    if(any(is.nan(fd[,c]))){
      fd[,c]<-as.character(fd[,c])
      fd[is.nan(fd[,c]),c]<-"NAN"
    }
    else{
      fd[,c]<-as.character(fd[,c])
    }
  }
  
  # Handle numerical formats
  for(c in t$colname[t$destinationtype %in% c("decimal","int","bigint","smallint","tinyint")& t$importtype=="character"]){
    converted_num<-text_to_number(fd[,c])
    if(any(!is.na(fd[,c])& 
           is.na(converted_num)))
      stop(paste("Conversion to number failed for",c))
    fd[,c]<-converted_num
    m<-max(abs(fd[,c]),na.rm=TRUE)
    if(t$destinationtype[t$colname==c] == "decimal" & m>999999999999999.9999)
      stop(paste("Number overflows decimal(19,4) for",c))
    if(t$destinationtype[t$colname==c] == "int" & m>2147483647)
      stop(paste("Number overflows int for",c))
    if(t$destinationtype[t$colname==c] == "smallint" & m> 32767)
      stop(paste("Number overflows smallint for",c))
    if(t$destinationtype[t$colname==c] == "tinyint" & m> 255)
      stop(paste("Number overflows smallint for",c))
    t$importtype[t$colname==c]<-t$destinationtype[t$colname==c]
  }
  #Handle dates
  for(c in t$colname[t$destinationtype %in% c("date","datetime2")& t$importtype=="character"]){
    if(any(!is.na(fd[,c])& 
           is.na(as.Date(fd[,c]))))
      stop(paste("Conversion to date failed for",c))
    fd[,c]<-as.Date(fd[,c])
    t$importtype[t$colname==c]<-t$destinationtype[t$colname==c]
  }
  #Handle bits
  for(c in t$colname[t$destinationtype %in% c("bit")& t$importtype!="bit"]){
    newval<-text_to_bit(fd[,c])
    if(any(!is.na(fd[,c])&  !fd[,c] %in% c("",":") &
           is.na(newval))){
      summary(factor(fd[,c]))
      View(fd[!is.na(fd[,c])&is.na(newval),c])
      stop(paste("Conversion to bit failed for",c))
    }
    fd[,c]<-newval
    t$importtype[t$colname==c]<-t$destinationtype[t$colname==c]
  }
  
  handled_destination<-c("varchar","nvarchar","decimal","int","bigint","smallint","tinyint","date","datetime2","bit")
  if(any(!t$destinationtype %in% handled_destination)){
    stop(paste("Unknown destination type ",t$destinationtype[!t$destinationtype %in% handled_destination]))
  }
    
  vmcon <- dbConnect(odbc(),
                     Driver = "SQL Server",
                     Server = "vmsqldiig.database.windows.net",
                     Database = "CSIS360",
                     UID = login,
                     PWD =pwd)
  
    interval<-25000
    rowcount<-nrow(fd)
    #Roughy 12 minutes per 100k interval, so two hours per file.
    for (r in 0:ceiling(rowcount/interval)){  #reset to 0 when not recovering from a crash
      start<-1+r*interval
      end<-(r+1)*interval
      if(start>rowcount) {break}
      if(end>rowcount) {end<-rowcount}
      fd_filtered<-fd[start:end,]
      # ctu<-fd_filtered$contract_transaction_unique_key
      # t %>% filter(importtype %in% c("numeric") & !t$destinationtype %in% c("decimal","int","bigint","smallint","tinyint"))
      # fd_filtered[,t$importtype %in% c("numeric") &
      #               !t$destinationtype %in% c("decimal","int","bigint","smallint","tinyint")]<-NA
      # # fd_filtered[,t$destinationtype %in% c("decimal","int","bigint","smallint","tinyint")]<-NA #%in% c("decidecimal","int","bigint","smallint","tinyint")]
      # summary(factor(fd$type_of_idc))
      
      print(c("Upload Current Start:",start,"Next Start:",end+1, nrow(fd_filtered),format(Sys.time(), "%c")))
      dbAppendTable(conn = vmcon, 
                    name = SQL('"ErrorLogging"."FPDSdelta"'), 
                    value = fd_filtered)  ## x is any data frame
      #https://stackoverflow.com/questions/66864660/r-dbi-sql-server-dbwritetable-truncates-rows-field-types-parameter-does-not-w
    }
  #Note, transactions will not commit until you disconnect! Whether or not
  #the computer maintains this connection in the meantime doesn't matter,
  #formal disconnection is required.
  dbDisconnect(vmcon)
}

##### Upload deleted row list to ErrorLogging.unmatched_contract_transaction_unique_key####
# Upload deleted rows, just a small number of columns, so hopefully much faster
n<-nrow(delete_fpds)
delete_fpds<-distinct(delete_fpds)
interval<-100000
start1<-2
delete_fpds<-as.data.frame(delete_fpds)
for (f in 1:(n/interval)){
  start<-start1+f*interval
  end<-start1+(f+1)*interval-1
  #Stop when we've reached the end of imports
  if(start>nrow(delete_fpds)) {break}
  if(end>nrow(delete_fpds)) {end<-nrow(delete_fpds)}
  delete_fpds_filtered<-as.data.frame(delete_fpds[start:end,])
  colnames(delete_fpds_filtered)[1]<-"contract_transaction_unique_key"
  vmcon <- dbConnect(odbc(),
                     Driver = "SQL Server",
                     Server = "vmsqldiig.database.windows.net",
                     Database = "CSIS360",
                     UID = login,
                     PWD =pwd)
  
  
  print(c("Upload Current Start:",start,"Next Start:",end+1,format(Sys.time(), "%c")))
  dbAppendTable(conn = vmcon, 
                name = SQL('"ErrorLogging"."unmatched_contract_transaction_unique_key"'), 
                value = delete_fpds_filtered)  ## x is any data frame
  #https://stackoverflow.com/questions/66864660/r-dbi-sql-server-dbwritetable-truncates-rows-field-types-parameter-does-not-w
  # }
  #Note, transactions will not commit until you disconnect! Whether or not
  #the computer maintains this connection in the meantime doesn't matter,
  #formal disconnection is required.
  dbDisconnect(vmcon)
}

 
