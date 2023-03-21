SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[P40semiclean](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[MainAccountName] [varchar](45) NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[DefenseOrganizationName] [varchar](50) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[BudgetSubActivityTitle] [varchar](75) NULL,
	[LineItem] [varchar](13) NOT NULL,
	[LineItemTitle] [varchar](301) NULL,
	[CostType] [varchar](1) NOT NULL,
	[CostTypeTitle] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[ProgramElementsforCodeBItems] [varchar](68) NULL,
	[OtherRelatedProgramElements] [varchar](148) NULL,
	[IsContinuing] [bit] NULL,
	[IDcode] [varchar](1) NULL,
	[MDAP] [varchar](4) NULL,
	[Type] [varchar](4) NULL,
	[header1] [varchar](50) NULL,
	[Book] [varchar](100) NULL,
	[LineNumber] [smallint] NULL,
	[FiscalYear] [smallint] NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[ProjectionType] [varchar](10) NOT NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_PByear_AccountDSI_BudgetActivity_BudgetSubActivity_LineItem_CostType_BaseOther_ProjectionType] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC,
	[CostType] ASC,
	[BaseOther] ASC,
	[ProjectionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_AccountDSI]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_AccountDSI_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_AccountDSI_BudgetActivity]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_AccountDSI_BudgetActivity_BudgetSubActivity] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_AccountDSI_BudgetActivity_BudgetSubActivity]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_BaseOther] FOREIGN KEY([BaseOther])
REFERENCES [budget].[BaseOther] ([BaseOther])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_BaseOther]
GO
ALTER TABLE [Project].[P40semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_p40_long_CostType] FOREIGN KEY([CostType])
REFERENCES [budget].[CostType] ([CostType])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_CostType]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_DefenseOrganization]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_IDcode] FOREIGN KEY([IDcode])
REFERENCES [budget].[IDcode] ([IDcode])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_IDcode]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_JBookHeader] FOREIGN KEY([header1])
REFERENCES [budget].[JBookHeader] ([JBookHeader])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_JBookHeader]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_budget_p40_long_MDAP] FOREIGN KEY([MDAP])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_budget_p40_long_MDAP]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_budget_P40_long_PByear_AccountDSI_DefOrg_BA_BSA_LineItem] FOREIGN KEY([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItemHistory] ([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_budget_P40_long_PByear_AccountDSI_DefOrg_BA_BSA_LineItem]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_ProjectionType] FOREIGN KEY([ProjectionType])
REFERENCES [budget].[ProjectionType] ([ProjectionType])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_ProjectionType]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_p40_long_Type] FOREIGN KEY([Type])
REFERENCES [budget].[Type] ([Type])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Budget_p40_long_Type]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Project_p40semiclean_LineItem] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItem] ([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [fk_Project_p40semiclean_LineItem]
GO
ALTER TABLE [Project].[P40semiclean]  WITH CHECK ADD  CONSTRAINT [CHK_Project_P40_Long_Negative_CostType_B] CHECK  (([Value]<=(0) OR [CostType]<>'B'))
GO
ALTER TABLE [Project].[P40semiclean] CHECK CONSTRAINT [CHK_Project_P40_Long_Negative_CostType_B]
GO
