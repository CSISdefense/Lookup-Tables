SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[USAIDgreenbook](
	[gbk_country_id] [float] NULL,
	[gbk_country_name] [nvarchar](255) NULL,
	[dac_sector_code] [int] NOT NULL,
	[dac_sector_name] [nvarchar](255) NULL,
	[dac_purpose_code] [int] NOT NULL,
	[dac_purpose_name] [nvarchar](255) NULL,
	[implementing_agency_id] [smallint] NOT NULL,
	[implementing_agency_name] [nvarchar](255) NULL,
	[implementing_subagency_id] [smallint] NOT NULL,
	[implementing_subagency_acronym] [nvarchar](255) NULL,
	[implementing_subagency_name] [nvarchar](255) NULL,
	[funding_account_id] [varchar](7) NOT NULL,
	[funding_account_name] [nvarchar](255) NULL,
	[funding_agency_id] [smallint] NOT NULL,
	[funding_agency_name] [nvarchar](255) NULL,
	[implementing_partner_type] [smallint] NOT NULL,
	[implementing_partner_type_name] [nvarchar](255) NULL,
	[assistance_category_id] [smallint] NOT NULL,
	[assistance_category_name] [nvarchar](255) NULL,
	[transaction_year] [float] NULL,
	[transaction_type_id] [smallint] NOT NULL,
	[transaction_type_name] [nvarchar](255) NULL,
	[transaction_amount] [decimal](19, 4) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Assistance].[USAIDgreenbook]  WITH NOCHECK ADD  CONSTRAINT [FK_assistance_USAIDgreenbook_funding_agency_ID] FOREIGN KEY([implementing_agency_id])
REFERENCES [agency].[USAIDgreenbookAgencyID] ([USAIDgreenbookAgencyID])
GO
ALTER TABLE [Assistance].[USAIDgreenbook] CHECK CONSTRAINT [FK_assistance_USAIDgreenbook_funding_agency_ID]
GO
ALTER TABLE [Assistance].[USAIDgreenbook]  WITH NOCHECK ADD  CONSTRAINT [fk_USAIDgreenbook_Funding_Account_ID] FOREIGN KEY([funding_account_id])
REFERENCES [budget].[FundingAccountID] ([FundingAccountID])
GO
ALTER TABLE [Assistance].[USAIDgreenbook] CHECK CONSTRAINT [fk_USAIDgreenbook_Funding_Account_ID]
GO
