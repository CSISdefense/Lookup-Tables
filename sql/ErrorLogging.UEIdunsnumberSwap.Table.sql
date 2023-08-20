SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[UEIdunsnumberSwap](
	[contract_transaction_unique_key] [varchar](154) NULL,
	[dunsnumber] [varchar](13) NULL,
	[recipient_uei] [varchar](12) NULL,
	[parentdunsnumber] [varchar](13) NULL,
	[recipient_parent_uei] [varchar](12) NULL
) ON [PRIMARY]
GO
