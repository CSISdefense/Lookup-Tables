USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[PKTableName](
	[PKSchemaName] [sysname] NOT NULL,
	[PKTableName] [varchar](50) NOT NULL,
	[PKcolumnCount] [int] NULL,
	[PKcolumnText] [varchar](50) NULL,
	[NoPKColumnText] [bit] NULL,
 CONSTRAINT [pk_PKTableName] PRIMARY KEY CLUSTERED 
(
	[PKSchemaName] ASC,
	[PKTableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO