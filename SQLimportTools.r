library(tidyr)
library(csis360)


read_create_table<-function(FileName){
  TargetTable.df<-read.csv(file.path("ImportAids\\",FileName),header=FALSE,sep=" ")
  
  #For now we're ignoring everything except the lines describing variable types
  CreateRow<-which(TargetTable.df$V1=="CREATE")
  TargetTable.df<-TargetTable.df[-c(1:CreateRow),]
  EndRow<-which(TargetTable.df$V1==")")
  TargetTable.df<-TargetTable.df[-c(EndRow:nrow(TargetTable.df)),]
  TargetTable.df$V1<-as.character(TargetTable.df$V1)
  #Once we have the table in, the next step is to clean up anything seperated on spaces
  #that should not have been for our purposes.
  # 
  TargetTable.df$V2<-as.character(TargetTable.df$V2)
  TargetTable.df$V2[substring(TargetTable.df$V2,1,9)=="[decimal]"]<-paste(
    TargetTable.df$V2[substring(TargetTable.df$V2,1,9)=="[decimal]"],
    TargetTable.df$V3[substring(TargetTable.df$V2,1,9)=="[decimal]"]
  )
  #Just in case the only Not NULL is a decimal
  TargetTable.df$V3<-as.character(TargetTable.df$V3)
  TargetTable.df$V3[substring(TargetTable.df$V2,1,9)=="[decimal]"]<-
    as.character(TargetTable.df$V4[substring(TargetTable.df$V2,1,9)=="[decimal]"])
  TargetTable.df$V4[substring(TargetTable.df$V2,1,9)=="[decimal]"]<-""
  
  TargetTable.df<-TargetTable.df[,c(1:3)]
  colnames(TargetTable.df)<-c("VariableName",
                              "VariableType",
                              "Nullable")
  TargetTable.df$Nullable<-gsub(",","",TargetTable.df$Nullable)
  TargetTable.df$VariableName<-gsub("\t","",TargetTable.df$VariableName)
  TargetTable.df
}

convert_all_of_type<-function(TargetTable.df,
                           OldType,
                           NewType,
                           Schema,
                           TableName){
  #Limit it to just relevant variables
  TargetTable.df<-TargetTable.df[TargetTable.df$VariableType==OldType,]
  if(nrow(TargetTable.df)==0)
    stop("OldType not found in table")
  ChangeList<-paste(
    "Alter Table ",Schema,".",TableName,"\n",
    "Alter Column ",TargetTable.df$VariableName," ",
    NewType," ",TargetTable.df$Nullable,sep="")
  ChangeList
}

list_problem_type<-function(TargetTable.df){
  TargetTable.df[TargetTable.df$VariableType=="[varchar](max)",]
}


translate_name<-function(TargetTable.df){
  lookup.NameConversion<-read.csv("ImportAids\\NameConversion.csv",
                                  stringsAsFactors = FALSE)
  if(!"SourceVariableName" %in% colnames(TargetTable.df)){
    colnames(TargetTable.df)[1]<-"SourceVariableName" 
  }

  TargetTable.df$OriginalSourceVariableName<-TargetTable.df$SourceVariableName
  TargetTable.df$SourceVariableName<-tolower(TargetTable.df$SourceVariableName)
  
  #Protection against one-to-many joins.
  lookup.NameConversion$SourceVariableName<-tolower(lookup.NameConversion$SourceVariableName)
  if(any(duplicated(lookup.NameConversion$SourceVariableName))){
    print(unique(lookup.NameConversion$SourceVariableName[duplicated(lookup.NameConversion$SourceVariableName)]))
    stop("Duplicate entries in SourceVariableName")
  }
  
  TargetTable.df<-dplyr::left_join(TargetTable.df,lookup.NameConversion)
  # TargetTable.df$VariableName<-gsub("_","",TargetTable.df$VariableName)
  
  if(any(is.na(TargetTable.df$CSISvariableName))){
    print(unique(TargetTable.df$SourceVariableName[is.na(TargetTable.df$CSISvariableName)]))
    stop("Unmatched columns in SourceVariableName.")
  }
  
  #Protection against duplicate CSISvariableName
  if(any(duplicated(TargetTable.df$CSISvariableName))){
    print(unique(TargetTable.df$CSISvariableName[duplicated(TargetTable.df$CSISvariableName)]))
    stop("Duplicate entries in CSISvariableName after matching")
  }
  
  
  
  
  TargetTable.df$SourceVariableName<-TargetTable.df$OriginalSourceVariableName

  
  TargetTable.df<-subset(TargetTable.df,select=-c(OriginalSourceVariableName))
  
  
  TargetTable.df$CSISvariableName[TargetTable.df$SourceVariableName %in% 
                   lookup.NameConversion$CSISvariableName]<-
    TargetTable.df$SourceVariableName[TargetTable.df$SourceVariableName %in% 
                     lookup.NameConversion$CSISvariableName]
  
  
  
  TargetTable.df
}



