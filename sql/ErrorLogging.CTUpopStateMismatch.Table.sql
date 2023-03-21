SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[CTUpopStateMismatch](
	[contract_transaction_unique_key] [varchar](154) NULL,
	[last_modified_date] [datetime2](7) NULL,
	[pop_state_code] [varchar](2) NULL,
	[primary_place_of_performance_state_name] [varchar](255) NULL
) ON [PRIMARY]
GO
