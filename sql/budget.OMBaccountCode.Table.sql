SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[OMBaccountCode](
	[OMBaccountCode] [varchar](6) NOT NULL,
	[AccountName] [varchar](200) NULL,
	[IsOperatingExpense] [bit] NULL,
	[AgencyCode] [smallint] NULL,
	[BureauCode] [smallint] NULL,
	[SubfunctionCode] [smallint] NULL,
	[BEAcategory] [varchar](13) NULL,
	[mainaccountcode] [smallint] NOT NULL,
	[subaccountcode] [smallint] NULL,
	[TreasuryAgencyCode] [smallint] NOT NULL,
 CONSTRAINT [pk_OMBaccountCode] PRIMARY KEY CLUSTERED 
(
	[TreasuryAgencyCode] ASC,
	[OMBaccountCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[OMBaccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_OMBaccountCode_MainAccountCode] FOREIGN KEY([TreasuryAgencyCode], [mainaccountcode])
REFERENCES [budget].[MainAccountCode] ([TreasuryAgencyCode], [MainAccountCode])
GO
ALTER TABLE [budget].[OMBaccountCode] CHECK CONSTRAINT [fk_OMBaccountCode_MainAccountCode]
GO
ALTER TABLE [budget].[OMBaccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_OMBaccountCode_SubAccountCode] FOREIGN KEY([TreasuryAgencyCode], [mainaccountcode], [subaccountcode])
REFERENCES [budget].[SubAccountCode] ([TreasuryAgencyCode], [MainAccountCode], [SubAccountCode])
GO
ALTER TABLE [budget].[OMBaccountCode] CHECK CONSTRAINT [fk_OMBaccountCode_SubAccountCode]
GO
ALTER TABLE [budget].[OMBaccountCode]  WITH NOCHECK ADD  CONSTRAINT [fk_OMBaccountCode_TreasuryAgencyCode] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[OMBaccountCode] CHECK CONSTRAINT [fk_OMBaccountCode_TreasuryAgencyCode]
GO
