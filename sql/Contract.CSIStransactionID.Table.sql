SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[CSIStransactionID](
	[CSIScontractID] [int] NOT NULL,
	[idvmodificationnumber] [varchar](50) NULL,
	[modnumber] [varchar](25) NOT NULL,
	[transactionnumber] [bigint] NOT NULL,
	[CSIStransactionID] [int] IDENTITY(1,1) NOT NULL,
	[ContractLabelID] [int] NULL,
	[CSISidvmodificationID] [int] NULL,
	[isIDV] [bit] NULL,
	[CSISsourceIDVmodificationID] [int] NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[last_modified_date] [datetime2](7) NULL,
	[MaxOfCSISCreatedDate] [datetime] NULL,
	[fiscal_year] [int] NULL,
	[contractingofficeagencyid] [varchar](4) NULL,
	[IsInContractFPDS] [bit] NULL,
	[idvagencyid] [varchar](4) NULL,
	[AgencyID] [varchar](4) NULL,
	[IsNew6Dup] [bit] NULL,
 CONSTRAINT [pk_CSIStransactionID] PRIMARY KEY CLUSTERED 
(
	[CSIStransactionID] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  CONSTRAINT [DF__CSIStrans__CSISm__4DB54E83]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  CONSTRAINT [DF__CSIStrans__CSISm__4EA972BC]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  DEFAULT ((0)) FOR [IsNew6Dup]
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH CHECK ADD FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH CHECK ADD FOREIGN KEY([idvagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH CHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_contractingofficeagencyID] FOREIGN KEY([contractingofficeagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[CSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_contractingofficeagencyID]
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_contractlabelId] FOREIGN KEY([ContractLabelID])
REFERENCES [Contract].[ContractLabelID] ([ContractLabelID])
GO
ALTER TABLE [Contract].[CSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_contractlabelId]
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_CSIScontractID] FOREIGN KEY([CSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [Contract].[CSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_CSIScontractID]
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_CSISidvmodificationID] FOREIGN KEY([CSISidvmodificationID])
REFERENCES [Contract].[CSISidvmodificationID] ([CSISidvmodificationID])
GO
ALTER TABLE [Contract].[CSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_CSISidvmodificationID]
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_CSISsourceIDVmodificationID] FOREIGN KEY([CSISsourceIDVmodificationID])
REFERENCES [Contract].[CSISidvmodificationID] ([CSISidvmodificationID])
GO
ALTER TABLE [Contract].[CSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_CSISsourceIDVmodificationID]
GO
ALTER TABLE [Contract].[CSIStransactionID]  WITH CHECK ADD  CONSTRAINT [chk_contract_csistransactionid_idv_not_null] CHECK  (([fiscal_year]<(2000) OR [fiscal_year] IS NULL OR [CSISidvModificationID] IS NOT NULL AND [idvagencyid] IS NOT NULL AND [idvmodificationnumber] IS NOT NULL))
GO
ALTER TABLE [Contract].[CSIStransactionID] CHECK CONSTRAINT [chk_contract_csistransactionid_idv_not_null]
GO
