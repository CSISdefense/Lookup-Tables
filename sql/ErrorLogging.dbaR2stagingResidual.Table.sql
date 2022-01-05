SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[dbaR2stagingResidual](
	[PByear] [smallint] NULL,
	[MainAccountCode] [smallint] NULL,
	[MainAccountName] [varchar](86) NULL,
	[Service] [varchar](12) NULL,
	[BudgetActivity] [smallint] NULL,
	[ProgramElement] [varchar](10) NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[FiscalYear] [smallint] NULL,
	[ProjectionType] [varchar](11) NULL,
	[BaseOther] [varchar](14) NULL,
	[Value] [decimal](19, 4) NULL,
	[AccountDSI] [varchar](5) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[DBAcategory] [varchar](31) NULL,
	[DBAsubCategory] [varchar](50) NULL,
	[Classified] [varchar](20) NULL
) ON [PRIMARY]
GO
