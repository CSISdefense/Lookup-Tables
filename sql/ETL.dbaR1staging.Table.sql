SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[dbaR1staging](
	[PByear] [smallint] NULL,
	[MainAccountCode] [smallint] NULL,
	[BudgetActivity] [smallint] NULL,
	[BudgetActivityTitle] [varchar](48) NULL,
	[ProgramElement] [varchar](10) NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[ID] [smallint] NULL,
	[Classified] [varchar](20) NULL,
	[FiscalYear] [smallint] NULL,
	[ProjectionType] [varchar](11) NULL,
	[BaseOther] [varchar](14) NULL,
	[Value] [decimal](19, 4) NULL,
	[AccountDSI] [varchar](5) NULL,
	[DefenseOrganization] [varchar](5) NULL
) ON [PRIMARY]
GO
ALTER TABLE [ETL].[dbaR1staging]  WITH CHECK ADD FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
