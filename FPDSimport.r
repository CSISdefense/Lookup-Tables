#Setup
# setwd("D:\\Users\\Greg Sanders\\Documents\\Development\\Lookup-Tables")
setwd("K:\\Development\\Lookup-Tables")
source("SQLimportTools.r")

#******Importing into Errorlogging.FPDSviolatesConstraint
#Match up Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
OriginTableType.df<-ReadCreateTable("ErrorLogging_FPDSviolatesType.txt")
DestTableType.df<-ReadCreateTable("ErrorLogging_FPDSviolatesConstraint.txt")
OriginTableType.df<-TranslateName(OriginTableType.df)
MergeType.df<-MergeSourceAndCSISnameTables(OriginTableType.df,DestTableType.df)



#Create Try Convert
TryConvertList<-Create_Try_Converts(MergeType.df,"Errorlogging","FPDSviolatesType")
write(TryConvertList,"FPDStryConvertList.txt")

#Transfer from Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
InsertList<-CreateInsert(MergeType.df,
             "ErrorLogging",
             "FPDSviolatesType",
             "ErrorLogging",
             "FPDSviolatesConstraint",
             DateType=101)
write(InsertList,"Insert.txt")
write(CreateCSISdates("Contract","FPDS"),"CSISdates.txt")

#******Importing into Contract.FPDS 
#Match up Errorlogging.FPDSviolatesConstraint to Contract.FPDS 
DestTableConstraint.df<-ReadCreateTable("Contract_FPDS.txt")
OriginTableConstraint.df<-ReadCreateTable("ErrorLogging_FPDSviolatesConstraint.txt")
OriginTableConstraint.df<-TranslateName(OriginTableConstraint.df)
MergeConstraint.df<-MergeSourceAndCSISnameTables(OriginTableConstraint.df,DestTableConstraint.df)


#Transfer from Errorlogging.FPDSviolatesConstraint to Contract.FPDS
ConstTable.df<-TranslateName(DestTableConstraint.df)
MergeConst<-MergeSourceAndCSISnameTables(ConstTable.df,ConstTable.df)
InsertList<-CreateInsert(MergeConst,
                         "ErrorLogging",
                         "FPDSviolatesConstraint",
                         "Contract",
                         "FPDS",
                         DateType=101)
write(InsertList,"Insert2.txt")

