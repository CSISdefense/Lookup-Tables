SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[FundingAccountID](
	[FundingAccountID] [varchar](7) NOT NULL,
	[TreasuryAgencyCode] [smallint] NOT NULL,
	[mainaccountcode] [smallint] NOT NULL,
	[FundingAccountName] [nvarchar](255) NULL,
 CONSTRAINT [pk_Funding_Account_ID] PRIMARY KEY CLUSTERED 
(
	[FundingAccountID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
