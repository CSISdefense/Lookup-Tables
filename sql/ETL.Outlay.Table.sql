SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[Outlay](
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
) ON [PRIMARY]
GO
ALTER TABLE [ETL].[Outlay] ADD  CONSTRAINT [DF__Outlay__CSIScrea__496FBC53]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
