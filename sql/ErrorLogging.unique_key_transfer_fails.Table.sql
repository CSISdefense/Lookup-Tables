SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[unique_key_transfer_fails](
	[contract_award_unique_key] [varchar](120) NULL,
	[unique_award_key] [varchar](120) NULL,
	[detached_award_proc_unique] [varchar](154) NULL,
	[fiscal_year] [smallint] NULL,
	[CSIStransactionID] [int] NULL
) ON [PRIMARY]
GO
