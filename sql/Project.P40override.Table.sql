SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[P40override](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[LineItem] [varchar](13) NOT NULL,
	[LineItemTitle] [varchar](301) NULL,
	[CostType] [varchar](1) NOT NULL,
	[CostTypeTitle] [varchar](50) NULL,
	[OverrideCostType] [varchar](1) NULL,
	[OverrideCostTypeTitle] [varchar](50) NULL,
	[IsDuplicateActual] [bit] NULL,
	[ActualBeforeDivision] [decimal](19, 4) NULL,
	[OverrideActual] [decimal](19, 4) NULL,
 CONSTRAINT [pk_project_p40override] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC,
	[CostType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
