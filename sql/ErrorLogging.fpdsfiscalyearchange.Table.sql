SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[fpdsfiscalyearchange](
	[contract_transaction_unique_key] [varchar](154) NULL,
	[old_fiscal_year] [smallint] NULL,
	[new_fiscal_year] [smallint] NULL,
	[CSIStransactionID] [int] NULL
) ON [PRIMARY]
GO
