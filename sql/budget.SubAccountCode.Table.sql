USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [budget].[SubAccountCode](
	[TreasuryAgencyCode] [smallint] NOT NULL,
	[MainAccountCode] [smallint] NOT NULL,
	[SubAccountCode] [smallint] NOT NULL,
	[GWAagencyName] [varchar](69) NULL,
	[a] [varchar](1) NULL,
	[Acct_Type] [varchar](5) NULL,
	[Admin_Bureau] [smallint] NULL,
	[ATA] [smallint] NULL,
	[Fund_Type] [varchar](4) NULL,
	[SP] [smallint] NULL,
	[MinOfBPOA] [smallint] NULL,
	[MaxOfEPOA] [smallint] NULL,
	[GWA_TAS_Name] [varchar](200) NULL,
	[OMBaccountName] [varchar](200) NULL,
	[USAIDgreenbookAccountName] [varchar](100) NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[ImplementingAgencyID] [varchar](4) NULL,
	[AgencyCode] [smallint] NULL,
	[BureauCode] [smallint] NULL,
	[SubfunctionCode] [smallint] NULL,
	[BEAcategory] [varchar](13) NULL,
	[dac_sector_code] [int] NULL,
	[USAIDgreenbookImplementingAgencyID] [int] NULL,
	[USAIDgreenbookImplementingSubagencyID] [int] NULL,
	[USAIDgreenbookFundingAgencyID] [int] NULL,
	[implementing_partner_type] [smallint] NULL,
	[assistance_category_id] [smallint] NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[totalFPDSandFAADSamount] [decimal](19, 4) NULL,
	[topFundingAgencyIDtotalamount] [decimal](19, 4) NULL,
	[IsManualOverride] [bit] NOT NULL,
	[IsOffsetAccount] [bit] NULL,
	[IsGWATAScode] [bit] NOT NULL,
	[IsObsolete] [bit] NOT NULL,
	[istofix] [bit] NULL,
	[IsManualOMBagencyOrBureau] [bit] NOT NULL,
	[AccountTitle] [varchar](255) NULL,
	[IsMultiFundingAgency] [bit] NULL,
	[IsMultiImplementingAgency] [bit] NULL,
	[IsOperatingExpense] [bit] NULL,
	[IsOMBvsGreenbookContradiction] [bit] NULL,
	[FPDSandFAADSaccountTitle] [varchar](255) NULL,
 CONSTRAINT [pk_subaccountCode_mainaccountCode_TreasuryAgencyCode] PRIMARY KEY CLUSTERED 
(
	[TreasuryAgencyCode] ASC,
	[MainAccountCode] ASC,
	[SubAccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__CSISc__371C01EE]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__CSISm__38102627]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__CSISm__39044A60]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__IsMan__27A4B434]  DEFAULT ((0)) FOR [IsManualOverride]
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__IsGWA__471D5F8D]  DEFAULT ((0)) FOR [IsGWATAScode]
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__IsObs__481183C6]  DEFAULT ((0)) FOR [IsObsolete]
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__istof__4DCA5D1C]  DEFAULT ((0)) FOR [istofix]
GO
ALTER TABLE [budget].[SubAccountCode] ADD  CONSTRAINT [DF__SubAccoun__IsMan__65A1E6AD]  DEFAULT ((0)) FOR [IsManualOMBagencyOrBureau]
GO
ALTER TABLE [budget].[SubAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_budget_subaccountcode_mainaccountcode_treasuryagencycode] FOREIGN KEY([TreasuryAgencyCode], [MainAccountCode])
REFERENCES [budget].[MainAccountCode] ([TreasuryAgencyCode], [MainAccountCode])
GO
ALTER TABLE [budget].[SubAccountCode] CHECK CONSTRAINT [fk_budget_subaccountcode_mainaccountcode_treasuryagencycode]
GO
ALTER TABLE [budget].[SubAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_SubAccountCode_AgencyCode] FOREIGN KEY([AgencyCode])
REFERENCES [agency].[OMBagencyCode] ([OMBagencyCode])
GO
ALTER TABLE [budget].[SubAccountCode] CHECK CONSTRAINT [fk_SubAccountCode_AgencyCode]
GO
ALTER TABLE [budget].[SubAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_SubAccountCode_BureauCode] FOREIGN KEY([AgencyCode], [BureauCode])
REFERENCES [agency].[BureauCode] ([OMBagencyCode], [BureauCode])
GO
ALTER TABLE [budget].[SubAccountCode] CHECK CONSTRAINT [fk_SubAccountCode_BureauCode]
GO
ALTER TABLE [budget].[SubAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_SubAccountCode_FundingAgencyID] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [budget].[SubAccountCode] CHECK CONSTRAINT [fk_SubAccountCode_FundingAgencyID]
GO
ALTER TABLE [budget].[SubAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_SubAccountCode_ImplementingAgencyID] FOREIGN KEY([ImplementingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [budget].[SubAccountCode] CHECK CONSTRAINT [fk_SubAccountCode_ImplementingAgencyID]
GO
ALTER TABLE [budget].[SubAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_SubAccountCode_SubFunctionCode] FOREIGN KEY([SubfunctionCode])
REFERENCES [budget].[SubFunctionCode] ([SubfunctionCode])
GO
ALTER TABLE [budget].[SubAccountCode] CHECK CONSTRAINT [fk_SubAccountCode_SubFunctionCode]
GO
