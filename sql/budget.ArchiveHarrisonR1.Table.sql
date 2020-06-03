SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[ArchiveHarrisonR1](
	[ID] [smallint] NULL,
	[SourceFiscalYear] [int] NULL,
	[AccountDSI] [varchar](5) NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[MainAccountCode] [smallint] NULL,
	[AccountTitle] [varchar](40) NULL,
	[Organization] [varchar](5) NULL,
	[BudgetActivity] [smallint] NULL,
	[BudgetActivityTitle] [varchar](48) NULL,
	[LineNumber] [int] NULL,
	[ProgramElement] [varchar](10) NULL,
	[ProgramElementTitle] [varchar](80) NULL,
	[IncludeInTOA] [varchar](1) NULL,
	[Classified] [varchar](20) NULL,
	[FiscalYear] [smallint] NULL,
	[OriginType] [varchar](7) NULL,
	[PBtotal] [int] NULL,
	[PBtype] [int] NULL,
	[EnactedTotal] [int] NULL,
	[EnactedType] [int] NULL,
	[SpecialType] [int] NULL,
	[ActualTotal] [int] NULL
) ON [PRIMARY]
GO
