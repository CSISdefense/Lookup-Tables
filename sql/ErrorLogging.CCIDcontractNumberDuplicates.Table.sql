USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[CCIDcontractNumberDuplicates](
	[piid] [varchar](50) NULL,
	[idvpiid] [varchar](50) NULL,
	[CSISidvpiidID] [int] NULL,
	[ContractNumberCCID] [int] NOT NULL,
	[NewCCID] [int] NOT NULL
) ON [PRIMARY]
GO
