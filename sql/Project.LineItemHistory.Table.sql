SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[LineItemHistory](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[LineItem] [varchar](13) NOT NULL,
	[LineItemTitle] [varchar](301) NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[CSISbudgetLineKeyP1] [varchar](50) NULL,
	[CSISbudgetLineKeyP40] [varchar](50) NULL,
	[IsLineItemAlsoLineNumber] [bit] NULL,
	[CSIScreateddate] [datetime] NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[IncludesAdvancedProcurement] [bit] NOT NULL,
	[CSISbudgetLineKeyDBAp2016] [varchar](50) NULL,
	[CSISbudgetLineKeyDBAp2020] [varchar](50) NULL,
	[IsHandoff] [bit] NOT NULL,
	[CSISBudgetLineKeyDBA] [varchar](50) NULL,
 CONSTRAINT [pk_Project_LineItemHistory] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[LineItemHistory] ADD  CONSTRAINT [project_LineItemHistory_CSIScreateddate_getdate]  DEFAULT (getdate()) FOR [CSIScreateddate]
GO
ALTER TABLE [Project].[LineItemHistory] ADD  CONSTRAINT [project_LineItemHistory_CSISmodifiedDate_getdate]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[LineItemHistory] ADD  CONSTRAINT [project_LineItemHistory_system_user]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[LineItemHistory] ADD  DEFAULT ((0)) FOR [IsHandoff]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD FOREIGN KEY([CSISBudgetLineKeyDBA])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyP1])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyP40])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyDBAp2016])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD FOREIGN KEY([CSISbudgetLineKeyDBAp2020])
REFERENCES [Project].[CSISbudgetLineKey] ([CSISbudgetLineKey])
GO
ALTER TABLE [Project].[LineItemHistory]  WITH NOCHECK ADD  CONSTRAINT [FK__LineItemHistory__Defens__13739E55] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [FK__LineItemHistory__Defens__13739E55]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemHistory_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_LineItemHistory_AccountDSI]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemHistory_BSA] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_LineItemHistory_BSA]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_LineItemHistory_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_LineItemHistory_BudgetActivity]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_LineItemHistory_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_Project_LineItemHistory_AccountDSI]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_LineItemHistory_AccountDSI_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_Project_LineItemHistory_AccountDSI_BudgetActivity]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_LineItemHistory_AccountDSI_BudgetActivity_BudgetSubActivity] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_Project_LineItemHistory_AccountDSI_BudgetActivity_BudgetSubActivity]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_LineItemHistory_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_Project_LineItemHistory_DefenseOrganization]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [fk_Project_LineItemHistory_LineItem] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
REFERENCES [Project].[LineItem] ([AccountDSI], [BudgetActivity], [BudgetSubActivity], [LineItem])
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [fk_Project_LineItemHistory_LineItem]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyAligned] CHECK  ((NOT [CSISbudgetLineKeyp1]<>coalesce([CSISbudgetLineKeyP40],[CSISbudgetLineKeyp1]) AND NOT [CSISbudgetLineKeyp1]<>coalesce([CSISbudgetLineKeyP40],[CSISbudgetLineKeyp1]) AND NOT [CSISbudgetLineKeyp1]<>coalesce([CSISbudgetLineKeyDBA],[CSISbudgetLineKeyp1]) OR [CSISbudgetLineKeyp1] IS NULL AND NOT [CSISbudgetLineKeyP40]<>coalesce([CSISbudgetLineKeyDBA],[CSISbudgetLineKeyP40]) OR [IsLineItemAlsoLineNumber]=(1)))
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyAligned]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyDBAaligned] CHECK  (([CSISbudgetLineKeyDBA] IS NULL OR NOT [CSISbudgetLineKeyDBA]<>coalesce([CSISbudgetLineKeyDBAP2016],[CSISbudgetLineKeyDBA]) AND NOT [CSISbudgetLineKeyDBA]<>coalesce([CSISbudgetLineKeyDBAp2020],[CSISbudgetLineKeyDBA])))
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyDBAaligned]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyP1aligned] CHECK  (([CSISbudgetLineKeyp1] IS NULL OR NOT [CSISbudgetLineKeyp1]<>coalesce([CSISbudgetLineKeyP40],[CSISbudgetLineKeyp1]) AND NOT [CSISbudgetLineKeyp1]<>coalesce([CSISbudgetLineKeyDBA],[CSISbudgetLineKeyp1]) OR [IsLineItemAlsoLineNumber]=(1)))
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyP1aligned]
GO
ALTER TABLE [Project].[LineItemHistory]  WITH CHECK ADD  CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyP40aligned] CHECK  (([CSISbudgetLineKeyp40] IS NULL OR NOT [CSISbudgetLineKeyp40]<>coalesce([CSISbudgetLineKeyP1],[CSISbudgetLineKeyp40]) AND NOT [CSISbudgetLineKeyp1]<>coalesce([CSISbudgetLineKeyDBA],[CSISbudgetLineKeyp40]) OR [IsLineItemAlsoLineNumber]=(1)))
GO
ALTER TABLE [Project].[LineItemHistory] CHECK CONSTRAINT [chk_Project_LineItemHistory_CSISbudgetLineKeyP40aligned]
GO
