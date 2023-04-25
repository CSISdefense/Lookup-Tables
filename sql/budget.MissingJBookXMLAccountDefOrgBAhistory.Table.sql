SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[MissingJBookXMLAccountDefOrgBAhistory](
	[Path] [varchar](138) NULL,
	[PByear] [smallint] NOT NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[Comments] [varchar](255) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[IsMissingJBook] [bit] NULL,
 CONSTRAINT [pk_budget_MissingJBookXMLAccountDefOrgBAhistory] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[MissingJBookXMLAccountDefOrgBAhistory]  WITH CHECK ADD  CONSTRAINT [fk_budget_MissingJBookXMLAccountDefOrgBAhistory_ADSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [budget].[MissingJBookXMLAccountDefOrgBAhistory] CHECK CONSTRAINT [fk_budget_MissingJBookXMLAccountDefOrgBAhistory_ADSI]
GO
ALTER TABLE [budget].[MissingJBookXMLAccountDefOrgBAhistory]  WITH CHECK ADD  CONSTRAINT [fk_budget_MissingJBookXMLAccountDefOrgBAhistory_BA] FOREIGN KEY([AccountDSI], [BudgetActivity])
REFERENCES [budget].[BudgetActivity] ([AccountDSI], [BudgetActivity])
GO
ALTER TABLE [budget].[MissingJBookXMLAccountDefOrgBAhistory] CHECK CONSTRAINT [fk_budget_MissingJBookXMLAccountDefOrgBAhistory_BA]
GO
ALTER TABLE [budget].[MissingJBookXMLAccountDefOrgBAhistory]  WITH CHECK ADD  CONSTRAINT [fk_budget_MissingJBookXMLAccountDefOrgBAhistory_DefOrg] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [budget].[MissingJBookXMLAccountDefOrgBAhistory] CHECK CONSTRAINT [fk_budget_MissingJBookXMLAccountDefOrgBAhistory_DefOrg]
GO
