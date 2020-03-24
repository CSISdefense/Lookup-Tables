USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [budget].[FundingAccountID](
	[FundingAccountID] [varchar](7) NOT NULL,
	[TreasuryAgencyCode] [smallint] NOT NULL,
	[mainaccountcode] [smallint] NOT NULL,
	[FundingAccountName] [nvarchar](255) NULL,
 CONSTRAINT [pk_Funding_Account_ID] PRIMARY KEY CLUSTERED 
(
	[FundingAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [budget].[FundingAccountID]  WITH NOCHECK ADD  CONSTRAINT [fk_Funding_Account_ID_MainAccountCode] FOREIGN KEY([TreasuryAgencyCode], [mainaccountcode])
REFERENCES [budget].[MainAccountCode] ([TreasuryAgencyCode], [MainAccountCode])
GO
ALTER TABLE [budget].[FundingAccountID] CHECK CONSTRAINT [fk_Funding_Account_ID_MainAccountCode]
GO
ALTER TABLE [budget].[FundingAccountID]  WITH NOCHECK ADD  CONSTRAINT [fk_Funding_Account_ID_TreasuryAgencyCode] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[FundingAccountID] CHECK CONSTRAINT [fk_Funding_Account_ID_TreasuryAgencyCode]
GO
