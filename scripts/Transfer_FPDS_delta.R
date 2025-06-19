# Wholee database imports from PostGreSQL to Errorlogging.source_procurement_transaction

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
deltadir<-"FY(All)_All_Contracts_Delta_20250506"


####Import from flatfiles to R #####
file.list<-list.files(file.path(path,deltadir))
file.list<-file.list[substr(file.list,nchar(deltadir)-3,nchar(file.list))==".csv"]
deltalabel<-substr(deltadir,nchar(deltadir)-7,nchar(deltadir))

#Import
for (f in 1:length(file.list)){
  print(c(deltadir,f,"Read Start", format(Sys.time(), "%c")))
  fd<-read_csv(file.path(path,deltadir,file.list[f]), guess_max = 10000000)
  print(c(deltadir,f,"Read Finish", format(Sys.time(), "%c")))
  save_file=paste0("fpds_delta_",deltalabel,"_",f,".rda")
  save(fd,file=file.path(path,deltadir,save_file))
}


#### Upload from R to SQL server ####

file.list<-list.files(file.path(path,deltadir))
file.list<-file.list[substr(file.list,nchar(file.list)-3,nchar(file.list))==".rda"]

for (f in 1:length(file.list)){
  vmcon <- dbConnect(odbc(),
                     Driver = "SQL Server",
                     Server = "vmsqldiig.database.windows.net",
                     Database = "CSIS360",
                     UID = login,
                     PWD =pwd)
  
  load(file.path(path,deltadir,file.list[f]))

  print(c("File",file.list[f],"Processing Start", format(Sys.time(), "%c")))

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
  # Handle numerical formats
  for(c in t$colname[t$destinationtype %in% c("decimal","int","bigint","smallint")& t$importtype=="character"]){
    if(any(!is.na(fd[,c])& 
           is.na(text_to_number(fd[,c]))))
      stop(paste("Conversion to number failed for",c))
    fd[,c]<-text_to_number(fd[,c])
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
  t$importtype<-sapply(fd,class)
  
  interval<-100000
  rowcount<-nrow(fd)
  for (r in 0:ceiling(rowcount/invterval)){  #reset to 0 when not recovering from a crash
    start<-1+r*interval
    end<-(r+1)*interval
    if(start>rowcount) {break}
    if(end>rowcount) {end<-rowcount}
    fd_filtered<-fd %>% fd[start:end,]
    print(c("Upload Current Start:",start,"Next Start:",end+1, nrow(fd_filtered),format(Sys.time(), "%c")))
    dbAppendTable(conn = vmcon, 
                  name = SQL('"ErrorLogging"."fpdsdeleted"'), 
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

 
