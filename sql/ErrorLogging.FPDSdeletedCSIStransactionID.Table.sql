SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID](
	[CSIScontractID] [int] NOT NULL,
	[idvmodificationnumber] [varchar](50) NULL,
	[modnumber] [varchar](25) NOT NULL,
	[transactionnumber] [bigint] NOT NULL,
	[CSIStransactionID] [int] NOT NULL,
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
	[IsInCTU] [bit] NULL,
	[IsInFPDSdeleted] [bit] NOT NULL,
	[IsOddBlankIDVagencyID] [bit] NOT NULL,
	[IsOddBlankIDVPIID] [bit] NOT NULL,
	[IsDuplicate] [bit] NOT NULL,
	[IsInUnlabeledEntityID] [bit] NULL,
 CONSTRAINT [pk_CSIStransactionID] PRIMARY KEY CLUSTERED 
(
	[CSIStransactionID] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] ADD  CONSTRAINT [DF__CSIStrans__CSISm__4DB54E83]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] ADD  CONSTRAINT [DF__CSIStrans__CSISm__4EA972BC]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] ADD  DEFAULT ((0)) FOR [IsInFPDSdeleted]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] ADD  DEFAULT ((0)) FOR [IsOddBlankIDVagencyID]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] ADD  DEFAULT ((0)) FOR [IsOddBlankIDVPIID]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] ADD  DEFAULT ((0)) FOR [IsDuplicate]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID]  WITH CHECK ADD FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID]  WITH CHECK ADD FOREIGN KEY([idvagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID]  WITH CHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_contractingofficeagencyID] FOREIGN KEY([contractingofficeagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_contractingofficeagencyID]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_contractlabelId] FOREIGN KEY([ContractLabelID])
REFERENCES [Contract].[ContractLabelID] ([ContractLabelID])
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_contractlabelId]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_CSISidvmodificationID] FOREIGN KEY([CSISidvmodificationID])
REFERENCES [Contract].[CSISidvmodificationID] ([CSISidvmodificationID])
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_CSISidvmodificationID]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIStransactionID_CSISsourceIDVmodificationID] FOREIGN KEY([CSISsourceIDVmodificationID])
REFERENCES [Contract].[CSISidvmodificationID] ([CSISidvmodificationID])
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] CHECK CONSTRAINT [fk_contract_CSIStransactionID_CSISsourceIDVmodificationID]
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID]  WITH NOCHECK ADD  CONSTRAINT [fk_errorlogging_CSIStransactionID_CSIScontractID] FOREIGN KEY([CSIScontractID])
REFERENCES [ErrorLogging].[DeletedCSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [ErrorLogging].[FPDSdeletedCSIStransactionID] CHECK CONSTRAINT [fk_errorlogging_CSIStransactionID_CSIScontractID]
GO
