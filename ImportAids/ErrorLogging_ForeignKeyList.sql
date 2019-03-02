/****** Object:  View [ErrorLogging].[ForeignKeyList]    Script Date: 3/1/2019 10:32:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [ErrorLogging].[ForeignKeyList] AS 
-- Found this on SourceForge but forgot to note the URL adapted wih. 
-- http://stackoverflow.com/questions/95967/how-do-you-list-the-primary-key-of-a-sql-server-table
-- answered Apr 3 '13 at 20:29
-- dekdev

SELECT  CAST (oConstraint.name AS varchar(255)) as ConstraintName,
        'FK' as ConstraintType,
		OBJECT_SCHEMA_NAME(f.parent_object_id) AS FKSchema, 
        CAST (oParent.name AS varchar(255)) as FKTableName,
        CAST ( oParentCol.name AS varchar(255)) as FKColumnName,
        oParentColDtl.DATA_TYPE as ColumnDataType,  
		   oParentColDtl.CHARACTER_MAXIMUM_LENGTH as ColumnLength,
		OBJECT_SCHEMA_NAME(f.referenced_object_id) AS PKSchemaName,
        CAST ( oReference.name AS varchar(255)) as PKTableName,
        CAST (oReferenceCol.name AS varchar(255)) as PKColumnName
FROM sys.foreign_keys AS f
  INNER JOIN sys.foreign_key_columns AS FKC 
	ON f.OBJECT_ID = fkc.constraint_object_id
    INNER JOIN sys.sysobjects oConstraint
            ON FKC.constraint_object_id=oConstraint.id 
    INNER JOIN sys.sysobjects oParent
            ON FKC.parent_object_id=oParent.id
    INNER JOIN sys.all_columns oParentCol
            ON FKC.parent_object_id=oParentCol.object_id /* ID of the object to which this column belongs.*/
            AND FKC.parent_column_id=oParentCol.column_id/* ID of the column. Is unique within the object.Column IDs might not be sequential.*/
    INNER JOIN sys.sysobjects oReference
            ON FKC.referenced_object_id=oReference.id
    INNER JOIN INFORMATION_SCHEMA.COLUMNS oParentColDtl
            ON oParentColDtl.TABLE_NAME=oParent.name
            AND oParentColDtl.COLUMN_NAME=oParentCol.name
    INNER JOIN sys.all_columns oReferenceCol
            ON FKC.referenced_object_id=oReferenceCol.object_id /* ID of the object to which this column belongs.*/
            AND FKC.referenced_column_id=oReferenceCol.column_id/* ID of the column. Is unique within the object.Column IDs might not be sequential.*/
GO


