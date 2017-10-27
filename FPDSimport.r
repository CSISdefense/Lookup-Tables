#Setup
source("SQLimportTools.r")

#******Importing into Errorlogging.FPDSviolatesConstraint
#Match up Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
OriginTableType.df<-read_create_table("ErrorLogging_FPDSviolatesType.txt")
DestTableType.df<-read_create_table("ErrorLogging_FPDSviolatesConstraint.txt")
OriginTableType.df<-translate_name(OriginTableType.df)
MergeType.df<-merge_source_and_csis_name_tables(OriginTableType.df,DestTableType.df)



#Create Try Convert
TryConvertList<-Create_Try_Converts(MergeType.df,"Errorlogging","FPDSviolatesType")
write(TryConvertList,"FPDStryConvertList.txt")

#Transfer from Errorlogging.FPDSviolatesType to Errorlogging.FPDSviolatesConstraint
InsertList<-create_insert(MergeType.df,
             "ErrorLogging",
             "FPDSviolatesType",
             "ErrorLogging",
             "FPDSviolatesConstraint",
             DateType=101)
write(InsertList,"Insert.txt")
write(create_csis_dates("Contract","FPDS"),"CSISdates.txt")

#******Importing into Contract.FPDS 
#Match up Errorlogging.FPDSviolatesConstraint to Contract.FPDS 
DestTableConstraint.df<-read_create_table("Contract_FPDS.txt")
OriginTableConstraint.df<-read_create_table("ErrorLogging_FPDSviolatesConstraint.txt")
OriginTableConstraint.df<-translate_name(OriginTableConstraint.df)
MergeConstraint.df<-merge_source_and_csis_name_tables(OriginTableConstraint.df,DestTableConstraint.df)


#Transfer from Errorlogging.FPDSviolatesConstraint to Contract.FPDS
ConstTable.df<-translate_name(DestTableConstraint.df)
MergeConst<-merge_source_and_csis_name_tables(ConstTable.df,ConstTable.df)
InsertList<-create_insert(MergeConst,
                         "ErrorLogging",
                         "FPDSviolatesConstraint",
                         "Contract",
                         "FPDS",
                         DateType=101)
write(InsertList,"Insert2.txt")