merge_source_and_csis_name_tables<-function(SourceTable.df,
    CSIStable.df,
    drop_unmatched=TRUE){
  colnames(SourceTable.df)[1:3]<-c("SourceVariableName",
                                   "SourceVariableType",
                                   "SourceNullable")
  if(drop_unmatched==FALSE){
    SourceTable.df$CSISvariableName_unmatched<-SourceTable.df$CSISvariableName
  }
  SourceTable.df$CSISvariableNameLower<-tolower(as.character(SourceTable.df$CSISvariableName))
  SourceTable.df<-subset(SourceTable.df,select=-c(CSISvariableName))
  colnames(CSIStable.df)[1:3]<-c("CSISvariableName",
                                 "CSISvariableType",
                                 "CSISnullable")
  CSIStable.df$CSISvariableNameLower<-tolower(as.character(CSIStable.df$CSISvariableName))
  SourceTable.df<-plyr::join(SourceTable.df,CSIStable.df, by="CSISvariableNameLower",match="first")
  SourceTable.df<-subset(SourceTable.df,select=-c(CSISvariableNameLower))
  if(drop_unmatched==FALSE){
    SourceTable.df$CSISvariableName[is.na(SourceTable.df$CSISvariableName)]<-
      SourceTable.df$CSISvariableName_unmatched[is.na(SourceTable.df$CSISvariableName)]
    SourceTable.df<-subset(SourceTable.df,select=-c(CSISvariableName_unmatched))
    SourceTable.df$CSISvariableType[is.na(SourceTable.df$CSISvariableType)]<-
      SourceTable.df$SourceVariableType[is.na(SourceTable.df$CSISvariableType)]
    SourceTable.df$CSISnullable[is.na(SourceTable.df$CSISnullable)]<-
      SourceTable.df$SourceNullable[is.na(SourceTable.df$CSISnullable)]
  }
  SourceTable.df
}



create_csis_dates<-function(Schema,TableName){
  paste("ALTER TABLE ",Schema,".",TableName,"\n",
        "CREATE COLUMN CSISmodifiedDate datetime2 NOT NULL default getdate(),\n",
        "CSIScreatedDate datetime2 NOT NULL default getdate()\n",
        sep="")
}

