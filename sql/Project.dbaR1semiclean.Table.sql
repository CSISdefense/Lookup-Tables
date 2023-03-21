SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[dbaR1semiclean](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[MainAccountCode] [smallint] NOT NULL,
	[MainAccountName] [varchar](45) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[ID] [smallint] NOT NULL,
	[ClassifiedName] [varchar](20) NULL,
	[FiscalYear] [smallint] NULL,
	[ProjectionType] [varchar](11) NOT NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[Value] [decimal](19, 4) NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
 CONSTRAINT [pk_DBAr1_Long] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[MainAccountCode] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC,
	[ProjectionType] ASC,
	[BaseOther] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Project_dbaR1SemiClean_PByear_ADSI_DefOrg_BA_PE_Proj_BaseOther] ON [Project].[dbaR1semiclean]
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC,
	[ProjectionType] ASC,
	[BaseOther] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Project].[dbaR1semiclean]  WITH CHECK ADD FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[dbaR1semiclean]  WITH NOCHECK ADD  CONSTRAINT [fk_Budget_DBAr1_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[dbaR1semiclean] CHECK CONSTRAINT [fk_Budget_DBAr1_BudgetActivity]
GO
ALTER TABLE [Project].[dbaR1semiclean]  WITH NOCHECK ADD  CONSTRAINT [FK_Budget_DBAr1_ProgramElement] FOREIGN KEY([ProgramElement])
REFERENCES [Project].[ProgramElement] ([ProgramElement])
GO
ALTER TABLE [Project].[dbaR1semiclean] CHECK CONSTRAINT [FK_Budget_DBAr1_ProgramElement]
GO
ALTER TABLE [Project].[dbaR1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Project_dbaR1semiclean_ProgramElementHistory] FOREIGN KEY([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [ProgramElement])
REFERENCES [Project].[ProgramElementHistory] ([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [ProgramElement])
GO
ALTER TABLE [Project].[dbaR1semiclean] CHECK CONSTRAINT [fk_Project_dbaR1semiclean_ProgramElementHistory]
GO
