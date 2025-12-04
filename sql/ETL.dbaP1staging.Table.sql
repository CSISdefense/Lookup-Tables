SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[dbaP1staging](
	[PByear] [smallint] NOT NULL,
	[MainAccountCode] [smallint] NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[BudgetSubActivityTitle] [varchar](75) NULL,
	[LineItem] [varchar](13) NULL,
	[LineItemTitle] [varchar](301) NULL,
	[DBAcategory] [varchar](31) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](50) NULL,
	[ID] [smallint] NULL,
	[Classified] [varchar](1) NULL,
	[FiscalYear] [smallint] NULL,
	[ProjectionType] [varchar](11) NULL,
	[BaseOther] [varchar](14) NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](19, 4) NULL,
	[AccountDSI] [varchar](5) NULL,
	[DefenseOrganization] [varchar](5) NULL
) ON [PRIMARY]
GO
