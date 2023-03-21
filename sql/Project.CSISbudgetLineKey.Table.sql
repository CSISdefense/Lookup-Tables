SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[CSISbudgetLineKey](
	[CSISbudgetLineKey] [varchar](50) NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetSubActivity] [smallint] NULL,
	[LineItem] [varchar](13) NULL,
	[ProgramElement] [varchar](10) NULL,
	[CSISbudgetLineTitle] [varchar](301) NULL,
	[IsLineItemAlsoLineNumber] [bit] NULL,
	[CSIScreateddate] [datetime] NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[IsNoFYDPexpected] [bit] NULL,
	[Comments] [varchar](255) NULL,
	[IsInvestigatedMismatch] [bit] NULL,
	[IsDBAaggregated] [bit] NOT NULL,
	[IsComptrollerJBookAggregationMismatch] [bit] NOT NULL,
 CONSTRAINT [pk_CSISbudgetLineKey] PRIMARY KEY CLUSTERED 
(
	[CSISbudgetLineKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_CSISbudgetLineKey_AccountDSI_BA_BSA_LI_PE] UNIQUE NONCLUSTERED 
(
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC,
	[ProgramElement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[CSISbudgetLineKey] ADD  CONSTRAINT [project_CSISbudgetLineKey_CSIScreateddate_getdate]  DEFAULT (getdate()) FOR [CSIScreateddate]
GO
ALTER TABLE [Project].[CSISbudgetLineKey] ADD  CONSTRAINT [project_CSISbudgetLineKey_CSISmodifiedDate_getdate]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[CSISbudgetLineKey] ADD  CONSTRAINT [project_CSISbudgetLineKey_system_user]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[CSISbudgetLineKey] ADD  DEFAULT ((0)) FOR [IsDBAaggregated]
GO
ALTER TABLE [Project].[CSISbudgetLineKey] ADD  DEFAULT ((0)) FOR [IsComptrollerJBookAggregationMismatch]
GO
ALTER TABLE [Project].[CSISbudgetLineKey]  WITH NOCHECK ADD  CONSTRAINT [FK__Project_CSISbudgetLineKey__DefenseOrg] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [Project].[CSISbudgetLineKey] CHECK CONSTRAINT [FK__Project_CSISbudgetLineKey__DefenseOrg]
GO
ALTER TABLE [Project].[CSISbudgetLineKey]  WITH NOCHECK ADD  CONSTRAINT [fk_Project_CSISbudgetLineKey_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[CSISbudgetLineKey] CHECK CONSTRAINT [fk_Project_CSISbudgetLineKey_AccountDSI]
GO
ALTER TABLE [Project].[CSISbudgetLineKey]  WITH NOCHECK ADD  CONSTRAINT [fk_Project_CSISbudgetLineKey_BSA] FOREIGN KEY([AccountDSI], [BudgetActivity], [BudgetSubActivity])
REFERENCES [budget].[BudgetSubActivity] ([AccountDSI], [BudgetActivity], [BudgetSubActivity])
GO
ALTER TABLE [Project].[CSISbudgetLineKey] CHECK CONSTRAINT [fk_Project_CSISbudgetLineKey_BSA]
GO
ALTER TABLE [Project].[CSISbudgetLineKey]  WITH NOCHECK ADD  CONSTRAINT [fk_Project_CSISbudgetLineKey_BudgetActivity] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [Project].[CSISbudgetLineKey] CHECK CONSTRAINT [fk_Project_CSISbudgetLineKey_BudgetActivity]
GO
ALTER TABLE [Project].[CSISbudgetLineKey]  WITH CHECK ADD  CONSTRAINT [chk_CBLK_validation] CHECK  (([CSISbudgetLineKey]=((((((((case when [programelement] IS NULL then 'PROC' else 'RDTE' end+'~')+[AccountDSI])+'~')+CONVERT([varchar],[BudgetActivity]))+'~')+case when [BudgetSubActivity] IS NULL then '' else CONVERT([varchar],[BudgetSubactivity])+'~' end)+case when [ProgramElement] IS NULL then '' else [ProgramElement] end)+case when [LineItem] IS NULL then '' else [LineItem] end)))
GO
ALTER TABLE [Project].[CSISbudgetLineKey] CHECK CONSTRAINT [chk_CBLK_validation]
GO
ALTER TABLE [Project].[CSISbudgetLineKey]  WITH CHECK ADD  CONSTRAINT [chk_Project_LineItem_XOR_ProgramElement] CHECK  (([ProgramElement] IS NULL OR [LineItem] IS NULL AND [BudgetSubActivity] IS NULL))
GO
ALTER TABLE [Project].[CSISbudgetLineKey] CHECK CONSTRAINT [chk_Project_LineItem_XOR_ProgramElement]
GO
