SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[AtransitionProduct_or_Service_Code_Description](
	[productorservicecode] [varchar](4) NULL,
	[product_or_service_code_description] [varchar](255) NULL,
	[minofsignedyear] [int] NULL,
	[maxofsignedyear] [int] NULL,
	[minoflast_modified_year] [int] NULL,
	[maxoflast_modified_year] [int] NULL,
	[PlatformPortfolio] [varchar](30) NULL,
	[ProductServiceOrRnDarea] [varchar](49) NULL,
	[RnD_budgetActivity] [varchar](49) NULL
) ON [PRIMARY]
GO
ALTER TABLE [ProductOrServiceCode].[AtransitionProduct_or_Service_Code_Description]  WITH CHECK ADD FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [ProductOrServiceCode].[AtransitionProduct_or_Service_Code_Description]  WITH CHECK ADD FOREIGN KEY([ProductServiceOrRnDarea])
REFERENCES [ProductOrServiceCode].[ProductServiceOrRnDarea] ([ProductServiceOrRnDarea])
GO
ALTER TABLE [ProductOrServiceCode].[AtransitionProduct_or_Service_Code_Description]  WITH CHECK ADD FOREIGN KEY([RnD_budgetActivity])
REFERENCES [ProductOrServiceCode].[ProductServiceOrRnDarea] ([ProductServiceOrRnDarea])
GO
