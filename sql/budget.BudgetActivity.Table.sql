SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[BudgetActivity](
	[AccountDSI] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[ProcurementCategory] [varchar](31) NULL,
	[RnDbudgetActivity] [varchar](50) NULL,
	[IsNoFYDPexpected] [bit] NULL,
 CONSTRAINT [pk_BudgetActivity] PRIMARY KEY CLUSTERED 
(
	[AccountDSI] ASC,
	[BudgetActivity] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[BudgetActivity]  WITH NOCHECK ADD  CONSTRAINT [FK__BudgetAct__Defen__0CC6A0C6] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [budget].[BudgetActivity] CHECK CONSTRAINT [FK__BudgetAct__Defen__0CC6A0C6]
GO
ALTER TABLE [budget].[BudgetActivity]  WITH NOCHECK ADD  CONSTRAINT [FK__BudgetAct__Procu__17442F39] FOREIGN KEY([ProcurementCategory])
REFERENCES [Project].[DBAcategory] ([DBAcategory])
GO
ALTER TABLE [budget].[BudgetActivity] CHECK CONSTRAINT [FK__BudgetAct__Procu__17442F39]
GO
ALTER TABLE [budget].[BudgetActivity]  WITH NOCHECK ADD  CONSTRAINT [fk_BudgetActivity_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [budget].[BudgetActivity] CHECK CONSTRAINT [fk_BudgetActivity_AccountDSI]
GO
