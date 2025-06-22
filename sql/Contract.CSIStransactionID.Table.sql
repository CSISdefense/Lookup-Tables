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
	[AgencyID] [varchar](4) NOT NULL,
	[IsInCTU] [bit] NULL,
	[IsInFPDSdeleted] [bit] NOT NULL,
	[IsOddBlankIDVagencyID] [bit] NOT NULL,
	[IsOddBlankIDVPIID] [bit] NOT NULL,
	[IsDuplicate] [bit] NOT NULL,
	[IsInUnlabeledEntityID] [bit] NULL,
	[IsCCIDconflict] [bit] NULL,
	[IsBlankFY] [bit] NULL,
	[IsMarkedForDeletion] [bit] NOT NULL,
 CONSTRAINT [pk_CSIStransactionID] PRIMARY KEY CLUSTERED 
(
	[CSIStransactionID] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_Contract_CSIStransactionID_IsCCIDconflict_fiscal_year] ON [Contract].[CSIStransactionID]
(
	[IsCCIDconflict] ASC,
	[fiscal_year] ASC
)
INCLUDE([CSIScontractID]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_Contract_CSIStransactionID_isduplicate] ON [Contract].[CSIStransactionID]
(
	[IsDuplicate] ASC
)
INCLUDE([CSIScontractID],[modnumber],[transactionnumber],[IsInContractFPDS],[idvagencyid],[AgencyID],[IsInCTU],[IsInFPDSdeleted]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  CONSTRAINT [DF__CSIStrans__CSISm__4DB54E83]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  CONSTRAINT [DF__CSIStrans__CSISm__4EA972BC]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  DEFAULT ((0)) FOR [IsInFPDSdeleted]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  DEFAULT ((0)) FOR [IsOddBlankIDVagencyID]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  DEFAULT ((0)) FOR [IsOddBlankIDVPIID]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  DEFAULT ((0)) FOR [IsDuplicate]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  DEFAULT ((0)) FOR [IsCCIDconflict]
GO
ALTER TABLE [Contract].[CSIStransactionID] ADD  DEFAULT ((0)) FOR [IsMarkedForDeletion]
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
