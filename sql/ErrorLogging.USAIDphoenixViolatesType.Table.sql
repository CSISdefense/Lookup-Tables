USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[USAIDphoenixViolatesType](
	[ErrorDescription] [varchar](255) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL,
	[AWARD_NUMBER] [varchar](255) NULL,
	[AWARD_DESCRIPTION] [varchar](255) NULL,
	[POP_START_DATE] [varchar](255) NULL,
	[POP_END_DATE] [varchar](255) NULL,
	[DATE_END_QTR] [varchar](255) NULL,
	[FY] [varchar](255) NULL,
	[FISCAL_QTR] [varchar](255) NULL,
	[CALENDAR_YR] [varchar](255) NULL,
	[CALENDAR_QTR] [varchar](255) NULL,
	[IMPLEMENTING_MECHANISM] [varchar](255) NULL,
	[INTERAGENCY_TRANSFER_STATUS] [varchar](255) NULL,
	[SOURCE_OF_APPN_AGENCY] [varchar](255) NULL,
	[SOURCE_OF_APPN_SYMBOL] [varchar](255) NULL,
	[AGENCY] [varchar](255) NULL,
	[BUREAU_DIVISION_OFFICE_SERVICE] [varchar](255) NULL,
	[ORGANIZATIONAL_UNIT] [varchar](255) NULL,
	[ACTIVITY_CODE] [varchar](255) NULL,
	[ACTIVITY_NAME_OR_TITLE] [varchar](255) NULL,
	[ACTIVITY_DESCRIPTION] [varchar](255) NULL,
	[BENEFITTING_COUNTRY_REGION] [varchar](255) NULL,
	[DAC_CLASSIFICATION] [varchar](255) NULL,
	[TYING_STATUS_OF_AWARD] [varchar](255) NULL,
	[PROG_OE_FLAG] [varchar](255) NULL,
	[OBL_TYPE] [varchar](255) NULL,
	[APPN_ACCOUNT] [varchar](255) NULL,
	[FUND_CD] [varchar](255) NULL,
	[BBFY] [varchar](255) NULL,
	[EBFY] [varchar](255) NULL,
	[VENDOR_NAME] [varchar](255) NULL,
	[VENDOR_LOCATION] [varchar](255) NULL,
	[VENDOR_CATEGORY] [varchar](255) NULL,
	[DUNS_NUM] [varchar](255) NULL,
	[REPORTING_DATE] [varchar](255) NULL,
	[OBLIGATED] [varchar](255) NULL,
	[DISBURSED] [varchar](255) NULL,
	[CSISCreatedDate] [datetime2](7) NULL,
	[CSISModifiedDate] [datetime2](7) NULL
) ON [PRIMARY]
GO