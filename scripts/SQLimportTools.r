library(tidyr)
library(csis360)
library(dplyr)

read_create_table<-function(FileName,dir="ImportAids\\"){
  if(!is.null(dir)) FileName<-file.path(dir,FileName)
  TargetTable.df<-read.csv(FileName,header=FALSE,sep=" ")
  
  #For now we're ignoring everything except the lines describing variable types
  CreateRow<-which(TargetTable.df$V1=="CREATE")
  TargetTable.df<-TargetTable.df[-c(1:CreateRow),]
  EndRow<-min(which(TargetTable.df$V1==")" | TargetTable.df$V2=="CONSTRAINT"))
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
  id_row<-which(substring(TargetTable.df$V3,1,8)=="IDENTITY")
  TargetTable.df$V2[id_row]<-paste(
    TargetTable.df$V2[id_row],
    TargetTable.df$V3[id_row]
  )
  if("V4" %in% colnames(TargetTable.df)){
    TargetTable.df$V3[id_row]<-as.character(TargetTable.df$V4[id_row])
    TargetTable.df$V4[id_row]<-""
  }
  else if(length(id_row)>0 &  all(TargetTable.df$V1[id_row+1]=="NOT")){
    TargetTable.df$V3<-as.character(TargetTable.df$V3)
    TargetTable.df$V3[id_row]<-"NOT NULL,"
    TargetTable.df<-TargetTable.df[-(id_row+1),]
    TargetTable.df$V3<-factor(TargetTable.df$V3)
  }
  rm(id_row)
  
  
  #Just in case the only Not NULL is a decimal
  TargetTable.df$V3<-as.character(TargetTable.df$V3)
  #In the saved version of the file, the null is shunted to column four
  if("V4" %in% colnames(TargetTable.df)){
    TargetTable.df$V3[substring(TargetTable.df$V2,1,9)=="[decimal]"]<-
      as.character(TargetTable.df$V4[substring(TargetTable.df$V2,1,9)=="[decimal]"])
    TargetTable.df$V4[substring(TargetTable.df$V2,1,9)=="[decimal]"]<-""
  }
  #In the script outputted version of the file, it's shunted to the next line.
  else {
    dec_row<-which(substring(TargetTable.df$V2,1,9)=="[decimal]")
    TargetTable.df$V3[dec_row]<-TargetTable.df$V1[dec_row+1]
    if(length(dec_row)>0)
      TargetTable.df<-TargetTable.df[-(dec_row+1),]
  }
  #Handle NOT NULL which can split across two lines
  null_row<-which(TargetTable.df$V1=="NULL,")
  if(all(TargetTable.df$V3[null_row-1]=="NOT")){
    TargetTable.df$V3<-as.character(TargetTable.df$V3)
    TargetTable.df$V3[null_row-1]<-"NOT NULL,"
    TargetTable.df<-TargetTable.df[-null_row,]
    TargetTable.df$V3<-factor(TargetTable.df$V3)
  }
  else stop("NULLs, in first column that don't have a matching NOT")
  
  
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


translate_name<-function(TargetTable.df,test_only=FALSE){
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
    print(all_duplicate(TargetTable.df[,c("SourceVariableName","CSISvariableName")],key="CSISvariableName"))
      # unique(TargetTable.df[duplicated(TargetTable.df$CSISvariableName),c("SourceVariableName","CSISvariableName")])
      # )
    stop("Duplicate entries in CSISvariableName after matching")
  }
  #Add the CSISvariableName fields: IsDroppedNameField	Pair
  TargetTable.df<-read_and_join_experiment(TargetTable.df,
                           path="",dir="ImportAids\\",lookup_file = "CSISvariableName.csv",
                           skip_check_var = "IsDroppedNameField")
  
  TargetTable.df$SourceVariableName<-TargetTable.df$OriginalSourceVariableName

  
  TargetTable.df<-subset(TargetTable.df,select=-c(OriginalSourceVariableName))
  
  
  TargetTable.df$CSISvariableName[TargetTable.df$SourceVariableName %in% 
                   lookup.NameConversion$CSISvariableName]<-
    TargetTable.df$SourceVariableName[TargetTable.df$SourceVariableName %in% 
                     lookup.NameConversion$CSISvariableName]
  
  
  if(test_only) return(TRUE)
  TargetTable.df
}



