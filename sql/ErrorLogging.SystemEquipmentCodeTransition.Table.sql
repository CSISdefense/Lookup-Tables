USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[SystemEquipmentCodeTransition](
	[CSIStransactionID1] [int] NULL,
	[SystemEquipmentCode1] [varchar](4) NULL,
	[f1Year] [int] NULL,
	[CSIStransactionID2] [int] NULL,
	[SystemEquipmentCode2] [varchar](4) NULL,
	[f2Year] [int] NULL,
	[obligatedamount] [decimal](38, 4) NULL,
	[numberofactions] [bigint] NULL,
	[NumberOfRows] [int] NULL
) ON [PRIMARY]
GO
