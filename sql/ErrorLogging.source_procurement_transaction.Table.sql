/****** Object:  Table [ErrorLogging].[source_procurement_transaction]    Script Date: 3/31/2024 4:33:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ErrorLogging].[source_procurement_transaction](
	[detached_award_procurement_id] [int] NULL,
	[detached_award_proc_unique] [varchar](154) NULL,
	[a_76_fair_act_action] [bit] NULL,
	[a_76_fair_act_action_desc] [varchar](255) NULL,
	[action_date] [datetime2](7) NULL,
	[action_type] [varchar](1) NULL,
	[action_type_description] [varchar](255) NULL,
	[additional_reporting] [varchar](255) NULL,
	[agency_id] [varchar](4) NULL,
	[annual_revenue] [decimal](19, 4) NULL,
	[award_description] [varchar](4035) NULL,
	[award_modification_amendme] [varchar](25) NULL,
	[award_or_idv_flag] [varchar](5) NULL,
	[awardee_or_recipient_legal] [nvarchar](150) NULL,
	[awardee_or_recipient_uniqu] [nvarchar](150) NULL,
	[awarding_agency_code] [smallint] NULL,
	[awarding_agency_name] [varchar](255) NULL,
	[awarding_office_code] [varchar](6) NULL,
	[awarding_office_name] [varchar](255) NULL,
	[awarding_sub_tier_agency_c] [varchar](4) NULL,
	[awarding_sub_tier_agency_n] [varchar](255) NULL,
	[base_and_all_options_value] [decimal](19, 4) NULL,
	[base_exercised_options_val] [decimal](19, 4) NULL,
	[business_categories] [varchar](1000) NULL,
	[cage_code] [varchar](5) NULL,
	[clinger_cohen_act_pla_desc] [varchar](255) NULL,
	[clinger_cohen_act_planning] [bit] NULL,
	[commercial_item_acqui_desc] [varchar](255) NULL,
	[commercial_item_acquisitio] [varchar](1) NULL,
	[commercial_item_test_desc] [varchar](255) NULL,
	[commercial_item_test_progr] [varchar](1) NULL,
	[consolidated_contract] [varchar](1) NULL,
	[consolidated_contract_desc] [varchar](255) NULL,
	[construction_wage_rat_desc] [varchar](255) NULL,
	[construction_wage_rate_req] [varchar](1) NULL,
	[contingency_humanitar_desc] [varchar](255) NULL,
	[contingency_humanitarian_o] [varchar](1) NULL,
	[contract_award_type] [varchar](1) NULL,
	[contract_award_type_desc] [varchar](255) NULL,
	[contract_bundling] [varchar](1) NULL,
	[contract_bundling_descrip] [varchar](255) NULL,
	[contract_financing] [varchar](1) NULL,
	[contract_financing_descrip] [varchar](255) NULL,
	[contracting_officers_desc] [varchar](255) NULL,
	[contracting_officers_deter] [varchar](1) NULL,
	[cost_accounting_stand_desc] [varchar](255) NULL,
	[cost_accounting_standards] [varchar](1) NULL,
	[cost_or_pricing_data] [varchar](1) NULL,
	[cost_or_pricing_data_desc] [varchar](255) NULL,
	[country_of_product_or_desc] [varchar](255) NULL,
	[country_of_product_or_serv] [varchar](3) NULL,
	[created_at] [datetime2](7) NULL,
	[current_total_value_award] [decimal](19, 4) NULL,
	[division_name] [nvarchar](150) NULL,
	[division_number_or_office] [varchar](10) NULL,
	[dod_claimant_prog_cod_desc] [varchar](255) NULL,
	[dod_claimant_program_code] [varchar](3) NULL,
	[domestic_or_foreign_e_desc] [varchar](255) NULL,
	[domestic_or_foreign_entity] [varchar](1) NULL,
	[epa_designated_produc_desc] [varchar](255) NULL,
	[epa_designated_product] [varchar](1) NULL,
	[evaluated_preference] [varchar](6) NULL,
	[evaluated_preference_desc] [varchar](255) NULL,
	[extent_compete_description] [varchar](255) NULL,
	[extent_competed] [varchar](3) NULL,
	[fair_opportunity_limi_desc] [varchar](255) NULL,
	[fair_opportunity_limited_s] [varchar](4) NULL,
	[fed_biz_opps] [varchar](1) NULL,
	[fed_biz_opps_description] [varchar](255) NULL,
	[federal_action_obligation] [decimal](19, 4) NULL,
	[foreign_funding] [varchar](21) NULL,
	[foreign_funding_desc] [varchar](25) NULL,
	[funding_agency_code] [varchar](4) NULL,
	[funding_agency_name] [varchar](255) NULL,
	[funding_office_code] [varchar](6) NULL,
	[funding_office_name] [varchar](255) NULL,
	[funding_sub_tier_agency_co] [varchar](4) NULL,
	[funding_sub_tier_agency_na] [varchar](255) NULL,
	[government_furnished_desc] [varchar](255) NULL,
	[government_furnished_prope] [varchar](1) NULL,
	[high_comp_officer1_amount] [decimal](19, 4) NULL,
	[high_comp_officer1_full_na] [varchar](100) NULL,
	[high_comp_officer2_amount] [decimal](19, 4) NULL,
	[high_comp_officer2_full_na] [varchar](100) NULL,
	[high_comp_officer3_amount] [decimal](19, 4) NULL,
	[high_comp_officer3_full_na] [varchar](100) NULL,
	[high_comp_officer4_amount] [decimal](19, 4) NULL,
	[high_comp_officer4_full_na] [varchar](100) NULL,
	[high_comp_officer5_amount] [decimal](19, 4) NULL,
	[high_comp_officer5_full_na] [varchar](100) NULL,
	[idv_type] [varchar](1) NULL,
	[idv_type_description] [varchar](255) NULL,
	[information_technolog_desc] [varchar](255) NULL,
	[information_technology_com] [varchar](30) NULL,
	[inherently_government_desc] [varchar](40) NULL,
	[inherently_government_func] [varchar](10) NULL,
	[initial_report_date] [datetime2](7) NULL,
	[interagency_contract_desc] [varchar](255) NULL,
	[interagency_contracting_au] [varchar](3) NULL,
	[labor_standards] [varchar](1) NULL,
	[labor_standards_descrip] [varchar](255) NULL,
	[last_modified] [datetime2](7) NULL,
	[legal_entity_address_line1] [varchar](115) NULL,
	[legal_entity_address_line2] [varchar](64) NULL,
	[legal_entity_address_line3] [varchar](55) NULL,
	[legal_entity_city_name] [varchar](35) NULL,
	[legal_entity_congressional] [varchar](22) NULL,
	[legal_entity_country_code] [nvarchar](50) NULL,
	[legal_entity_country_name] [varchar](255) NULL,
	[legal_entity_county_code] [int] NULL,
	[legal_entity_county_name] [varchar](30) NULL,
	[legal_entity_state_code] [varchar](35) NULL,
	[legal_entity_state_descrip] [varchar](35) NULL,
	[legal_entity_zip4] [varchar](28) NULL,
	[legal_entity_zip5] [varchar](255) NULL,
	[legal_entity_zip_last4] [varchar](255) NULL,
	[local_area_set_aside] [varchar](4) NULL,
	[local_area_set_aside_desc] [varchar](255) NULL,
	[major_program] [varchar](104) NULL,
	[materials_supplies_article] [varchar](1) NULL,
	[materials_supplies_descrip] [varchar](255) NULL,
	[multi_year_contract] [bit] NULL,
	[multi_year_contract_desc] [varchar](255) NULL,
	[multiple_or_single_aw_desc] [varchar](255) NULL,
	[multiple_or_single_award_i] [varchar](1) NULL,
	[naics] [varchar](6) NULL,
	[naics_description] [varchar](255) NULL,
	[national_interest_action] [varchar](4) NULL,
	[national_interest_desc] [varchar](255) NULL,
	[number_of_actions] [bigint] NULL,
	[number_of_employees] [bigint] NULL,
	[number_of_offers_received] [bigint] NULL,
	[ordering_period_end_date] [datetime2](7) NULL,
	[organizational_type] [varchar](30) NULL,
	[other_statutory_authority] [varchar](1000) NULL,
	[other_than_full_and_o_desc] [varchar](255) NULL,
	[other_than_full_and_open_c] [varchar](3) NULL,
	[parent_award_id] [varchar](50) NULL,
	[performance_based_se_desc] [varchar](255) NULL,
	[performance_based_service] [varchar](38) NULL,
	[period_of_perf_potential_e] [datetime2](7) NULL,
	[period_of_performance_curr] [datetime2](7) NULL,
	[period_of_performance_star] [datetime2](7) NULL,
	[piid] [varchar](50) NULL,
	[place_of_manufacture] [varchar](1) NULL,
	[place_of_manufacture_desc] [varchar](255) NULL,
	[place_of_perf_country_desc] [varchar](255) NULL,
	[place_of_perfor_state_desc] [varchar](255) NULL,
	[place_of_perform_city_name] [varchar](100) NULL,
	[place_of_perform_country_c] [varchar](3) NULL,
	[place_of_perform_country_n] [varchar](255) NULL,
	[place_of_perform_county_co] [int] NULL,
	[place_of_perform_county_na] [varchar](26) NULL,
	[place_of_perform_state_nam] [varchar](255) NULL,
	[place_of_perform_zip_last4] [varchar](255) NULL,
	[place_of_performance_congr] [varchar](22) NULL,
	[place_of_performance_locat] [varchar](9) NULL,
	[place_of_performance_state] [varchar](2) NULL,
	[place_of_performance_zip4a] [varchar](10) NULL,
	[place_of_performance_zip5] [varchar](255) NULL,
	[potential_total_value_awar] [decimal](19, 4) NULL,
	[price_evaluation_adjustmen] [smallint] NULL,
	[product_or_service_co_desc] [varchar](255) NULL,
	[product_or_service_code] [varchar](4) NULL,
	[program_acronym] [varchar](29) NULL,
	[program_system_or_equ_desc] [varchar](255) NULL,
	[program_system_or_equipmen] [varchar](4) NULL,
	[pulled_from] [varchar](255) NULL,
	[purchase_card_as_paym_desc] [varchar](255) NULL,
	[purchase_card_as_payment_m] [bit] NULL,
	[recovered_materials_s_desc] [varchar](255) NULL,
	[recovered_materials_sustai] [varchar](1) NULL,
	[referenced_idv_agency_desc] [varchar](255) NULL,
	[referenced_idv_agency_iden] [varchar](4) NULL,
	[referenced_idv_agency_name] [varchar](255) NULL,
	[referenced_idv_modificatio] [varchar](25) NULL,
	[referenced_idv_type] [varchar](1) NULL,
	[referenced_idv_type_desc] [varchar](255) NULL,
	[referenced_mult_or_si_desc] [varchar](255) NULL,
	[referenced_mult_or_single] [varchar](1) NULL,
	[research] [varchar](3) NULL,
	[research_description] [varchar](255) NULL,
	[sam_exception] [varchar](70) NULL,
	[sam_exception_description] [varchar](71) NULL,
	[sea_transportation] [varchar](1) NULL,
	[sea_transportation_desc] [varchar](255) NULL,
	[solicitation_date] [date] NULL,
	[solicitation_identifier] [varchar](69) NULL,
	[solicitation_procedur_desc] [varchar](255) NULL,
	[solicitation_procedures] [varchar](5) NULL,
	[subcontracting_plan] [varchar](1) NULL,
	[subcontracting_plan_desc] [varchar](255) NULL,
	[total_obligated_amount] [decimal](19, 4) NULL,
	[transaction_number] [bigint] NULL,
	[type_of_contract_pric_desc] [varchar](255) NULL,
	[type_of_contract_pricing] [varchar](2) NULL,
	[type_of_idc] [varchar](41) NULL,
	[type_of_idc_description] [varchar](255) NULL,
	[type_set_aside] [varchar](10) NULL,
	[type_set_aside_description] [varchar](255) NULL,
	[ultimate_parent_legal_enti] [nvarchar](150) NULL,
	[ultimate_parent_unique_ide] [varchar](255) NULL,
	[undefinitized_action] [varchar](1) NULL,
	[undefinitized_action_desc] [varchar](255) NULL,
	[unique_award_key] [varchar](120) NULL,
	[updated_at] [datetime2](7) NULL,
	[vendor_alternate_name] [varchar](150) NULL,
	[vendor_alternate_site_code] [varchar](20) NULL,
	[vendor_doing_as_business_n] [nvarchar](150) NULL,
	[vendor_enabled] [varchar](255) NULL,
	[vendor_fax_number] [varchar](30) NULL,
	[vendor_legal_org_name] [nvarchar](150) NULL,
	[vendor_location_disabled_f] [varchar](255) NULL,
	[vendor_phone_number] [varchar](20) NULL,
	[vendor_site_code] [varchar](15) NULL,
	[awardee_or_recipient_uei] [varchar](12) NULL,
	[ultimate_parent_uei] [varchar](12) NULL,
	[small_business_competitive] [bit] NULL,
	[city_local_government] [bit] NULL,
	[county_local_government] [bit] NULL,
	[inter_municipal_local_gove] [bit] NULL,
	[local_government_owned] [bit] NULL,
	[municipality_local_governm] [bit] NULL,
	[school_district_local_gove] [bit] NULL,
	[township_local_government] [bit] NULL,
	[us_state_government] [bit] NULL,
	[us_federal_government] [bit] NULL,
	[federal_agency] [bit] NULL,
	[federally_funded_research] [bit] NULL,
	[us_tribal_government] [bit] NULL,
	[foreign_government] [bit] NULL,
	[community_developed_corpor] [bit] NULL,
	[labor_surplus_area_firm] [bit] NULL,
	[corporate_entity_not_tax_e] [bit] NULL,
	[corporate_entity_tax_exemp] [bit] NULL,
	[partnership_or_limited_lia] [bit] NULL,
	[sole_proprietorship] [bit] NULL,
	[small_agricultural_coopera] [bit] NULL,
	[international_organization] [bit] NULL,
	[us_government_entity] [bit] NULL,
	[emerging_small_business] [bit] NULL,
	[c8a_program_participant] [bit] NULL,
	[sba_certified_8_a_joint_ve] [bit] NULL,
	[dot_certified_disadvantage] [bit] NULL,
	[self_certified_small_disad] [bit] NULL,
	[historically_underutilized] [bit] NULL,
	[small_disadvantaged_busine] [bit] NULL,
	[the_ability_one_program] [bit] NULL,
	[historically_black_college] [bit] NULL,
	[c1862_land_grant_college] [bit] NULL,
	[c1890_land_grant_college] [bit] NULL,
	[c1994_land_grant_college] [bit] NULL,
	[minority_institution] [bit] NULL,
	[private_university_or_coll] [bit] NULL,
	[school_of_forestry] [bit] NULL,
	[state_controlled_instituti] [bit] NULL,
	[tribal_college] [bit] NULL,
	[veterinary_college] [bit] NULL,
	[educational_institution] [bit] NULL,
	[alaskan_native_servicing_i] [bit] NULL,
	[community_development_corp] [bit] NULL,
	[native_hawaiian_servicing] [bit] NULL,
	[domestic_shelter] [bit] NULL,
	[manufacturer_of_goods] [bit] NULL,
	[hospital_flag] [bit] NULL,
	[veterinary_hospital] [bit] NULL,
	[hispanic_servicing_institu] [bit] NULL,
	[foundation] [bit] NULL,
	[woman_owned_business] [bit] NULL,
	[minority_owned_business] [bit] NULL,
	[women_owned_small_business] [bit] NULL,
	[economically_disadvantaged] [bit] NULL,
	[joint_venture_women_owned] [bit] NULL,
	[joint_venture_economically] [bit] NULL,
	[veteran_owned_business] [bit] NULL,
	[service_disabled_veteran_o] [bit] NULL,
	[contracts] [bit] NULL,
	[grants] [bit] NULL,
	[receives_contracts_and_gra] [bit] NULL,
	[airport_authority] [bit] NULL,
	[council_of_governments] [bit] NULL,
	[housing_authorities_public] [bit] NULL,
	[interstate_entity] [bit] NULL,
	[planning_commission] [bit] NULL,
	[port_authority] [bit] NULL,
	[transit_authority] [bit] NULL,
	[subchapter_s_corporation] [bit] NULL,
	[limited_liability_corporat] [bit] NULL,
	[foreign_owned_and_located] [bit] NULL,
	[american_indian_owned_busi] [bit] NULL,
	[alaskan_native_owned_corpo] [bit] NULL,
	[indian_tribe_federally_rec] [bit] NULL,
	[native_hawaiian_owned_busi] [bit] NULL,
	[tribally_owned_business] [bit] NULL,
	[asian_pacific_american_own] [bit] NULL,
	[black_american_owned_busin] [bit] NULL,
	[hispanic_american_owned_bu] [bit] NULL,
	[native_american_owned_busi] [bit] NULL,
	[subcontinent_asian_asian_i] [bit] NULL,
	[other_minority_owned_busin] [bit] NULL,
	[for_profit_organization] [bit] NULL,
	[nonprofit_organization] [bit] NULL,
	[other_not_for_profit_organ] [bit] NULL,
	[us_local_government] [bit] NULL,
	[entity_data_source] [varchar](255) NULL,
	[CSISCreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[temp_uei] [varchar](12) NULL
) ON [PRIMARY]
GO

ALTER TABLE [ErrorLogging].[source_procurement_transaction] ADD  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO

ALTER TABLE [ErrorLogging].[source_procurement_transaction] ADD  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO




alter table errorlogging.source_procurement_transaction
alter column legal_entity_zip5 varchar(5)

alter table errorlogging.source_procurement_transaction
alter column legal_entity_zip_last4 varchar(4)

alter table errorlogging.source_procurement_transaction
alter column place_of_perform_zip_last4 varchar(4)

alter table errorlogging.source_procurement_transaction
alter column place_of_performance_zip5 varchar(5)

alter table errorlogging.fpdsstage2
alter column ccrexception varchar(1)

alter table errorlogging.source_procurement_transaction
alter column sam_exception_description varchar(71)

alter table errorlogging.source_procurement_transaction
alter column ultimate_parent_unique_ide varchar(13)

alter table errorlogging.source_procurement_transaction
alter column awardee_or_recipient_uniqu varchar(13)

alter table errorlogging.source_procurement_transaction
alter column awardee_or_recipient_uniqu varchar(13)