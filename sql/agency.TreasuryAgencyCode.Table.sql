SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[TreasuryAgencyCode](
	[TreasuryAgencyCode] [smallint] NOT NULL,
	[Notes] [varchar](255) NULL,
	[GWAagencyName] [varchar](70) NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[ImplementingAgencyID] [varchar](4) NULL,
	[AgencyCode] [smallint] NULL,
	[BureauCode] [smallint] NULL,
	[SubfunctionCode] [smallint] NULL,
	[a] [varchar](1) NULL,
	[Acct_Type] [varchar](5) NULL,
	[Admin_Bureau] [smallint] NULL,
	[MinOfBPOA] [smallint] NULL,
	[MaxOfEPOA] [smallint] NULL,
	[Fund_Type] [varchar](4) NULL,
	[SP] [smallint] NULL,
	[ATA] [smallint] NULL,
	[dac_sector_code] [int] NULL,
	[USAIDgreenbookImplementingAgencyID] [int] NULL,
	[USAIDgreenbookImplementingSubagencyID] [int] NULL,
	[USAIDgreenbookFundingAgencyID] [int] NULL,
	[implementing_partner_type] [smallint] NULL,
	[assistance_category_id] [smallint] NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NULL,
	[topFundingAgencyIDtotalamount] [decimal](19, 4) NULL,
	[totalFPDSandFAADSamount] [decimal](19, 4) NULL,
	[IsManualOverride] [bit] NOT NULL,
 CONSTRAINT [pk_TreasuryAgencyCode] PRIMARY KEY CLUSTERED 
(
	[TreasuryAgencyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[TreasuryAgencyCode] ADD  CONSTRAINT [DF__TreasuryA__CSISc__1C680BB2]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[TreasuryAgencyCode] ADD  CONSTRAINT [DF__TreasuryA__CSISm__1D5C2FEB]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [agency].[TreasuryAgencyCode] ADD  CONSTRAINT [dt_CSISmodifiedBy]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [agency].[TreasuryAgencyCode] ADD  CONSTRAINT [DF__TreasuryA__IsMan__2898D86D]  DEFAULT ((0)) FOR [IsManualOverride]
GO
ALTER TABLE [agency].[TreasuryAgencyCode]  WITH NOCHECK ADD  CONSTRAINT [FK_Agency_TreasuryAgencyCode_fundingagencyID] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[TreasuryAgencyCode] CHECK CONSTRAINT [FK_Agency_TreasuryAgencyCode_fundingagencyID]
GO
ALTER TABLE [agency].[TreasuryAgencyCode]  WITH NOCHECK ADD  CONSTRAINT [FK_Agency_TreasuryAgencyCode_ImplementingAgencyID] FOREIGN KEY([ImplementingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[TreasuryAgencyCode] CHECK CONSTRAINT [FK_Agency_TreasuryAgencyCode_ImplementingAgencyID]
GO
ALTER TABLE [agency].[TreasuryAgencyCode]  WITH NOCHECK ADD  CONSTRAINT [fk_TreasuryAgencyCode_AgencyCode] FOREIGN KEY([AgencyCode])
REFERENCES [agency].[OMBagencyCode] ([OMBagencyCode])
GO
ALTER TABLE [agency].[TreasuryAgencyCode] CHECK CONSTRAINT [fk_TreasuryAgencyCode_AgencyCode]
GO
ALTER TABLE [agency].[TreasuryAgencyCode]  WITH NOCHECK ADD  CONSTRAINT [fk_TreasuryAgencyCode_BureauCode] FOREIGN KEY([AgencyCode], [BureauCode])
REFERENCES [agency].[BureauCode] ([OMBagencyCode], [BureauCode])
GO
ALTER TABLE [agency].[TreasuryAgencyCode] CHECK CONSTRAINT [fk_TreasuryAgencyCode_BureauCode]
GO
ALTER TABLE [agency].[TreasuryAgencyCode]  WITH NOCHECK ADD  CONSTRAINT [fk_TreasuryAgencyCode_SubFunctionCode] FOREIGN KEY([SubfunctionCode])
REFERENCES [budget].[SubFunctionCode] ([SubfunctionCode])
GO
ALTER TABLE [agency].[TreasuryAgencyCode] CHECK CONSTRAINT [fk_TreasuryAgencyCode_SubFunctionCode]
GO
