SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[CCCContractIDtoVendorName](
	[Supplier_ID] [bigint] NULL,
	[Supplier] [nvarchar](255) NULL,
	[SuppAddress] [nvarchar](1000) NULL,
	[SuppCity] [nvarchar](255) NULL,
	[SuppProvince] [varchar](10) NULL,
	[SuppPostCode] [varchar](255) NULL,
	[SuppCountry] [varchar](10) NULL,
	[Project] [varchar](10) NULL,
	[ProjectDescription] [nvarchar](255) NULL,
	[ContractNumber] [varchar](255) NOT NULL,
	[ProjCustomerID] [bigint] NULL,
	[ProjectCustomer] [nvarchar](255) NULL,
	[ProjCustAddress] [nvarchar](255) NULL,
	[ProjCustCity] [nvarchar](255) NULL,
	[ProjCustProvince] [varchar](10) NULL,
	[ProjCustPostCode] [varchar](30) NULL,
	[Country] [varchar](10) NULL,
	[Work_Order] [varchar](25) NULL,
	[WO_Description] [nvarchar](255) NULL,
	[WO_Extref] [varchar](255) NULL,
	[Reference] [varchar](255) NULL,
	[Amount] [decimal](19, 4) NULL,
	[Currency] [varchar](10) NULL,
	[ExchangeRate] [decimal](19, 4) NULL,
	[CAD_Amount] [decimal](19, 4) NULL,
	[Date] [date] NULL,
	[SectorCode] [bigint] NULL,
	[SectorName] [nvarchar](255) NULL,
	[DateFrom] [date] NULL,
	[DateTo] [date] NULL,
	[Contract_or_Amendment] [varchar](30) NULL,
	[CustomerType] [nvarchar](255) NULL,
	[CummulativeAmount] [decimal](19, 4) NULL,
	[ProductCode] [bigint] NULL,
	[CSIScontractID] [int] NULL,
	[CSISidvpiidID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Location].[CCCContractIDtoVendorName]  WITH NOCHECK ADD  CONSTRAINT [FK__CCCContra__CSISc__09801FC7] FOREIGN KEY([CSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [Location].[CCCContractIDtoVendorName] CHECK CONSTRAINT [FK__CCCContra__CSISc__09801FC7]
GO
ALTER TABLE [Location].[CCCContractIDtoVendorName]  WITH NOCHECK ADD  CONSTRAINT [FK__CCCContra__CSISi__0A744400] FOREIGN KEY([CSISidvpiidID])
REFERENCES [Contract].[CSISidvpiidID] ([CSISidvpiidID])
GO
ALTER TABLE [Location].[CCCContractIDtoVendorName] CHECK CONSTRAINT [FK__CCCContra__CSISi__0A744400]
GO
