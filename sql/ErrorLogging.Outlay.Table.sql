USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ErrorLogging].[Outlay](
	[RawYear] [nvarchar](255) NULL,
	[AgencyCode] [varchar](3) NULL,
	[AgencyName] [varchar](100) NULL,
	[BureauCode] [varchar](2) NULL,
	[AccountCode] [varchar](6) NULL,
	[TreasuryAgencyCode] [varchar](2) NULL,
	[SubfunctionCode] [varchar](3) NULL,
	[SubfunctionTitle] [varchar](100) NULL,
	[BEAcategory] [varchar](13) NULL,
	[GrantNonGrantSplit] [varchar](8) NULL,
	[OnOrOffBudget] [varchar](10) NULL,
	[Outlay] [decimal](19, 4) NULL,
	[BureauName] [varchar](100) NULL,
	[AccountName] [varchar](200) NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [ErrorLogging].[Outlay] ADD  CONSTRAINT [DF__Outlay__CSIScrea__496FBC53]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
