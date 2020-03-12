#Setup
source("scripts//SQLimportTools.r")

#******Importing into Errorlogging.FSRSviolatesConstraint
#Match up Errorlogging.FSRSviolatesType to Errorlogging.FSRSviolatesConstraint
OriginTableType.df<-read_create_table("ErrorLogging_FSRSviolatesType.txt")
DestTableType.df<-read_create_table("ErrorLogging_FSRSviolatesConstraint.txt")
OriginTableType.df<-translate_name(OriginTableType.df)
MergeType.df<-merge_source_and_csis_name_tables(OriginTableType.df,DestTableType.df)

#Create Try Convert
TryConvertList<-create_try_converts(MergeType.df,"Errorlogging","FSRSviolatesType")
write(TryConvertList,"FSRStryConvertList.txt")

#Transfer from Errorlogging.FSRSviolatesType to Errorlogging.FSRSviolatesConstraint
InsertList<-create_insert(MergeType.df,
             "ErrorLogging",
             "FSRSviolatesType",
             "ErrorLogging",
             "FSRSviolatesConstraint",
             DateType=101)
write(InsertList,"FSRSinsert.txt")
write(create_csis_dates("Contract","FSRS"),"CSISdates.txt")

#******Importing into Contract.FSRS 
#Match up Errorlogging.FSRSviolatesConstraint to Contract.FSRS 
DestTableConstraint.df<-read_create_table("Contract_FSRS.txt")
OriginTableConstraint.df<-read_create_table("ErrorLogging_FSRSviolatesConstraint.txt")
OriginTableConstraint.df<-translate_name(OriginTableConstraint.df)
MergeConstraint.df<-merge_source_and_csis_name_tables(OriginTableConstraint.df,DestTableConstraint.df)


#Transfer from Errorlogging.FSRSviolatesConstraint to Contract.FSRS
ConstTable.df<-translate_name(DestTableConstraint.df)
MergeConst<-merge_source_and_csis_name_tables(ConstTable.df,ConstTable.df)
InsertList<-create_insert(MergeConst,
                         "ErrorLogging",
                         "FSRSviolatesConstraint",
                         "Contract",
                         "FSRS",
                         DateType=101)
write(InsertList,"Insert2.txt")



fkTable.df<-read_create_table("Contract_FSRS.txt")

  debug(convert_field_to_foreign_key)
  Output<-convert_field_to_foreign_key("Contract","FSRS","[PrimeAwardPrincipalPlaceCountry]",
                           fkTable.df,
                           "FPDStypeTable","Country3lettercode")
  write(Output,"convert_field_to_foreign_key.txt")
  
  # convert_field_to_foreign_key("Contract","FSRS","[SubAwardeeDunsnumber]",
  #                          fkTable.df,
  #                          "Contractor","Dunsnumber")
  # 
  # convert_field_to_foreign_key("Contract","FSRS","[SubAwardeeParentDuns]",
  #                          fkTable.df,
  #                          "Contractor","Dunsnumber")
  
  
  
  
  
  # --Decimal nullif('')
  # --prime-award_source_sub_acocunt varchar(2)?
  # --prime-award_source_account varchar(4)?
  # --prime-award_source_subaccount varchar(3)
  # --scientific notation to decimal
  
  # 
  # OriginalTable.df<-read_create_table("ErrorLogging_FSRSviolatesType.csv")
  # TargetTable.df<-read_create_table("Contract_FSRS.csv")
  # OriginalTable.df<-translate_name(OriginalTable.df)
  # MergeTable.df<-merge_source_and_csis_name_tables(OriginalTable.df,TargetTable.df)
  # 
  # # ChangeList<-convert_all_of_type(TargetTable.df,
  # #                  "[real]",
  # #                  "[decimal](19, 4)",
  # #                  "Contract",
  # #                  "FSRS")
  # # write(ChangeList,"ChangeList.txt")
  # # 
  # # ChangeList<-convert_all_of_type(TargetTable.df,
  # #                              "[real]",
  # #                              "[decimal](19, 4)",
  # #                              "Errorlogging",
  # #                              "FSRSviolatesConstraint")
  # # write(ChangeList,"ChangeList.txt")
  # 
  # list_problem_type(TargetTable.df)
  # debug(convert_switch)
  # 
  # debug(OneSwitch)
  # TryConvertList<-create_try_converts(MergeTable.df,"ErrorLogging","FSRSviolatesType")
  # write(TryConvertList,"TryConvertList.txt")
  # 
  # InsertList<-create_insert(MergeTable.df,
  #                          "ErrorLogging",
  #                          "FSRSviolatesType",
  #                          "ErrorLogging",
  #                          "FSRSviolatesConstraint")
  # write(InsertList,"InsertList.txt")
  # 
  # 
  # 