USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[P1_Long](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[MainAccountCode] [smallint] NOT NULL,
	[MainAccountName] [varchar](45) NULL,
	[Organization] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[BudgetSubActivityTitle] [varchar](52) NULL,
	[LineItem] [varchar](10) NOT NULL,
	[LineItemTitle] [varchar](45) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](44) NOT NULL,
	[AddOrNonAdd] [varchar](7) NULL,
	[Classified] [varchar](1) NULL,
	[FiscalYear] [smallint] NOT NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[ProjectionType] [varchar](7) NOT NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](19, 4) NULL,
	[LineNumber] [int] NULL,
	[BaseOtherSum] [varchar](7) NULL,
	[BaseOtherInclude] [varchar](5) NULL
) ON [PRIMARY]
GO
