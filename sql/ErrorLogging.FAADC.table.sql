DROP TABLE [ErrorLogging].[FAADC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ErrorLogging].[FAADC](
	[assistance_transaction_unique_key] [varchar](255) NULL,
	[assistance_award_unique_key] [varchar](255) NULL,
	[award_id_fain] [varchar](255) NULL,
	[modification_number] [varchar](255) NULL,
	[award_id_uri] [varchar](255) NULL,
	[sai_number] [varchar](255) NULL,
	[federal_action_obligation] decimal(19,4) NULL,
	[total_obligated_amount] decimal(19,4) NULL,
	[total_outlayed_amount_for_overall_award] decimal(19,4) NULL,
	[indirect_cost_federal_share_amount] decimal(19,4) NULL,
	[non_federal_funding_amount] decimal(19,4) NULL,
	[total_non_federal_funding_amount] decimal(19,4) NULL,
	[face_value_of_loan] decimal(19,4) NULL,
	[original_loan_subsidy_cost] decimal(19,4) NULL,
	[total_face_value_of_loan] decimal(19,4) NULL,
	[total_loan_subsidy_cost] decimal(19,4) NULL,
	[disaster_emergency_fund_codes_for_overall_award] [varchar](255) NULL,
	[outlayed_amount_from_COVID-19_supplementals_for_overall_award] decimal(19,4) NULL,
	[obligated_amount_from_COVID-19_supplementals_for_overall_award] decimal(19,4) NULL,
	[outlayed_amount_from_IIJA_supplemental_for_overall_award] decimal(19,4) NULL,
	[obligated_amount_from_IIJA_supplemental_for_overall_award] decimal(19,4) NULL,
	[action_date] [date] NULL,
	[action_date_fiscal_year] integer NULL,
	[period_of_performance_start_date] [date] NULL,
	[period_of_performance_current_end_date] [date] NULL,
	[awarding_agency_code] [varchar](255) NULL,
	[awarding_agency_name] [varchar](255) NULL,
	[awarding_sub_agency_code] [varchar](255) NULL,
	[awarding_sub_agency_name] [varchar](255) NULL,
	[awarding_office_code] [varchar](255) NULL,
	[awarding_office_name] [varchar](255) NULL,
	[funding_agency_code] [varchar](255) NULL,
	[funding_agency_name] [varchar](255) NULL,
	[funding_sub_agency_code] [varchar](255) NULL,
	[funding_sub_agency_name] [varchar](255) NULL,
	[funding_office_code] [varchar](255) NULL,
	[funding_office_name] [varchar](255) NULL,
	[treasury_accounts_funding_this_award] [varchar](4000) NULL,
	[federal_accounts_funding_this_award] [varchar](4000) NULL,
	[object_classes_funding_this_award] [varchar](4000) NULL,
	[program_activities_funding_this_award] [varchar](5000) NULL,
	[recipient_uei] [varchar](255) NULL,
	[recipient_duns] [varchar](255) NULL,
	[recipient_name] [varchar](255) NULL,
	[recipient_name_raw] [varchar](255) NULL,
	[recipient_parent_uei] [varchar](255) NULL,
	[recipient_parent_duns] [varchar](255) NULL,
	[recipient_parent_name] [varchar](255) NULL,
	[recipient_parent_name_raw] [varchar](255) NULL,
	[recipient_country_code] [varchar](255) NULL,
	[recipient_country_name] [varchar](255) NULL,
	[recipient_address_line_1] [varchar](255) NULL,
	[recipient_address_line_2] [varchar](255) NULL,
	[recipient_city_code] [varchar](255) NULL,
	[recipient_city_name] [varchar](255) NULL,
	[prime_award_transaction_recipient_county_fips_code] [varchar](255) NULL,
	[recipient_county_name] [varchar](255) NULL,
	[prime_award_transaction_recipient_state_fips_code] [varchar](255) NULL,
	[recipient_state_code] [varchar](255) NULL,
	[recipient_state_name] [varchar](255) NULL,
	[recipient_zip_code] [varchar](255) NULL,
	[recipient_zip_last_4_code] [varchar](255) NULL,
	[prime_award_transaction_recipient_cd_original] [varchar](255) NULL,
	[prime_award_transaction_recipient_cd_current] [varchar](255) NULL,
	[recipient_foreign_city_name] [varchar](255) NULL,
	[recipient_foreign_province_name] [varchar](255) NULL,
	[recipient_foreign_postal_code] [varchar](255) NULL,
	[primary_place_of_performance_scope] [varchar](255) NULL,
	[primary_place_of_performance_country_code] [varchar](255) NULL,
	[primary_place_of_performance_country_name] [varchar](255) NULL,
	[primary_place_of_performance_code] [varchar](255) NULL,
	[primary_place_of_performance_city_name] [varchar](255) NULL,
	[prime_award_transaction_place_of_performance_county_fips_code] [varchar](255) NULL,
	[primary_place_of_performance_county_name] [varchar](255) NULL,
	[prime_award_transaction_place_of_performance_state_fips_code] [varchar](255) NULL,
	[primary_place_of_performance_state_name] [varchar](255) NULL,
	[primary_place_of_performance_zip_4] [varchar](255) NULL,
	[prime_award_transaction_place_of_performance_cd_original] [varchar](255) NULL,
	[prime_award_transaction_place_of_performance_cd_current] [varchar](255) NULL,
	[primary_place_of_performance_foreign_location] [varchar](255) NULL,
	[cfda_number] decimal(19,4) NULL,
	[cfda_title] [varchar](255) NULL,
	[funding_opportunity_number] [varchar](255) NULL,
	[funding_opportunity_goals_text] [varchar](255) NULL,
	[assistance_type_code] [varchar](255) NULL,
	[assistance_type_description] [varchar](255) NULL,
	[transaction_description] [varchar](4008) NULL,
	[prime_award_base_transaction_description] [varchar](4008) NULL,
	[business_funds_indicator_code] [varchar](255) NULL,
	[business_funds_indicator_description] [varchar](255) NULL,
	[business_types_code] [varchar](255) NULL,
	[business_types_description] [varchar](255) NULL,
	[correction_delete_indicator_code] [varchar](255) NULL,
	[correction_delete_indicator_description] [varchar](255) NULL,
	[action_type_code] [varchar](255) NULL,
	[action_type_description] [varchar](255) NULL,
	[record_type_code] [varchar](255) NULL,
	[record_type_description] [varchar](255) NULL,
	[highly_compensated_officer_1_name] [varchar](255) NULL,
	[highly_compensated_officer_1_amount] decimal(19,4) NULL,
	[highly_compensated_officer_2_name] [varchar](255) NULL,
	[highly_compensated_officer_2_amount] decimal(19,4) NULL,
	[highly_compensated_officer_3_name] [varchar](255) NULL,
	[highly_compensated_officer_3_amount] decimal(19,4) NULL,
	[highly_compensated_officer_4_name] [varchar](255) NULL,
	[highly_compensated_officer_4_amount] decimal(19,4) NULL,
	[highly_compensated_officer_5_name] [varchar](255) NULL,
	[highly_compensated_officer_5_amount] decimal(19,4) NULL,
	[usaspending_permalink] [varchar](255) NULL,
	[last_modified_date] [date] NULL,
	[USAspending_file_name] [varchar](255) NULL
) ON [PRIMARY]
GO

