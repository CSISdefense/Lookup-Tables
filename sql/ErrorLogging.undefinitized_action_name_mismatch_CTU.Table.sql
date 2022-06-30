SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[undefinitized_action_name_mismatch_CTU](
	[lettercontract] [varchar](1) NULL,
	[undefinitized_action_name] [varchar](255) NULL,
	[contract_transaction_unique_key] [varchar](154) NULL,
	[last_modified_date] [datetime2](7) NULL,
	[inset] [datetime2](7) NULL
) ON [PRIMARY]
GO
