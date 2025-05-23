SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[HistoricalContractsBucketData](
	[Fiscal Year] [varchar](50) NULL,
	[Product or Service Code] [varchar](4) NULL,
	[Action Obligation] [varchar](50) NULL,
	[Contract Action] [varchar](50) NULL,
	[obligatedamount] [decimal](19, 4) NULL
) ON [PRIMARY]
GO
