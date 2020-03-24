USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [budget].[Outlay](
	[Outlay] [decimal](19, 4) NULL,
	[Fiscal_Year] [int] NULL,
	[AgencyCode] [smallint] NULL,
	[AgencyName] [varchar](100) NULL,
	[BureauCode] [smallint] NULL,
	[BureauName] [varchar](100) NULL,
	[AccountName] [varchar](200) NULL,
	[SubfunctionCode] [smallint] NULL,
	[SubfunctionTitle] [varchar](100) NULL,
	[BEAcategory] [varchar](13) NULL,
	[GrantVsNonGrantSplit] [varchar](8) NULL,
	[OnOrOffBudget] [varchar](10) NULL,
	[YearType] [varchar](50) NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[OMBaccountCode] [varchar](6) NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [budget].[Outlay] ADD  CONSTRAINT [DF__Outlay__CSIScrea__44AB0736]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [budget].[Outlay]  WITH NOCHECK ADD  CONSTRAINT [fk_Outlay_BureauCode] FOREIGN KEY([AgencyCode], [BureauCode])
REFERENCES [agency].[BureauCode] ([OMBagencyCode], [BureauCode])
GO
ALTER TABLE [budget].[Outlay] CHECK CONSTRAINT [fk_Outlay_BureauCode]
GO
ALTER TABLE [budget].[Outlay]  WITH NOCHECK ADD  CONSTRAINT [fk_Outlay_OMBaccountCode] FOREIGN KEY([TreasuryAgencyCode], [OMBaccountCode])
REFERENCES [budget].[OMBaccountCode] ([TreasuryAgencyCode], [OMBaccountCode])
GO
ALTER TABLE [budget].[Outlay] CHECK CONSTRAINT [fk_Outlay_OMBaccountCode]
GO
ALTER TABLE [budget].[Outlay]  WITH NOCHECK ADD  CONSTRAINT [fk_Outlay_OMBagencyCode] FOREIGN KEY([AgencyCode])
REFERENCES [agency].[OMBagencyCode] ([OMBagencyCode])
GO
ALTER TABLE [budget].[Outlay] CHECK CONSTRAINT [fk_Outlay_OMBagencyCode]
GO
ALTER TABLE [budget].[Outlay]  WITH NOCHECK ADD  CONSTRAINT [fk_Outlay_SubFunctionCode] FOREIGN KEY([SubfunctionCode])
REFERENCES [budget].[SubFunctionCode] ([SubfunctionCode])
GO
ALTER TABLE [budget].[Outlay] CHECK CONSTRAINT [fk_Outlay_SubFunctionCode]
GO
ALTER TABLE [budget].[Outlay]  WITH NOCHECK ADD  CONSTRAINT [fk_Outlay_TreasuryAgencyCode] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[Outlay] CHECK CONSTRAINT [fk_Outlay_TreasuryAgencyCode]
GO
