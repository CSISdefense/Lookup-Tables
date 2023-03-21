SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[R1semiclean](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[MainAccountName] [varchar](45) NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[DefenseOrganizationName] [varchar](50) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[IncludeInTOA] [bit] NULL,
	[Classified] [varchar](1) NULL,
	[LineNumber] [smallint] NULL,
	[FiscalYear] [smallint] NOT NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[ProjectionType] [varchar](10) NOT NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_PByear_AccountDSI_BudgetActivity_ProgramElement_BaseOther_ProjectionType] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC,
	[BaseOther] ASC,
	[ProjectionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[R1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r1_long_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[R1semiclean] CHECK CONSTRAINT [fk_Budget_r1_long_AccountDSI]
GO
ALTER TABLE [Project].[R1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r1_long_AccountDSI_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[R1semiclean] CHECK CONSTRAINT [fk_Budget_r1_long_AccountDSI_BudgetActivity]
GO
ALTER TABLE [Project].[R1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r1_long_BaseOther] FOREIGN KEY([BaseOther])
REFERENCES [budget].[BaseOther] ([BaseOther])
GO
ALTER TABLE [Project].[R1semiclean] CHECK CONSTRAINT [fk_Budget_r1_long_BaseOther]
GO
ALTER TABLE [Project].[R1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r1_long_Classified] FOREIGN KEY([Classified])
REFERENCES [budget].[Classified] ([Classified])
GO
ALTER TABLE [Project].[R1semiclean] CHECK CONSTRAINT [fk_Budget_r1_long_Classified]
GO
ALTER TABLE [Project].[R1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r1_long_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[R1semiclean] CHECK CONSTRAINT [fk_Budget_r1_long_DefenseOrganization]
GO
ALTER TABLE [Project].[R1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r1_long_ProjectionType] FOREIGN KEY([ProjectionType])
REFERENCES [budget].[ProjectionType] ([ProjectionType])
GO
ALTER TABLE [Project].[R1semiclean] CHECK CONSTRAINT [fk_Budget_r1_long_ProjectionType]
GO
ALTER TABLE [Project].[R1semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Project_R1semiclean_ProgramElement] FOREIGN KEY([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [ProgramElement])
REFERENCES [Project].[ProgramElementHistory] ([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [ProgramElement])
GO
ALTER TABLE [Project].[R1semiclean] CHECK CONSTRAINT [fk_Project_R1semiclean_ProgramElement]
GO
