SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[DBAr2021staging](
	[PByear] [smallint] NULL,
	[MainAccountCode] [smallint] NULL,
	[MainAccountName] [varchar](86) NULL,
	[Service] [varchar](12) NULL,
	[BudgetActivity] [smallint] NULL,
	[ProgramElement] [varchar](10) NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[Classified] [varchar](20) NULL,
	[Category] [varchar](31) NULL,
	[SubCategory] [varchar](50) NULL,
	[FiscalYear] [smallint] NULL,
	[ProjectionType] [varchar](11) NULL,
	[BaseOther] [varchar](14) NULL,
	[Value] [decimal](19, 4) NULL,
	[AccountDSI] [varchar](5) NULL,
	[DefenseOrganization] [varchar](5) NULL
) ON [PRIMARY]
GO
