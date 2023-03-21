SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[CTUcodeNameMismatch](
	[contract_transaction_unique_key] [varchar](154) NOT NULL,
	[last_modified_date] [datetime2](7) NOT NULL,
	[inset] [datetime2](7) NULL,
	[lettercontract] [varchar](1) NULL,
	[undefinitized_action_name] [varchar](255) NULL,
	[CCRexception] [varchar](1) NULL,
	[sam_exception_description] [varchar](71) NULL,
	[pop_state_code] [varchar](2) NULL,
	[primary_place_of_performance_state_name] [varchar](255) NULL,
	[vendor_state_code] [varchar](30) NULL,
	[recipient_state_name] [varchar](255) NULL,
 CONSTRAINT [pk_ErrorLogging_CTUcodeNameMismatch] PRIMARY KEY CLUSTERED 
(
	[contract_transaction_unique_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[CTUcodeNameMismatch]  WITH CHECK ADD FOREIGN KEY([CCRexception])
REFERENCES [Vendor].[CCRexception] ([CCRexception])
GO
ALTER TABLE [ErrorLogging].[CTUcodeNameMismatch]  WITH CHECK ADD FOREIGN KEY([pop_state_code])
REFERENCES [FPDSTypeTable].[statecode] ([statecode])
GO
ALTER TABLE [ErrorLogging].[CTUcodeNameMismatch]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogging_CTUcodeNameMismatch_contract_transaction_unique_key] FOREIGN KEY([contract_transaction_unique_key])
REFERENCES [Contract].[contract_transaction_unique_key] ([contract_transaction_unique_key])
GO
ALTER TABLE [ErrorLogging].[CTUcodeNameMismatch] CHECK CONSTRAINT [fk_ErrorLogging_CTUcodeNameMismatch_contract_transaction_unique_key]
GO
ALTER TABLE [ErrorLogging].[CTUcodeNameMismatch]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogging_CTUcodeNameMismatch_fpdstypetable_lettercontract] FOREIGN KEY([lettercontract])
REFERENCES [FPDSTypeTable].[lettercontract] ([LetterContract])
GO
ALTER TABLE [ErrorLogging].[CTUcodeNameMismatch] CHECK CONSTRAINT [fk_ErrorLogging_CTUcodeNameMismatch_fpdstypetable_lettercontract]
GO