convert_switch<-function(MergeTable.df,
                         DateType=101,
                         IsTryConvert=FALSE){
  #I swear I had this working, but then it broke hard and every time I tried to 
  #debug it, the crash took minutes to resolve.
  # OneSwitch<-function(VariableName,
  #                     VariableShortType,
  #                     VariableFullType){
  #   ConvertText<-ifelse(IsTryConvert,"Try_Convert","Convert")
  #   Outcome<-switch(VariableShortType,
  #                   "[decimal]"=paste(ConvertText,"(",VariableFullType,
  #                                     ", ",ConvertText,"(real,",
  #                                     VariableName,"))",
  #                                     sep=""
  #                   ),
  #                   "[date]"=paste(ConvertText,"([date], ",
  #                                  VariableName,
  #                                  ",",as.character(DateType),")",
  #                                  sep=""
  #                   ),
  #                   paste(ConvertText,"(",VariableFullType,", ",
  #                         VariableName,
  #                         ")",
  #                         sep=""
  #                   )
  #   )
  #   Outcome
  # }
  # 
  # 
  # MergeTable.df$VariableShortType<-substr(MergeTable.df$CSISvariableType,1,
  #                                         regexpr(']',MergeTable.df$CSISvariableType))
  # 
  # MergeTable.df<-
  #   ddply(MergeTable.df,
  #                      .(SourceVariableName,VariableShortType,CSISvariableType),
  #          transform,
  #                      ConvertList=OneSwitch(SourceVariableName,
  #                                            VariableShortType,
  #                                            CSISvariableType))
  # MergeTable.df
  
    ConvertText<-ifelse(IsTryConvert,"Try_Convert","Convert")
    MergeTable.df$VariableShortType<-substr(MergeTable.df$CSISvariableType,1,
                                            regexpr(']',MergeTable.df$CSISvariableType))

    MergeTable.df$ConvertList<-NA
    SwitchList<-MergeTable.df$SourceVariableType==MergeTable.df$CSISvariableType
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
    MergeTable.df$ConvertList[SwitchList]<-MergeTable.df$SourceVariableName[SwitchList]
    
    
    SwitchList<-MergeTable.df$VariableShortType %in% c("[decimal]","[smallint]","[bigint]")&
      is.na(MergeTable.df$ConvertList)
    MergeTable.df$ConvertList[SwitchList]<-
      paste(ConvertText,"(",
                                      MergeTable.df$CSISvariableType[SwitchList] ,
                                      ", ",ConvertText,"(real,",
                                      MergeTable.df$SourceVariableName[SwitchList] ,"))",
                                      sep=""
                    )
    
    SwitchList<-MergeTable.df$VariableShortType=="[bit]"&
        is.na(MergeTable.df$ConvertList)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
        MergeTable.df$ConvertList[SwitchList]<-
        paste(ConvertText,"(",
              MergeTable.df$CSISvariableType[SwitchList] ,", ",
              "(SELECT ReturnBit from Errorlogging.ConvertYNtoBit(",
              MergeTable.df$SourceVariableName[SwitchList] ,
              ")))",
              sep=""
        )
    
    SwitchList<-MergeTable.df$VariableShortType=="[date]"&
      is.na(MergeTable.df$ConvertList)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
    MergeTable.df$ConvertList[SwitchList]<-
      paste(ConvertText,"([date], ",
                                   MergeTable.df$SourceVariableName[SwitchList] ,
                                   ",",as.character(DateType),")",
                                   sep=""
                    )
    SwitchList<-is.na(MergeTable.df$ConvertList)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
    MergeTable.df$ConvertList[SwitchList]<-
                    paste(ConvertText,"(",
                          MergeTable.df$CSISvariableType[SwitchList] ,", ",
                          MergeTable.df$SourceVariableName[SwitchList] ,
                          ")",
                          sep=""
                    )
    MergeTable.df
}


length_check<-function(data){

    data$length_check<-""

    data$VariableTypeNumber<-as.numeric(
        (substr(data$CSISvariableType,
                regexpr('[(]',data$CSISvariableType)+1,
                regexpr('[)]',data$CSISvariableType)-1)
        ))
        
  #No Colon
    SwitchList<-data$VariableShortType=="[varchar]"&
        data$length_check==""&
        !is.na(data$VariableTypeNumber)&
      (data$is.colon.split=="FALSE" | is.na(data$is.colon.split))
    data$length_check[SwitchList]<-
        paste("OR len(",data$SourceVariableName[SwitchList] ,")",
              ">",data$VariableTypeNumber[SwitchList],"\n"
        )
    
    #Colon Split
    SwitchList<-data$VariableShortType=="[varchar]"&
      data$length_check==""&
      !is.na(data$VariableTypeNumber)&
      (data$is.colon.split=="TRUE")
    data$length_check[SwitchList]<-
      paste("OR len(",
            "(Select LeftOfColon from FPDSTypeTable.leftofcolon(",
            data$SourceVariableName[SwitchList],")))",
            ">",data$VariableTypeNumber[SwitchList],"\n"
      )
    
    
    
    data
}

left_of_colon<-function(data){
  
  data$left_of_colon<-""
  
  #Colon Split
  SwitchList<-!is.na(data$is.colon.split) & data$is.colon.split=="TRUE"
  data$left_of_colon[SwitchList]<-
    paste("(Select LeftOfColon from FPDSTypeTable.leftofcolon(",
          data$SourceVariableName[SwitchList],")) as leftofcolon,\n",
    sep=""
    )

  data
}


