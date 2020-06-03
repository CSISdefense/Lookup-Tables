SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[BureauCode](
	[OMBagencyCode] [smallint] NOT NULL,
	[agencyname] [varchar](100) NULL,
	[BureauCode] [smallint] NOT NULL,
	[bureauname] [varchar](100) NULL,
	[implementingagencyid] [varchar](4) NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[TopImplementingAgencyIDamount] [decimal](19, 4) NULL,
	[TotalFPDSandFAADSamount] [decimal](19, 4) NULL,
	[IsManualOverride] [bit] NOT NULL,
	[OMBagencyCodeBureauCodeImplementingAgencyIDpartial] [decimal](19, 4) NULL,
	[topFundingagencyidamount] [decimal](19, 4) NULL,
	[IsTreasuryAgencyOverride] [bit] NOT NULL,
 CONSTRAINT [pk_BureauCode] PRIMARY KEY CLUSTERED 
(
	[OMBagencyCode] ASC,
	[BureauCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[BureauCode] ADD  CONSTRAINT [DF__OMBagency__CSISc__26E59A25]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[BureauCode] ADD  CONSTRAINT [DF__OMBagency__CSISm__27D9BE5E]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [agency].[BureauCode] ADD  CONSTRAINT [DF__OMBagency__CSISm__28CDE297]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [agency].[BureauCode] ADD  CONSTRAINT [DF__OMBagency__IsMan__0DE4E231]  DEFAULT ((0)) FOR [IsManualOverride]
GO
ALTER TABLE [agency].[BureauCode] ADD  CONSTRAINT [DF__OMBagency__IsTre__61D155C9]  DEFAULT ((0)) FOR [IsTreasuryAgencyOverride]
GO
ALTER TABLE [agency].[BureauCode]  WITH NOCHECK ADD  CONSTRAINT [FK__OMBagency__Fundi__29C206D0] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[BureauCode] CHECK CONSTRAINT [FK__OMBagency__Fundi__29C206D0]
GO
ALTER TABLE [agency].[BureauCode]  WITH NOCHECK ADD  CONSTRAINT [FK_Agency_OMBagencyCodeBureauCode_ImplementingAgencyID] FOREIGN KEY([implementingagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[BureauCode] CHECK CONSTRAINT [FK_Agency_OMBagencyCodeBureauCode_ImplementingAgencyID]
GO
ALTER TABLE [agency].[BureauCode]  WITH NOCHECK ADD  CONSTRAINT [fk_BureauCode_OMBagencyCode] FOREIGN KEY([OMBagencyCode])
REFERENCES [agency].[OMBagencyCode] ([OMBagencyCode])
GO
ALTER TABLE [agency].[BureauCode] CHECK CONSTRAINT [fk_BureauCode_OMBagencyCode]
GO
