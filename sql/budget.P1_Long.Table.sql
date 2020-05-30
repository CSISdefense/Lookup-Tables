USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[P1_Long](
	[PByear] [varchar](255) NULL,
	[AccountDSI] [varchar](255) NULL,
	[MainAccountCode] [varchar](255) NULL,
	[MainAccountName] [varchar](255) NULL,
	[Organization] [varchar](255) NULL,
	[BudgetActivity] [varchar](255) NULL,
	[BudgetActivityTitle] [varchar](255) NULL,
	[BudgetSubActivity] [varchar](255) NULL,
	[BudgetSubActivityTitle] [varchar](255) NULL,
	[LineItem] [varchar](255) NULL,
	[LineItemTitle] [varchar](255) NULL,
	[CostType] [varchar](255) NULL,
	[CostTypeTitle] [varchar](255) NULL,
	[AddOrNonAdd] [varchar](255) NULL,
	[Classified] [varchar](255) NULL,
	[FiscalYear] [varchar](255) NULL,
	[BaseOther] [varchar](255) NULL,
	[ProjectionType] [varchar](255) NULL,
	[Quantity] [varchar](255) NULL,
	[Value] [varchar](255) NULL,
	[LineNumber] [varchar](255) NULL,
	[BaseOtherSum] [varchar](255) NULL,
	[BaseOtherInclude] [varchar](255) NULL
) ON [PRIMARY]
GO
