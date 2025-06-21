SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[CSIScontractID](
	[idvpiid] [varchar](50) NULL,
	[piid] [varchar](50) NULL,
	[CSIScontractID] [int] IDENTITY(1,1) NOT NULL,
	[ContractLabelID] [int] NULL,
	[hyphenatedIDVpiid] [varchar](50) NULL,
	[CSISidvpiidID] [int] NULL,
	[IsPerformanceBasedLogistics] [bit] NULL,
	[ContractingAgencyID] [varchar](4) NULL,
	[ContractingOfficeID] [varchar](6) NULL,
	[MajorCommandID] [varchar](8) NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[FundingOfficeID] [varchar](6) NULL,
	[TypeOfContractPricing] [varchar](2) NULL,
	[SystemEquipmentCode] [varchar](4) NULL,
	[StatutoryExceptionToFairOpportunity] [varchar](4) NULL,
	[ExtentCompeted] [varchar](3) NULL,
	[MinOfEffectiveDate] [datetime2](7) NULL,
	[MaxOfEffectiveDate] [datetime2](7) NULL,
	[CSISsolicitationID] [int] NULL,
	[ContractNumber] [varchar](50) NULL,
	[MinOfSignedDate] [date] NULL,
	[LastUltimateCompletionDate] [date] NULL,
	[MaxOfSignedDate] [date] NULL,
	[AnyIdentifiedSystemEquipment] [bit] NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[IsAbove1990constantMTAthreshold] [bit] NULL,
	[IsAbove2016constantMTAthreshold] [bit] NULL,
	[IsAbove2016constantArbitrary1000k] [bit] NULL,
	[topContractingOfficeAgencyID] [varchar](4) NULL,
	[topContractingOfficeAgencyIDamount] [decimal](19, 4) NULL,
	[ProductOrServiceCode] [varchar](4) NULL,
	[principalnaicscode] [varchar](6) NULL,
	[topProductOrServiceCode] [varchar](4) NULL,
	[topProductOrServiceAmount] [decimal](19, 4) NULL,
	[topPrincipalNAICScode] [varchar](6) NULL,
	[topPrincipalNAICSamount] [decimal](19, 4) NULL,
	[topContractingOfficeID] [varchar](6) NULL,
	[topContractingOfficeAmount] [decimal](19, 4) NULL,
	[IsParentCSIScontractID] [bit] NULL,
	[IsDuplicate] [bit] NULL,
	[IsAbove2018constant10ThousandThreshold] [bit] NULL,
 CONSTRAINT [pk_CSIScontractID] PRIMARY KEY CLUSTERED 
(
	[CSIScontractID] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Contract_CSIScontractID_CSISidvpiidID] ON [Contract].[CSIScontractID]
(
	[CSISidvpiidID] ASC
)
INCLUDE([idvpiid],[piid],[ContractLabelID],[hyphenatedIDVpiid],[IsPerformanceBasedLogistics],[ContractingAgencyID],[ContractingOfficeID],[MajorCommandID],[FundingAgencyID],[FundingOfficeID],[TypeOfContractPricing],[SystemEquipmentCode],[StatutoryExceptionToFairOpportunity],[ExtentCompeted],[MinOfEffectiveDate],[MaxOfEffectiveDate],[CSISsolicitationID],[ContractNumber],[MinOfSignedDate],[LastUltimateCompletionDate],[MaxOfSignedDate],[AnyIdentifiedSystemEquipment],[CSISmodifiedDate],[CSISmodifiedBy],[IsAbove1990constantReportingThreshold],[IsAbove2016constantReportingThreshold],[IsAbove2016constantOneMillionThreshold]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_contract_csiscontractid_ContractNumber] ON [Contract].[CSIScontractID]
(
	[ContractNumber] ASC
)
WHERE ([ContractNumber] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_contract_IDVpiidPiid] ON [Contract].[CSIScontractID]
(
	[idvpiid] ASC,
	[piid] ASC
)
WHERE ([PIID] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [ix_Contract_CSIScontractID_ContractingAgencyID_TopContractingOfficeAgencyID] ON [Contract].[CSIScontractID]
(
	[ContractingOfficeID] ASC
)
INCLUDE([ContractingAgencyID],[topContractingOfficeAgencyID]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [ix_Contract_CSIScontractID_principalNAICScode] ON [Contract].[CSIScontractID]
(
	[principalnaicscode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [ix_CSIS_ContractID_ContractingAgencyID] ON [Contract].[CSIScontractID]
(
	[ContractingAgencyID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [ix_CSIS_ContractID_ProductOrServiceCode] ON [Contract].[CSIScontractID]
(
	[ProductOrServiceCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Contract].[CSIScontractID] ADD  CONSTRAINT [DF__CSIScontr__CSISM__49E4BD9F]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Contract].[CSIScontractID] ADD  CONSTRAINT [DF__CSIScontr__CSISm__4BCD0611]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Contract].[CSIScontractID] ADD  DEFAULT ((0)) FOR [IsDuplicate]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [contract_CSIScontractID_ContractLabelID] FOREIGN KEY([ContractLabelID])
REFERENCES [Contract].[ContractLabelID] ([ContractLabelID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [contract_CSIScontractID_ContractLabelID]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__Contr__2AD6269A] FOREIGN KEY([ContractingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__Contr__2AD6269A]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__ContractingOfficeID] FOREIGN KEY([ContractingAgencyID], [ContractingOfficeID])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__ContractingOfficeID]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__exten__345F90D4] FOREIGN KEY([ExtentCompeted])
REFERENCES [FPDSTypeTable].[extentcompeted] ([extentcompeted])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__exten__345F90D4]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__Fundi__2F9ADBB7] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__Fundi__2F9ADBB7]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__FundingOfficeID] FOREIGN KEY([FundingAgencyID], [FundingOfficeID])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__FundingOfficeID]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__Major__2EA6B77E] FOREIGN KEY([MajorCommandID])
REFERENCES [Office].[MajorCommandID] ([MajorCommandID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__Major__2EA6B77E]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__statu__336B6C9B] FOREIGN KEY([StatutoryExceptionToFairOpportunity])
REFERENCES [FPDSTypeTable].[statutoryexceptiontofairopportunity] ([statutoryexceptiontofairopportunity])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__statu__336B6C9B]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [FK__CSIScontr__syste__32774862] FOREIGN KEY([SystemEquipmentCode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [FK__CSIScontr__syste__32774862]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSIScontractID_CSISidvpiidID] FOREIGN KEY([CSISidvpiidID])
REFERENCES [Contract].[CSISidvpiidID] ([CSISidvpiidID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [fk_contract_CSIScontractID_CSISidvpiidID]
GO
ALTER TABLE [Contract].[CSIScontractID]  WITH NOCHECK ADD  CONSTRAINT [fk_CSIScontractID] FOREIGN KEY([ContractLabelID])
REFERENCES [Contract].[ContractLabelID] ([ContractLabelID])
GO
ALTER TABLE [Contract].[CSIScontractID] CHECK CONSTRAINT [fk_CSIScontractID]
GO
