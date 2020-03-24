USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ErrorLogging].[CCIDcontractNumberDuplicates](
	[piid] [varchar](50) NULL,
	[idvpiid] [varchar](50) NULL,
	[CSISidvpiidID] [int] NULL,
	[ContractNumberCCID] [int] NOT NULL,
	[NewCCID] [int] NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
