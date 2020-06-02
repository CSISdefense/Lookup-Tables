SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[ContractNumberToCSISContractID](
	[CSIScontractID] [int] IDENTITY(1,1) NOT NULL,
	[ContractNumber] [varchar](50) NULL,
	[IDVPIID] [varchar](50) NULL,
	[PIID] [varchar](50) NULL
) ON [PRIMARY]
GO
