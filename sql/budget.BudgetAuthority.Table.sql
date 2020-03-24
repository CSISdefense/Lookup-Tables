USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [budget].[BudgetAuthority](
	[AgencyCode] [smallint] NULL,
	[AgencyName] [varchar](88) NULL,
	[BureauCode] [smallint] NULL,
	[BureauName] [varchar](88) NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[OMBaccountCode] [varchar](6) NULL,
	[AccountName] [varchar](164) NULL,
	[SubfunctionCode] [smallint] NULL,
	[SubfunctionTitle] [varchar](64) NULL,
	[BEAcategory] [varchar](13) NULL,
	[OnOrOffBudget] [varchar](10) NULL,
	[Fiscal_Year] [int] NULL,
	[BudgetAuthority] [decimal](19, 4) NULL,
	[CSISdateCreated] [datetime2](7) NOT NULL,
	[YearType] [varchar](20) NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [budget].[BudgetAuthority]  WITH NOCHECK ADD  CONSTRAINT [fk_BudgetAuthority_BureauCode] FOREIGN KEY([AgencyCode], [BureauCode])
REFERENCES [agency].[BureauCode] ([OMBagencyCode], [BureauCode])
GO
ALTER TABLE [budget].[BudgetAuthority] CHECK CONSTRAINT [fk_BudgetAuthority_BureauCode]
GO
ALTER TABLE [budget].[BudgetAuthority]  WITH NOCHECK ADD  CONSTRAINT [fk_BudgetAuthority_OMBaccountCode] FOREIGN KEY([TreasuryAgencyCode], [OMBaccountCode])
REFERENCES [budget].[OMBaccountCode] ([TreasuryAgencyCode], [OMBaccountCode])
GO
ALTER TABLE [budget].[BudgetAuthority] CHECK CONSTRAINT [fk_BudgetAuthority_OMBaccountCode]
GO
ALTER TABLE [budget].[BudgetAuthority]  WITH NOCHECK ADD  CONSTRAINT [fk_BudgetAuthority_OMBagencyCode] FOREIGN KEY([AgencyCode])
REFERENCES [agency].[OMBagencyCode] ([OMBagencyCode])
GO
ALTER TABLE [budget].[BudgetAuthority] CHECK CONSTRAINT [fk_BudgetAuthority_OMBagencyCode]
GO
ALTER TABLE [budget].[BudgetAuthority]  WITH NOCHECK ADD  CONSTRAINT [fk_BudgetAuthority_SubFunctionCode] FOREIGN KEY([SubfunctionCode])
REFERENCES [budget].[SubFunctionCode] ([SubfunctionCode])
GO
ALTER TABLE [budget].[BudgetAuthority] CHECK CONSTRAINT [fk_BudgetAuthority_SubFunctionCode]
GO
ALTER TABLE [budget].[BudgetAuthority]  WITH NOCHECK ADD  CONSTRAINT [fk_BudgetAuthority_TreasuryAgencyCode] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[BudgetAuthority] CHECK CONSTRAINT [fk_BudgetAuthority_TreasuryAgencyCode]
GO
