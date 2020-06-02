SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[BudgetAuthority](
	[AgencyCode] [varchar](3) NULL,
	[AgencyName] [varchar](88) NULL,
	[BureauCode] [smallint] NULL,
	[BureauName] [varchar](88) NULL,
	[AccountCode] [varchar](6) NULL,
	[AccountName] [varchar](164) NULL,
	[TreasuryAgencyCode] [varchar](2) NULL,
	[SubfunctionCode] [varchar](3) NULL,
	[SubfunctionTitle] [varchar](64) NULL,
	[BEAcategory] [varchar](13) NULL,
	[OnOrOffBudget] [varchar](10) NULL,
	[RawYear] [nvarchar](255) NULL,
	[BudgetAuthority] [decimal](19, 4) NULL,
	[CSISdateCreated] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[BudgetAuthority] ADD  CONSTRAINT [DF__BudgetAut__CSISd__3E08F69F]  DEFAULT (getdate()) FOR [CSISdateCreated]
GO
