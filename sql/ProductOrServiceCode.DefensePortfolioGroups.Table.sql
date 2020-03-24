USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[DefensePortfolioGroups](
	[ID] [int] NOT NULL,
	[Portfolio Group] [nvarchar](255) NULL,
	[1L Code] [nvarchar](255) NULL,
	[1L1R Code] [nvarchar](255) NULL,
	[2L Code] [nvarchar](255) NULL,
	[4 Code] [nvarchar](255) NULL,
	[2R Code] [nvarchar](255) NULL,
	[2R Code contested] [nvarchar](255) NULL,
	[Field10] [nvarchar](255) NULL,
	[Field8] [nvarchar](255) NULL,
	[Field9] [nvarchar](255) NULL,
	[Field11] [nvarchar](255) NULL,
	[Field12] [nvarchar](255) NULL,
	[Field13] [nvarchar](255) NULL,
	[Field14] [nvarchar](255) NULL,
	[Field15] [nvarchar](255) NULL,
	[Field16] [nvarchar](255) NULL,
	[Field17] [nvarchar](255) NULL,
	[Field18] [nvarchar](255) NULL
) ON [PRIMARY]
GO
