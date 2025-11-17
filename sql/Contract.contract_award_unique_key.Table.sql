SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[contract_award_unique_key](
	[contract_award_unique_key] [varchar](120) NOT NULL,
	[AgencyID] [varchar](4) NOT NULL,
	[awarding_agency_code] [smallint] NULL,
	[award_id_piid] [varchar](50) NOT NULL,
	[parent_award_id_piid] [varchar](50) NULL,
	[parent_award_agency_id] [varchar](4) NULL,
	[award_or_idv_flag] [varchar](5) NOT NULL,
	[CSIScontractID] [int] NULL,
	[CSISidvpiidID] [int] NULL,
	[parent_contract_award_unique_key] [varchar](120) NULL,
	[IsDerived] [bit] NULL,
	[IsFPDSerror] [bit] NOT NULL,
	[numberofoffersreceived] [bigint] NULL,
	[idv_type_code] [varchar](1) NULL,
	[typeofidc] [varchar](41) NULL,
	[parent_award_single_or_multiple_code] [varchar](1) NULL,
	[IsAwardIDVdup] [bit] NULL,
	[IsAbove2018constantSimplifedAcquisition250kThreshold] [bit] NULL,
	[IsAbove2018constantCommercialItem7500k] [bit] NULL,
	[IsAbove2018constantMTAthreshold] [bit] NULL,
	[IsAbove2016constantMTAthreshold] [bit] NULL,
	[IsAbove1990constantMTAthreshold] [bit] NULL,
	[IsAbove2018constantCostAccounting2000kThreshold] [bit] NULL,
	[IsAbove2016constantArbitrary1000k] [bit] NULL,
	[IsDefense] [bit] NULL,
	[CostAccountingStandardsClause] [varchar](1) NULL,
	[costorpricingdata] [varchar](1) NULL,
	[solicitationprocedures] [varchar](5) NULL,
	[commercialitemacquisitionprocedures] [varchar](1) NULL,
	[contractingofficerbusinesssizedetermination] [varchar](1) NULL,
	[isforeigngovernment] [bit] NULL,
	[extentcompeted] [varchar](3) NULL,
	[statutoryexceptiontofairopportunity] [varchar](4) NULL,
	[typeofcontractpricing] [varchar](2) NULL,
	[CompetedIsSomeCompetition] [bit] NULL,
	[FairOppIsSomeCompetition] [bit] NULL,
	[AnyCASclause] [bit] NULL,
 CONSTRAINT [pk_contract_award_unique_key] PRIMARY KEY CLUSTERED 
(
	[contract_award_unique_key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [ix_contract_award_unique_key_parent_contract_award_unique_key] ON [Contract].[contract_award_unique_key]
(
	[parent_contract_award_unique_key] ASC
)
INCLUDE([parent_award_id_piid],[parent_award_agency_id]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_Contract_contract_award_unique_key_CSIScontractID] ON [Contract].[contract_award_unique_key]
(
	[CSIScontractID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Contract].[contract_award_unique_key] ADD  DEFAULT ((0)) FOR [IsDerived]
GO
ALTER TABLE [Contract].[contract_award_unique_key] ADD  DEFAULT ((0)) FOR [IsFPDSerror]
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD  CONSTRAINT [contract_contract_award_unique_key_parent_contract_award_unique_key] FOREIGN KEY([parent_contract_award_unique_key])
REFERENCES [Contract].[contract_award_unique_key] ([contract_award_unique_key])
GO
ALTER TABLE [Contract].[contract_award_unique_key] CHECK CONSTRAINT [contract_contract_award_unique_key_parent_contract_award_unique_key]
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([commercialitemacquisitionprocedures])
REFERENCES [FPDSTypeTable].[CommercialItemAcquisitionProcedures] ([CommercialItemAcquisitionProcedures])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([contractingofficerbusinesssizedetermination])
REFERENCES [FPDSTypeTable].[contractingofficerbusinesssizedetermination] ([contractingofficerbusinesssizedetermination])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([CostAccountingStandardsClause])
REFERENCES [FPDSTypeTable].[CostAccountingStandardsClause] ([CostAccountingStandardsClause])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([costorpricingdata])
REFERENCES [FPDSTypeTable].[costorpricingdata] ([costorpricingdata])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([CSISidvpiidID])
REFERENCES [Contract].[CSISidvpiidID] ([CSISidvpiidID])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([idv_type_code])
REFERENCES [FPDSTypeTable].[idv_type_code] ([idv_type_code])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([parent_award_single_or_multiple_code])
REFERENCES [FPDSTypeTable].[multipleorsingleawardidc] ([multipleorsingleawardidc])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([solicitationprocedures])
REFERENCES [FPDSTypeTable].[solicitationprocedures] ([solicitationprocedures])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([typeofcontractpricing])
REFERENCES [FPDSTypeTable].[typeofcontractpricing] ([TypeOfContractPricing])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD  CONSTRAINT [fk_contract_award_unique_key_CSIScontractID] FOREIGN KEY([CSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [Contract].[contract_award_unique_key] CHECK CONSTRAINT [fk_contract_award_unique_key_CSIScontractID]
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD  CONSTRAINT [chk_contract_contract_award_unique_key_concatenation] CHECK  (((((((('CONT_'+case when [award_or_idv_flag]='AWARD' then 'AWD' else 'IDV' end)+'_')+coalesce(nullif([award_id_piid],''),'-NONE-'))+'_')+[agencyID])+case when [award_or_idv_flag]='AWARD' then (('_'+coalesce(nullif([parent_award_id_piid],''),'-NONE-'))+'_')+coalesce(nullif([parent_award_agency_id],''),'-NONE-') else '' end)=[contract_award_unique_key]))
GO
ALTER TABLE [Contract].[contract_award_unique_key] CHECK CONSTRAINT [chk_contract_contract_award_unique_key_concatenation]
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD  CONSTRAINT [chk_contract_contract_award_unique_key_null_IDVPIID] CHECK  (([parent_award_id_piid] IS NOT NULL AND [parent_award_agency_id] IS NOT NULL OR [award_or_idv_flag]='IDV'))
GO
ALTER TABLE [Contract].[contract_award_unique_key] CHECK CONSTRAINT [chk_contract_contract_award_unique_key_null_IDVPIID]
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD  CONSTRAINT [chk_contract_contract_award_unique_key_parent] CHECK  ((((('CONT_IDV_'+[parent_award_id_piid])+'_')+[parent_award_agency_id])=[parent_contract_award_unique_key]))
GO
ALTER TABLE [Contract].[contract_award_unique_key] CHECK CONSTRAINT [chk_contract_contract_award_unique_key_parent]
GO