create_try_converts<-function(data,
                              Schema,
                              TableName,
                              DateType=101,
                              IncludeAlters=TRUE,
  path="https://raw.githubusercontent.com/CSISdefense/Lookup-Tables/master/style/"){
  #Limit it to just cases where the variable type is changing
  data<-subset(data,SourceVariableType!=data$CSISvariableType)
  if(nrow(data)==0){
    warning("No try_converts necessary")
    return(0)
  }
  data<-convert_switch(data,101,TRUE)
  
  #After hitting an error that there's no column named column
  if("column" %in% colnames(data)){
    data<-read_and_join(data,
                        "Lookup_Column_Key.csv",
                        path="https://raw.githubusercontent.com/CSISdefense/Lookup-Tables/master/style/",
                        directory="",
                        by="column",
                        add_var="is.colon.split",
                        new_var_checked=FALSE
    )
  }
  data<-length_check(data)
  data<-left_of_colon(data)
  
  

  ConvertList<-paste(
    "SELECT DISTINCT ",
    data$SourceVariableName,",\n",
    "len(",data$SourceVariableName,") as Length,\n",
    data$left_of_colon,
    "'",data$CSISvariableType,"' as DestinationType","\n",
    "FROM ",Schema,".",TableName,"\n",
    "WHERE (",
    data$ConvertList,
    " IS NULL AND\n",
    "NULLIF(",data$SourceVariableName,",'') IS NOT NULL)\n",
    data$length_check,
    sep="")
  
  
  #Create an alter to fix that, if not supressed by user
  if(IncludeAlters){
    ConvertList<-rbind(ConvertList,
                       paste("ALTER TABLE ",Schema,".",TableName,"\n",
                             "ALTER COLUMN ",data$SourceVariableName," ",
                             data$CSISvariableType,"\n",sep="")
    )
  }
  
  
  ConvertList
}


count_empties<-function(Table.df,
  Schema,
  TableName){
  
  Table.df$NullCheck<-Table.df$SourceVariableName
  Table.df$NullCheck[substr(Table.df$VariableType,1,9)=="[varchar]" | 
  substr(Table.df$VariableType,1,7)=="varchar"]<-
    paste("nullif(",Table.df$NullCheck[substr(Table.df$VariableType,1,9)=="[varchar]" | 
  substr(Table.df$VariableType,1,7)=="varchar"],",'')",sep="")
  
  InsertList<-"SELECT count(*) as TotalRows,"
  InsertList<-c(InsertList,paste("sum(iif(",Table.df$NullCheck,
    " is null,1,0)) as ",Table.df$SourceVariableName,",",sep=""))
  #Remove the comma from the select list column
  InsertList[length(InsertList)]<-substr(InsertList[length(InsertList)],
    1,
    nchar(InsertList[length(InsertList)])-1)
  
  InsertList<-c(InsertList,
    paste("FROM ",Schema,".",TableName,"\n",sep="")
  )    
  
  InsertList
}




create_update_FPDS<-function(MergeTable.df,
    SourceSchema,
    SourceTableName,
    TargetSchema,
    TargetTableName,
    DateType=101){
  
  update_list<-"UPDATE T SET"
  
  #Remove rows that shouldn't be updated
  MergeTable.df<-MergeTable.df[which(!tolower(MergeTable.df$SourceVariableName) %in% tolower(c(
    "[CSISCreatedDate]",
    "[unique_transaction_id]",
    "[fiscal_year]"))),]

  #Add a null check to columns missing in recent USAspending downloads
  MissingColumns<-which(tolower(MergeTable.df$SourceVariableName) %in% tolower(c(
    "[mod_agency]",
    "[lettercontract]",
    "[majorprogramcode]",
    "[account_title]",
    "[rec_flag]",
    "[parentdunsnumber]",
    "[locationcode]",
    "[statecode]",
    "[smallbusinesscompetitivenessdemonstrationprogram]",
    "[isarchitectureandengineering]",
    "[isconstructionfirm]",
    "[isotherbusinessororganization]",
    "[iswomenownedsmallbusiness]",
    "[isecondisadvwomenownedsmallbusiness]",
    "[isjointventurewomenownedsmallbusiness]",
    "[isjointventureecondisadvwomenownedsmallbusiness]",
    "[prime_awardee_executive5]",
    "[prime_awardee_executive4]",
    "[prime_awardee_executive3]",
    "[prime_awardee_executive2]",
    "[prime_awardee_executive1]",
    "[progsourcesubacct]")))
  
  MergeTable.df$NullCheck<-paste("S.",MergeTable.df$SourceVariableName,sep="")
  MergeTable.df$NullCheck[MissingColumns]<-
    paste("coalesce(nullif(",MergeTable.df$NullCheck[MissingColumns],",''),",
      "T.",MergeTable.df$CSISvariableName[MissingColumns],")",sep="")
  
  
    update_list<-c(update_list,paste(MergeTable.df$CSISvariableName,"=",
    MergeTable.df$NullCheck,",",sep=""))
  #Remove the comma from the select list column
  update_list[length(update_list)]<-substr(update_list[length(update_list)],
    1,
    nchar(update_list[length(update_list)])-1)
  #Wrap up
  update_list<-c(update_list,
    paste("FROM ",TargetSchema,".",TargetTableName," as T",sep="")
  )    
  update_list<-c(update_list,
    paste("INNER Join ",SourceSchema,".",SourceTableName," as S",sep=""),
    "ON s.Unique_Transaction_ID=t.Unique_Transaction_ID and",
    "s.Fiscal_Year=t.Fiscal_Year",
    "WHERE s.last_modified_date>=t.last_modified_date"
  )    
  
    
  update_list
}



