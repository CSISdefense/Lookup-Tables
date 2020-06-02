SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[DBAr1](
	[PByear] [smallint] NULL,
	[AccountDSI] [varchar](5) NULL,
	[MainAccountName] [varchar](45) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[BudgetActivity] [smallint] NULL,
	[BudgetActivityTitle] [varchar](48) NULL,
	[LineNumber] [int] NULL,
	[ProgramElement] [varchar](10) NULL,
	[ProgramElementTitle] [varchar](80) NULL,
	[IncludeInTOA] [varchar](1) NULL,
	[Classified] [varchar](20) NULL,
	[FiscalYear] [smallint] NULL,
	[OriginType] [varchar](7) NULL,
	[PBtotal] [int] NULL,
	[PBtype] [int] NULL,
	[EnactedTotal] [int] NULL,
	[EnactedType] [int] NULL,
	[SpecialType] [int] NULL,
	[ActualTotal] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [budget].[DBAr1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseR1_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [budget].[DBAr1] CHECK CONSTRAINT [fk_DefenseR1_AccountDSI]
GO
ALTER TABLE [budget].[DBAr1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseR1_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [budget].[DBAr1] CHECK CONSTRAINT [fk_DefenseR1_BudgetActivity]
GO
ALTER TABLE [budget].[DBAr1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseR1_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [budget].[DBAr1] CHECK CONSTRAINT [fk_DefenseR1_DefenseOrganization]
GO
ALTER TABLE [budget].[DBAr1]  WITH NOCHECK ADD  CONSTRAINT [FK_ProgramElement] FOREIGN KEY([ProgramElement])
REFERENCES [Project].[ProgramElement] ([ProgramElement])
GO
ALTER TABLE [budget].[DBAr1] CHECK CONSTRAINT [FK_ProgramElement]
GO
