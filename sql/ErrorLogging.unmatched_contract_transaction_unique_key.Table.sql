SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[unmatched_contract_transaction_unique_key](
	[contract_transaction_unique_key] [varchar](154) NOT NULL,
 CONSTRAINT [pk_contract_transaction_unique_key] PRIMARY KEY CLUSTERED 
(
	[contract_transaction_unique_key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[unmatched_contract_transaction_unique_key]  WITH CHECK ADD  CONSTRAINT [fk_errorlogging_unmatched_contract_transaction_unique_key] FOREIGN KEY([contract_transaction_unique_key])
REFERENCES [Contract].[contract_transaction_unique_key] ([contract_transaction_unique_key])
GO
ALTER TABLE [ErrorLogging].[unmatched_contract_transaction_unique_key] CHECK CONSTRAINT [fk_errorlogging_unmatched_contract_transaction_unique_key]
GO
