SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[P1staging](
	[BudgetActivity] [smallint] NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[LineItem] [varchar](10) NULL,
	[LineItemTitle] [varchar](45) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](44) NULL,
	[AddOrNonAdd] [varchar](7) NULL,
	[Classified] [varchar](1) NULL,
	[FiscalYear] [smallint] NULL,
	[LineNumber] [smallint] NULL,
	[AccountDSI] [varchar](5) NULL,
	[PByear] [smallint] NULL,
	[MainAccountName] [varchar](45) NULL,
	[BudgetSubActivity] [smallint] NULL,
	[BudgetSubActivityTitle] [varchar](52) NULL,
	[BaseOther] [varchar](14) NULL,
	[ProjectionType] [varchar](11) NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](28, 0) NULL,
	[BaseOtherSum] [varchar](7) NULL,
	[BaseOtherInclude] [bit] NULL,
	[DefenseOrganization] [varchar](9) NULL,
	[DefenseOrganizationName] [varchar](47) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]
GO