create_insert<-function(MergeTable.df,
                       SourceSchema,
                       SourceTableName,
                       TargetSchema,
                       TargetTableName,
                       DateType=101){
  MergeTable.df<-convert_switch(MergeTable.df,101,FALSE)
  MergeTable.df<-MergeTable.df %>% filter(IsDroppedNameField==FALSE | is.na(IsDroppedNameField))
  InsertList<-paste("INSERT INTO ",TargetSchema,".",TargetTableName,"\n",
                    "(",sep="")
  InsertList<-c(InsertList,paste(MergeTable.df$CSISvariableName,",",sep=""))
  #Remove the comma from the last insert list column
  InsertList[length(InsertList)]<-gsub(",","",InsertList[length(InsertList)])
  InsertList<-c(InsertList,")\n SELECT ")
  InsertList<-c(InsertList,paste(MergeTable.df$ConvertList,",",sep=""))
  #Remove the comma from the select list column
  InsertList[length(InsertList)]<-substr(InsertList[length(InsertList)],1,
                                       nchar(InsertList[length(InsertList)])-1)
  
  InsertList<-c(InsertList,
                    paste("FROM ",SourceSchema,".",SourceTableName,"\n",sep="")
  )
  InsertList
}



convert_field_to_foreign_key<-function(FKschema,
                                   FKtable,
                                   FKcolumn,
                                   TargetTable.df,
                                   PKschema,
                                   PKtable,
                                   PKcolumn=PKtable){

  pkTable.df<-read.csv(file.path("ImportAids","ErrorLogging_PrimaryKeyList.csv")
                       ,header=TRUE,sep=",") %>% remove_bom()
  pkTable.df<-subset(pkTable.df,
                     toupper(PKSchemaName)==toupper(PKschema) &
                       toupper(PKTableName)==toupper(PKtable) &
                     toupper(PKColumnName)==toupper(PKcolumn))
  if(nrow(pkTable.df)==0)
    stop(paste("No Primary Key match for",PKschema,PKtable,PKcolumn))
  #Test if the field can be converted to the primary keys typed.

  
  if(!"SourceVariableType" %in% colnames(TargetTable.df)){
    colnames(TargetTable.df)[1:3]<-c("SourceVariableName" ,
                                "SourceVariableType",
                                "SourceVariableNullable")
  }
  
  TargetTable.df<-subset(TargetTable.df,
                         toupper(SourceVariableName)==toupper(FKcolumn))
  if(nrow(TargetTable.df)==0)
    stop(paste("No Source match for",FKcolumn))
  
  
  Output<-''
  TargetTable.df<-join(TargetTable.df,pkTable.df,
                       by=c("PKSchemaName",
                            "PKTableName",
                            "PKColumnName")
                            )
  #If the VariableTypes don't match, create a select and alter to fix that'
  
    TryConvertTable.df<-TargetTable.df
    TryConvertTable.df$CSISvariableName<-pkTable.df$PKColumnName
    TryConvertTable.df$CSISvariableType<-paste('[',pkTable.df$ColumnDataType,']',sep='')
    if(TryConvertTable.df$CSISvariableType[1]=="[varchar]"){
      TryConvertTable.df$CSISvariableType<-paste(TryConvertTable.df$CSISvariableType,
                                             "(",pkTable.df$ColumnLength,")",
                                             sep="")
    }
  if(TryConvertTable.df$CSISvariableType!=TryConvertTable.df$SourceVariableType){  
    Output<-create_try_converts(TryConvertTable.df,
                                FKschema,
                                FKtable)
    
    rm(TryConvertTable.df)
  }
  
  #Select all of the unmached values in the foreign key table
  Output<-rbind(Output,
                paste("SELECT DISTINCT fk.",FKcolumn,"\n",
                      "FROM ",FKschema,".",FKtable," as fk\n",
                      "LEFT OUTER JOIN ",PKschema,".",PKtable," as pk\n",
                      "On pk.",PKcolumn,"=fk.",FKcolumn,"\n",
                      "WHERE pk.",PKcolumn," is NULL\n",sep="")
  )
  
  #Insert unmatched values into the primary key table
  Output<-rbind(Output,
                paste("INSERT INTO ",PKschema,".",PKtable,"\n",
                      "(",PKcolumn,")\n",
                    "SELECT DISTINCT fk.",FKcolumn,"\n",
                      "FROM ",FKschema,".",FKtable," as fk\n",
                      "LEFT OUTER JOIN ",PKschema,".",PKtable," as pk\n",
                      "On pk.",PKcolumn,"=fk.",FKcolumn,"\n",
                      "WHERE pk.",PKcolumn," is NULL\n",sep="")
  )
  
  Output<-rbind(Output,
                paste("ALTER TABLE ",FKschema,".",FKtable,"\n",
                      "ADD CONSTRAINT fk_",gsub("\\[","",gsub("\\]","",FKschema))
                      ,"_",gsub("\\[","",gsub("\\]","",FKtable)),"_",
                      gsub("-","_",gsub("\\[","",gsub("\\]","",FKcolumn))),
                      " foreign key(",FKcolumn,")\n"
                      ,"references ",PKschema,".",PKtable,"(",PKcolumn,")\n",sep="")
  )
  Output
}

