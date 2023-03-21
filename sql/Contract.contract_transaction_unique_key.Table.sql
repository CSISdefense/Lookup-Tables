SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[contract_transaction_unique_key](
	[contract_transaction_unique_key] [varchar](154) NOT NULL,
	[contract_award_unique_key] [varchar](120) NOT NULL,
	[modification_number] [varchar](25) NOT NULL,
	[parent_award_modification_number] [varchar](25) NOT NULL,
	[transaction_number] [bigint] NOT NULL,
	[CSIStransactionID] [int] NULL,
	[CSISidvmodificationID] [int] NULL,
	[awarding_sub_agency_code] [varchar](4) NULL,
	[idvagencyid] [varchar](4) NULL,
	[ParentCTU] [varchar](154) NULL,
	[IsParentCTU] [bit] NOT NULL,
 CONSTRAINT [pk_contract_transaction_unique_key] PRIMARY KEY CLUSTERED 
(
	[contract_transaction_unique_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_contract_transaction_unique_key_CSIStransactionID] ON [Contract].[contract_transaction_unique_key]
(
	[CSIStransactionID] ASC
)
WHERE ([CSIStransactionID] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [Contract].[contract_transaction_unique_key]  WITH CHECK ADD  CONSTRAINT [fk_contract_transaction_unique_key_contract_award_unique_key] FOREIGN KEY([contract_award_unique_key])
REFERENCES [Contract].[contract_award_unique_key] ([contract_award_unique_key])
GO
ALTER TABLE [Contract].[contract_transaction_unique_key] CHECK CONSTRAINT [fk_contract_transaction_unique_key_contract_award_unique_key]
GO
ALTER TABLE [Contract].[contract_transaction_unique_key]  WITH CHECK ADD  CONSTRAINT [fk_contract_transaction_unique_key_parentCTu] FOREIGN KEY([ParentCTU])
REFERENCES [Contract].[contract_transaction_unique_key] ([contract_transaction_unique_key])
GO
ALTER TABLE [Contract].[contract_transaction_unique_key] CHECK CONSTRAINT [fk_contract_transaction_unique_key_parentCTu]
GO
