SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[LineItemCostTypeToProcIDHistory](
	[AccountDSI] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[LineItem] [varchar](13) NOT NULL,
	[CostType] [varchar](1) NOT NULL,
	[ProcID] [int] NOT NULL,
	[StartSourceFiscalYear] [int] NOT NULL,
	[EndSourceFiscalYear] [int] NOT NULL,
	[CSISmodifiedBy] [varchar](128) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] ADD  CONSTRAINT [DF__LineItemT__CSISm__21F6C7D6]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] ADD  CONSTRAINT [DF__LineItemT__CSISm__22EAEC0F]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemCostTypeToProcIDHistory_CostType] FOREIGN KEY([AccountDSI], [CostType])
REFERENCES [budget].[AccountDSIcostType] ([AccountDSI], [CostType])
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] CHECK CONSTRAINT [fk_LineItemCostTypeToProcIDHistory_CostType]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemToProcIDHistory_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] CHECK CONSTRAINT [fk_LineItemToProcIDHistory_AccountDSI]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemToProcIDHistory_BSA] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] CHECK CONSTRAINT [fk_LineItemToProcIDHistory_BSA]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemToProcIDHistory_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] CHECK CONSTRAINT [fk_LineItemToProcIDHistory_BudgetActivity]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemToProcIDHistory_LineItem] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItem] ([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] CHECK CONSTRAINT [fk_LineItemToProcIDHistory_LineItem]
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemToProcIDHistory_ProcID] FOREIGN KEY([ProcID])
REFERENCES [Project].[ProcID] ([ProcID])
GO
ALTER TABLE [Project].[LineItemCostTypeToProcIDHistory] CHECK CONSTRAINT [fk_LineItemToProcIDHistory_ProcID]
GO
