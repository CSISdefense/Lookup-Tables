USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Assistance].[USAIDphoenix](
	[AWARD_NUMBER] [varchar](30) NULL,
	[AWARD_DESCRIPTION] [varchar](255) NULL,
	[POP_START_DATE] [datetime2](7) NULL,
	[POP_END_DATE] [datetime2](7) NULL,
	[DATE_END_QTR] [datetime2](7) NULL,
	[FY] [int] NULL,
	[FISCAL_QTR] [decimal](19, 4) NULL,
	[CALENDAR_YR] [decimal](19, 4) NULL,
	[CALENDAR_QTR] [decimal](19, 4) NULL,
	[IMPLEMENTING_MECHANISM] [varchar](27) NULL,
	[INTERAGENCY_TRANSFER_STATUS] [varchar](255) NULL,
	[SOURCE_OF_APPN_AGENCY] [varchar](28) NULL,
	[SOURCE_OF_APPN_SYMBOL] [varchar](6) NULL,
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
	[BBFY] [decimal](19, 4) NULL,
	[EBFY] [decimal](19, 4) NULL,
	[VENDOR_NAME] [nvarchar](150) NULL,
	[VENDOR_LOCATION] [varchar](17) NULL,
	[VENDOR_CATEGORY] [varchar](10) NULL,
	[DUNS_NUM] [varchar](13) NULL,
	[REPORTING_DATE] [datetime2](7) NULL,
	[OBLIGATED] [decimal](19, 4) NULL,
	[DISBURSED] [decimal](19, 4) NULL,
	[CSISCreatedDate] [datetime2](7) NULL,
	[CSISModifiedDate] [datetime2](7) NULL,
	[CSISawardID] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Assistance].[USAIDphoenix]  WITH NOCHECK ADD  CONSTRAINT [FK_Contractor_DUNS_NUM] FOREIGN KEY([DUNS_NUM])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Assistance].[USAIDphoenix] CHECK CONSTRAINT [FK_Contractor_DUNS_NUM]
GO
ALTER TABLE [Assistance].[USAIDphoenix]  WITH NOCHECK ADD  CONSTRAINT [fk_USAIDphoenix_VENDOR_NAME] FOREIGN KEY([VENDOR_NAME])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Assistance].[USAIDphoenix] CHECK CONSTRAINT [fk_USAIDphoenix_VENDOR_NAME]
GO
