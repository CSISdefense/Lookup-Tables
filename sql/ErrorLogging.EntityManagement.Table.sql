USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[EntityManagement](
	[DUNS] [nvarchar](255) NULL,
	[DUNS+4] [nvarchar](255) NULL,
	[CAGE_CODE] [nvarchar](255) NULL,
	[DODAAC] [nvarchar](255) NULL,
	[SAM_EXTRACT_CODE] [nvarchar](255) NULL,
	[PURPOSE_OF_REGISTRATION] [nvarchar](255) NULL,
	[INITIAL_REGISTRATION_DATE] [nvarchar](255) NULL,
	[EXPIRATION_DATE] [nvarchar](255) NULL,
	[LAST_UPDATE_DATE] [nvarchar](255) NULL,
	[ACTIVATION_DATE] [nvarchar](255) NULL,
	[LEGAL_BUSINESS_NAME] [nvarchar](255) NULL,
	[DBA_NAME] [nvarchar](255) NULL,
	[COMPANY_DIVISION] [nvarchar](255) NULL,
	[DIVISION_NUMBER] [nvarchar](255) NULL,
	[PHYSICAL_ADDRESS_LINE_1] [nvarchar](255) NULL,
	[PHYSICAL_ADDRESS_LINE_2] [nvarchar](255) NULL,
	[PHYSICAL_ADDRESS_CITY] [nvarchar](255) NULL,
	[PHYSICAL_ADDRESS_PROVINCE_OR_STATE] [nvarchar](255) NULL,
	[PHYSICAL_ADDRESS_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[PHYSICAL_ADDRESS_ZIP_CODE_+4] [nvarchar](255) NULL,
	[PHYSICAL_ADDRESS_COUNTRY_CODE] [nvarchar](255) NULL,
	[ENTITY_CONGRESSIONAL_DISTRICT] [nvarchar](255) NULL,
	[BUSINESS_START_DATE] [nvarchar](255) NULL,
	[FISCAL_YEAR_END_CLOSE_DATE] [nvarchar](255) NULL,
	[CORPORATE_URL] [nvarchar](255) NULL,
	[ENTITY_STRUCTURE] [nvarchar](255) NULL,
	[STATE_OF_INCORPORATION] [nvarchar](255) NULL,
	[COUNTRY_OF_INCORPORATION] [nvarchar](255) NULL,
	[BUSINESS_TYPE_COUNTER] [nvarchar](255) NULL,
	[BUSINESS_TYPE_STRING] [nvarchar](255) NULL,
	[PRIMARY_NAICS] [nvarchar](255) NULL,
	[NAICS_CODE_COUNTER] [nvarchar](255) NULL,
	[NAICS_CODE_STRING] [nvarchar](max) NULL,
	[PSC_CODE_COUNTER] [nvarchar](255) NULL,
	[PSC_CODE_STRING] [nvarchar](2500) NULL,
	[CREDIT_CARD_USAGE] [nvarchar](255) NULL,
	[CORRESPONDENCE_FLAG] [nvarchar](255) NULL,
	[MAILING_ADDRESS_LINE_1] [nvarchar](255) NULL,
	[MAILING_ADDRESS_LINE_2] [nvarchar](255) NULL,
	[MAILING_ADDRESS_CITY] [nvarchar](255) NULL,
	[MAILING_ADDRESS_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[MAILING_ADDRESS_ZIP_CODE_+4] [nvarchar](255) NULL,
	[MAILING_ADDRESS_COUNTRY] [nvarchar](255) NULL,
	[MAILING_ADDRESS_STATE_OR_PROVINCE] [nvarchar](255) NULL,
	[GOVT_BUS_POC_FIRST_NAME] [nvarchar](255) NULL,
	[GOVT_BUS_POC_MIDDLE_INITIAL] [nvarchar](255) NULL,
	[GOVT_BUS_POC_LAST_NAME] [nvarchar](255) NULL,
	[GOVT_BUS_POC_TITLE] [nvarchar](255) NULL,
	[GOVT_BUS_POC_ST_ADD_1] [nvarchar](255) NULL,
	[GOVT_BUS_POC_ST_ADD_2] [nvarchar](255) NULL,
	[GOVT_BUS_POC_CITY] [nvarchar](255) NULL,
	[GOVT_BUS_POC_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[GOVT_BUS_POC_ZIP_CODE_+4] [nvarchar](255) NULL,
	[GOVT_BUS_POC_COUNTRY_CODE] [nvarchar](255) NULL,
	[GOVT_BUS_POC_STATE_OR_PROVINCE] [nvarchar](255) NULL,
	[GOVT_BUS_POC_U.S._PHONE] [nvarchar](255) NULL,
	[GOVT_BUS_POC_U.S._PHONE_EXT] [nvarchar](255) NULL,
	[GOVT_BUS_POC_NON-U.S._PHONE] [nvarchar](255) NULL,
	[GOVT_BUS_POC_FAX_U.S._ONLY] [nvarchar](255) NULL,
	[GOVT_BUS_POC_EMAIL] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_FIRST_NAME] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_MIDDLE_INITIAL] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_LAST_NAME] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_TITLE] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_ST_ADD_1] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_ST_ADD_2] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_CITY] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_ZIP_CODE_+4] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_COUNTRY_CODE] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_STATE_OR_PROVINCE] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_U.S._PHONE] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_U.S._PHONE_EXT] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_NON-U.S._PHONE] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_FAX_U.S._ONLY] [nvarchar](255) NULL,
	[ALT_GOVT_BUS_POC_EMAIL] [nvarchar](255) NULL,
	[PAST_PERF_POC_POC_FIRST_NAME] [nvarchar](255) NULL,
	[PAST_PERF_POC_POC_MIDDLE_INITIAL] [nvarchar](255) NULL,
	[PAST_PERF_POC_POC_LAST_NAME] [nvarchar](255) NULL,
	[PAST_PERF_POC_POC_TITLE] [nvarchar](255) NULL,
	[PAST_PERF_POC_ST_ADD_1] [nvarchar](255) NULL,
	[PAST_PERF_POC_ST_ADD_2] [nvarchar](255) NULL,
	[PAST_PERF_POC_CITY] [nvarchar](255) NULL,
	[PAST_PERF_POC_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[PAST_PERF_POC_ZIP_CODE_+4] [nvarchar](255) NULL,
	[PAST_PERF_POC_COUNTRY_CODE] [nvarchar](255) NULL,
	[PAST_PERF_POC_STATE_OR_PROVINCE] [nvarchar](255) NULL,
	[PAST_PERF_POC_U.S._PHONE] [nvarchar](255) NULL,
	[PAST_PERF_POC_U.S._PHONE_EXT] [nvarchar](255) NULL,
	[PAST_PERF_POC_NON-U.S._PHONE] [nvarchar](255) NULL,
	[PAST_PERF_POC_FAX_U.S._ONLY] [nvarchar](255) NULL,
	[PAST_PERF_POC_EMAIL] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_FIRST_NAME] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_MIDDLE_INITIAL] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_LAST_NAME] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_TITLE] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_ST_ADD_1] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_ST_ADD_2] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_CITY] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_ZIP_CODE_+4] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_COUNTRY_CODE] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_STATE_OR_PROVINCE] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_U.S._PHONE] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_U.S._PHONE_EXT] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_NON-U.S._PHONE] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_FAX_U.S._ONLY] [nvarchar](255) NULL,
	[ALT_PAST_PERF_POC_EMAIL] [nvarchar](255) NULL,
	[ELEC_BUS_POC_FIRST_NAME] [nvarchar](255) NULL,
	[ELEC_BUS_POC_MIDDLE_INITIAL] [nvarchar](255) NULL,
	[ELEC_BUS_POC_LAST_NAME] [nvarchar](255) NULL,
	[ELEC_BUS_POC_TITLE] [nvarchar](255) NULL,
	[ELEC_BUS_POC_ST_ADD_1] [nvarchar](255) NULL,
	[ELEC_BUS_POC_ST_ADD_2] [nvarchar](255) NULL,
	[ELEC_BUS_POC_CITY] [nvarchar](255) NULL,
	[ELEC_BUS_POC_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[ELEC_BUS_POC_ZIP_CODE_+4] [nvarchar](255) NULL,
	[ELEC_BUS_POC_COUNTRY_CODE] [nvarchar](255) NULL,
	[ELEC_BUS_POC_STATE_OR_PROVINCE] [nvarchar](255) NULL,
	[ELEC_BUS_POC_U.S._PHONE] [nvarchar](255) NULL,
	[ELEC_BUS_POC_U.S._PHONE_EXT] [nvarchar](255) NULL,
	[ELEC_BUS_POC_NON-U.S._PHONE] [nvarchar](255) NULL,
	[ELEC_BUS_POC_FAX_U.S._ONLY] [nvarchar](255) NULL,
	[ELEC_BUS_POC_EMAIL] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_POC_FIRST_NAME] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_POC_MIDDLE_INITIAL] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_POC_LAST_NAME] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_POC_TITLE] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_ST_ADD_1] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_ST_ADD_2] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_CITY] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_ZIP/POSTAL_CODE] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_ZIP_CODE_+4] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_COUNTRY_CODE] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_STATE_OR_PROVINCE] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_U.S._PHONE] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_U.S._PHONE_EXT] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_NON-U.S._PHONE] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_FAX_U.S._ONLY] [nvarchar](255) NULL,
	[ALT_ELEC_POC_BUS_EMAIL] [nvarchar](255) NULL,
	[NAICS_EXCEPTION_COUNTER] [nvarchar](255) NULL,
	[NAICS_EXCEPTION_STRING] [nvarchar](1100) NULL,
	[DEBT_SUBJECT_TO_OFFSET_FLAG] [nvarchar](255) NULL,
	[EXCLUSION_STATUS_FLAG] [nvarchar](255) NULL,
	[SBA_BUSINESS_TYPES_COUNTER] [nvarchar](255) NULL,
	[SBA_BUSINESS_TYPES_STRING] [nvarchar](255) NULL,
	[NO_PUBLIC_DISPLAY_FLAG] [nvarchar](255) NULL,
	[DISASTER_RESPONSE_COUNTER] [nvarchar](255) NULL,
	[DISASTER_RESPONSE_STRING] [nvarchar](255) NULL,
	[END_OF_RECORD_INDICATOR] [nvarchar](255) NULL,
	[CSISCreatedDate] [datetime] NOT NULL,
	[CSISModifiedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[EntityManagement] ADD  CONSTRAINT [DF_SAM_CSISCreatedDate]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [ErrorLogging].[EntityManagement] ADD  CONSTRAINT [DF_SAM_CSISModifiedDate]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO