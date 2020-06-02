SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[Receipt](
	[Fiscal_Year] [smallint] NULL,
	[YearType] [varchar](50) NULL,
	[Receipt] [decimal](19, 4) NULL,
	[SourceCategoryCode] [smallint] NULL,
	[SourceCategoryName] [varchar](50) NULL,
	[SourceSubcategory] [smallint] NULL,
	[SourceSubcategoryName] [varchar](50) NULL,
	[AgencyCode] [smallint] NULL,
	[AgencyName] [varchar](88) NULL,
	[BureauCode] [smallint] NULL,
	[BureauName] [varchar](88) NULL,
	[TreasuryAgencycode] [smallint] NULL,
	[OMBaccountCode] [varchar](6) NULL,
	[AccountName] [varchar](164) NULL,
	[OnOrOffBudget] [varchar](10) NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [budget].[Receipt] ADD  CONSTRAINT [DF__Receipts__CSIScr__7929BC6D]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [budget].[Receipt]  WITH NOCHECK ADD  CONSTRAINT [fk_Receipt_BureauCode] FOREIGN KEY([AgencyCode], [BureauCode])
REFERENCES [agency].[BureauCode] ([OMBagencyCode], [BureauCode])
GO
ALTER TABLE [budget].[Receipt] CHECK CONSTRAINT [fk_Receipt_BureauCode]
GO
ALTER TABLE [budget].[Receipt]  WITH NOCHECK ADD  CONSTRAINT [fk_Receipt_OMBaccountCode] FOREIGN KEY([TreasuryAgencycode], [OMBaccountCode])
REFERENCES [budget].[OMBaccountCode] ([TreasuryAgencyCode], [OMBaccountCode])
GO
ALTER TABLE [budget].[Receipt] CHECK CONSTRAINT [fk_Receipt_OMBaccountCode]
GO
ALTER TABLE [budget].[Receipt]  WITH NOCHECK ADD  CONSTRAINT [fk_Receipt_OMBagencyCode] FOREIGN KEY([AgencyCode])
REFERENCES [agency].[OMBagencyCode] ([OMBagencyCode])
GO
ALTER TABLE [budget].[Receipt] CHECK CONSTRAINT [fk_Receipt_OMBagencyCode]
GO
ALTER TABLE [budget].[Receipt]  WITH NOCHECK ADD  CONSTRAINT [fk_Receipt_SourceCategoryCode] FOREIGN KEY([SourceCategoryCode])
REFERENCES [budget].[SourceCategoryCode] ([SourceCategoryCode])
GO
ALTER TABLE [budget].[Receipt] CHECK CONSTRAINT [fk_Receipt_SourceCategoryCode]
GO
ALTER TABLE [budget].[Receipt]  WITH NOCHECK ADD  CONSTRAINT [fk_Receipt_SourceSubcategory] FOREIGN KEY([SourceCategoryCode], [SourceSubcategory])
REFERENCES [budget].[SourceSubcategory] ([SourceCategoryCode], [SourceSubcategory])
GO
ALTER TABLE [budget].[Receipt] CHECK CONSTRAINT [fk_Receipt_SourceSubcategory]
GO
ALTER TABLE [budget].[Receipt]  WITH NOCHECK ADD  CONSTRAINT [fk_Receipts_TreasuryAgencyCode] FOREIGN KEY([TreasuryAgencycode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[Receipt] CHECK CONSTRAINT [fk_Receipts_TreasuryAgencyCode]
GO
