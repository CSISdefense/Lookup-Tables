require(plyr)

ReadCreateTable<-function(FileName){
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

ConvertAllOfType<-function(TargetTable.df,
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

ListProblemType<-function(TargetTable.df){
  TargetTable.df[TargetTable.df$VariableType=="[varchar](max)",]
}


TranslateName<-function(TargetTable.df){
  lookup.NameConversion<-read.csv("ImportAids\\NameConversion.csv",
                                  stringsAsFactors = FALSE)
  if(!"SourceVariableName" %in% colnames(TargetTable.df)){
    colnames(TargetTable.df)[1]<-"SourceVariableName" 
  }
  TargetTable.df$OriginalSourceVariableName<-TargetTable.df$SourceVariableName
  TargetTable.df$SourceVariableName<-tolower(TargetTable.df$SourceVariableName)
  lookup.NameConversion$SourceVariableName<-tolower(lookup.NameConversion$SourceVariableName)
  TargetTable.df<-plyr::join(TargetTable.df,lookup.NameConversion)
  # TargetTable.df$VariableName<-gsub("_","",TargetTable.df$VariableName)
  
  TargetTable.df$SourceVariableName<-TargetTable.df$OriginalSourceVariableName
  TargetTable.df<-subset(TargetTable.df,select=-c(OriginalSourceVariableName))
  
  
  TargetTable.df$CSISvariableName[TargetTable.df$SourceVariableName %in% 
                   lookup.NameConversion$CSISvariableName]<-
    TargetTable.df$SourceVariableName[TargetTable.df$SourceVariableName %in% 
                     lookup.NameConversion$CSISvariableName]
  
  
  TargetTable.df
}



MergeSourceAndCSISnameTables<-function(SourceTable.df,CSIStable.df){
  colnames(SourceTable.df)[1:3]<-c("SourceVariableName",
                                   "SourceVariableType",
                                   "SourceNullable")
  SourceTable.df$CSISvariableNameLower<-tolower(as.character(SourceTable.df$CSISvariableName))
  SourceTable.df<-subset(SourceTable.df,select=-c(CSISvariableName))
  colnames(CSIStable.df)[1:3]<-c("CSISvariableName",
                                 "CSISvariableType",
                                 "CSISnullable")
  CSIStable.df$CSISvariableNameLower<-tolower(as.character(CSIStable.df$CSISvariableName))
  SourceTable.df<-plyr::join(SourceTable.df,CSIStable.df, by="CSISvariableNameLower",match="first")
  SourceTable.df<-subset(SourceTable.df,select=-c(CSISvariableNameLower))
}



CreateCSISdates<-function(Schema,TableName){
  paste("ALTER TABLE ",Schema,".",TableName,"\n",
        "CREATE CSISmodifiedDate datetime2 NOT NULL default gettime(),\n",
        "CSIScreatedDate datetime2 NOT NULL default gettime()\n",
        sep="")
}

ConvertSwitch<-function(MergeTable.df,DateType=101,IsTryConvert=FALSE){
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
    MergeTable.df$ConvertList[SwitchList]<-
      paste(ConvertText,"([date], ",
                                   MergeTable.df$SourceVariableName[SwitchList] ,
                                   ",",as.character(DateType),")",
                                   sep=""
                    )
    SwitchList<-is.na(MergeTable.df$ConvertList)
    MergeTable.df$ConvertList[SwitchList]<-
                    paste(ConvertText,"(",
                          MergeTable.df$CSISvariableType[SwitchList] ,", ",
                          MergeTable.df$SourceVariableName[SwitchList] ,
                          ")",
                          sep=""
                    )
    MergeTable.df
}


LengthCheck<-function(MergeTable.df){

    MergeTable.df$LengthCheck<-""

    MergeTable.df$VariableTypeNumber<-as.numeric(
        (substr(MergeTable.df$CSISvariableType,
                regexpr('[(]',MergeTable.df$CSISvariableType)+1,
                regexpr('[)]',MergeTable.df$CSISvariableType)-1)
        ))
        

    SwitchList<-MergeTable.df$VariableShortType=="[varchar]"&
        MergeTable.df$LengthCheck==""&
        !is.na(MergeTable.df$VariableTypeNumber)
    MergeTable.df$LengthCheck[SwitchList]<-
        paste("OR len(",MergeTable.df$SourceVariableName[SwitchList] ,")",
              ">",MergeTable.df$VariableTypeNumber[SwitchList],"\n"
        )

    MergeTable.df
}


CreateTryConverts<-function(MergeTable.df,
                              Schema,
                              TableName,
                              DateType=101,
                              IncludeAlters=TRUE){
  #Limit it to just cases where the variable type is changing
  MergeTable.df<-subset(MergeTable.df,SourceVariableType!=MergeTable.df$CSISvariableType)
  if(nrow(MergeTable.df)==0){
    warning("No try_converts necessary")
    return(0)
  }
  MergeTable.df<-ConvertSwitch(MergeTable.df,101,TRUE)
  MergeTable.df<-LengthCheck(MergeTable.df)
  
  ConvertList<-paste(
    "SELECT DISTINCT ",
    MergeTable.df$SourceVariableName,",\n",
    "len(",MergeTable.df$SourceVariableName,") as Length,\n",
    "'",MergeTable.df$CSISvariableType,"' as DestinationType","\n",
    "FROM ",Schema,".",TableName,"\n",
    "WHERE (",
    MergeTable.df$ConvertList,
    " IS NULL AND\n",
    "NULLIF(",MergeTable.df$SourceVariableName,",'') IS NOT NULL)\n",
    MergeTable.df$LengthCheck,
    sep="")
  
  
  
  #Create an alter to fix that, if not supressed by user
  if(IncludeAlters){
    ConvertList<-rbind(ConvertList,
                       paste("ALTER TABLE ",Schema,".",TableName,"\n",
                             "ALTER COLUMN ",MergeTable.df$SourceVariableName," ",
                             MergeTable.df$CSISvariableType,"\n",sep="")
    )
  }
  
  
  ConvertList
}


CreateInsert<-function(MergeTable.df,
                       SourceSchema,
                       SourceTableName,
                       TargetSchema,
                       TargetTableName,
                       DateType=101){
  MergeTable.df<-ConvertSwitch(MergeTable.df,101,FALSE)
  
  InsertList<-paste("INSERT INTO ",TargetSchema,".",TargetTableName,"\n",
                    "(",sep="")
  InsertList<-c(InsertList,paste(MergeTable.df$CSISvariableName,",",sep=""))
  #Remove the comma from the last insert list column
  InsertList[length(InsertList)]<-gsub(",","",InsertList[length(InsertList)])
  InsertList<-c(InsertList,")\n SELECT ")
  InsertList<-c(InsertList,paste(MergeTable.df$ConvertList,",",sep=""))
  #Remove the comma from the select list column
  InsertList[length(InsertList)]<-substr(InsertList[length(InsertList)],
                                       1,
                                       nchar(InsertList[length(InsertList)])-1)
  
  InsertList<-c(InsertList,
                    paste("FROM ",SourceSchema,".",SourceTableName,"\n",sep="")
  )
  InsertList
}



ConvertFieldToForeignKey<-function(FKschema,
                                   FKtable,
                                   FKcolumn,
                                   TargetTable.df,
                                   PKschema,
                                   PKtable,
                                   PKcolumn=PKtable){

  pkTable.df<-read.csv(file.path("ImportAids","ErrorLogging_PrimaryKeyList.csv")
                       ,header=TRUE,sep=",")
  pkTable.df<-subset(pkTable.df,
                     toupper(PKSchemaName)==toupper(PKschema) &
                       toupper(PKTableName)==toupper(PKtable) &
                     toupper(PKColumnName)==toupper(PKcolumn))
  #Test if the field can be converted to the primary keys typed.

  
  if(!"SourceVariableType" %in% colnames(TargetTable.df)){
    colnames(TargetTable.df)[1:3]<-c("SourceVariableName" ,
                                "SourceVariableType",
                                "SourceVariableNullable")
  }
  TargetTable.df<-subset(TargetTable.df,
                         toupper(SourceVariableName)==toupper(FKcolumn))
  
  
  Output<-''
  TargetTable.df<-join(TargetTable.df,pkTable.df)
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
    Output<-CreateTryConverts(TryConvertTable.df,
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
                      gsub("\\[","",gsub("\\]","",FKcolumn)),
                      " foreign key(",FKcolumn,")\n"
                      ,"references ",PKschema,".",PKtable,"(",PKcolumn,")\n",sep="")
  )
  Output
}


CreateForeignKeyAssigments<-function(Schema,
                            TableName){
  
  MergeTable.df<-ReadCreateTable(paste(Schema,"_",TableName,".txt",sep=""))
  MergeTable.df<-TranslateName(MergeTable.df)
  
  #Limit it to just cases where the variable type is changing
  lookup.CSISvariableNameToPrimaryKey<-read.csv(file.path("ImportAids","Lookup_CSISvariableNameToPrimaryKey.csv"),
                                  stringsAsFactors = FALSE,
                                  na.strings=c(""))
  MergeTable.df<-join(MergeTable.df,lookup.CSISvariableNameToPrimaryKey)
  MergeTable.df<-subset(MergeTable.df,!is.na(PKSchemaName))
  if(nrow(MergeTable.df)==0){
    warning("No foreign keys to assign")
    return(0)
  }
  ForeignKeyList<-''
  for(i in 1:nrow(MergeTable.df))
    ForeignKeyList<-rbind(ForeignKeyList,
                          ConvertFieldToForeignKey(Schema,TableName,MergeTable.df$SourceVariableName[i],
                                                   MergeTable.df,
                                                   MergeTable.df$PKSchemaName[i],MergeTable.df$PKTableName[i])
    )
  

  write(ForeignKeyList,
        paste(Schema,"_",TableName,"_foreign_key.txt",sep=""), 
        append=FALSE)  
  
    ForeignKeyList
}


MatchTwoTables<-function(NewSchema,NewTable,TargetSchema,TargetTable){
  #******Importing into Voter_VoterList_2016_07_14.txt
  NewTableType.df<-ReadCreateTable(paste(NewSchema,"_",NewTable,".txt",sep=""))
  NewTableType.df<-TranslateName(NewTableType.df)
  
  #Sync up with the VID Table
  TargetTableType.df<-ReadCreateTable(paste(TargetSchema,"_",TargetTable,".txt",sep=""))
  MergeTable.df<-MergeSourceAndCSISnameTables(NewTableType.df,TargetTableType.df)
  TryConvertList<-CreateTryConverts(MergeTable.df,NewSchema,NewTable)
  write(TryConvertList,
        paste(NewSchema,"_",NewTable,"_to_",TargetSchema,"_",TargetTable,"_","try_convert.txt",sep=""), 
        append=TRUE)
  
  #Transfer from Voter.VoterList_2016_07_14 to Voter.VID
  MergeTable.df<-subset(MergeTable.df,!is.na(CSISvariableType))
  
  InsertList<-CreateInsert(MergeTable.df,
                           NewSchema,
                           NewTable,
                           TargetSchema,
                           TargetTable,
                           DateType=101)
  write(InsertList,
        paste(NewSchema,"_",NewTable,"_to_",TargetSchema,"_",TargetTable,"_","Insert.txt",sep=""))
}