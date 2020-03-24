USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ErrorLogging].[OverseasLoanOrGrantCountry](
	[Assistance Type] [varchar](8) NULL,
	[Recipient Country] [varchar](100) NULL,
	[Program Name] [varchar](100) NULL,
	[Unit Name] [varchar](25) NULL,
	[Fiscal Year] [varchar](50) NULL,
	[Obligations ($US)] [decimal](28, 0) NULL
)

GO
SET ANSI_PADDING OFF
GO
