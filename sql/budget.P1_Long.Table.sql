SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[P1_Long](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[MainAccountCode] [smallint] NOT NULL,
	[MainAccountName] [varchar](45) NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[DefenseOrganizationName] [varchar](50) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[BudgetSubActivityTitle] [varchar](75) NULL,
	[LineItem] [varchar](13) NOT NULL,
	[LineItemTitle] [varchar](301) NULL,
	[CostType] [varchar](1) NOT NULL,
	[CostTypeTitle] [varchar](50) NOT NULL,
	[AddOrNonAdd] [varchar](7) NULL,
	[Classified] [varchar](1) NULL,
	[LineNumber] [smallint] NULL,
	[FiscalYear] [smallint] NOT NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[ProjectionType] [varchar](10) NOT NULL,
	[BaseOtherSum] [varchar](7) NULL,
	[BaseOtherInclude] [bit] NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_PByear_AccountDSI_DefenseOrganization_BudgetActivity_BudgetSubActivity_LineItem_CostTypeTitle_BaseOther_ProjectionType] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC,
	[CostTypeTitle] ASC,
	[BaseOther] ASC,
	[ProjectionType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
