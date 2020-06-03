SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[DBAp1](
	[PByear] [smallint] NULL,
	[AccountDSI] [varchar](5) NULL,
	[MainAccountName] [varchar](45) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[LineNumber] [smallint] NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[BudgetSubActivityTitle] [varchar](75) NULL,
	[LineItem] [varchar](13) NOT NULL,
	[LineItemTitle] [varchar](301) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](50) NULL,
	[AddOrNonAdd] [varchar](7) NULL,
	[Classified] [varchar](1) NULL,
	[FiscalYear] [smallint] NULL,
	[OriginType] [varchar](7) NULL,
	[PBtotal] [int] NULL,
	[PBtype] [int] NULL,
	[EnactedTotal] [int] NULL,
	[EnactedType] [int] NULL,
	[SpecialType] [int] NULL,
	[ActualTotal] [int] NULL,
	[QuantPBtotal] [int] NULL,
	[QuantPBtype] [int] NULL,
	[QuantEnactedTotal] [int] NULL,
	[QuantEnactedType] [int] NULL,
	[QuantSpecialType] [int] NULL,
	[QuantActualTotal] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [budget].[DBAp1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseP1_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [budget].[DBAp1] CHECK CONSTRAINT [fk_DefenseP1_AccountDSI]
GO
ALTER TABLE [budget].[DBAp1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseP1_BSA] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [budget].[DBAp1] CHECK CONSTRAINT [fk_DefenseP1_BSA]
GO
ALTER TABLE [budget].[DBAp1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseP1_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [budget].[DBAp1] CHECK CONSTRAINT [fk_DefenseP1_BudgetActivity]
GO
ALTER TABLE [budget].[DBAp1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseP1_CostType] FOREIGN KEY([AccountDSI], [CostType])
REFERENCES [budget].[CostType] ([AccountDSI], [CostType])
GO
ALTER TABLE [budget].[DBAp1] CHECK CONSTRAINT [fk_DefenseP1_CostType]
GO
ALTER TABLE [budget].[DBAp1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseP1_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [budget].[DBAp1] CHECK CONSTRAINT [fk_DefenseP1_DefenseOrganization]
GO
ALTER TABLE [budget].[DBAp1]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseP1_LineItem] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItem] ([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [budget].[DBAp1] CHECK CONSTRAINT [fk_DefenseP1_LineItem]
GO
