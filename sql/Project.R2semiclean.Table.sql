SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[R2semiclean](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[DefenseOrganizationName] [varchar](50) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[Description] [varchar](max) NULL,
	[LineNumber] [smallint] NULL,
	[Type] [varchar](4) NULL,
	[header1] [varchar](50) NULL,
	[Book] [varchar](100) NULL,
	[FiscalYear] [smallint] NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[ProjectionType] [varchar](10) NOT NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_PByear_DefenseOrganization_BudgetActivity_ProgramElement_BaseOther_ProjectionType] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC,
	[BaseOther] ASC,
	[ProjectionType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r2_long_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Budget_r2_long_AccountDSI]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r2_long_AccountDSI_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Budget_r2_long_AccountDSI_BudgetActivity]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r2_long_BaseOther] FOREIGN KEY([BaseOther])
REFERENCES [budget].[BaseOther] ([BaseOther])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Budget_r2_long_BaseOther]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r2_long_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Budget_r2_long_DefenseOrganization]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r2_long_JBookHeader] FOREIGN KEY([header1])
REFERENCES [budget].[JBookHeader] ([JBookHeader])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Budget_r2_long_JBookHeader]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r2_long_ProjectionType] FOREIGN KEY([ProjectionType])
REFERENCES [budget].[ProjectionType] ([ProjectionType])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Budget_r2_long_ProjectionType]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Budget_r2_long_Type] FOREIGN KEY([Type])
REFERENCES [budget].[Type] ([Type])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Budget_r2_long_Type]
GO
ALTER TABLE [Project].[R2semiclean]  WITH CHECK ADD  CONSTRAINT [fk_Project_R2semiclean_ProgramElement] FOREIGN KEY([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [ProgramElement])
REFERENCES [Project].[ProgramElementHistory] ([PByear], [AccountDSI], [DefenseOrganization], [BudgetActivity], [ProgramElement])
GO
ALTER TABLE [Project].[R2semiclean] CHECK CONSTRAINT [fk_Project_R2semiclean_ProgramElement]
GO
