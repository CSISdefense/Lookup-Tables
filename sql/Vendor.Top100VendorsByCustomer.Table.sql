USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[Top100VendorsByCustomer](
	[Global Vendor Name] [nvarchar](255) NULL,
	[Number Of Actions] [float] NULL,
	[Dollars Obligated] [float] NULL,
	[%Total Actions] [float] NULL,
	[% Total Dollars] [float] NULL,
	[Agency] [nvarchar](255) NULL
) ON [PRIMARY]
GO
