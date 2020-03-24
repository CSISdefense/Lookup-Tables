USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Office].[Defense_Major_Command_Codes_and_Offices](
	[MajorCommandID] [varchar](8) NULL,
	[MajorCommandCode] [varchar](24) NULL,
	[MajorCommandName] [varchar](100) NULL,
	[ContractingOfficeID] [varchar](6) NULL,
	[ContractingOfficeName] [varchar](100) NULL,
	[ContractingAgencyID] [varchar](4) NULL,
	[ContractingDepartmentID] [varchar](4) NULL,
	[Fiscal_Year] [smallint] NULL,
	[ActionObligation] [decimal](28, 0) NULL,
	[ContractingActions] [bigint] NULL,
	[NumberOfRecords] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
