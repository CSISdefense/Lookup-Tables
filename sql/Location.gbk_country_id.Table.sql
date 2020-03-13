USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[gbk_country_id](
	[gbk_country_id] [float] NULL,
	[gbk_country_name] [nvarchar](255) NULL,
	[Country3LetterCode] [varchar](3) NULL,
	[ISOalpha3] [varchar](3) NULL,
	[ISOalpha2] [varchar](2) NULL
) ON [PRIMARY]
GO
