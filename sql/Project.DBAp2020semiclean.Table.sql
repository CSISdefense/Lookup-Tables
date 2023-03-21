SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[DBAp2020semiclean](
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
	[ProcurementCategory] [varchar](31) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](50) NOT NULL,
	[ID] [smallint] NULL,
	[ClassifiedName] [varchar](1) NULL,
	[FiscalYear] [smallint] NULL,
	[ProjectionType] [varchar](11) NOT NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_project_dbaP2020semicleanstaging] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[MainAccountCode] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC,
	[CostTypeTitle] ASC,
	[ProjectionType] ASC,
	[BaseOther] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_dbaP2020semiclean_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_Budget_dbaP2020semiclean_AccountDSI]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_dbaP2020semiclean_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_Budget_dbaP2020semiclean_BudgetActivity]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_dbaP2020semiclean_BudgetSubActivity] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_Budget_dbaP2020semiclean_BudgetSubActivity]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_dbaP2020semiclean_CostType] FOREIGN KEY([CostType])
REFERENCES [budget].[CostType] ([CostType])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_Budget_dbaP2020semiclean_CostType]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_dbaP2020semiclean_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_Budget_dbaP2020semiclean_DefenseOrganization]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_dbaP2020semiclean_LineItem] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItem] ([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_Budget_dbaP2020semiclean_LineItem]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Project_dbaP2020semiclean_LineItemHistory] FOREIGN KEY([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItemHistory] ([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_Project_dbaP2020semiclean_LineItemHistory]
GO
ALTER TABLE [Project].[DBAp2020semiclean]  WITH CHECK ADD  CONSTRAINT [fk_project_DBAp2020semiclean_ProcurementCategory] FOREIGN KEY([ProcurementCategory])
REFERENCES [Project].[DBAcategory] ([DBAcategory])
GO
ALTER TABLE [Project].[DBAp2020semiclean] CHECK CONSTRAINT [fk_project_DBAp2020semiclean_ProcurementCategory]
GO
