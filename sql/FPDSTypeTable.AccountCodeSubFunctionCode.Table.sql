USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[AccountCodeSubFunctionCode](
	[agencycode] [varchar](3) NULL,
	[AgencyName] [varchar](100) NULL,
	[BureauCode] [varchar](2) NULL,
	[BureauName] [varchar](100) NULL,
	[AccountCode] [varchar](6) NULL,
	[accountname] [varchar](200) NULL,
	[TreasuryAgencyCode] [varchar](2) NULL,
	[SubfunctionCode] [varchar](3) NULL,
	[SubfunctionTitle] [varchar](100) NULL,
	[IncludeInIAP] [bit] NULL,
	[personnel] [bit] NULL
) ON [PRIMARY]
GO
