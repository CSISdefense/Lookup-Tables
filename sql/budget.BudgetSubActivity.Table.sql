SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[BudgetSubActivity](
	[AccountDSI] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[BudgetSubActivityTitle] [varchar](52) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[ProcurementCategory] [varchar](31) NULL,
 CONSTRAINT [pk_BSA] PRIMARY KEY CLUSTERED 
(
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[BudgetSubActivity]  WITH NOCHECK ADD  CONSTRAINT [FK__BSA__DefenseOrga__118B55E3] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [budget].[BudgetSubActivity] CHECK CONSTRAINT [FK__BSA__DefenseOrga__118B55E3]
GO
ALTER TABLE [budget].[BudgetSubActivity]  WITH NOCHECK ADD  CONSTRAINT [FK__BSA__Procurement__16500B00] FOREIGN KEY([ProcurementCategory])
REFERENCES [Project].[DBAcategory] ([DBAcategory])
GO
ALTER TABLE [budget].[BudgetSubActivity] CHECK CONSTRAINT [FK__BSA__Procurement__16500B00]
GO
ALTER TABLE [budget].[BudgetSubActivity]  WITH NOCHECK ADD  CONSTRAINT [fk_BSA_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [budget].[BudgetSubActivity] CHECK CONSTRAINT [fk_BSA_AccountDSI]
GO
ALTER TABLE [budget].[BudgetSubActivity]  WITH NOCHECK ADD  CONSTRAINT [fk_BSA_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [budget].[BudgetSubActivity] CHECK CONSTRAINT [fk_BSA_BudgetActivity]
GO
