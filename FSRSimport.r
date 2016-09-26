#Setup
# setwd("D:\\Users\\Greg Sanders\\Documents\\Development\\Lookup-Tables")
setwd("K:\\Development\\Lookup-Tables")
source("SQLimportTools.r")

#******Importing into Errorlogging.FSRSviolatesConstraint
#Match up Errorlogging.FSRSviolatesType to Errorlogging.FSRSviolatesConstraint
OriginTableType.df<-ReadCreateTable("ErrorLogging_FSRSviolatesType.txt")
DestTableType.df<-ReadCreateTable("ErrorLogging_FSRSviolatesConstraint.txt")
OriginTableType.df<-TranslateName(OriginTableType.df)
MergeType.df<-MergeSourceAndCSISnameTables(OriginTableType.df,DestTableType.df)

#Create Try Convert
TryConvertList<-Create_Try_Converts(MergeType.df,"Errorlogging","FSRSviolatesType")
write(TryConvertList,"FSRStryConvertList.txt")

#Transfer from Errorlogging.FSRSviolatesType to Errorlogging.FSRSviolatesConstraint
InsertList<-CreateInsert(MergeType.df,
             "ErrorLogging",
             "FSRSviolatesType",
             "ErrorLogging",
             "FSRSviolatesConstraint",
             DateType=101)
write(InsertList,"FSRSinsert.txt")
write(CreateCSISdates("Contract","FSRS"),"CSISdates.txt")

#******Importing into Contract.FSRS 
#Match up Errorlogging.FSRSviolatesConstraint to Contract.FSRS 
DestTableConstraint.df<-ReadCreateTable("Contract_FSRS.txt")
OriginTableConstraint.df<-ReadCreateTable("ErrorLogging_FSRSviolatesConstraint.txt")
OriginTableConstraint.df<-TranslateName(OriginTableConstraint.df)
MergeConstraint.df<-MergeSourceAndCSISnameTables(OriginTableConstraint.df,DestTableConstraint.df)


#Transfer from Errorlogging.FSRSviolatesConstraint to Contract.FSRS
ConstTable.df<-TranslateName(DestTableConstraint.df)
MergeConst<-MergeSourceAndCSISnameTables(ConstTable.df,ConstTable.df)
InsertList<-CreateInsert(MergeConst,
                         "ErrorLogging",
                         "FSRSviolatesConstraint",
                         "Contract",
                         "FSRS",
                         DateType=101)
write(InsertList,"Insert2.txt")



fkTable.df<-ReadCreateTable("Contract_FSRS.txt")

  debug(ConvertFieldToForeignKey)
  ConvertFieldToForeignKey("Contract","FSRS","[PrimeAwardeeParentDuns]",
                           fkTable.df,
                           "Contractor","Dunsnumber")

  ConvertFieldToForeignKey("Contract","FSRS","[SubAwardeeDunsnumber]",
                           fkTable.df,
                           "Contractor","Dunsnumber")
  
  ConvertFieldToForeignKey("Contract","FSRS","[SubAwardeeParentDuns]",
                           fkTable.df,
                           "Contractor","Dunsnumber")
  