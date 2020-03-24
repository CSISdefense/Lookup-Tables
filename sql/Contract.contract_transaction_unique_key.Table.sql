USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[contract_transaction_unique_key](
	[contract_transaction_unique_key] [varchar](255) NULL,
	[contract_award_unique_key] [varchar](255) NULL,
	[modification_number] [varchar](255) NULL,
	[parent_award_modification_number] [varchar](255) NULL,
	[transaction_number] [varchar](255) NULL,
	[award_or_idv_flag] [varchar](255) NULL,
	[awarding_sub_agency_code] [varchar](255) NULL
) ON [PRIMARY]
GO