merge_source_and_csis_name_tables<-function(SourceTable.df,
    CSIStable.df,
    drop_unmatched=TRUE){
  colnames(SourceTable.df)[1:3]<-c("SourceVariableName",
                                   "SourceVariableType",
                                   "SourceNullable")
  # if("CSISvariableName" %in% colnames(SourceTable.df)){
  if(drop_unmatched==FALSE){
    SourceTable.df$CSISvariableName_unmatched<-SourceTable.df$CSISvariableName
  }
  SourceTable.df$CSISvariableNameLower<-tolower(as.character(SourceTable.df$CSISvariableName))
  SourceTable.df<-subset(SourceTable.df,select=-c(CSISvariableName))
  colnames(CSIStable.df)[1:3]<-c("CSISvariableName",
                                 "CSISvariableType",
                                 "CSISnullable")
  CSIStable.df$CSISvariableNameLower<-tolower(as.character(CSIStable.df$CSISvariableName))
  SourceTable.df<-left_join(SourceTable.df,CSIStable.df, by="CSISvariableNameLower",match="first")
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
                         IsTryConvert=FALSE,
                         Apply_Drop=TRUE){
  #I swear I had this working, but then it broke hard and every time I tried to 
  #debug it, the crash took minutes to resolve.
  # OneSwitch<-function(VariableName,
  #                     CSISvariableShortType,
  #                     VariableFullType){
  #   ConvertText<-ifelse(IsTryConvert,"Try_Convert","Convert")
  #   Outcome<-switch(CSISvariableShortType,
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
  # MergeTable.df$CSISvariableShortType<-substr(MergeTable.df$CSISvariableType,1,
  #                                         regexpr(']',MergeTable.df$CSISvariableType))
  # 
  # MergeTable.df<-
  #   ddply(MergeTable.df,
  #                      .(SourceVariableName,CSISvariableShortType,CSISvariableType),
  #          transform,
  #                      ConvertList=OneSwitch(SourceVariableName,
  #                                            CSISvariableShortType,
  #                                            CSISvariableType))
  # MergeTable.df
  if(any(is.na(MergeTable.df$CSISvariableType)))
    stop("Some columns are missing a destination type")
  
  ConvertText<-ifelse(IsTryConvert,"Try_Convert","Convert")
  MergeTable.df$CSISvariableShortType<-substr(MergeTable.df$CSISvariableType,1,
                                          regexpr(']',MergeTable.df$CSISvariableType))
  MergeTable.df$SourceVariableShortType<-substr(MergeTable.df$SourceVariableType,1,
                                              regexpr(']',MergeTable.df$SourceVariableType))
  
  MergeTable.df$ConvertList<-NA
  
  #Conversions within the same type
  SwitchList<-MergeTable.df$SourceVariableType==MergeTable.df$CSISvariableType
  if(Apply_Drop==TRUE)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
  MergeTable.df$ConvertList[SwitchList]<-MergeTable.df$SourceVariableName[SwitchList]
  
    
  #Converting to a numerical type
  SwitchList<-MergeTable.df$CSISvariableShortType %in% c("[decimal]","[smallint]","[bigint]")&
    is.na(MergeTable.df$ConvertList)
  MergeTable.df$ConvertList[SwitchList]<-
    paste(ConvertText,"(",
          MergeTable.df$CSISvariableType[SwitchList] ,
          ", ",ConvertText,"(real,nullif(",
          MergeTable.df$SourceVariableName[SwitchList] ,",'')))",
          sep=""
    )
  if(any(is.na(MergeTable.df$ConvertList[SwitchList]))) stop("NA ConvertList")
  
  #Converting to bit from any type
  SwitchList<-MergeTable.df$CSISvariableShortType=="[bit]"&
    is.na(MergeTable.df$ConvertList)
  if(Apply_Drop==TRUE)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
  MergeTable.df$ConvertList[SwitchList]<-
    paste(ConvertText,"(",
          MergeTable.df$CSISvariableType[SwitchList] ,", ",
          "(SELECT ReturnBit from Errorlogging.ConvertYNtoBit(",
          MergeTable.df$SourceVariableName[SwitchList] ,
          ")))",
          sep=""
    )
  if(any(is.na(MergeTable.df$ConvertList[SwitchList]))) stop("NA ConvertList")
  
  #Converting to date from any type
  SwitchList<-MergeTable.df$CSISvariableShortType %in% c("[date]")&
    is.na(MergeTable.df$ConvertList)
  
  if(Apply_Drop==TRUE)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
  MergeTable.df$ConvertList[SwitchList]<-
    paste(ConvertText,"(",MergeTable.df$CSISvariableType[SwitchList],", nullif(",
          MergeTable.df$SourceVariableName[SwitchList] ,
          ",''),",as.character(DateType),")",
          sep=""
    )
  if(any(is.na(MergeTable.df$ConvertList[SwitchList]))) stop("NA ConvertList")
  
  #Converting to datetime2 from any type
  SwitchList<-MergeTable.df$CSISvariableShortType %in% c("[datetime2]")&
    is.na(MergeTable.df$ConvertList)
  
  if(Apply_Drop==TRUE)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
  MergeTable.df$ConvertList[SwitchList]<-
    paste(ConvertText,"(",MergeTable.df$CSISvariableType[SwitchList],", nullif(",
          MergeTable.df$SourceVariableName[SwitchList] ,",''))", #Not applying DateType to datetime2
          sep=""
    )
  if(any(is.na(MergeTable.df$ConvertList[SwitchList]))) stop("NA ConvertList")
  
  
  #All remaining types
  SwitchList<-is.na(MergeTable.df$ConvertList)
  if(Apply_Drop==TRUE)
    SwitchList[MergeTable.df$IsDroppedNameField==TRUE] <-FALSE
  MergeTable.df$ConvertList[SwitchList]<-
    paste(ConvertText,"(",
          MergeTable.df$CSISvariableType[SwitchList] ,", ",
          MergeTable.df$SourceVariableName[SwitchList] ,
          ")",
          sep=""
    )
  if(any(is.na(MergeTable.df$ConvertList[SwitchList]))) stop("NA ConvertList")
  
  MergeTable.df
}


