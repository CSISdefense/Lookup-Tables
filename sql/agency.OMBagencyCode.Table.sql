SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[OMBagencyCode](
	[OMBagencyCode] [smallint] NOT NULL,
	[AgencyName] [varchar](100) NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[ImplementingAgencyID] [varchar](4) NULL,
	[totalFPDSandFAADSamount] [decimal](19, 4) NULL,
	[topimplementingagencyidamount] [decimal](19, 4) NULL,
	[IsManualOverride] [bit] NOT NULL,
	[OMBagencyCodeBureauCodeImplementingAgencyIDpartial] [decimal](19, 4) NULL,
	[topFundingagencyidamount] [decimal](19, 4) NULL,
 CONSTRAINT [pk_OmbAgencyCode] PRIMARY KEY CLUSTERED 
(
	[OMBagencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[OMBagencyCode] ADD  CONSTRAINT [DF__OMBagency__CSISc__2220E508]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[OMBagencyCode] ADD  CONSTRAINT [DF__OMBagency__CSISm__23150941]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [agency].[OMBagencyCode] ADD  CONSTRAINT [DF__OMBagency__CSISm__24092D7A]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [agency].[OMBagencyCode] ADD  CONSTRAINT [DF__OMBagency__IsMan__0ED9066A]  DEFAULT ((0)) FOR [IsManualOverride]
GO
ALTER TABLE [agency].[OMBagencyCode]  WITH NOCHECK ADD  CONSTRAINT [FK__OMBagency__Fundi__24FD51B3] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[OMBagencyCode] CHECK CONSTRAINT [FK__OMBagency__Fundi__24FD51B3]
GO
ALTER TABLE [agency].[OMBagencyCode]  WITH NOCHECK ADD  CONSTRAINT [FK__OMBagency__Imple__25F175EC] FOREIGN KEY([ImplementingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[OMBagencyCode] CHECK CONSTRAINT [FK__OMBagency__Imple__25F175EC]
GO
