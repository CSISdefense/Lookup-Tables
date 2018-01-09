USE [DIIG]
GO

/****** Object:  View [ErrorLogging].[PrimaryKeyList]    Script Date: 12/4/2017 3:32:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [ErrorLogging].[PrimaryKeyList] AS 
-- Found this on SourceForge
-- http://stackoverflow.com/questions/95967/how-do-you-list-the-primary-key-of-a-sql-server-table
-- answered Apr 3 '13 at 20:29
-- dekdev
SELECT  CAST (PKnUKEY.name AS VARCHAR(30)) as ConstraintName,
        CAST (PKnUKEY.type_desc AS VARCHAR(30)) as ConstraintType,
		        oParentColDtl.DATA_TYPE as ColumnDataType,
		oParentColDtl.CHARACTER_MAXIMUM_LENGTH as ColumnLength,
		s.name as PKSchemaName,
		
		--OBJECT_SCHEMA_NAME(PKnUTable.referenced_object_id) AS PKSchema,
        CAST (PKnUTable.name AS VARCHAR(30)) as PKTableName,
        CAST ( PKnUKEYCol.name AS VARCHAR(30)) as PKColumnName

--select 
--    s.name as SchemaName,
--    t.name as TableName,
--    tc.name as ColumnName,
--    ic.key_ordinal as KeyOrderNr
--from 
--where i.is_primary_key=1 
--order by t.name, ic.key_ordinal ;

FROM sys.key_constraints as PKnUKEY
    INNER JOIN sys.tables as PKnUTable
            ON PKnUTable.object_id = PKnUKEY.parent_object_id
    INNER JOIN sys.index_columns as PKnUColIdx
            ON PKnUColIdx.object_id = PKnUTable.object_id
            AND PKnUColIdx.index_id = PKnUKEY.unique_index_id
    INNER JOIN sys.columns as PKnUKEYCol
            ON PKnUKEYCol.object_id = PKnUTable.object_id
            AND PKnUKEYCol.column_id = PKnUColIdx.column_id
    INNER JOIN INFORMATION_SCHEMA.COLUMNS oParentColDtl
            ON oParentColDtl.TABLE_NAME=PKnUTable.name
            AND oParentColDtl.COLUMN_NAME=PKnUKEYCol.name
	INNER JOIN sys.schemas s 
			ON s.schema_id=PKnUTable.schema_id

--    sys.schemas s 
--    inner join sys.tables PKnUTable   on s.schema_id=PKnUTable.schema_id
--    inner join sys.indexes i  on PKnUTable.object_id=i.object_id
--    inner join sys.index_columns PKnUColIdx on i.object_id=PKnUColIdx.object_id 
--                                   and i.index_id=PKnUColIdx.index_id
--    inner join sys.columns PKnUKEYCol on PKnUColIdx.object_id=PKnUKEYCol.object_id 
--                             and PKnUColIdx.column_id=PKnUKEYCol.column_id




GO


