SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[contract_transaction_unique_key](
	[contract_transaction_unique_key] [varchar](74) NOT NULL,
	[contract_award_unique_key] [varchar](74) NOT NULL,
	[modification_number] [varchar](25) NOT NULL,
	[parent_award_modification_number] [varchar](25) NOT NULL,
	[transaction_number] [bigint] NOT NULL,
	[CSIStransactionID] [int] NULL,
	[CSISidvmodificationID] [int] NULL,
	[awarding_sub_agency_code] [varchar](4) NULL,
	[idvagencyid] [varchar](4) NULL,
	[ParentCTU] [varchar](74) NULL,
	[IsParentCTU] [bit] NOT NULL,
 CONSTRAINT [pk_contract_transaction_unique_key] PRIMARY KEY CLUSTERED 
(
	[contract_transaction_unique_key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[contract_transaction_unique_key] ADD  DEFAULT ((0)) FOR [IsParentCTU]
GO
ALTER TABLE [Contract].[contract_transaction_unique_key]  WITH CHECK ADD FOREIGN KEY([CSISidvmodificationID])
REFERENCES [Contract].[CSISidvmodificationID] ([CSISidvmodificationID])
GO
ALTER TABLE [Contract].[contract_transaction_unique_key]  WITH CHECK ADD FOREIGN KEY([CSIStransactionID])
REFERENCES [Contract].[CSIStransactionID] ([CSIStransactionID])
GO
ALTER TABLE [Contract].[contract_transaction_unique_key]  WITH CHECK ADD FOREIGN KEY([idvagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[contract_transaction_unique_key]  WITH CHECK ADD FOREIGN KEY([ParentCTU])
REFERENCES [Contract].[contract_transaction_unique_key] ([contract_transaction_unique_key])
GO
ALTER TABLE [Contract].[contract_transaction_unique_key]  WITH CHECK ADD  CONSTRAINT [fk_contract_transaction_unique_key_contract_award_unique_key] FOREIGN KEY([contract_award_unique_key])
REFERENCES [Contract].[contract_award_unique_key] ([contract_award_unique_key])
GO
ALTER TABLE [Contract].[contract_transaction_unique_key] CHECK CONSTRAINT [fk_contract_transaction_unique_key_contract_award_unique_key]
GO