get_CSISvariableNameToPrimaryKey<-function(){
  lookup.CSISvariableNameToPrimaryKey<-read.csv(file.path("ImportAids","ErrorLogging_ForeignKeyList.csv"),
                                                stringsAsFactors = FALSE,
                                                na.strings=c(""))
  
  lookup.CSISvariableNameToPrimaryKey$FKColumnNameUp<-toupper(lookup.CSISvariableNameToPrimaryKey$FKColumnName)
  
  #First consolidate down to only CSISvariable names and keys, using upper to handle case sensitivity
  lookup.CSISvariableNameToPrimaryKey <- lookup.CSISvariableNameToPrimaryKey %>% remove_bom() %>%
    dplyr::rename(CSISvariableName= FKColumnName) %>% 
    dplyr::group_by(FKColumnNameUp,PKSchemaName,PKTableName,PKColumnName) %>%
    dplyr::summarise(CSISvariableName=max(CSISvariableName)) %>%
    dplyr::group_by(CSISvariableName) %>%
    dplyr::select(-FKColumnNameUp) 
  
  #Handle those cases with multiple primary keys (typically these involves heirarchical pks that appear across multiple tables)
  #The core one should share a name with the column name (with a few exceptions, like contractr.parentcontractor)
  lookup.CSISvariableNameToPrimaryKey <- lookup.CSISvariableNameToPrimaryKey %>%
    dplyr::mutate(RepeatCount=length(CSISvariableName),
                  AnyExact=max(ifelse(toupper(PKTableName)==toupper(PKColumnName),1,0))) %>%
    dplyr::filter(AnyExact==0 | RepeatCount==1 | toupper(PKTableName)==toupper(PKColumnName)) %>%
    dplyr::mutate(RepeatCount=length(CSISvariableName))
  
  print(lookup.CSISvariableNameToPrimaryKey%>% dplyr::filter(RepeatCount>1))
  if(max(lookup.CSISvariableNameToPrimaryKey$RepeatCount>1))
    stop("Repeated CSISvariableName")
  lookup.CSISvariableNameToPrimaryKey$CSISvariableName<-paste("[",lookup.CSISvariableNameToPrimaryKey$CSISvariableName,"]",sep="")
  
  lookup.CSISvariableNameToPrimaryKey
}

