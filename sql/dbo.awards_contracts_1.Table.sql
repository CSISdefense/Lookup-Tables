USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[awards_contracts_1](
	[award_id_piid] [varchar](50) NULL,
	[modification_number] [varchar](50) NULL,
	[transaction_number] [varchar](50) NULL,
	[parent_award_agency_id] [varchar](50) NULL,
	[parent_award_agency_name] [varchar](50) NULL,
	[parent_award_id] [varchar](50) NULL,
	[parent_award_modification_number] [varchar](50) NULL,
	[federal_action_obligation] [varchar](50) NULL,
	[base_and_exercised_options_value] [varchar](50) NULL,
	[base_and_all_options_value] [varchar](50) NULL,
	[action_date] [varchar](50) NULL,
	[period_of_performance_start_date] [varchar](50) NULL,
	[period_of_performance_current_end_date] [varchar](50) NULL,
	[period_of_performance_potential_end_date] [varchar](50) NULL,
	[ordering_period_end_date] [varchar](50) NULL,
	[awarding_agency_code] [varchar](50) NULL,
	[awarding_agency_name] [varchar](50) NULL,
	[awarding_sub_agency_code] [varchar](50) NULL,
	[awarding_sub_agency_name] [varchar](50) NULL,
	[awarding_office_code] [varchar](50) NULL,
	[awarding_office_name] [varchar](50) NULL,
	[funding_agency_code] [varchar](50) NULL,
	[funding_agency_name] [varchar](50) NULL,
	[funding_sub_agency_code] [varchar](50) NULL,
	[funding_sub_agency_name] [varchar](50) NULL,
	[funding_office_code] [varchar](50) NULL,
	[funding_office_name] [varchar](50) NULL,
	[foreign_funding] [varchar](50) NULL,
	[sam_exception] [varchar](50) NULL,
	[recipient_duns] [varchar](50) NULL,
	[recipient_name] [varchar](50) NULL,
	[recipient_doing_business_as_name] [varchar](50) NULL,
	[recipient_parent_name] [varchar](50) NULL,
	[recipient_parent_duns] [varchar](50) NULL,
	[recipient_country_code] [varchar](50) NULL,
	[recipient_country_name] [varchar](50) NULL,
	[recipient_address_line_1] [varchar](50) NULL,
	[recipient_address_line_2] [varchar](50) NULL,
	[recipient_address_line_3] [varchar](50) NULL,
	[recipient_city_name] [varchar](50) NULL,
	[recipient_state_code] [varchar](50) NULL,
	[recipient_state_name] [varchar](50) NULL,
	[recipient_zip_4_code] [varchar](50) NULL,
	[recipient_congressional_district] [varchar](50) NULL,
	[recipient_phone_number] [varchar](50) NULL,
	[recipient_fax_number] [varchar](50) NULL,
	[primary_place_of_performance_country_code] [varchar](50) NULL,
	[primary_place_of_performance_country_name] [varchar](50) NULL,
	[primary_place_of_performance_city_name] [varchar](50) NULL,
	[primary_place_of_performance_county_name] [varchar](50) NULL,
	[primary_place_of_performance_state_code] [varchar](50) NULL,
	[primary_place_of_performance_state_name] [varchar](50) NULL,
	[primary_place_of_performance_zip_4] [varchar](50) NULL,
	[primary_place_of_performance_congressional_district] [varchar](50) NULL,
	[primary_place_of_performance_location_code] [varchar](50) NULL,
	[award_type_code] [varchar](50) NULL,
	[award_type] [varchar](50) NULL,
	[idv_type_code] [varchar](50) NULL,
	[idv_type] [varchar](50) NULL,
	[multiple_or_single_award_idv_code] [varchar](50) NULL,
	[multiple_or_single_award_idv] [varchar](50) NULL,
	[type_of_idc_code] [varchar](50) NULL,
	[type_of_idc] [varchar](50) NULL,
	[type_of_contract_pricing_code] [varchar](50) NULL,
	[type_of_contract_pricing] [varchar](50) NULL,
	[award_description] [varchar](50) NULL,
	[action_type_code] [varchar](50) NULL,
	[action_type] [varchar](50) NULL,
	[solicitation_identifier] [varchar](50) NULL,
	[number_of_actions] [varchar](50) NULL,
	[product_or_service_code] [varchar](50) NULL,
	[product_or_service_code_description] [varchar](50) NULL,
	[contract_bundling_code] [varchar](50) NULL,
	[contract_bundling] [varchar](50) NULL,
	[dod_claimant_program_code] [varchar](50) NULL,
	[dod_claimant_program_description] [varchar](50) NULL,
	[naics_code] [varchar](50) NULL,
	[naics_description] [varchar](50) NULL,
	[recovered_materials_sustainability_code] [varchar](50) NULL,
	[recovered_materials_sustainability] [varchar](50) NULL,
	[domestic_or_foreign_entity_code] [varchar](50) NULL,
	[domestic_or_foreign_entity] [varchar](50) NULL,
	[dod_acquisition_program_code] [varchar](50) NULL,
	[dod_acquisition_program_description] [varchar](50) NULL,
	[information_technology_commercial_item_category_code] [varchar](50) NULL,
	[information_technology_commercial_item_category] [varchar](50) NULL,
	[epa_designated_product_code] [varchar](50) NULL,
	[epa_designated_product] [varchar](50) NULL,
	[country_of_product_or_service_origin_code] [varchar](50) NULL,
	[country_of_product_or_service_origin] [varchar](50) NULL,
	[place_of_manufacture_code] [varchar](50) NULL,
	[place_of_manufacture] [varchar](50) NULL,
	[subcontracting_plan_code] [varchar](50) NULL,
	[subcontracting_plan] [varchar](50) NULL,
	[extent_competed_code] [varchar](50) NULL,
	[extent_competed] [varchar](50) NULL,
	[solicitation_procedures_code] [varchar](50) NULL,
	[solicitation_procedures] [varchar](50) NULL,
	[type_of_set_aside_code] [varchar](50) NULL,
	[type_of_set_aside] [varchar](50) NULL,
	[evaluated_preference_code] [varchar](50) NULL,
	[evaluated_preference] [varchar](50) NULL,
	[research_code] [varchar](50) NULL,
	[research] [varchar](50) NULL,
	[fair_opportunity_limited_sources_code] [varchar](50) NULL,
	[fair_opportunity_limited_sources] [varchar](50) NULL,
	[other_than_full_and_open_competition_code] [varchar](50) NULL,
	[other_than_full_and_open_competition] [varchar](50) NULL,
	[number_of_offers_received] [varchar](50) NULL,
	[commercial_item_acquisition_procedures_code] [varchar](50) NULL,
	[commercial_item_acquisition_procedures] [varchar](50) NULL,
	[small_business_competitiveness_demonstration _program] [varchar](50) NULL,
	[commercial_item_test_program_code] [varchar](50) NULL,
	[commercial_item_test_program] [varchar](50) NULL,
	[a76_fair_act_action_code] [varchar](50) NULL,
	[a76_fair_act_action] [varchar](50) NULL,
	[fed_biz_opps_code] [varchar](50) NULL,
	[fed_biz_opps] [varchar](50) NULL,
	[local_area_set_aside_code] [varchar](50) NULL,
	[local_area_set_aside] [varchar](50) NULL,
	[price_evaluation_adjustment_preference_percent_difference] [varchar](50) NULL,
	[clinger_cohen_act_planning_code] [varchar](50) NULL,
	[clinger_cohen_act_planning] [varchar](50) NULL,
	[walsh_healey_act_code] [varchar](50) NULL,
	[walsh_healey_act] [varchar](50) NULL,
	[service_contract_act_code] [varchar](50) NULL,
	[service_contract_act] [varchar](50) NULL,
	[davis_bacon_act_code] [varchar](50) NULL,
	[davis_bacon_act] [varchar](50) NULL,
	[interagency_contracting_authority_code] [varchar](50) NULL,
	[interagency_contracting_authority] [varchar](50) NULL,
	[other_statutory_authority] [varchar](50) NULL,
	[program_acronym] [varchar](50) NULL,
	[parent_award_type_code] [varchar](50) NULL,
	[parent_award_type] [varchar](50) NULL,
	[parent_award_single_or_multiple_code] [varchar](50) NULL,
	[parent_award_single_or_multiple] [varchar](50) NULL,
	[major_program] [varchar](50) NULL,
	[national_interest_action_code] [varchar](50) NULL,
	[national_interest_action] [varchar](50) NULL,
	[cost_or_pricing_data_code] [varchar](50) NULL,
	[cost_or_pricing_data] [varchar](50) NULL,
	[cost_accounting_standards_clause_code] [varchar](50) NULL,
	[cost_accounting_standards_clause] [varchar](50) NULL,
	[gfe_gfp_code] [varchar](50) NULL,
	[gfe_gfp] [varchar](50) NULL,
	[sea_transportation_code] [varchar](50) NULL,
	[sea_transportation] [varchar](50) NULL,
	[undefinitized_action_code] [varchar](50) NULL,
	[undefinitized_action] [varchar](50) NULL,
	[consolidated_contract_code] [varchar](50) NULL,
	[consolidated_contract] [varchar](50) NULL,
	[performance_based_service_acquisition_code] [varchar](50) NULL,
	[performance_based_service_acquisition] [varchar](50) NULL,
	[multi_year_contract_code] [varchar](50) NULL,
	[multi_year_contract] [varchar](50) NULL,
	[contract_financing_code] [varchar](50) NULL,
	[contract_financing] [varchar](50) NULL,
	[purchase_card_as_payment_method_code] [varchar](50) NULL,
	[purchase_card_as_payment_method] [varchar](50) NULL,
	[contingency_humanitarian_or_peacekeeping_operation_code] [varchar](50) NULL,
	[contingency_humanitarian_or_peacekeeping_operation] [varchar](50) NULL,
	[alaskan_native_owned_corporation_or_firm] [varchar](50) NULL,
	[american_indian_owned_business] [varchar](50) NULL,
	[indian_tribe_federally_recognized] [varchar](50) NULL,
	[native_hawaiian_owned_business] [varchar](50) NULL,
	[tribally_owned_business] [varchar](50) NULL,
	[veteran_owned_business] [varchar](50) NULL,
	[service_disabled_veteran_owned_business] [varchar](50) NULL,
	[woman_owned_business] [varchar](50) NULL,
	[women_owned_small_business] [varchar](50) NULL,
	[economically_disadvantaged_women_owned_small_business] [varchar](50) NULL,
	[joint_venture_women_owned_small_business] [varchar](50) NULL,
	[joint_venture_economic_disadvantaged_women_owned_small_bus] [varchar](50) NULL,
	[minority_owned_business] [varchar](50) NULL,
	[subcontinent_asian_asian_indian_american_owned_business] [varchar](50) NULL,
	[asian_pacific_american_owned_business] [varchar](50) NULL,
	[black_american_owned_business] [varchar](50) NULL,
	[hispanic_american_owned_business] [varchar](50) NULL,
	[native_american_owned_business] [varchar](50) NULL,
	[other_minority_owned_business] [varchar](50) NULL,
	[contracting_officers_determination_of_business_size] [varchar](50) NULL,
	[contracting_officers_determination_of_business_size_code] [varchar](50) NULL,
	[emerging_small_business] [varchar](50) NULL,
	[community_developed_corporation_owned_firm] [varchar](50) NULL,
	[labor_surplus_area_firm] [varchar](50) NULL,
	[us_federal_government] [varchar](50) NULL,
	[federally_funded_research_and_development_corp] [varchar](50) NULL,
	[federal_agency] [varchar](50) NULL,
	[us_state_government] [varchar](50) NULL,
	[us_local_government] [varchar](50) NULL,
	[city_local_government] [varchar](50) NULL,
	[county_local_government] [varchar](50) NULL,
	[inter_municipal_local_government] [varchar](50) NULL,
	[local_government_owned] [varchar](50) NULL,
	[municipality_local_government] [varchar](50) NULL,
	[school_district_local_government] [varchar](50) NULL,
	[township_local_government] [varchar](50) NULL,
	[us_tribal_government] [varchar](50) NULL,
	[foreign_government] [varchar](50) NULL,
	[corporate_entity_not_tax_exempt] [varchar](50) NULL,
	[corporate_entity_tax_exempt] [varchar](50) NULL,
	[partnership_or_limited_liability_partnership] [varchar](50) NULL,
	[sole_proprietorship] [varchar](50) NULL,
	[small_agricultural_cooperative] [varchar](50) NULL,
	[international_organization] [varchar](50) NULL,
	[us_government_entity] [varchar](50) NULL,
	[community_development_corporation] [varchar](50) NULL,
	[domestic_shelter] [varchar](50) NULL,
	[educational_institution] [varchar](50) NULL,
	[foundation] [varchar](50) NULL,
	[hospital_flag] [varchar](50) NULL,
	[manufacturer_of_goods] [varchar](50) NULL,
	[veterinary_hospital] [varchar](50) NULL,
	[hispanic_servicing_institution] [varchar](50) NULL,
	[receives_contracts] [varchar](50) NULL,
	[receives_grants] [varchar](50) NULL,
	[receives_contracts_and_grants] [varchar](50) NULL,
	[airport_authority] [varchar](50) NULL,
	[council_of_governments] [varchar](50) NULL,
	[housing_authorities_public_tribal] [varchar](50) NULL,
	[interstate_entity] [varchar](50) NULL,
	[planning_commission] [varchar](50) NULL,
	[port_authority] [varchar](50) NULL,
	[transit_authority] [varchar](50) NULL,
	[subchapter_scorporation] [varchar](50) NULL,
	[limited_liability_corporation] [varchar](50) NULL,
	[foreign_owned_and_located] [varchar](50) NULL,
	[for_profit_organization] [varchar](50) NULL,
	[nonprofit_organization] [varchar](50) NULL,
	[other_not_for_profit_organization] [varchar](50) NULL,
	[the_ability_one_program] [varchar](50) NULL,
	[private_university_or_college] [varchar](50) NULL,
	[state_controlled_institution_of_higher_learning] [varchar](50) NULL,
	[1862_land_grant_college] [varchar](50) NULL,
	[1890_land_grant_college] [varchar](50) NULL,
	[1994_land_grant_college] [varchar](50) NULL,
	[minority_institution] [varchar](50) NULL,
	[historically_black_college] [varchar](50) NULL,
	[tribal_college] [varchar](50) NULL,
	[alaskan_native_servicing_institution] [varchar](50) NULL,
	[native_hawaiian_servicing_institution] [varchar](50) NULL,
	[school_of_forestry] [varchar](50) NULL,
	[veterinary_college] [varchar](50) NULL,
	[dot_certified_disadvantage] [varchar](50) NULL,
	[self_certified_small_disadvantaged_business] [varchar](50) NULL,
	[small_disadvantaged_business] [varchar](50) NULL,
	[c8a_program_participant] [varchar](50) NULL,
	[historically_underutilized_business_zone _hubzone_firm] [varchar](50) NULL,
	[sba_certified_8a_joint_venture] [varchar](50) NULL,
	[last_modified_date] [varchar](50) NULL
) ON [PRIMARY]
GO