SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[TestContractNumber](
	[PIID] [int] IDENTITY(1,1) NOT NULL,
	[IDVPIID] [varchar](50) NULL,
	[ContractNumber] [varchar](100) NULL
) ON [PRIMARY]
GO
