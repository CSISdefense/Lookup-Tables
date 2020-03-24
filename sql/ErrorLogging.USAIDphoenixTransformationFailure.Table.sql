USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[USAIDphoenixTransformationFailure](
	[AWARD_NUMBER] [varchar](30) NULL,
	[AWARD_DESCRIPTION] [varchar](255) NULL,
	[POP_START_DATE] [varchar](50) NULL,
	[POP_END_DATE] [varchar](50) NULL,
	[DATE_END_QTR] [varchar](50) NULL,
	[FY] [smallint] NULL,
	[FISCAL_QTR] [smallint] NULL,
	[CALENDAR_YR] [smallint] NULL,
	[CALENDAR_QTR] [smallint] NULL,
	[IMPLEMENTING_MECHANISM] [varchar](27) NULL,
	[INTERAGENCY_TRANSFER_STATUS] [varchar](255) NULL,
	[SOURCE_OF_APPN_AGENCY] [varchar](28) NULL,
	[SOURCE_OF_APPN_SYMBOL] [smallint] NULL,
	[AGENCY] [varchar](5) NULL,
	[BUREAU_DIVISION_OFFICE_SERVICE] [varchar](10) NULL,
	[ORGANIZATIONAL_UNIT] [varchar](20) NULL,
	[ACTIVITY_CODE] [varchar](25) NULL,
	[ACTIVITY_NAME_OR_TITLE] [varchar](82) NULL,
	[ACTIVITY_DESCRIPTION] [varchar](111) NULL,
	[BENEFITTING_COUNTRY_REGION] [varchar](47) NULL,
	[DAC_CLASSIFICATION] [varchar](15) NULL,
	[TYING_STATUS_OF_AWARD] [varchar](255) NULL,
	[PROG_OE_FLAG] [varchar](1) NULL,
	[OBL_TYPE] [varchar](10) NULL,
	[APPN_ACCOUNT] [varchar](40) NULL,
	[FUND_CD] [varchar](10) NULL,
	[BBFY] [smallint] NULL,
	[EBFY] [smallint] NULL,
	[VENDOR_NAME] [varchar](75) NULL,
	[VENDOR_LOCATION] [varchar](17) NULL,
	[VENDOR_CATEGORY] [varchar](10) NULL,
	[DUNS_NUM] [varchar](13) NULL,
	[REPORTING_DATE] [varchar](50) NULL,
	[OBLIGATED] [real] NULL,
	[DISBURSED] [real] NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]
GO
