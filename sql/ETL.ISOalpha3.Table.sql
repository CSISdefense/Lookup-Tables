SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[ISOalpha3](
	[Global Code] [varchar](50) NULL,
	[Global Name] [varchar](100) NULL,
	[Region Code] [varchar](50) NULL,
	[Region Name] [varchar](100) NULL,
	[Sub-region Code] [varchar](50) NULL,
	[Sub-region Name] [varchar](100) NULL,
	[Intermediate Region Code] [varchar](50) NULL,
	[Intermediate Region Name] [varchar](100) NULL,
	[Country or Area] [varchar](100) NULL,
	[M49 Code] [varchar](50) NULL,
	[ISO-alpha3 Code] [varchar](50) NULL,
	[Least Developed Countries (LDC)] [varchar](50) NULL,
	[Land Locked Developing Countries (LLDC)] [varchar](50) NULL,
	[Small Island Developing States (SIDS)] [varchar](50) NULL,
	[Developed   Developing Countries] [varchar](50) NULL
) ON [PRIMARY]
GO
