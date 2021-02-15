SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[LineItem](
	[AccountDSI] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[LineItem] [varchar](13) NOT NULL,
	[LineItemTitle] [varchar](301) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[ProcurementCategory] [varchar](31) NULL,
	[IsLineItemAlsoLineNumber] [bit] NULL,
 CONSTRAINT [pk_Project_LineItem] PRIMARY KEY CLUSTERED 
(
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[LineItem]  WITH NOCHECK ADD  CONSTRAINT [FK__LineItem__Defens__13739E55] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[LineItem] CHECK CONSTRAINT [FK__LineItem__Defens__13739E55]
GO
ALTER TABLE [Project].[LineItem]  WITH NOCHECK ADD  CONSTRAINT [FK__LineItem__Procur__18385372] FOREIGN KEY([ProcurementCategory])
REFERENCES [Project].[ProcurementCategory] ([ProcurementCategory])
GO
ALTER TABLE [Project].[LineItem] CHECK CONSTRAINT [FK__LineItem__Procur__18385372]
GO
ALTER TABLE [Project].[LineItem]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItem_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[LineItem] CHECK CONSTRAINT [fk_LineItem_AccountDSI]
GO
ALTER TABLE [Project].[LineItem]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItem_BSA] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[LineItem] CHECK CONSTRAINT [fk_LineItem_BSA]
GO
ALTER TABLE [Project].[LineItem]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItem_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[LineItem] CHECK CONSTRAINT [fk_LineItem_BudgetActivity]
GO
