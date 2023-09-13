SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProgramElementHistory](
	[PByear] [smallint] NOT NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[CSISbudgetLineKeyR1] [varchar](50) NULL,
	[CSISbudgetLineKeyR2] [varchar](50) NULL,
	[IsProgramElementAlsoLineNumber] [bit] NULL,
	[CSIScreateddate] [datetime] NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[IsHandoff] [bit] NOT NULL,
	[CSISbudgetLineKeyDBAr2016] [varchar](50) NULL,
	[CSISbudgetLineKeyDBAr2020] [varchar](50) NULL,
	[CSISBudgetLineKeyDBA] [varchar](50) NULL,
 CONSTRAINT [pk_Budget_ProgramElementHistory] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[ProgramElementHistory] ADD  CONSTRAINT [project_ProgramElementHistory_CSIScreateddate_getdate]  DEFAULT (getdate()) FOR [CSIScreateddate]
GO
ALTER TABLE [Project].[ProgramElementHistory] ADD  CONSTRAINT [project_ProgramElementHistory_CSISmodifiedDate_getdate]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[ProgramElementHistory] ADD  CONSTRAINT [project_ProgramElementHistory_system_user]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[ProgramElementHistory] ADD  DEFAULT ((0)) FOR [IsHandoff]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD FOREIGN KEY([CSISBudgetLineKeyDBA])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyDBAr2016])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyDBAr2020])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyR1])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyR2])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_ProgramElementHistory_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [fk_Project_ProgramElementHistory_AccountDSI]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_ProgramElementHistory_AccountDSI_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [fk_Project_ProgramElementHistory_AccountDSI_BudgetActivity]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_ProgramElementHistory_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [fk_Project_ProgramElementHistory_DefenseOrganization]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_ProgramElementHistory_ProgramElement] FOREIGN KEY([ProgramElement])
REFERENCES [Project].[ProgramElement] ([ProgramElement])
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [fk_Project_ProgramElementHistory_ProgramElement]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [chk_CSISbudgetLineKeyAligned] CHECK  ((NOT [CSISbudgetLineKeyR1]<>coalesce([CSISbudgetLineKeyR2],[CSISbudgetLineKeyR1]) AND NOT [CSISbudgetLineKeyR1]<>coalesce([CSISbudgetLineKeyR2],[CSISbudgetLineKeyDBAr2016]) AND NOT [CSISbudgetLineKeyR1]<>coalesce([CSISbudgetLineKeyR2],[CSISbudgetLineKeyDBAr2016]) OR ([CSISbudgetLineKeyR1] IS NULL AND (NOT [CSISbudgetLineKeyR2]<>coalesce([CSISbudgetLineKeyDBAr2016],[CSISbudgetLineKeyR2]) AND NOT [CSISbudgetLineKeyR2]<>coalesce([CSISbudgetLineKeyDBAr2020],[CSISbudgetLineKeyR2])) OR [CSISbudgetLineKeyR2] IS NULL AND NOT [CSISbudgetLineKeyDBAr2016]<>coalesce([CSISbudgetLineKeyDBAr2020],[CSISbudgetLineKeyDBAr2016]))))
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [chk_CSISbudgetLineKeyAligned]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [chk_Project_ProgramElementHistory_CSISbudgetLineKeyDBAaligned] CHECK  (([CSISbudgetLineKeyDBA] IS NULL OR NOT [CSISbudgetLineKeyDBA]<>coalesce([CSISbudgetLineKeyDBAr2016],[CSISbudgetLineKeyDBA]) AND NOT [CSISbudgetLineKeyDBA]<>coalesce([CSISbudgetLineKeyDBAr2020],[CSISbudgetLineKeyDBA])))
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [chk_Project_ProgramElementHistory_CSISbudgetLineKeyDBAaligned]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [chk_Project_ProgramElementHistory_CSISbudgetLineKeyR1aligned] CHECK  (([CSISbudgetLineKeyR1] IS NULL OR NOT [CSISbudgetLineKeyR1]<>coalesce([CSISbudgetLineKeyR2],[CSISbudgetLineKeyR1]) AND NOT [CSISbudgetLineKeyR1]<>coalesce([CSISbudgetLineKeyDBA],[CSISbudgetLineKeyR1])))
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [chk_Project_ProgramElementHistory_CSISbudgetLineKeyR1aligned]
GO
ALTER TABLE [Project].[ProgramElementHistory]  WITH CHECK ADD  CONSTRAINT [chk_Project_ProgramElementHistory_CSISbudgetLineKeyR2aligned] CHECK  (([CSISbudgetLineKeyR2] IS NULL OR NOT [CSISbudgetLineKeyR2]<>coalesce([CSISbudgetLineKeyR1],[CSISbudgetLineKeyR2]) AND NOT [CSISbudgetLineKeyR1]<>coalesce([CSISbudgetLineKeyDBA],[CSISbudgetLineKeyR2])))
GO
ALTER TABLE [Project].[ProgramElementHistory] CHECK CONSTRAINT [chk_Project_ProgramElementHistory_CSISbudgetLineKeyR2aligned]
GO
