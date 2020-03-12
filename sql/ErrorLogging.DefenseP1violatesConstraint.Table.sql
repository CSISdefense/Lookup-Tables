USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[DefenseP1violatesConstraint](
	[ID] [smallint] NULL,
	[SourceFiscalYear] [int] NULL,
	[AccountDSI] [varchar](5) NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[MainAccountCode] [smallint] NULL,
	[AccountTitle] [varchar](40) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[LineNumber] [int] NULL,
	[BSA] [smallint] NOT NULL,
	[BSAtitle] [varchar](52) NULL,
	[LineItem] [varchar](10) NULL,
	[LineItemTitle] [varchar](45) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](44) NULL,
	[AddOrNonAdd] [varchar](7) NULL,
	[Classified] [varchar](1) NULL,
	[ProcurementCategory] [varchar](31) NULL,
	[FiscalYear] [smallint] NULL,
	[OriginType] [varchar](7) NULL,
	[PBtotal] [int] NULL,
	[PBtype] [int] NULL,
	[EnactedTotal] [int] NULL,
	[EnactedType] [int] NULL,
	[SpecialType] [int] NULL,
	[ActualTotal] [int] NULL,
	[QuantPBtotal] [int] NULL,
	[QuantPBtype] [int] NULL,
	[QuantEnactedTotal] [int] NULL,
	[QuantEnactedType] [int] NULL,
	[QuantSpecialType] [int] NULL,
	[QuantActualTotal] [int] NULL,
	[ErrorCode] [int] NULL,
	[ErrrorColumn] [int] NULL
) ON [PRIMARY]
GO
