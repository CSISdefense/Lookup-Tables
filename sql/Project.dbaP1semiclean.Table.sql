SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[dbaP1semiclean](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[MainAccountCode] [smallint] NOT NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[BudgetSubActivityTitle] [varchar](75) NULL,
	[LineItem] [varchar](13) NOT NULL,
	[LineItemTitle] [varchar](301) NULL,
	[ID] [int] NOT NULL,
	[ProcurementCategory] [varchar](31) NULL,
	[CostType] [varchar](1) NOT NULL,
	[CostTypeTitle] [varchar](50) NULL,
	[Classified] [varchar](1) NULL,
	[FiscalYear] [smallint] NULL,
	[ProjectionType] [varchar](11) NOT NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_project_dbap1staging] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[MainAccountCode] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC,
	[CostType] ASC,
	[ProjectionType] ASC,
	[BaseOther] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_DBAp1_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Budget_DBAp1_AccountDSI]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_DBAp1_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Budget_DBAp1_BudgetActivity]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_DBAp1_BudgetSubActivity] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Budget_DBAp1_BudgetSubActivity]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_DBAp1_Classified] FOREIGN KEY([Classified])
REFERENCES [budget].[Classified] ([Classified])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Budget_DBAp1_Classified]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_DBAp1_CostType] FOREIGN KEY([CostType])
REFERENCES [budget].[CostType] ([CostType])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Budget_DBAp1_CostType]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_DBAp1_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Budget_DBAp1_DefenseOrganization]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_DBAp1_LineItem] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItem] ([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Budget_DBAp1_LineItem]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Project_dbaP1semiclean_LineItemHistory] FOREIGN KEY([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItemHistory] ([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_Project_dbaP1semiclean_LineItemHistory]
GO
ALTER TABLE [Project].[dbaP1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_project_DBAp1semiclean_ProcurementCategory] FOREIGN KEY([ProcurementCategory])
REFERENCES [Project].[ProcurementCategory] ([ProcurementCategory])
GO
ALTER TABLE [Project].[dbaP1semiclean] CHECK CONSTRAINT [fk_project_DBAp1semiclean_ProcurementCategory]
GO
