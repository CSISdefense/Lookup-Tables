SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[FPDS](
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
	[currentcompletiondate] [datetime2](7) NULL,
	[ultimatecompletiondate] [datetime2](7) NULL,
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
	[transaction_description] [varchar](4035) NULL,
	[purchasecardaspaymentmethod] [bit] NULL,
	[nationalinterestactioncode] [varchar](4) NULL,
	[progsourceagency] [varchar](2) NULL,
	[progsourceaccount] [varchar](4) NULL,
	[progsourcesubacct] [varchar](3) NULL,
	[account_title] [varchar](90) NULL,
	[rec_flag] [varchar](4) NULL,
	[typeofidc] [varchar](41) NULL,
	[multipleorsingleawardidc] [varchar](1) NULL,
	[programacronym] [varchar](29) NULL,
	[vendorname] [nvarchar](150) NULL,
	[vendoralternatename] [varchar](150) NULL,
	[vendorlegalorganizationname] [nvarchar](150) NULL,
	[vendordoingasbusinessname] [nvarchar](150) NULL,
	[divisionname] [nvarchar](150) NULL,
	[divisionnumberorofficecode] [varchar](10) NULL,
	[ccrexception] [varchar](1) NULL,
	[streetaddress] [varchar](125) NULL,
	[streetaddress2] [varchar](70) NULL,
	[streetaddress3] [varchar](55) NULL,
	[city] [varchar](35) NULL,
	[zipcode] [varchar](28) NULL,
	[vendorcountrycode] [nvarchar](50) NULL,
	[vendor_state_code] [varchar](35) NULL,
	[prime_award_transaction_recipient_cd_current] [varchar](22) NULL,
	[vendorsitecode] [varchar](15) NULL,
	[vendoralternatesitecode] [varchar](20) NULL,
	[dunsnumber] [varchar](13) NULL,
	[parentdunsnumber] [varchar](13) NULL,
	[phoneno] [varchar](20) NULL,
	[faxno] [varchar](30) NULL,
	[registrationdate] [date] NULL,
	[renewaldate] [date] NULL,
	[mod_parent] [nvarchar](150) NULL,
	[locationcode] [varchar](9) NULL,
	[statecode] [varchar](2) NULL,
	[pop_state_code] [varchar](2) NULL,
	[placeofperformancecountrycode] [varchar](3) NULL,
	[placeofperformancezipcode] [varchar](10) NULL,
	[prime_award_transaction_place_of_performance_cd_current] [varchar](22) NULL,
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
	[consolidatedcontract] [varchar](1) NULL,
	[countryoforigin] [varchar](3) NULL,
	[placeofmanufacture] [varchar](1) NULL,
	[manufacturingorganizationtype] [varchar](1) NULL,
	[agencyid] [varchar](4) NULL,
	[piid] [varchar](50) NULL,
	[modnumber] [varchar](25) NOT NULL,
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
	[simplified_procedures_for_certain_commercial_items_code] [varchar](1) NULL,
	[smallbusinesscompetitivenessdemonstrationprogram] [bit] NULL,
	[a76action] [bit] NULL,
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
	[foreign_owned] [bit] NULL,
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
	[CSIStransactionID] [int] NULL,
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
	[last_modified_date] [datetime2](7) NULL,
	[TypeOfBusiness] [varchar](1) NULL,
	[ContractActionTypeDD350] [varchar](8) NULL,
	[headquartercode] [varchar](13) NULL,
	[CAGE] [varchar](5) NULL,
	[ContractNumber] [varchar](15) NULL,
	[award_type_code] [varchar](1) NULL,
	[idv_type_code] [varchar](1) NULL,
	[parent_award_type_code] [varchar](1) NULL,
	[parent_award_single_or_multiple_code] [varchar](1) NULL,
	[primary_place_of_performance_county_name] [varchar](26) NULL,
	[indian_tribe_federally_recognized] [bit] NULL,
	[other_minority_owned_business] [bit] NULL,
	[community_developed_corporation_owned_firm] [bit] NULL,
	[labor_surplus_area_firm] [bit] NULL,
	[city_local_government] [bit] NULL,
	[county_local_government] [bit] NULL,
	[inter_municipal_local_government] [bit] NULL,
	[local_government_owned] [bit] NULL,
	[corporate_entity_not_tax_exempt] [bit] NULL,
	[international_organization] [bit] NULL,
	[us_government_entity] [bit] NULL,
	[community_development_corporation] [bit] NULL,
	[domestic_shelter] [bit] NULL,
	[manufacturer_of_goods] [bit] NULL,
	[alaskan_native_servicing_institution] [bit] NULL,
	[native_hawaiian_servicing_institution] [bit] NULL,
	[sba_certified_8a_joint_venture] [bit] NULL,
	[dot_certified_disadvantage] [bit] NULL,
	[contract_transaction_unique_key] [varchar](154) NULL,
	[contract_award_unique_key] [varchar](120) NULL,
	[current_total_value_of_award] [decimal](19, 4) NULL,
	[potential_total_value_of_award] [decimal](19, 4) NULL,
	[award_or_idv_flag] [varchar](5) NULL,
	[inherently_governmental_functions] [varchar](10) NULL,
	[total_dollars_obligated] [decimal](19, 4) NULL,
	[solicitation_date] [date] NULL,
	[treasury_accounts_funding_this_award] [varchar](4000) NULL,
	[federal_accounts_funding_this_award] [varchar](1000) NULL,
	[usaspending_permalink] [varchar](150) NULL,
	[awarding_agency_code] [smallint] NULL,
	[recipient_county_name] [varchar](30) NULL,
	[disaster_emergency_fund_codes_for_overall_award] [varchar](500) NULL,
	[object_classes_funding_this_award] [varchar](1000) NULL,
	[program_activities_funding_this_award] [varchar](5012) NULL,
	[obligated_amount_funded_by_COVID19_supplementals_for_overall_award] [decimal](19, 4) NULL,
	[outlayed_amount_funded_by_COVID19_supplementals_for_overall_award] [decimal](19, 4) NULL,
	[dod_acquisition_program_description] [varchar](255) NULL,
	[recipient_uei] [varchar](12) NULL,
	[recipient_parent_uei] [varchar](12) NULL,
	[prime_award_base_transaction_description] [varchar](4008) NULL,
	[obligated_amount_funded_by_IIJA_supplementals_for_overall_award] [decimal](19, 4) NULL,
	[outlayed_amount_funded_by_IIJA_supplementals_for_overall_award] [decimal](19, 4) NULL,
	[recipient_name_raw] [nvarchar](150) NULL,
	[recipient_parent_name_raw] [nvarchar](150) NULL,
	[prime_award_transaction_recipient_county_fips_code] [int] NULL,
	[prime_award_transaction_recipient_state_fips_code] [tinyint] NULL,
	[prime_award_transaction_place_of_performance_county_fips_code] [int] NULL,
	[prime_award_transaction_place_of_performance_state_fips_code] [tinyint] NULL,
	[prime_award_transaction_recipient_cd_original] [varchar](22) NULL,
	[prime_award_transaction_place_of_performance_cd_original] [varchar](22) NULL,
	[total_outlayed_amount_for_overall_award] [decimal](19, 4) NULL,
	[initial_report_date] [datetime2](7) NULL,
	[detached_award_procurement_id] [int] NULL,
	[additional_reporting] [varchar](92) NULL,
	[business_categories] [varchar](1000) NULL,
	[pulled_from] [varchar](5) NULL,
	[entity_data_source] [varchar](3) NULL,
	[created_at] [datetime2](7) NULL,
	[updated_at] [datetime2](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[FPDS] ADD  CONSTRAINT [DF_FPDS_CSISCreatedDate]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [Contract].[FPDS] ADD  CONSTRAINT [DF_FPDS_CSISModifiedDate]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD FOREIGN KEY([awarding_agency_code])
REFERENCES [agency].[awarding_agency_code] ([awarding_agency_code])
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD FOREIGN KEY([awarding_agency_code])
REFERENCES [agency].[awarding_agency_code] ([awarding_agency_code])
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD FOREIGN KEY([prime_award_transaction_recipient_state_fips_code])
REFERENCES [Location].[State_FIPS_Code] ([state_fips_code])
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_award_type_code] FOREIGN KEY([award_type_code])
REFERENCES [FPDSTypeTable].[award_type_code] ([award_type_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_award_type_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_CommercialItemTestProgram] FOREIGN KEY([simplified_procedures_for_certain_commercial_items_code])
REFERENCES [FPDSTypeTable].[simplified_procedures_for_certain_commercial_items_code] ([simplified_procedures_for_certain_commercial_items_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_CommercialItemTestProgram]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_consolidatedcontract] FOREIGN KEY([consolidatedcontract])
REFERENCES [Contract].[consolidatedcontract] ([consolidatedcontract])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_consolidatedcontract]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_FPDS_contract_award_unique_key] FOREIGN KEY([contract_award_unique_key])
REFERENCES [Contract].[contract_award_unique_key] ([contract_award_unique_key])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_FPDS_contract_award_unique_key]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_contract_transaction_unique_key] FOREIGN KEY([contract_transaction_unique_key])
REFERENCES [Contract].[contract_transaction_unique_key] ([contract_transaction_unique_key])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_contract_transaction_unique_key]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_contractactiontype] FOREIGN KEY([contractactiontype])
REFERENCES [FPDSTypeTable].[ContractActionType] ([contractactiontype])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_contractactiontype]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_Contracting] FOREIGN KEY([fiscal_year], [contractingofficeagencyid], [contractingofficeid])
REFERENCES [Office].[OfficeIDhistory] ([fiscal_year], [AgencyID], [OfficeID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_Contracting]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_csistransactionid] FOREIGN KEY([CSIStransactionID])
REFERENCES [Contract].[CSIStransactionID] ([CSIStransactionID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_csistransactionid]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_FundingOfficeIDhistory] FOREIGN KEY([fiscal_year], [fundingrequestingagencyid], [fundingrequestingofficeid])
REFERENCES [Office].[OfficeIDhistory] ([fiscal_year], [AgencyID], [OfficeID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_FundingOfficeIDhistory]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_idv_type_code] FOREIGN KEY([idv_type_code])
REFERENCES [FPDSTypeTable].[idv_type_code] ([idv_type_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_idv_type_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_informationtechnologycommercialitemcategory] FOREIGN KEY([informationtechnologycommercialitemcategory])
REFERENCES [FPDSTypeTable].[informationtechnologycommercialitemcategory] ([informationtechnologycommercialitemcategory])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_informationtechnologycommercialitemcategory]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_fpds_LetterContract] FOREIGN KEY([lettercontract])
REFERENCES [FPDSTypeTable].[lettercontract] ([LetterContract])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_LetterContract]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_majorprogramcode] FOREIGN KEY([majorprogramcode])
REFERENCES [Contract].[MajorProgramCode] ([majorprogramcode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_majorprogramcode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_fpds_Mod_Agency] FOREIGN KEY([mod_agency])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_Mod_Agency]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_mod_parent] FOREIGN KEY([mod_parent])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_mod_parent]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_parent_award_single_or_multiple_code] FOREIGN KEY([parent_award_single_or_multiple_code])
REFERENCES [FPDSTypeTable].[multipleorsingleawardidc] ([multipleorsingleawardidc])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_parent_award_single_or_multiple_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_parent_award_type_code] FOREIGN KEY([parent_award_type_code])
REFERENCES [FPDSTypeTable].[idv_type_code] ([idv_type_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_parent_award_type_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_prime_award_transaction_place_of_performance_cd_original] FOREIGN KEY([prime_award_transaction_place_of_performance_cd_original])
REFERENCES [Location].[Congressional_District] ([congressional_district])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_prime_award_transaction_place_of_performance_cd_original]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_prime_award_transaction_place_of_performance_state_fips_code] FOREIGN KEY([prime_award_transaction_place_of_performance_state_fips_code])
REFERENCES [Location].[State_FIPS_Code] ([state_fips_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_prime_award_transaction_place_of_performance_state_fips_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_prime_award_transaction_recipient_cd_original] FOREIGN KEY([prime_award_transaction_recipient_cd_original])
REFERENCES [Location].[Congressional_District] ([congressional_district])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_prime_award_transaction_recipient_cd_original]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_progsourceagency] FOREIGN KEY([progsourceagency], [progsourceaccount], [progsourcesubacct])
REFERENCES [budget].[progsource] ([progsourceagency], [progsourceaccount], [progsourcesubacct])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_progsourceagency]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_rec_flag] FOREIGN KEY([rec_flag])
REFERENCES [budget].[rec_flag] ([rec_flag])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_rec_flag]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_recipient_name_raw] FOREIGN KEY([recipient_name_raw])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_recipient_name_raw]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_recipient_parent_name_raw] FOREIGN KEY([recipient_parent_name_raw])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_recipient_parent_name_raw]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_recipient_parent_uei] FOREIGN KEY([recipient_parent_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_recipient_parent_uei]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_recipient_parent_UEIhistory] FOREIGN KEY([recipient_parent_uei], [fiscal_year])
REFERENCES [Vendor].[UEIhistory] ([UEI], [Fiscal_Year])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_recipient_parent_UEIhistory]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_recipient_uei] FOREIGN KEY([recipient_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_recipient_uei]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_recipient_UEIhistory] FOREIGN KEY([recipient_uei], [fiscal_year])
REFERENCES [Vendor].[UEIhistory] ([UEI], [Fiscal_Year])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_recipient_UEIhistory]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_TypeOfBusiness] FOREIGN KEY([TypeOfBusiness])
REFERENCES [FPDSTypeTable].[TypeofBusinessDD350] ([TypeOfBusiness])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_TypeOfBusiness]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_typeofcontractpricing] FOREIGN KEY([typeofcontractpricing])
REFERENCES [FPDSTypeTable].[typeofcontractpricing] ([TypeOfContractPricing])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_typeofcontractpricing]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_contract_fpds_vendor_state_code] FOREIGN KEY([vendor_state_code])
REFERENCES [Location].[recipient_state_code] ([recipient_state_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_contract_fpds_vendor_state_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_agencyid] FOREIGN KEY([agencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_agencyid]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_budget_FundedByForeignEntity] FOREIGN KEY([fundedbyforeignentity])
REFERENCES [budget].[FundedByForeignEntity] ([fundedbyforeignentity])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_budget_FundedByForeignEntity]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_claimantprogramcode] FOREIGN KEY([claimantprogramcode])
REFERENCES [FPDSTypeTable].[ClaimantProgramCode] ([ClaimantProgramCode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_claimantprogramcode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_commercialitemacquisitionprocedures] FOREIGN KEY([commercialitemacquisitionprocedures])
REFERENCES [FPDSTypeTable].[CommercialItemAcquisitionProcedures] ([CommercialItemAcquisitionProcedures])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_commercialitemacquisitionprocedures]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_contingencyhumanitarianpeacekeepingoperation] FOREIGN KEY([contingencyhumanitarianpeacekeepingoperation])
REFERENCES [Assistance].[ContingencyHumanitarianPeacekeepingOperation] ([ContingencyHumanitarianPeacekeepingOperation])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_contingencyhumanitarianpeacekeepingoperation]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_Contract_award_or_idv_flag] FOREIGN KEY([award_or_idv_flag])
REFERENCES [Contract].[award_or_idv_flag] ([award_or_idv_flag])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_Contract_award_or_idv_flag]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_Contract_Contract_Award_Unique_Key] FOREIGN KEY([contract_award_unique_key])
REFERENCES [Contract].[contract_award_unique_key] ([contract_award_unique_key])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_Contract_Contract_Award_Unique_Key]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_contractbundling] FOREIGN KEY([contractbundling])
REFERENCES [FPDSTypeTable].[contractbundling] ([contractbundling])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_contractbundling]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_contractfinancing] FOREIGN KEY([contractfinancing])
REFERENCES [FPDSTypeTable].[contractfinancing] ([contractfinancing])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_contractfinancing]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_contractingofficeagencyid] FOREIGN KEY([contractingofficeagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_contractingofficeagencyid]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_contractingofficeid] FOREIGN KEY([contractingofficeagencyid], [contractingofficeid])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_contractingofficeid]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_contractingofficerbusinesssizedetermination] FOREIGN KEY([contractingofficerbusinesssizedetermination])
REFERENCES [FPDSTypeTable].[contractingofficerbusinesssizedetermination] ([contractingofficerbusinesssizedetermination])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_contractingofficerbusinesssizedetermination]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_costorpricingdata] FOREIGN KEY([costorpricingdata])
REFERENCES [FPDSTypeTable].[costorpricingdata] ([costorpricingdata])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_costorpricingdata]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_countryoforigin] FOREIGN KEY([countryoforigin])
REFERENCES [FPDSTypeTable].[Country3LetterCode] ([Country3LetterCode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_countryoforigin]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_davisbaconact] FOREIGN KEY([davisbaconact])
REFERENCES [FPDSTypeTable].[davisbaconact] ([davisbaconact])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_davisbaconact]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_divisionname] FOREIGN KEY([divisionname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_divisionname]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_dunsnumber] FOREIGN KEY([dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_dunsnumber]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDS_Dunsnumber_Fiscal_Year] FOREIGN KEY([dunsnumber], [fiscal_year])
REFERENCES [Contractor].[DunsnumberToParentContractorHistory] ([DUNSnumber], [FiscalYear])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_FPDS_Dunsnumber_Fiscal_Year]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_evaluatedpreference] FOREIGN KEY([evaluatedpreference])
REFERENCES [FPDSTypeTable].[evaluatedpreference] ([evaluatedpreference])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_evaluatedpreference]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_extentcompeted] FOREIGN KEY([extentcompeted])
REFERENCES [FPDSTypeTable].[extentcompeted] ([extentcompeted])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_extentcompeted]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_FPDStypetable_CostAccountingStandardsClause] FOREIGN KEY([costaccountingstandardsclause])
REFERENCES [FPDSTypeTable].[CostAccountingStandardsClause] ([CostAccountingStandardsClause])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_FPDStypetable_CostAccountingStandardsClause]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_FPDStypetable_fedbizopps] FOREIGN KEY([fedbizopps])
REFERENCES [FPDSTypeTable].[fedbizopps] ([fedbizopps])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_FPDStypetable_fedbizopps]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_FPDStypetable_PerformanceBasedServiceContract] FOREIGN KEY([performancebasedservicecontract])
REFERENCES [FPDSTypeTable].[PerformanceBasedServiceContract] ([performancebasedservicecontract])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_FPDStypetable_PerformanceBasedServiceContract]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_fpdstypetable_typeofidc] FOREIGN KEY([typeofidc])
REFERENCES [FPDSTypeTable].[TypeOfIDC] ([typeofIDC])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_fpdstypetable_typeofidc]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_fundingrequestingagencyid] FOREIGN KEY([fundingrequestingagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_fundingrequestingagencyid]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_gfe_gfp] FOREIGN KEY([gfe_gfp_code])
REFERENCES [FPDSTypeTable].[gfe_gfp] ([gfe_gfp])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_gfe_gfp]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_headquartercode] FOREIGN KEY([headquartercode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_headquartercode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_idvagencyid] FOREIGN KEY([idvagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_idvagencyid]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_interagencycontractingauthority] FOREIGN KEY([interagencycontractingauthority])
REFERENCES [FPDSTypeTable].[interagencycontractingauthority] ([interagencycontractingauthority])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_interagencycontractingauthority]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_Location_localareasetaside] FOREIGN KEY([localareasetaside])
REFERENCES [Location].[localareasetaside] ([localareasetaside])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_Location_localareasetaside]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_maj_agency_cat] FOREIGN KEY([maj_agency_cat])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_maj_agency_cat]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_maj_fund_agency_cat] FOREIGN KEY([maj_fund_agency_cat])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_maj_fund_agency_cat]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_manufacturingorganizationtype] FOREIGN KEY([manufacturingorganizationtype])
REFERENCES [Location].[manufacturingorganizationtype] ([manufacturingorganizationtype])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_manufacturingorganizationtype]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_mod_agency] FOREIGN KEY([mod_agency])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_mod_agency]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_multipleorsingleawardidc] FOREIGN KEY([multipleorsingleawardidc])
REFERENCES [FPDSTypeTable].[multipleorsingleawardidc] ([multipleorsingleawardidc])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_multipleorsingleawardidc]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_nationalinterestactioncode] FOREIGN KEY([nationalinterestactioncode])
REFERENCES [Assistance].[NationalInterestActionCode] ([NationalInterestActionCode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_nationalinterestactioncode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDS_OfficeID] FOREIGN KEY([fundingrequestingagencyid], [fundingrequestingofficeid])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_FPDS_OfficeID]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_parentdunsnumber] FOREIGN KEY([parentdunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_parentdunsnumber]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_placeofmanufacture] FOREIGN KEY([placeofmanufacture])
REFERENCES [FPDSTypeTable].[PlaceOfManufacture] ([PlaceOfManufacture])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_placeofmanufacture]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_placeofperformancecountrycode] FOREIGN KEY([placeofperformancecountrycode])
REFERENCES [FPDSTypeTable].[Country3LetterCode] ([Country3LetterCode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_placeofperformancecountrycode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_pop_state_code] FOREIGN KEY([pop_state_code])
REFERENCES [FPDSTypeTable].[statecode] ([statecode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_pop_state_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [FK_FPDS_prime_award_transaction_place_of_performance_county_fips_code] FOREIGN KEY([prime_award_transaction_place_of_performance_county_fips_code])
REFERENCES [Location].[County_FIPS_Code] ([county_fips_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_prime_award_transaction_place_of_performance_county_fips_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [FK_FPDS_prime_award_transaction_recipient_county_fips_code] FOREIGN KEY([prime_award_transaction_recipient_county_fips_code])
REFERENCES [Location].[County_FIPS_Code] ([county_fips_code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_prime_award_transaction_recipient_county_fips_code]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_principalnaicscode] FOREIGN KEY([principalnaicscode])
REFERENCES [FPDSTypeTable].[PrincipalNaicsCode] ([principalnaicscode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_principalnaicscode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_productorservicecode] FOREIGN KEY([productorservicecode])
REFERENCES [FPDSTypeTable].[ProductOrServiceCode] ([ProductOrServiceCode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_productorservicecode]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_ProductOrServiceCode_inherently_governmental_functions] FOREIGN KEY([inherently_governmental_functions])
REFERENCES [ProductOrServiceCode].[inherently_governmental_functions] ([inherently_governmental_functions])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_ProductOrServiceCode_inherently_governmental_functions]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_ProductOrServiceCode_Research_Code] FOREIGN KEY([research_code])
REFERENCES [ProductOrServiceCode].[Research_Code] ([Research_Code])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_ProductOrServiceCode_Research_Code]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_reasonformodification] FOREIGN KEY([reasonformodification])
REFERENCES [FPDSTypeTable].[reasonformodification] ([reasonformodification])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_reasonformodification]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_reasonnotcompeted] FOREIGN KEY([reasonnotcompeted])
REFERENCES [FPDSTypeTable].[reasonnotcompeted] ([reasonnotcompeted])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_reasonnotcompeted]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_recoveredmaterialclauses] FOREIGN KEY([recoveredmaterialclauses])
REFERENCES [FPDSTypeTable].[recoveredmaterialclauses] ([recoveredmaterialclauses])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_recoveredmaterialclauses]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_seatransportation] FOREIGN KEY([seatransportation])
REFERENCES [FPDSTypeTable].[seatransportation] ([seatransportation])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_seatransportation]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_servicecontractact] FOREIGN KEY([servicecontractact])
REFERENCES [FPDSTypeTable].[servicecontractact] ([servicecontractact])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_servicecontractact]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_solicitationprocedures] FOREIGN KEY([solicitationprocedures])
REFERENCES [FPDSTypeTable].[solicitationprocedures] ([solicitationprocedures])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_solicitationprocedures]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_statecode] FOREIGN KEY([statecode])
REFERENCES [FPDSTypeTable].[statecode] ([statecode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_statecode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_statutoryexceptiontofairopportunity] FOREIGN KEY([statutoryexceptiontofairopportunity])
REFERENCES [FPDSTypeTable].[statutoryexceptiontofairopportunity] ([statutoryexceptiontofairopportunity])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_statutoryexceptiontofairopportunity]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_subcontractplan] FOREIGN KEY([subcontractplan])
REFERENCES [FPDSTypeTable].[subcontractplan] ([subcontractplan])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_subcontractplan]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_systemequipmentcode] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_systemequipmentcode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_typeofsetaside] FOREIGN KEY([typeofsetaside])
REFERENCES [FPDSTypeTable].[typeofsetaside] ([typeofsetaside])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_typeofsetaside]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_useofepadesignatedproducts] FOREIGN KEY([useofepadesignatedproducts])
REFERENCES [FPDSTypeTable].[useofepadesignatedproducts] ([useofepadesignatedproducts])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_useofepadesignatedproducts]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_Vendor_CCRexception] FOREIGN KEY([ccrexception])
REFERENCES [Vendor].[CCRexception] ([CCRexception])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_Vendor_CCRexception]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_Vendor_OrganizationalType] FOREIGN KEY([organizationaltype])
REFERENCES [Vendor].[OrganizationalType] ([OrganizationalType])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_Vendor_OrganizationalType]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [fk_fpds_vendorcountrycode] FOREIGN KEY([vendorcountrycode])
REFERENCES [FPDSTypeTable].[vendorcountrycode] ([vendorcountrycode])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_fpds_vendorcountrycode]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_vendordoingasbusinessname] FOREIGN KEY([vendordoingasbusinessname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_vendordoingasbusinessname]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDS_vendorlegalorganizationname] FOREIGN KEY([vendorlegalorganizationname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_FPDS_vendorlegalorganizationname]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDS_VendorName] FOREIGN KEY([vendorname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [fk_FPDS_VendorName]
GO
ALTER TABLE [Contract].[FPDS]  WITH NOCHECK ADD  CONSTRAINT [FK_FPDS_walshhealyact] FOREIGN KEY([walshhealyact])
REFERENCES [FPDSTypeTable].[walshhealyact] ([walshhealyact])
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [FK_FPDS_walshhealyact]
GO
ALTER TABLE [Contract].[FPDS]  WITH CHECK ADD  CONSTRAINT [chk_PIID_ContractNumber] CHECK  (([PIID] IS NOT NULL OR [ContractNumber] IS NOT NULL))
GO
ALTER TABLE [Contract].[FPDS] CHECK CONSTRAINT [chk_PIID_ContractNumber]
GO
