USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ErrorLogging].[Receipt](
	[RawYear] [nvarchar](255) NULL,
	[Receipt] [decimal](19, 4) NULL,
	[SourceCategoryCode] [smallint] NULL,
	[SourceCategoryName] [varchar](50) NULL,
	[SourceSubcategory] [smallint] NULL,
	[SourceSubcategoryName] [varchar](50) NULL,
	[AgencyCode] [smallint] NULL,
	[AgencyName] [varchar](88) NULL,
	[BureauCode] [smallint] NULL,
	[BureauName] [varchar](88) NULL,
	[AccountCode] [varchar](6) NULL,
	[AccountName] [varchar](164) NULL,
	[TreasuryAgencycode] [varchar](3) NULL,
	[OnOrOffBudget] [varchar](10) NULL,
	[CSIScreatedDate] [datetime2](7) NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [ErrorLogging].[Receipt] ADD  CONSTRAINT [DF__Receipts__CSIScr__3EFD1AD8]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
