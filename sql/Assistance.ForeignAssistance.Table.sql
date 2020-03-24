USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Assistance].[ForeignAssistance](
	[AwardIdentifier] [varchar](62) NULL,
	[AwardAccountableOrganizationName] [varchar](41) NULL,
	[AwardAccountableOrganizationOffice] [varchar](123) NULL,
	[AwardAccountableOrganizationOrgRefCode] [varchar](5) NULL,
	[AwareExtendingOrganizationName] [varchar](42) NULL,
	[AwardExtendingOrganizationOffice] [varchar](255) NULL,
	[AwardExtendingOrganizationOrgRefCode] [varchar](5) NULL,
	[AwardImplementingOrganizationName] [varchar](213) NULL,
	[AwardImplementingOrganizationAddressStreet Address] [varchar](120) NULL,
	[AwardImplementingOrganizationAddressCity] [varchar](33) NULL,
	[AwardImplementingOrganizationAddressStateProvince] [varchar](20) NULL,
	[AwardImplementingOrganizationAddressZipcode] [varchar](20) NULL,
	[AwardImplementingOrganizationAddressCountryCode] [smallint] NULL,
	[AwardImplementingOrganizationAddressCountry] [varchar](27) NULL,
	[AwardImplementingOrganizationDUNSnumber] [varchar](13) NULL,
	[AwardImplementingOrganizationDescription] [varchar](255) NULL,
	[AwardTitle] [varchar](255) NULL,
	[AwardDescription] [varchar](255) NULL,
	[AwardStatus] [varchar](15) NULL,
	[AwardCollaborationType] [varchar](12) NULL,
	[AwardTotalEstimatedValue] [real] NULL,
	[AwardSigningDate] [datetime] NULL,
	[AwardInteragencyTransferStatus] [varchar](20) NULL,
	[AwardDateStartDateDate] [datetime] NULL,
	[AwardDateStartDateType] [varchar](13) NULL,
	[AwardDateEndDateDate] [datetime] NULL,
	[AwardDateEndDateType] [varchar](11) NULL,
	[AwardLocationName] [varchar](33) NULL,
	[AwardLocationActivityScope] [smallint] NULL,
	[AwardLocationReach] [smallint] NULL,
	[AwardBudgetPeriodStart] [datetime] NULL,
	[AwardBudgetPeriodEnd] [datetime] NULL,
	[AwardBudgetValue] [int] NULL,
	[AwardTransactionValueDate] [datetime] NULL,
	[AwardTransactionType] [varchar](12) NULL,
	[AwardTransactionDate] [datetime] NULL,
	[AwardTransactionDisbursementChannel] [varchar](103) NULL,
	[AwardTransactionRecipientCountryName] [varchar](21) NULL,
	[AwardTransactionRecipientRegionName] [varchar](35) NULL,
	[AwardTransactionAidType] [varchar](114) NULL,
	[AwardTransactionTied Status] [varchar](14) NULL,
	[AwardTransactionFlowType] [varchar](3) NULL,
	[AwardTransactionFinanceType] [varchar](39) NULL,
	[AwardTransactionDACsectorCode] [int] NULL,
	[AwardTransactionSector] [varchar](53) NULL,
	[AwardTransactionCategory] [varchar](39) NULL,
	[AwardTransactionTreasuryAccountMainAccountCode] [varchar](25) NULL,
	[AwardTransactionTreasuryAccountRegularCode] [varchar](41) NULL,
	[AwardTransactionTreasuryAccountAccountTitle] [varchar](124) NULL,
	[TreasuryAccountBeginningFiscalFundingYear] [smallint] NULL,
	[TreasuryAccountEndingFiscalFundingYear] [smallint] NULL,
	[DataReportingDate] [datetime] NULL,
	[AwardTransactionFiscalYearQuarter] [smallint] NULL,
	[AwardTransactionFiscalYearYear] [smallint] NULL,
	[AwardTransactionObligation] [decimal](19, 4) NULL,
	[AwardTransactionDisbursement] [decimal](19, 4) NULL
)

GO
SET ANSI_PADDING OFF
GO
