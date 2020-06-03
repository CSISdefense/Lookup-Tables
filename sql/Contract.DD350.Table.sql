SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[DD350](
	[FiscalReportingPeriod] [varchar](50) NULL,
	[ContractingAgencyId] [varchar](4) NULL,
	[ReportNumber] [varchar](50) NULL,
	[ContractingOfficeCode] [varchar](6) NOT NULL,
	[ContractingOfficeName] [varchar](50) NULL,
	[ContractNumber] [varchar](50) NULL,
	[OriginOfContract] [varchar](50) NULL,
	[Reserved] [varchar](50) NULL,
	[ModificationOrderNumber] [varchar](25) NULL,
	[CompletionDate] [varchar](50) NULL,
	[ContractorIdentificationCode] [varchar](13) NULL,
	[HeadquarterCode] [varchar](13) NULL,
	[UltimateParentCode] [varchar](13) NULL,
	[GovernmentAgency] [varchar](50) NULL,
	[Cage] [varchar](5) NULL,
	[ContractorNameAndDivisionName] [nvarchar](150) NULL,
	[VendorAddressLine1] [varchar](50) NULL,
	[VendorAddressCity] [varchar](50) NULL,
	[VendorAddressStateName] [varchar](50) NULL,
	[VendorAddressZipCode] [varchar](50) NULL,
	[PrincipalPlaceOfPerformanceLocationCode] [varchar](50) NULL,
	[CountryCode] [varchar](13) NULL,
	[StateCode] [varchar](50) NULL,
	[CityOrPlaceName] [varchar](50) NULL,
	[CountyName] [varchar](50) NULL,
	[State/CountryName] [varchar](50) NULL,
	[Column 26] [varchar](50) NULL,
	[ForeignMilitarySale] [varchar](50) NULL,
	[MultiyearContract] [varchar](50) NULL,
	[MultiyearContractCost] [varchar](50) NULL,
	[Column 30] [varchar](50) NULL,
	[productorservicecode] [varchar](4) NULL,
	[ProductOrServiceDescription] [varchar](50) NULL,
	[DodClaimantProgramCode] [varchar](3) NULL,
	[ClaimantProgramDescription] [varchar](50) NULL,
	[WeaponSystemCode] [varchar](4) NULL,
	[WeaponSystemName] [varchar](50) NULL,
	[Sic] [varchar](50) NULL,
	[ContractActionType] [varchar](8) NULL,
	[TypeIndefiniteDeliveryContract] [varchar](1) NULL,
	[Multipleorsingleawardidc] [varchar](1) NULL,
	[ModificationCode] [varchar](1) NULL,
	[CicaApplicability] [varchar](50) NULL,
	[Synopsis] [varchar](50) NULL,
	[NotSynopsized] [varchar](50) NULL,
	[ExtentCompetedDD350] [varchar](3) NULL,
	[SeaTransportation] [varchar](50) NULL,
	[TypeOfContract] [varchar](2) NULL,
	[NumberOfOffersSolicited] [varchar](50) NULL,
	[SolicitationProcedures] [varchar](50) NULL,
	[reasonnotcompeted] [varchar](3) NULL,
	[SubjectToLaborStandardsStatutes] [varchar](50) NULL,
	[CostOrPricingData] [varchar](50) NULL,
	[ContractFinancing] [varchar](1) NULL,
	[PlaceOfManufacture] [varchar](50) NULL,
	[CountryOfOriginCode] [varchar](50) NULL,
	[Commercial] [varchar](50) NULL,
	[TypeOfBusiness] [varchar](1) NULL,
	[HubzoneRepresentation] [varchar](50) NULL,
	[ReasonNotAwardedToSmallDisadvantagedBusiness] [varchar](50) NULL,
	[ReasonNotAwardedToSmallBusiness] [varchar](50) NULL,
	[SmallBusinessSet-Aside] [varchar](50) NULL,
	[SmallDisadvantagedBusinessSet-Aside] [varchar](50) NULL,
	[HistoricallyBlackCollege/Univ.OrMinorityInst.Set-Aside] [varchar](50) NULL,
	[OtherPreferenceProgram(PriorToFy1997)/TypeOfHubzonePreference(Fy2000)] [varchar](50) NULL,
	[PremiumPercent] [varchar](50) NULL,
	[EthnicGroup] [varchar](50) NULL,
	[Women-OwnedBusiness] [varchar](50) NULL,
	[SmallBusinessInnovativeResearchProgram] [varchar](50) NULL,
	[SubcontractingPlan] [varchar](50) NULL,
	[SmallBusinessCompetitivenessDemonstrationProgram] [varchar](50) NULL,
	[SizeOfSmallBusiness] [varchar](50) NULL,
	[EmergingSmallBusiness] [varchar](50) NULL,
	[ContingencyOperation] [varchar](50) NULL,
	[CostAccountingStandardsClause] [varchar](50) NULL,
	[Reserved2] [varchar](50) NULL,
	[Column 77] [varchar](50) NULL,
	[Column 78] [varchar](50) NULL,
	[ActionObligationDollars] [decimal](19, 4) NULL,
	[NumberOfActions] [bigint] NULL,
	[NumberOfOffersReceived] [bigint] NULL,
	[Actiondate] [datetime2](7) NULL,
	[fiscal_year] [smallint] NULL,
	[CAGEmalformed] [varchar](9) NULL,
	[TransactionNumberCSISadded] [bigint] NULL,
	[CSIStransactionID] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [fk__contract_dd350_reasonnotcompeted] FOREIGN KEY([reasonnotcompeted])
REFERENCES [FPDSTypeTable].[reasonnotcompeted] ([reasonnotcompeted])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [fk__contract_dd350_reasonnotcompeted]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK__DD350__Contracti__3F122971] FOREIGN KEY([ContractingAgencyId])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK__DD350__Contracti__3F122971]
GO
ALTER TABLE [Contract].[DD350]  WITH CHECK ADD FOREIGN KEY([CSIStransactionID])
REFERENCES [Contract].[CSIStransactionID] ([CSIStransactionID])
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK__DD350__DodClaima__3E1E0538] FOREIGN KEY([DodClaimantProgramCode])
REFERENCES [FPDSTypeTable].[ClaimantProgramCode] ([ClaimantProgramCode])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK__DD350__DodClaima__3E1E0538]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_contractfinancing] FOREIGN KEY([ContractFinancing])
REFERENCES [FPDSTypeTable].[contractfinancing] ([contractfinancing])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_contractfinancing]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_ContractorIdentificationCode] FOREIGN KEY([ContractorIdentificationCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_ContractorIdentificationCode]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_dd350_ContractorNameAndDivisionName] FOREIGN KEY([ContractorNameAndDivisionName])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [fk_contract_dd350_ContractorNameAndDivisionName]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_dd350_dunsnumber] FOREIGN KEY([ContractorIdentificationCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [fk_contract_dd350_dunsnumber]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_extentcompeted] FOREIGN KEY([ExtentCompetedDD350])
REFERENCES [FPDSTypeTable].[extentcompetedDD350] ([extentcompetedDD350])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_extentcompeted]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_dd350_headquartercode] FOREIGN KEY([HeadquarterCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [fk_contract_dd350_headquartercode]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_modificationcode] FOREIGN KEY([ModificationCode])
REFERENCES [FPDSTypeTable].[modificationcodeDD350] ([modificationcode])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_modificationcode]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_multipleorsingleawardidc] FOREIGN KEY([Multipleorsingleawardidc])
REFERENCES [FPDSTypeTable].[multipleorsingleawardidc] ([multipleorsingleawardidc])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_multipleorsingleawardidc]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_productorservicecode] FOREIGN KEY([productorservicecode])
REFERENCES [FPDSTypeTable].[ProductOrServiceCode] ([ProductOrServiceCode])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_productorservicecode]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_TypeofBusiness] FOREIGN KEY([TypeOfBusiness])
REFERENCES [FPDSTypeTable].[TypeofBusinessDD350] ([TypeOfBusiness])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_TypeofBusiness]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_UltimateParentCode] FOREIGN KEY([UltimateParentCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_UltimateParentCode]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [FK_contract_DD350_WeaponSystemCode] FOREIGN KEY([WeaponSystemCode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [FK_contract_DD350_WeaponSystemCode]
GO
ALTER TABLE [Contract].[DD350]  WITH NOCHECK ADD  CONSTRAINT [pk_contract_DD350_contractingOfficeCode] FOREIGN KEY([ContractingOfficeCode])
REFERENCES [Office].[ContractingOfficeCode] ([ContractingOfficeCode])
GO
ALTER TABLE [Contract].[DD350] CHECK CONSTRAINT [pk_contract_DD350_contractingOfficeCode]
GO
