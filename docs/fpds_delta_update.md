##A Download a copy of the delta files
Save a complete copy of the delta files for contract and assistance. They may be found at (the USAspending.gov award_data_archive)[https://www.usaspending.gov/download_center/award_data_archive]

We do not sync up the repository folder, instead we just keep local copies. For example: [Your repository folder]/USAspending-local

This can be done in a matter of minutes, but **must be done every month.**

##B Upload the delta files to SQL

Once it is downloaded, the Lookup\\scripts\\Transfer_FPDS.R file can be used to upload to SQL server.

##C Set up in SQL

###1 For Contract Award records:
Working through the StoredProcedure
DIIGsql\SQL\ErrorLogging.SP_TransferFPDSdelta.StoredProcedure


 /* 1) Handle contract_award_unique_key, 4A) add them to the primary key, 1B) derive parent_contract_award_unique_keys, and 
 4C) match them up with CSIScontractIDs and CSISidvpiidIDs */
 /* 1A) add them to the primary key */
 /*4D CAU Diagnosis  */
 
###2 2A Handle contract_transaction_unique_key, add them to the primary key and match them up with CSISidvmodificationIDs and CSIStransactionID

