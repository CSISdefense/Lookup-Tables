SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[FPDSdelta_support](
	[action_date_fiscal_year] [smallint] NULL,
	[IsTransferred] [bit] NOT NULL,
	[correction_delete_ind] [varchar](1) NULL,
	[contract_transaction_unique_key] [varchar](154) NOT NULL,
	[CSIStransactionID] [int] NULL,
	[source_last_modified_date] [datetime2](7) NULL,
	[target_last_modified_date] [datetime2](7) NULL,
 CONSTRAINT [pk_Errorlogging_FPDSdelta_support_contract_transaction_unique_key] PRIMARY KEY CLUSTERED 
(
	[contract_transaction_unique_key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_errorlogging_FPDSdelta_support_ctu] ON [ETL].[FPDSdelta_support]
(
	[contract_transaction_unique_key] ASC
)
INCLUDE([CSIStransactionID],[action_date_fiscal_year],[source_last_modified_date],[target_last_modified_date],[IsTransferred],[correction_delete_ind]) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [nci_msft_1_FPDSdelta_support_1E5AC9C20E35DA9E961FEDF2813F8C3B] ON [ETL].[FPDSdelta_support]
(
	[action_date_fiscal_year] ASC,
	[IsTransferred] ASC,
	[correction_delete_ind] ASC
)
INCLUDE([CSIStransactionID],[source_last_modified_date],[target_last_modified_date]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