create_foreign_key_assigments<-function(Schema,
                              TableName){
  
  MergeTable.df<-read_create_table(paste(Schema,"_",TableName,".txt",sep=""))
  MergeTable.df<-translate_name(MergeTable.df)
  
  #Limit it to just cases where the variable type is changing
  lookup.CSISvariableNameToPrimaryKey<-get_CSISvariableNameToPrimaryKey()
  
  
  MergeTable.df<-join(MergeTable.df,lookup.CSISvariableNameToPrimaryKey,
                      by="CSISvariableName")
  MergeTable.df<-subset(MergeTable.df,!is.na(PKSchemaName))
  if(nrow(MergeTable.df)==0){
    warning("No foreign keys to assign")
    return(0)
  }
  ForeignKeyList<-''
  for(i in 1:nrow(MergeTable.df))
    ForeignKeyList<-rbind(ForeignKeyList,
                          convert_field_to_foreign_key(Schema,TableName,MergeTable.df$SourceVariableName[i],
                                                   MergeTable.df,
                                                   MergeTable.df$PKSchemaName[i],
                                                   MergeTable.df$PKTableName[i],
                                                   MergeTable.df$PKColumnName[i])
    )
  

  write(ForeignKeyList,
        paste(Schema,"_",TableName,"_foreign_key.txt",sep=""), 
        append=FALSE)  
  
    ForeignKeyList
}


match_two_tables<-function(NewSchema,NewTable,TargetSchema,TargetTable){
  #******Importing into Voter_VoterList_2016_07_14.txt
  NewTableType.df<-read_create_table(paste(NewSchema,"_",NewTable,".txt",sep=""))
  NewTableType.df<-translate_name(NewTableType.df)
  
  #Sync up with the VID Table
  TargetTableType.df<-read_create_table(paste(TargetSchema,"_",TargetTable,".txt",sep=""))
  MergeTable.df<-merge_source_and_csis_name_tables(NewTableType.df,TargetTableType.df)
  TryConvertList<-create_try_converts(MergeTable.df,NewSchema,NewTable)
  write(TryConvertList,
        paste(NewSchema,"_",NewTable,"_to_",TargetSchema,"_",TargetTable,"_","try_convert.txt",sep=""), 
        append=TRUE)
  
  #Transfer from Voter.VoterList_2016_07_14 to Voter.VID
  MergeTable.df<-subset(MergeTable.df,!is.na(CSISvariableType))
  
  InsertList<-create_insert(MergeTable.df,
                           NewSchema,
                           NewTable,
                           TargetSchema,
                           TargetTable,
                           DateType=101)
  write(InsertList,
        paste(NewSchema,"_",NewTable,"_to_",TargetSchema,"_",TargetTable,"_","Insert.txt",sep=""))
}


shift_table<-function(Schema,
                     Table,
                     NColShift,
                     FirstColumnName=NA,
                     WhereValue=NA){
  TableType.df<-read_create_table(paste(Schema,"_",Table,".txt",sep=""))  
  ListLength<-length(TableType.df$VariableName)
  FirstColumn<-1
  if(!is.na(FirstColumnName)){
    FirstColumn<-which(toupper(TableType.df$VariableName) %in% toupper(c(FirstColumnName,paste("[",FirstColumnName,"]",sep=""))))
    if(length(FirstColumn)==0) return(paste("Invalid FirstColumnName:",FirstColumnName))
  }
  TargetNameList<-TableType.df$VariableName[FirstColumn:(ListLength-NColShift)]
  SourceNameList<-TableType.df$VariableName[(FirstColumn+NColShift):ListLength]
  
  if(is.na(WhereValue)) WhereValue<-"--Add Where criteria here"
  
  Output<- "SELECT "
  Output<-rbind(Output,paste(TargetNameList,"=", SourceNameList,",",collapse="\n"))
  Output[length(Output)]<-substring(Output[length(Output)],1,nchar(Output[length(Output)])-1)
  Output<- rbind(Output,paste("FROM ",Schema,".",Table,sep=""))
  Output<- rbind(Output,paste("WHERE",WhereValue,"\n\n"))
  Output<- rbind(Output,paste("UPDATE ",Schema,".",Table,"\n",
                              "SET ",sep=""
  ))
  Output<-rbind(Output,paste(TargetNameList,"=", SourceNameList,",",collapse="\n"))
  Output[length(Output)]<-substring(Output[length(Output)],1,nchar(Output[length(Output)])-1)
  Output<- rbind(Output,paste("WHERE",WhereValue,"\n\n"))
  write(Output,
        paste("Shift_",Schema,"_",Table,"_by_",NColShift,".txt",sep=""),
        append=FALSE)
}
