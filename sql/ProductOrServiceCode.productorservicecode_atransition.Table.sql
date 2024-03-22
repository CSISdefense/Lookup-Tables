SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[productorservicecode_atransition](
	[contract_transaction_unique_key] [varchar](154) NULL,
	[productorservicecode] [varchar](4) NULL,
	[product_or_service_code_description] [varchar](255) NULL,
	[signeddate] [datetime2](7) NULL,
	[last_modified_date] [datetime2](7) NULL,
	[PlatformPortfolio] [varchar](30) NULL
) ON [PRIMARY]
GO
ALTER TABLE [ProductOrServiceCode].[productorservicecode_atransition]  WITH CHECK ADD FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