length_check<-function(data){

    data$length_check<-""

    data$VariableTypeNumber<-as.numeric(
        (substr(data$CSISvariableType,
                regexpr('[(]',data$CSISvariableType)+1,
                regexpr('[)]',data$CSISvariableType)-1)
        ))

    
    #No Colon and Varchar to Varchar
    SwitchList<-data$CSISvariableShortType=="[varchar]"&
      data$SourceVariableShortType=="[varchar]" &
      data$length_check==""&
      !is.na(data$VariableTypeNumber)
    if("is.colon.split" %in% colnames(data))
      SwitchList<-SwitchList&(data$is.colon.split=="FALSE" | is.na(data$is.colon.split))
    
    data$length_check[SwitchList]<-
      paste("max(len(",data$SourceVariableName[SwitchList] ,"))",sep=""
      )
    
    
            
    #No Colon and other  to Varchar

    SwitchList<-data$CSISvariableShortType=="[varchar]"&
        data$length_check==""&
        !is.na(data$VariableTypeNumber)
    if("is.colon.split" %in% colnames(data))
       SwitchList<-SwitchList&(data$is.colon.split=="FALSE" | is.na(data$is.colon.split))
    data$length_check[SwitchList]<-
        paste("OR len(",data$SourceVariableName[SwitchList] ,")",
              ">",data$VariableTypeNumber[SwitchList],"\n"
        )
    
    
    
    #Colon Split
    if("is.colon.split" %in% colnames(data)){
      SwitchList<-data$CSISvariableShortType=="[varchar]"&
        data$length_check==""&
        !is.na(data$VariableTypeNumber)&
        (data$is.colon.split=="TRUE")
      data$length_check[SwitchList]<-
        paste("OR len(",
              "(Select LeftOfColon from FPDSTypeTable.leftofcolon(",
              data$SourceVariableName[SwitchList],")))",
              ">",data$VariableTypeNumber[SwitchList],"\n"
        )
    }
    
    
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
  path="https://raw.githubusercontent.com/CSISdefense/Lookup-Tables/master/style/",
  Add_Colon_Split=FALSE,
  Apply_Drop=TRUE,
  IncludeSingle=TRUE,
  IncludeMultiple=TRUE){
  #Limit it to just cases where the variable type is changing
  data<-subset(data,SourceVariableType!=data$CSISvariableType)
  
  
  if(nrow(data)==0){
    warning("No try_converts necessary")
    return(0)
  }
  data<-convert_switch(data,DateType,TRUE,Apply_Drop=Apply_Drop)
  if(any(is.na(data$ConvertList))) stop("NA ConvertList")
  
  #This is only relevant to legacy FPDS
  if(Add_Colon_Split==TRUE){
    #Join up the files
    data$column<-data$SourceVariableName
    data$column<-substring(data$column,2,nchar(data$column)-1)
    
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
  
  #Single column conversion checks
  
  if(IncludeSingle)
    ConvertList<-paste("SELECT DISTINCT ",
                       data$SourceVariableName,",\n",
                       "len(",data$SourceVariableName,") as Length,\n",
                       data$left_of_colon,
                       "'",data$CSISvariableType,"' as DestinationType","\n",
                       "FROM ",Schema,".",TableName,"\n",
                       "WHERE (",
                       data$ConvertList,
                       " IS NULL AND\n",
                       "NULLIF(",data$SourceVariableName,",'') IS NOT NULL)\n",
                       data$length_check,sep="")
  else ConvertList<-NULL
  
  #Create an alter to fix that, if not supressed by user
  if(IncludeAlters)
    ConvertList<-rbind(ConvertList,
                       paste("ALTER TABLE ",Schema,".",TableName,"\n",
                             "ALTER COLUMN ",data$SourceVariableName," ",
                             data$CSISvariableType,"\n",sep="")
    )
  
  
  if(IncludeMultiple){
    varchar_list<-data$CSISvariableShortType=="[varchar]"&
      data$SourceVariableShortType=="[varchar]" &
      !is.na(data$VariableTypeNumber)
    
    bit_list<- data$CSISvariableShortType=="[bit]"
    
    
    not_varchar_or_bit<-!varchar_list & !bit_list
    ConvertList<-c(ConvertList,
                   paste("--Check across all non-varchar and non-bit destination types for failed tryconverts. Note you have to remove an extraneous comma from the first item.",
                         "\nSELECT\n",
                         paste(
                           paste("\t,max(iif(",data$ConvertList[not_varchar_or_bit]," is null and\n\t\tnullif(",data$SourceVariableName[not_varchar_or_bit],",'') is not null,1,0)) as ",data$SourceVariableName[not_varchar_or_bit],
                                 sep = ""),
                           collapse="\n"),
                         "\n\tFROM ",Schema,".",TableName,"\n",
                         collapse="",sep="")
    )
    
    ConvertList<-c(ConvertList,
                   paste("--Check across all bit destination types for failed tryconverts. Note you have to remove an extraneous comma from the first item.",
                         "\nSELECT\n",
                         paste(
                           paste(",max(",data$SourceVariableName[bit_list],") as ",
                                 data$SourceVariableName[bit_list],
                                 sep = ""),
                           collapse="\n"),
                         "\nFROM (SELECT\n",
                         paste(
                           paste("\t,(SELECT ReturnBit from ErrorLogging.IsFailedConvertYNtoBit(",data$SourceVariableName[bit_list],")) as ",data$SourceVariableName[bit_list],
                                 sep = ""),
                           collapse="\n"),
                         "\n\tFROM ",Schema,".",TableName,") as ml\n",
                         collapse="",sep="")
    )
    
    
    #
    
    
    if(any(varchar_list)){
      ConvertList<-c(ConvertList,
                     paste( "--Varchar to varchar group check. Note you have to remove an extraneous comma from the first item.", 
                            "\nSELECT\n",
                            paste(
                              paste(",iif(",data$SourceVariableName[varchar_list],
                                    ">",data$VariableTypeNumber[varchar_list],
                                    ",",data$SourceVariableName[varchar_list],",NULL) as ",
                                    data$SourceVariableName[varchar_list],
                                    sep = ""),
                              collapse="\n"),
                            "\nFROM (SELECT\n",
                            paste(
                              paste("\t,",data$length_check[varchar_list]," as ",data$SourceVariableName[varchar_list],
                                    sep = ""),
                              collapse="\n"),
                            "\n\tFROM ",Schema,".",TableName,") as ml\n",
                            collapse="")
      )
    } 
    
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
    DateType=101,
    drop_name=FALSE,
    update_with_null=FALSE){
  
  update_list<-"UPDATE T SET"
  
  if("IsDroppedNameField" %in% colnames(MergeTable.df) & drop_name==TRUE)
    MergeTable.df<-MergeTable.df %>% filter(IsDroppedNameField==FALSE | is.na(IsDroppedNameField))
  
  
  #Remove rows that shouldn't be updated
  MergeTable.df<-MergeTable.df[which(!tolower(MergeTable.df$SourceVariableName) %in% tolower(c(
    "[CSISCreatedDate]",
    "[unique_transaction_id]",
    "[fiscal_year]"))),]

  #Add a null check to columns missing in recent USAspending downloads
  if(update_with_null==TRUE){
  NullCheckCols<-which(tolower(MergeTable.df$SourceVariableName) %in% tolower(c(
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
  }
  else
    NullCheckCols<-1:nrow(MergeTable.df)
  
  varchar<-substring(MergeTable.df$SourceVariableType,2,8) %in% c("varchar","nvarcha")
  
  
  MergeTable.df$NullCheck<-paste("S.",MergeTable.df$SourceVariableName,sep="")
  MergeTable.df$NullCheck[NullCheckCols&varchar]<-
    paste("coalesce(nullif(",MergeTable.df$NullCheck[NullCheckCols&varchar],",''),",
      "T.",MergeTable.df$CSISvariableName[NullCheckCols&varchar],")",sep="")
  MergeTable.df$NullCheck[NullCheckCols&!varchar]<-
    paste("coalesce(",MergeTable.df$NullCheck[NullCheckCols&!varchar],",",
          "T.",MergeTable.df$CSISvariableName[NullCheckCols&!varchar],")",sep="")
  
  
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
    "ON s.CSIStransactionID=t.CSIStransactionID and",
    "WHERE s.last_modified_date>=t.last_modified_date"
  )    
  
    
  update_list
}



create_insert<-function(MergeTable.df,
                       SourceSchema,
                       SourceTableName,
                       TargetSchema,
                       TargetTableName,
                       DateType=101,
                       allow_missing=TRUE,
                       Apply_Drop=TRUE){
  
  if("IsDroppedNameField" %in% colnames(MergeTable.df) & Apply_Drop==TRUE)
    MergeTable.df<-MergeTable.df %>% filter(IsDroppedNameField==FALSE | is.na(IsDroppedNameField))
  if(allow_missing==TRUE)
    MergeTable.df<-MergeTable.df %>% filter(!is.na(CSISvariableType))
  else if(any(is.na(MergeTable.df$CSISvariableType)))
    stop("Some columns are missing a destination type")
    
  MergeTable.df<-convert_switch(MergeTable.df,DateType,FALSE,Apply_Drop = Apply_Drop)
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
                                   PKcolumn=PKtable,
                                   FKname=NULL,
                                   PKname=NULL,
                                   suppress_select=FALSE,
                                   suppress_alter=FALSE,
                                   suppress_insert=FALSE){

  pkTable.df<-read.csv(file.path("ImportAids","ErrorLogging_PrimaryKeyList.csv")
                       ,header=TRUE,sep=",") %>% remove_bom()
  pkTable.df<-subset(pkTable.df,
                     toupper(PKSchemaName)==toupper(PKschema) &
                       toupper(PKTableName)==toupper(PKtable) &
                     toupper(PKColumnCode)==toupper(PKcolumn))
  if(nrow(pkTable.df)==0)
    stop(paste("No Primary Key match for",PKschema,PKtable,PKcolumn))
  #Test if the field can be converted to the primary keys typed.
  
  
  if(!"SourceVariableType" %in% colnames(TargetTable.df)){
    colnames(TargetTable.df)[1:3]<-c("SourceVariableName" ,
                                "SourceVariableType",
                                "SourceVariableNullable")
  }
  
  if(length(FKname)>0){ 
    if(FKname=="") FKname<-NULL
    else FKname<-gsub("\\[|\\]","",FKname)
  }
  
  if(length(PKname)>0){ 
    if(PKname=="") PKname<-NULL
    else PKname<-gsub("\\[|\\]","",PKname)
  }
  
  
  #If there's no destination, then no point tracking the source name
  if (is.null(PKname)){
    warning(paste("No Primary Key Text field (PKname) to match FKname",FKname))
    FKname<-NULL
  }
  
  
  TargetTable.df<-subset(TargetTable.df,
                         toupper(SourceVariableName)==toupper(FKcolumn))
  if(nrow(TargetTable.df)==0)
    stop(paste("No Source match for",FKcolumn))
  
  

  TargetTable.df<-left_join(TargetTable.df,pkTable.df,
                       by=c("PKSchemaName",
                            "PKTableName",
                            "PKColumnCode")
                            )
  #If the VariableTypes don't match, create a select and alter to fix that'
  
    TryConvertTable.df<-TargetTable.df
    TryConvertTable.df$CSISvariableName<-pkTable.df$PKColumnCode
    TryConvertTable.df$CSISvariableType<-paste('[',pkTable.df$ColumnDataType,']',sep='')
    if(TryConvertTable.df$CSISvariableType[1]=="[varchar]"){
      TryConvertTable.df$CSISvariableType<-paste(TryConvertTable.df$CSISvariableType,
                                             "(",pkTable.df$ColumnLength,")",
                                             sep="")
    }

  Output<-''
  if(suppress_alter==FALSE & TryConvertTable.df$CSISvariableType!=TryConvertTable.df$SourceVariableType){  
    Output<-create_try_converts(TryConvertTable.df,
                                FKschema,
                                FKtable)
    
    rm(TryConvertTable.df)
  }
  
  
  if(suppress_select==FALSE){
  
  iifFKname<-paste("iif(fk.",FKname,"=pk.",PKname," or\n",
                   "\t(fk.",FKname,"='' and pk.",PKname," is NULL) or\n",
                   "\tcharindex('('+fk.",FKname,"+')',pk.",PKname," )>0,\n",
                   sep="")
  
  #Select all of the unmached values in the foreign key table
  Output<-rbind(
    Output,paste(
      "--List new ",FKcolumn, 
      #** Select List
      ifelse(!is.null(FKname),paste(" and updated",FKname),""),
      " for insertion into ",PKschema,".",PKtable,"\n",
      "SELECT fk.",FKcolumn,",\n",
      # "len(fk.",FKcolumn,") as length,\n", Don't need it for this one
      #**If there's a name to go with the code
      ifelse(!is.null(FKname),
             paste("max(",iifFKname,
                   "\tNULL,fk.",FKname,")) as MaxOfNewFK",FKname,",\n",
                   "count(distinct ",iifFKname,
                   "\tNULL,fk.",FKname,")) as unmatched_name_count,\n",
                   "pk.",PKname," as PK",PKname,",\n",
                   "max(",iifFKname,
                   "\t1,0)) as any_name_match,\n",sep=""),""),
      "'",PKschema,".",PKtable,"' as PrimaryKeyTable\n",
      #** Tables and Joins
      "FROM ",FKschema,".",FKtable," as fk\n",
      "LEFT OUTER JOIN ",PKschema,".",PKtable," as pk\n",
      "On pk.",PKcolumn,"=fk.",FKcolumn,"\n",
      #If no FKname, a simple WHERE
      ifelse(!is.null(FKname),"",paste("WHERE pk.",PKcolumn," is NULL\n",sep="")),
      #If a FKname exists, check if it has changed
      "GROUP BY fk.",FKcolumn,
      ifelse(!is.null(FKname),paste(", pk.",PKname,"\n",
                                    "HAVING max(",iifFKname,
                                    "\t0,1))=1",sep=""),""),
      "\nORDER BY fk.",FKcolumn,"\n",
      sep="")
  )
  }
  
  if(suppress_insert==FALSE)  
    #Insert unmatched values into the primary key table
    Output<-rbind(Output,
                  paste("INSERT INTO ",PKschema,".",PKtable,"\n",
                        "(",PKcolumn,ifelse(is.null(FKname),"",paste(",",PKname,sep="")),")\n",
                        "SELECT fk.",FKcolumn,"\n",
                        ifelse(is.null(FKname),"",paste(",max(fk.",FKname,") as ",PKname,"\n",sep="")),
                        "FROM ",FKschema,".",FKtable," as fk\n",
                        
                        "LEFT OUTER JOIN ",PKschema,".",PKtable," as pk\n",
                        "On pk.",PKcolumn,"=fk.",FKcolumn,"\n",
                        "WHERE pk.",PKcolumn," is NULL\n",
                        "GROUP BY fk.",FKcolumn,
                        sep="")
    )
  
  
  if(suppress_alter==FALSE)    
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
  if(file.exists(file.path("data","semi_clean","ErrorLogging_ForeignKeyList.csv")))
    fk_file<-file.path("data","semi_clean","ErrorLogging_ForeignKeyList.csv")
  else if(file.exists(file.path("ImportAids","ErrorLogging_ForeignKeyList.csv")))
    fk_file<-file.path("ImportAids","ErrorLogging_ForeignKeyList.csv")
  else stop("File Not Found")
    
  
  lookup.CSISvariableNameToPrimaryKey<-read.csv(fk_file,
                                                stringsAsFactors = FALSE,
                                                na.strings=c(""))
  lookup.CSISvariableNameToPrimaryKey<-remove_bom(lookup.CSISvariableNameToPrimaryKey)
  lookup.CSISvariableNameToPrimaryKey$FKColumnNameUp<-toupper(lookup.CSISvariableNameToPrimaryKey$FKColumnName)
  
  #Starting by dropping cases in which case a primary key is a foreign key for a different table.
  #E.g. MailingElectionDate->ElectionDate. In this case, we want MailingElectionDate to match up to the higher level in the 
  #heirarchy, Election.MailingElectionDate. We don't need them to match with the base, Eletion.ElectionDate because everything
  #in Election.MailingElectionDate already is a component of the subsequent table, thanks to the existing foreign key.
  lookup.CSISvariableNameToPrimaryKey<- lookup.CSISvariableNameToPrimaryKey %>%
    dplyr::filter(toupper(FKTableName)!=toupper(FKColumnName))
  
  #First consolidate down to only CSISvariable names and keys, using upper to handle case sensitivity
  lookup.CSISvariableNameToPrimaryKey <- lookup.CSISvariableNameToPrimaryKey %>% remove_bom() %>%
    dplyr::rename(CSISvariableName= FKColumnName) %>% 
    dplyr::group_by(FKColumnNameUp,PKSchemaName,PKTableName,PKColumnCode,PKcolumnCount,PKcolumnText) %>%
    dplyr::summarise(CSISvariableName=max(CSISvariableName)) %>%
    dplyr::group_by(CSISvariableName) %>%
    dplyr::select(-FKColumnNameUp) 
  
  #Handle those cases with multiple primary keys (typically these involves heirarchical pks that appear across multiple tables)
  #The core one should share a name with the column name (with a few exceptions, like contractor.parentcontractor)
  lookup.CSISvariableNameToPrimaryKey <- lookup.CSISvariableNameToPrimaryKey %>%
    dplyr::mutate(RepeatCount=length(CSISvariableName),
                  AnyExact=max(ifelse(toupper(PKTableName)==toupper(PKColumnCode),1,0))) %>%
    dplyr::filter(AnyExact==0 | RepeatCount==1 | toupper(PKTableName)==toupper(PKColumnCode)) %>%
    dplyr::mutate(RepeatCount=length(CSISvariableName))
  
  
  if(max(lookup.CSISvariableNameToPrimaryKey$RepeatCount>1)){
    print(lookup.CSISvariableNameToPrimaryKey%>% dplyr::filter(RepeatCount>1))
    warning("Repeated CSISvariableName")
    lookup.CSISvariableNameToPrimaryKey<-  lookup.CSISvariableNameToPrimaryKey %>% dplyr::filter(RepeatCount==1 | toupper(PKTableName)==toupper(PKColumnCode))
  }
  lookup.CSISvariableNameToPrimaryKey$CSISvariableName<-paste("[",lookup.CSISvariableNameToPrimaryKey$CSISvariableName,"]",sep="")
  
  lookup.CSISvariableNameToPrimaryKey
}

create_foreign_key_assigments<-function(Schema,
                              TableName,
                              dir="SQL",
                              suppress_select=FALSE,
                              suppress_alter=FALSE,
                              suppress_insert=FALSE){
  table_file<-file.path(dir,paste(Schema,".",TableName,".table.sql",sep=""))
  if (file.exists(file.path(dir,paste(Schema,".",TableName,".table.sql",sep=""))))
      table_file<-file.path(dir,paste(Schema,".",TableName,".table.sql",sep=""))
  else if (file.path(dir,paste(Schema,"_",TableName,".txt",sep="")))
      table_file<-file.path(dir,paste(Schema,"_",TableName,".txt",sep=""))
  else stop("Table file not found")
    
  MergeTable.df<-read_create_table(table_file,dir=NULL)
  MergeTable.df<-translate_name(MergeTable.df)
  
  #Limit it to just cases where the variable type is changing
  lookup.CSISvariableNameToPrimaryKey<-get_CSISvariableNameToPrimaryKey()
  
  
  MergeTable.df<-left_join(MergeTable.df,lookup.CSISvariableNameToPrimaryKey,
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
                                                   MergeTable.df$PKColumnCode[i],
                                                   FKname=MergeTable.df$Pair[i],
                                                   PKname=MergeTable.df$PKcolumnText[i],
                                                   suppress_select=suppress_select,
                                                   suppress_alter=suppress_alter,
                                                   suppress_insert=suppress_insert)
    )
  
    ForeignKeyList
}


match_two_tables<-function(NewSchema,NewTable,TargetSchema,TargetTable,translate=TRUE,insert=FALSE){
  #******Importing into Voter_VoterList_2016_07_14.txt
  NewTableType.df<-read_create_table(paste(NewSchema,"_",NewTable,".txt",sep=""))
    NewTableType.df<-translate_name(NewTableType.df)
  
  #Sync up with the VID Table
  TargetTableType.df<-read_create_table(paste(TargetSchema,"_",TargetTable,".txt",sep=""))
  MergeTable.df<-merge_source_and_csis_name_tables(NewTableType.df,TargetTableType.df)
  TryConvertList<-create_try_converts(MergeTable.df,NewSchema,NewTable)
  if(nrow(TryConvertList)>0){
    write(TryConvertList,
        paste("Output//",NewSchema,"_",NewTable,"_to_",TargetSchema,"_",TargetTable,"_","try_convert.txt",sep=""), 
        append=FALSE)
  }
  if(insert==TRUE){
    #Transfer from Voter.VoterList_2016_07_14 to Voter.VID
    MergeTable.df<-subset(MergeTable.df,!is.na(CSISvariableType))
    
    InsertList<-create_insert(MergeTable.df,
                              NewSchema,
                              NewTable,
                              TargetSchema,
                              TargetTable,
                              DateType=101)
    write(InsertList,
          paste("Output//",NewSchema,"_",NewTable,"_to_",TargetSchema,"_",TargetTable,"_","Insert.txt",sep=""))
  }
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
        paste("Output//","Shift_",Schema,"_",Table,"_by_",NColShift,".txt",sep=""),
        append=FALSE)
}
