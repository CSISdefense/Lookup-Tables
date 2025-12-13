SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[p40manual](
	[PByear] [smallint] NULL,
	[AccountDSI] [varchar](5) NULL,
	[MainAccountCode] [smallint] NULL,
	[MainAccountName] [varchar](33) NULL,
	[BudgetActivity] [smallint] NULL,
	[BudgetActivityTitle] [varchar](48) NULL,
	[BudgetSubActivity] [smallint] NULL,
	[BudgetSubActivityTitle] [varchar](44) NULL,
	[LineItem] [varchar](13) NULL,
	[LineItemTitle] [varchar](38) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](30) NULL,
	[FiscalYear] [smallint] NULL,
	[BaseOther] [varchar](5) NULL,
	[ProjectionType] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[Value] [int] NULL,
	[Type] [varchar](4) NULL,
	[DefenseOrganization] [varchar](4) NULL,
	[IsContinuing] [varchar](max) NULL,
	[CSISbudgetLineKey] [varchar](24) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
