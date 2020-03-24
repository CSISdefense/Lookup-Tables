USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[SubFunctionAccountCode](
	[SubfunctionCode] [varchar](3) NULL,
	[TreasuryAgencyCode] [varchar](2) NULL,
	[AccountCode] [varchar](6) NULL,
	[accountname] [varchar](200) NULL
) ON [PRIMARY]
GO
