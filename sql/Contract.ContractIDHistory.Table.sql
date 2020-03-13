USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[ContractIDHistory](
	[ContractID] [int] NOT NULL,
	[PIID or IDVPIID] [nvarchar](255) NULL,
	[PIID] [nvarchar](255) NULL,
	[IDVPIID] [nvarchar](255) NULL,
	[fiscal_year] [int] NULL,
	[systemEquipmentCode] [nvarchar](255) NULL,
	[obligatedamount] [float] NULL,
	[Split] [bit] NOT NULL,
	[Comments] [nvarchar](255) NULL,
	[Override] [bit] NOT NULL
) ON [PRIMARY]
GO
