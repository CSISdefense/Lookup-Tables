SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[FPDSgovManuallyAdded](
	[unique_transaction_id] [varchar](36) NULL,
	[transaction_status] [varchar](6) NULL,
	[obligatedamount] [decimal](19, 4) NULL,
	[baseandexercisedoptionsvalue] [decimal](19, 4) NULL,
	[baseandalloptionsvalue] [decimal](19, 4) NULL,
	[maj_agency_cat] [varchar](4) NULL,
	[mod_agency] [varchar](4) NULL,
	[maj_fund_agency_cat] [varchar](4) NULL,
	[contractingofficeagencyid] [varchar](4) NULL,
	[contractingofficeid] [varchar](6) NULL,
	[fundingrequestingagencyid] [varchar](4) NULL,
	[fundingrequestingofficeid] [varchar](6) NULL,
	[fundedbyforeignentity] [varchar](21) NULL,
	[signeddate] [date] NULL,
	[effectivedate] [date] NULL,
	[currentcompletiondate] [date] NULL,
	[ultimatecompletiondate] [date] NULL,
	[lastdatetoorder] [date] NULL,
	[contractactiontype] [varchar](41) NULL,
	[reasonformodification] [varchar](1) NULL,
	[typeofcontractpricing] [varchar](2) NULL,
	[priceevaluationpercentdifference] [smallint] NULL,
	[subcontractplan] [varchar](1) NULL,
	[lettercontract] [varchar](1) NULL,
	[multiyearcontract] [bit] NULL,
	[performancebasedservicecontract] [varchar](38) NULL,
	[majorprogramcode] [varchar](104) NULL,
	[contingencyhumanitarianpeacekeepingoperation] [varchar](1) NULL,
	[contractfinancing] [varchar](1) NULL,
	[costorpricingdata] [varchar](1) NULL,
	[costaccountingstandardsclause] [varchar](1) NULL,
	[descriptionofcontractrequirement] [varchar](4035) NULL,
	[purchasecardaspaymentmethod] [bit] NULL,
	[nationalinterestactioncode] [varchar](4) NULL,
	[progsourceagency] [varchar](2) NULL,
	[progsourceaccount] [varchar](4) NULL,
	[progsourcesubacct] [varchar](3) NULL,
	[account_title] [varchar](90) NULL,
	[rec_flag] [varchar](4) NULL,
	[typeofidc] [varchar](41) NULL,
	[multipleorsingleawardidc] [varchar](1) NULL,
	[programacronym] [varchar](28) NULL,
	[vendorname] [nvarchar](150) NULL,
	[vendoralternatename] [varchar](150) NULL,
	[vendorlegalorganizationname] [nvarchar](150) NULL,
	[vendordoingasbusinessname] [nvarchar](150) NULL,
	[divisionname] [nvarchar](150) NULL,
	[divisionnumberorofficecode] [varchar](10) NULL,
	[vendorenabled] [varchar](1) NULL,
	[vendorlocationdisableflag] [varchar](1) NULL,
	[ccrexception] [varchar](70) NULL,
	[streetaddress] [varchar](90) NULL,
	[streetaddress2] [varchar](60) NULL,
	[streetaddress3] [varchar](55) NULL,
	[city] [varchar](35) NULL,
	[state] [varchar](20) NULL,
	[zipcode] [varchar](28) NULL,
	[vendorcountrycode] [varchar](50) NULL,
	[vendor_state_code] [varchar](20) NULL,
	[vendor_cd] [varchar](22) NULL,
	[congressionaldistrict] [varchar](22) NULL,
	[vendorsitecode] [varchar](15) NULL,
	[vendoralternatesitecode] [varchar](20) NULL,
	[dunsnumber] [varchar](13) NULL,
	[parentdunsnumber] [varchar](13) NULL,
	[phoneno] [varchar](20) NULL,
	[faxno] [varchar](30) NULL,
	[registrationdate] [date] NULL,
	[renewaldate] [date] NULL,
	[mod_parent] [varchar](150) NULL,
	[locationcode] [varchar](9) NULL,
	[statecode] [varchar](2) NULL,
	[pop_state_code] [varchar](2) NULL,
	[placeofperformancecountrycode] [varchar](3) NULL,
	[placeofperformancezipcode] [varchar](10) NULL,
	[pop_cd] [varchar](4) NULL,
	[placeofperformancecongressionaldistrict] [varchar](6) NULL,
	[psc_cat] [varchar](2) NULL,
	[productorservicecode] [varchar](4) NULL,
	[systemequipmentcode] [varchar](4) NULL,
	[claimantprogramcode] [varchar](3) NULL,
	[principalnaicscode] [varchar](6) NULL,
	[informationtechnologycommercialitemcategory] [varchar](30) NULL,
	[gfe_gfp_code] [varchar](1) NULL,
	[useofepadesignatedproducts] [varchar](1) NULL,
	[recoveredmaterialclauses] [varchar](1) NULL,
	[seatransportation] [varchar](1) NULL,
	[contractbundling] [varchar](1) NULL,
	[consolidatedcontract] [bit] NULL,
	[countryoforigin] [varchar](3) NULL,
	[placeofmanufacture] [varchar](1) NULL,
	[manufacturingorganizationtype] [varchar](1) NULL,
	[agencyid] [varchar](4) NULL,
	[piid] [varchar](50) NULL,
	[modnumber] [varchar](25) NULL,
	[transactionnumber] [bigint] NULL,
	[fiscal_year] [smallint] NULL,
	[idvagencyid] [varchar](4) NULL,
	[idvpiid] [varchar](50) NULL,
	[idvmodificationnumber] [varchar](25) NULL,
	[solicitationid] [varchar](69) NULL,
	[extentcompeted] [varchar](3) NULL,
	[reasonnotcompeted] [varchar](3) NULL,
	[numberofoffersreceived] [bigint] NULL,
	[commercialitemacquisitionprocedures] [varchar](1) NULL,
	[commercialitemtestprogram] [bit] NULL,
	[smallbusinesscompetitivenessdemonstrationprogram] [varchar](6) NULL,
	[a76action] [varchar](3) NULL,
	[competitiveprocedures] [varchar](1) NULL,
	[solicitationprocedures] [varchar](5) NULL,
	[typeofsetaside] [varchar](10) NULL,
	[localareasetaside] [varchar](4) NULL,
	[evaluatedpreference] [varchar](6) NULL,
	[fedbizopps] [varchar](1) NULL,
	[research_code] [varchar](3) NULL,
	[statutoryexceptiontofairopportunity] [varchar](4) NULL,
	[organizationaltype] [varchar](30) NULL,
	[firm8aflag] [bit] NULL,
	[hubzoneflag] [bit] NULL,
	[sdbflag] [bit] NULL,
	[issbacertifiedsmalldisadvantagedbusiness] [bit] NULL,
	[shelteredworkshopflag] [bit] NULL,
	[hbcuflag] [bit] NULL,
	[educationalinstitutionflag] [bit] NULL,
	[womenownedflag] [bit] NULL,
	[veteranownedflag] [bit] NULL,
	[srdvobflag] [bit] NULL,
	[localgovernmentflag] [bit] NULL,
	[minorityinstitutionflag] [bit] NULL,
	[aiobflag] [bit] NULL,
	[stategovernmentflag] [bit] NULL,
	[federalgovernmentflag] [bit] NULL,
	[minorityownedbusinessflag] [bit] NULL,
	[apaobflag] [bit] NULL,
	[tribalgovernmentflag] [bit] NULL,
	[baobflag] [bit] NULL,
	[naobflag] [bit] NULL,
	[saaobflag] [bit] NULL,
	[nonprofitorganizationflag] [bit] NULL,
	[isothernotforprofitorganization] [bit] NULL,
	[isforprofitorganization] [bit] NULL,
	[isfoundation] [bit] NULL,
	[haobflag] [bit] NULL,
	[ishispanicservicinginstitution] [bit] NULL,
	[emergingsmallbusinessflag] [bit] NULL,
	[hospitalflag] [bit] NULL,
	[contractingofficerbusinesssizedetermination] [varchar](1) NULL,
	[is1862landgrantcollege] [bit] NULL,
	[is1890landgrantcollege] [bit] NULL,
	[is1994landgrantcollege] [bit] NULL,
	[isveterinarycollege] [bit] NULL,
	[isveterinaryhospital] [bit] NULL,
	[isprivateuniversityorcollege] [bit] NULL,
	[isschoolofforestry] [bit] NULL,
	[isstatecontrolledinstitutionofhigherlearning] [bit] NULL,
	[isserviceprovider] [bit] NULL,
	[receivescontracts] [bit] NULL,
	[receivesgrants] [bit] NULL,
	[receivescontractsandgrants] [bit] NULL,
	[isairportauthority] [bit] NULL,
	[iscouncilofgovernments] [bit] NULL,
	[ishousingauthoritiespublicortribal] [bit] NULL,
	[isinterstateentity] [bit] NULL,
	[isplanningcommission] [bit] NULL,
	[isportauthority] [bit] NULL,
	[istransitauthority] [bit] NULL,
	[issubchapterscorporation] [bit] NULL,
	[islimitedliabilitycorporation] [bit] NULL,
	[isforeignownedandlocated] [bit] NULL,
	[isarchitectureandengineering] [bit] NULL,
	[isdotcertifieddisadvantagedbusinessenterprise] [bit] NULL,
	[iscitylocalgovernment] [bit] NULL,
	[iscommunitydevelopedcorporationownedfirm] [bit] NULL,
	[iscommunitydevelopmentcorporation] [bit] NULL,
	[isconstructionfirm] [bit] NULL,
	[ismanufacturerofgoods] [bit] NULL,
	[iscorporateentitynottaxexempt] [bit] NULL,
	[iscountylocalgovernment] [bit] NULL,
	[isdomesticshelter] [bit] NULL,
	[isfederalgovernmentagency] [bit] NULL,
	[isfederallyfundedresearchanddevelopmentcorp] [bit] NULL,
	[isforeigngovernment] [bit] NULL,
	[isindiantribe] [bit] NULL,
	[isintermunicipallocalgovernment] [bit] NULL,
	[isinternationalorganization] [bit] NULL,
	[islaborsurplusareafirm] [bit] NULL,
	[islocalgovernmentowned] [bit] NULL,
	[ismunicipalitylocalgovernment] [bit] NULL,
	[isnativehawaiianownedorganizationorfirm] [bit] NULL,
	[isotherbusinessororganization] [bit] NULL,
	[isotherminorityowned] [bit] NULL,
	[ispartnershiporlimitedliabilitypartnership] [bit] NULL,
	[isschooldistrictlocalgovernment] [bit] NULL,
	[issmallagriculturalcooperative] [bit] NULL,
	[issoleproprietorship] [bit] NULL,
	[istownshiplocalgovernment] [bit] NULL,
	[istriballyownedfirm] [bit] NULL,
	[istribalcollege] [bit] NULL,
	[isalaskannativeownedcorporationorfirm] [bit] NULL,
	[iscorporateentitytaxexempt] [bit] NULL,
	[iswomenownedsmallbusiness] [bit] NULL,
	[isecondisadvwomenownedsmallbusiness] [bit] NULL,
	[isjointventurewomenownedsmallbusiness] [bit] NULL,
	[isjointventureecondisadvwomenownedsmallbusiness] [bit] NULL,
	[walshhealyact] [varchar](1) NULL,
	[servicecontractact] [varchar](1) NULL,
	[davisbaconact] [varchar](1) NULL,
	[clingercohenact] [bit] NULL,
	[otherstatutoryauthority] [varchar](1000) NULL,
	[interagencycontractingauthority] [varchar](3) NULL,
	[CSISCreatedDate] [datetime] NOT NULL,
	[CSISModifiedDate] [datetime] NOT NULL,
	[numberofactions] [bigint] NULL,
	[numberofemployees] [bigint] NULL,
	[annualrevenue] [decimal](19, 4) NULL,
	[CSIStransactionID] [int] NOT NULL,
	[CSISUniqueIndexID] [uniqueidentifier] NULL,
	[CSISUniqueIndexIdentity] [uniqueidentifier] NOT NULL,
	[PlaceofPerformanceCity] [varchar](100) NULL,
	[prime_awardee_executive1] [varchar](100) NULL,
	[prime_awardee_executive2] [varchar](100) NULL,
	[prime_awardee_executive3] [varchar](100) NULL,
	[prime_awardee_executive4] [varchar](100) NULL,
	[prime_awardee_executive5] [varchar](100) NULL,
	[prime_awardee_executive5_compensation] [decimal](19, 4) NULL,
	[prime_awardee_executive2_compensation] [decimal](19, 4) NULL,
	[prime_awardee_executive3_compensation] [decimal](19, 4) NULL,
	[prime_awardee_executive4_compensation] [decimal](19, 4) NULL,
	[prime_awardee_executive1_compensation] [decimal](19, 4) NULL,
	[last_modified_date] [date] NULL,
	[TypeOfBusiness] [varchar](1) NULL,
	[ContractActionTypeDD350] [varchar](8) NULL,
	[TypeIndefiniteDeliveryContract] [varchar](1) NULL,
	[headquartercode] [varchar](13) NULL,
	[CAGE] [varchar](5) NULL,
	[ContractNumber] [varchar](15) NULL
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] ADD  CONSTRAINT [df_FPDSmanualAdd_CSISCreatedDate]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] ADD  CONSTRAINT [df_FPDSmanualAdd_CSISModifiedDate]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] ADD  CONSTRAINT [DF_FPDS_Contract_CSISUniqueIndexID]  DEFAULT (newsequentialid()) FOR [CSISUniqueIndexID]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] ADD  CONSTRAINT [DF_FPDS_Contract_CSISUniqueIndexIdentity]  DEFAULT (newsequentialid()) FOR [CSISUniqueIndexIdentity]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_fpds_Mod_Agency] FOREIGN KEY([mod_agency])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_contract_fpds_Mod_Agency]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogging_FPDSgovManuallyAdded] FOREIGN KEY([CSIStransactionID])
REFERENCES [Contract].[CSIStransactionID] ([CSIStransactionID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_ErrorLogging_FPDSgovManuallyAdded]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded__headquartercode] FOREIGN KEY([headquartercode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded__headquartercode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_agencyid] FOREIGN KEY([agencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_agencyid]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_claimantprogramcode] FOREIGN KEY([claimantprogramcode])
REFERENCES [FPDSTypeTable].[ClaimantProgramCode] ([ClaimantProgramCode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_claimantprogramcode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_commercialitemacquisitionprocedures] FOREIGN KEY([commercialitemacquisitionprocedures])
REFERENCES [FPDSTypeTable].[CommercialItemAcquisitionProcedures] ([CommercialItemAcquisitionProcedures])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_commercialitemacquisitionprocedures]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_contingencyhumanitarianpeacekeepingoperation] FOREIGN KEY([contingencyhumanitarianpeacekeepingoperation])
REFERENCES [Assistance].[ContingencyHumanitarianPeacekeepingOperation] ([ContingencyHumanitarianPeacekeepingOperation])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_contingencyhumanitarianpeacekeepingoperation]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_contractbundling] FOREIGN KEY([contractbundling])
REFERENCES [FPDSTypeTable].[contractbundling] ([contractbundling])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_contractbundling]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_contractfinancing] FOREIGN KEY([contractfinancing])
REFERENCES [FPDSTypeTable].[contractfinancing] ([contractfinancing])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_contractfinancing]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_contractingofficeagencyid] FOREIGN KEY([contractingofficeagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_contractingofficeagencyid]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_contractingofficeid] FOREIGN KEY([contractingofficeid])
REFERENCES [Office].[ContractingOfficeCode] ([ContractingOfficeCode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_contractingofficeid]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_contractingofficerbusinesssizedetermination] FOREIGN KEY([contractingofficerbusinesssizedetermination])
REFERENCES [FPDSTypeTable].[contractingofficerbusinesssizedetermination] ([contractingofficerbusinesssizedetermination])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_contractingofficerbusinesssizedetermination]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_costorpricingdata] FOREIGN KEY([costorpricingdata])
REFERENCES [FPDSTypeTable].[costorpricingdata] ([costorpricingdata])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_costorpricingdata]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_countryoforigin] FOREIGN KEY([countryoforigin])
REFERENCES [FPDSTypeTable].[Country3LetterCode] ([Country3LetterCode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_countryoforigin]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_davisbaconact] FOREIGN KEY([davisbaconact])
REFERENCES [FPDSTypeTable].[davisbaconact] ([davisbaconact])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_davisbaconact]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_divisionname] FOREIGN KEY([divisionname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_divisionname]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_dunsnumber] FOREIGN KEY([dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_dunsnumber]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_evaluatedpreference] FOREIGN KEY([evaluatedpreference])
REFERENCES [FPDSTypeTable].[evaluatedpreference] ([evaluatedpreference])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_evaluatedpreference]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_extentcompeted] FOREIGN KEY([extentcompeted])
REFERENCES [FPDSTypeTable].[extentcompeted] ([extentcompeted])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_extentcompeted]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_fundingrequestingagencyid] FOREIGN KEY([fundingrequestingagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_fundingrequestingagencyid]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_gfe_gfp] FOREIGN KEY([gfe_gfp_code])
REFERENCES [FPDSTypeTable].[gfe_gfp] ([gfe_gfp])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_gfe_gfp]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_idvagencyid] FOREIGN KEY([idvagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_idvagencyid]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_interagencycontractingauthority] FOREIGN KEY([interagencycontractingauthority])
REFERENCES [FPDSTypeTable].[interagencycontractingauthority] ([interagencycontractingauthority])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_interagencycontractingauthority]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_maj_agency_cat] FOREIGN KEY([maj_agency_cat])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_maj_agency_cat]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_maj_fund_agency_cat] FOREIGN KEY([maj_fund_agency_cat])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_maj_fund_agency_cat]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_manufacturingorganizationtype] FOREIGN KEY([manufacturingorganizationtype])
REFERENCES [FPDSTypeTable].[manufacturingorganizationtype] ([manufacturingorganizationtype])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_manufacturingorganizationtype]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_mod_agency] FOREIGN KEY([mod_agency])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_mod_agency]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_multipleorsingleawardidc] FOREIGN KEY([multipleorsingleawardidc])
REFERENCES [FPDSTypeTable].[multipleorsingleawardidc] ([multipleorsingleawardidc])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_multipleorsingleawardidc]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_nationalinterestactioncode] FOREIGN KEY([nationalinterestactioncode])
REFERENCES [Assistance].[NationalInterestActionCode] ([nationalinterestactioncode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_nationalinterestactioncode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_parentdunsnumber] FOREIGN KEY([parentdunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_parentdunsnumber]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_placeofmanufacture] FOREIGN KEY([placeofmanufacture])
REFERENCES [FPDSTypeTable].[PlaceOfManufacture] ([PlaceOfManufacture])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_placeofmanufacture]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_placeofperformancecountrycode] FOREIGN KEY([placeofperformancecountrycode])
REFERENCES [FPDSTypeTable].[Country3LetterCode] ([Country3LetterCode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_placeofperformancecountrycode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_pop_state_code] FOREIGN KEY([pop_state_code])
REFERENCES [FPDSTypeTable].[statecode] ([statecode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_pop_state_code]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_principalnaicscode] FOREIGN KEY([principalnaicscode])
REFERENCES [FPDSTypeTable].[PrincipalNaicsCode] ([principalnaicscode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_principalnaicscode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_productorservicecode] FOREIGN KEY([productorservicecode])
REFERENCES [FPDSTypeTable].[ProductOrServiceCode] ([ProductOrServiceCode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_productorservicecode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_reasonformodification] FOREIGN KEY([reasonformodification])
REFERENCES [FPDSTypeTable].[reasonformodification] ([reasonformodification])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_reasonformodification]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_reasonnotcompeted] FOREIGN KEY([reasonnotcompeted])
REFERENCES [FPDSTypeTable].[reasonnotcompeted] ([reasonnotcompeted])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_reasonnotcompeted]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_recoveredmaterialclauses] FOREIGN KEY([recoveredmaterialclauses])
REFERENCES [FPDSTypeTable].[recoveredmaterialclauses] ([recoveredmaterialclauses])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_recoveredmaterialclauses]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_seatransportation] FOREIGN KEY([seatransportation])
REFERENCES [FPDSTypeTable].[seatransportation] ([seatransportation])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_seatransportation]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_servicecontractact] FOREIGN KEY([servicecontractact])
REFERENCES [FPDSTypeTable].[servicecontractact] ([servicecontractact])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_servicecontractact]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_solicitationprocedures] FOREIGN KEY([solicitationprocedures])
REFERENCES [FPDSTypeTable].[solicitationprocedures] ([solicitationprocedures])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_solicitationprocedures]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_statecode] FOREIGN KEY([statecode])
REFERENCES [FPDSTypeTable].[statecode] ([statecode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_statecode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_statutoryexceptiontofairopportunity] FOREIGN KEY([statutoryexceptiontofairopportunity])
REFERENCES [FPDSTypeTable].[statutoryexceptiontofairopportunity] ([statutoryexceptiontofairopportunity])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_statutoryexceptiontofairopportunity]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_subcontractplan] FOREIGN KEY([subcontractplan])
REFERENCES [FPDSTypeTable].[subcontractplan] ([subcontractplan])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_subcontractplan]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_systemequipmentcode] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_systemequipmentcode]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_typeofcontractpricing] FOREIGN KEY([typeofcontractpricing])
REFERENCES [FPDSTypeTable].[typeofcontractpricing] ([TypeOfContractPricing])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_typeofcontractpricing]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_typeofsetaside] FOREIGN KEY([typeofsetaside])
REFERENCES [FPDSTypeTable].[typeofsetaside] ([typeofsetaside])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_typeofsetaside]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_useofepadesignatedproducts] FOREIGN KEY([useofepadesignatedproducts])
REFERENCES [FPDSTypeTable].[useofepadesignatedproducts] ([useofepadesignatedproducts])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_useofepadesignatedproducts]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_vendordoingasbusinessname] FOREIGN KEY([vendordoingasbusinessname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_vendordoingasbusinessname]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_vendorlegalorganizationname] FOREIGN KEY([vendorlegalorganizationname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_vendorlegalorganizationname]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_VendorName] FOREIGN KEY([vendorname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_VendorName]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSgovManuallyAdded_walshhealyact] FOREIGN KEY([walshhealyact])
REFERENCES [FPDSTypeTable].[walshhealyact] ([walshhealyact])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [fk_FPDSgovManuallyAdded_walshhealyact]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded]  WITH NOCHECK ADD  CONSTRAINT [pk_FPDS_contractingOfficeCode] FOREIGN KEY([fundingrequestingofficeid])
REFERENCES [Office].[ContractingOfficeCode] ([ContractingOfficeCode])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdded] CHECK CONSTRAINT [pk_FPDS_contractingOfficeCode]
GO
