USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[ARRAcontractIdentifiers](
	[ReferencedIDVPIID] [varchar](50) NULL,
	[PIID] [varchar](50) NULL,
	[ModificationNumber] [varchar](50) NULL,
	[TransactionNumber] [bigint] NULL,
	[freq] [varchar](50) NULL
) ON [PRIMARY]
GO
