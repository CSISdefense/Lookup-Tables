SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[MainAccountCode](
	[TreasuryAgencyCode] [smallint] NOT NULL,
	[MainAccountCode] [smallint] NOT NULL,
	[GWAagencyName] [varchar](69) NULL,
	[a] [varchar](1) NULL,
	[Acct_Type] [varchar](5) NULL,
	[Acct_Type_Description] [varchar](22) NULL,
	[Admin_Bureau] [smallint] NULL,
	[ATA] [smallint] NULL,
	[Fund_Type] [varchar](4) NULL,
	[Fund_Type_Description] [varchar](35) NULL,
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
	[istofix] [bit] NULL,
	[IsManualOMBagencyOrBureau] [bit] NOT NULL,
	[AccountTitle] [varchar](255) NULL,
	[IsOMBvsGreenbookContradiction] [bit] NULL,
	[IsOperatingExpense] [bit] NULL,
	[IsMultiFundingAgency] [bit] NULL,
	[IsMultiImplementingAgency] [bit] NULL,
	[FPDSandFAADSaccountTitle] [varchar](255) NULL,
	[IsFMS] [bit] NULL,
 CONSTRAINT [pk_mainaccountCode_TreasuryAgencyCode] PRIMARY KEY CLUSTERED 
(
	[TreasuryAgencyCode] ASC,
	[MainAccountCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[MainAccountCode] ADD  CONSTRAINT [DF__MainAccou__CSISc__343F9543]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [budget].[MainAccountCode] ADD  CONSTRAINT [DF__MainAccou__CSISm__3533B97C]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [budget].[MainAccountCode] ADD  CONSTRAINT [DF__MainAccou__CSISm__3627DDB5]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [budget].[MainAccountCode] ADD  CONSTRAINT [DF__MainAccou__IsMan__26B08FFB]  DEFAULT ((0)) FOR [IsManualOverride]
GO
ALTER TABLE [budget].[MainAccountCode] ADD  CONSTRAINT [DF__MainAccou__IsGWA__46293B54]  DEFAULT ((0)) FOR [IsGWATAScode]
GO
ALTER TABLE [budget].[MainAccountCode] ADD  CONSTRAINT [DF__MainAccou__istof__4CD638E3]  DEFAULT ((0)) FOR [istofix]
GO
ALTER TABLE [budget].[MainAccountCode] ADD  CONSTRAINT [DF__MainAccou__IsMan__64ADC274]  DEFAULT ((0)) FOR [IsManualOMBagencyOrBureau]
GO
ALTER TABLE [budget].[MainAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_budget_mainaccountcode_treasuryagencycode] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[MainAccountCode] CHECK CONSTRAINT [fk_budget_mainaccountcode_treasuryagencycode]
GO
ALTER TABLE [budget].[MainAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_MainAccountCode_AgencyCode] FOREIGN KEY([AgencyCode])
REFERENCES [agency].[OMBagencyCode] ([OMBagencyCode])
GO
ALTER TABLE [budget].[MainAccountCode] CHECK CONSTRAINT [fk_MainAccountCode_AgencyCode]
GO
ALTER TABLE [budget].[MainAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_MainAccountCode_BureauCode] FOREIGN KEY([AgencyCode], [BureauCode])
REFERENCES [agency].[BureauCode] ([OMBagencyCode], [BureauCode])
GO
ALTER TABLE [budget].[MainAccountCode] CHECK CONSTRAINT [fk_MainAccountCode_BureauCode]
GO
ALTER TABLE [budget].[MainAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_MainAccountCode_FundingAgencyID] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [budget].[MainAccountCode] CHECK CONSTRAINT [fk_MainAccountCode_FundingAgencyID]
GO
ALTER TABLE [budget].[MainAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_MainAccountCode_ImplementingAgencyID] FOREIGN KEY([ImplementingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [budget].[MainAccountCode] CHECK CONSTRAINT [fk_MainAccountCode_ImplementingAgencyID]
GO
ALTER TABLE [budget].[MainAccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_MainAccountCode_SubFunctionCode] FOREIGN KEY([SubfunctionCode])
REFERENCES [budget].[SubFunctionCode] ([SubfunctionCode])
GO
ALTER TABLE [budget].[MainAccountCode] CHECK CONSTRAINT [fk_MainAccountCode_SubFunctionCode]
GO
