
	update [ErrorLogging].[PKTableName]
	set [PKColumnText]='recipient_type_text'
where  [PKColumnText] is null and 
[PKTableName]='recipient_type'


update [ErrorLogging].[PKTableName]
set NoPKcolumnText=1
where PKTableName='StandardizedVendorNameHistory'
and NoPKcolumnText is null


SELECT [PKSchemaName]
      ,[PKTableName]
      ,PKcolumnCount
	  ,[PKColumnText]
	  ,NoPKcolumnText
  FROM [ErrorLogging].[PKTableName]
  where [PKColumnText] is null
  and (NoPKcolumnText is null or NoPKcolumnText=0)

select a.
from Vendor.EntityID a

