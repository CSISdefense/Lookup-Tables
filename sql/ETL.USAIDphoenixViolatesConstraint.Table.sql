SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[USAIDphoenixViolatesConstraint](
	[AWARD_NUMBER] [nvarchar](255) NULL,
	[AWARD_DESCRIPTION] [varchar](4000) NULL,
	[POP_START_DATE] [float] NULL,
	[POP_END_DATE] [float] NULL,
	[DATE_END_QTR] [float] NULL,
	[FY] [float] NULL,
	[FISCAL_QTR] [float] NULL,
	[CALENDAR_YR] [float] NULL,
	[CALENDAR_QTR] [float] NULL,
	[IMPLEMENTING_MECHANISM] [nvarchar](255) NULL,
	[INTERAGENCY_TRANSFER_STATUS] [nvarchar](255) NULL,
	[SOURCE_OF_APPN_AGENCY] [nvarchar](255) NULL,
	[SOURCE_OF_APPN_SYMBOL] [varchar](6) NULL,
	[AGENCY] [nvarchar](255) NULL,
	[BUREAU_DIVISION_OFFICE_SERVICE] [nvarchar](255) NULL,
	[ORGANIZATIONAL_UNIT] [nvarchar](255) NULL,
	[OBLIGATION_AMT] [float] NULL,
	[DISBURSED_AMT] [float] NULL,
	[CATEGORY] [nvarchar](255) NULL,
	[SECTOR] [nvarchar](255) NULL,
	[ACTIVITY_CODE] [nvarchar](255) NULL,
	[ACTIVITY_NAME_OR_TITLE] [nvarchar](255) NULL,
	[ACTIVITY_DESCRIPTION] [nvarchar](255) NULL,
	[BENEFITTING_COUNTRY_REGION] [nvarchar](255) NULL,
	[DAC_CLASSIFICATION] [nvarchar](255) NULL,
	[TYING_STATUS_OF_AWARD] [nvarchar](255) NULL,
	[PROG_OE_FLAG] [nvarchar](255) NULL,
	[OBL_TYPE] [nvarchar](255) NULL,
	[APPN_ACCOUNT] [nvarchar](255) NULL,
	[FUND_CD] [nvarchar](255) NULL,
	[BBFY] [float] NULL,
	[EBFY] [float] NULL,
	[VENDOR_NAME] [nvarchar](255) NULL,
	[VENDOR_LOCATION] [nvarchar](255) NULL,
	[VENDOR_CATEGORY] [nvarchar](255) NULL,
	[DUNS_NUM] [varchar](13) NULL,
	[REPORTING_DATE] [nvarchar](255) NULL,
	[csiscontractid] [int] NULL,
	[dunsnumber] [varchar](13) NULL,
	[CSISawardIDmod] [bigint] NULL,
	[CSISawardID] [bigint] NULL,
	[CSIScreatedDate] [datetime2](7) NULL,
	[CSISmodifiedDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [ETL].[USAIDphoenixViolatesConstraint] ADD  CONSTRAINT [DF_Errorlogging__USAIDPhoenix_CSIScreatedDate]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [ETL].[USAIDphoenixViolatesConstraint] ADD  CONSTRAINT [DF_Errorlogging__USAIDPhoenix_CSISmodifieddate]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
