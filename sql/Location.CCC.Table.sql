USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[CCC](
	[fiscal_year] [smallint] NULL,
	[Query_Run_Date] [datetime] NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[SubCustomer] [nvarchar](50) NULL,
	[ProductServiceOrRnDarea] [varchar](49) NULL,
	[PlatformPortfolio] [varchar](50) NULL,
	[Simple] [varchar](8) NULL,
	[principalnaicscodeText] [nvarchar](255) NULL,
	[isforeignownedandlocated] [bit] NULL,
	[isforeigngovernment] [bit] NULL,
	[isinternationalorganization] [bit] NULL,
	[organizationaltype] [varchar](30) NULL,
	[PlaceIsForeign] [bit] NULL,
	[PlaceCountryText] [nvarchar](255) NULL,
	[OriginIsForeign] [bit] NULL,
	[OriginCountryText] [nvarchar](255) NULL,
	[VendorIsForeign] [bit] NULL,
	[VendorCountryText] [nvarchar](255) NULL,
	[DUNSIsForeign] [bit] NULL,
	[DUNSCountryText] [nvarchar](255) NULL,
	[ParentIsForeign] [bit] NULL,
	[ParentCountryText] [nvarchar](255) NULL,
	[placeofmanufactureText] [nvarchar](255) NULL,
	[Is_CCC_Vendor] [bit] NULL,
	[dunsnumber] [varchar](13) NULL,
	[parentdunsnumber] [varchar](13) NULL,
	[streetaddress] [varchar](90) NULL,
	[StandardizedTopContractor] [varchar](150) NULL,
	[ParentID] [nvarchar](255) NULL,
	[isforeign] [bit] NULL,
	[parentheadquarterscountrycode] [nvarchar](3) NULL,
	[obligatedAmount] [decimal](19, 4) NULL,
	[numberOfActions] [bigint] NULL,
	[idvpiid] [varchar](50) NULL,
	[piid] [varchar](50) NULL,
	[modnumber] [varchar](25) NULL,
	[idvmodificationnumber] [varchar](25) NULL,
	[transactionnumber] [bigint] NULL,
	[CSIScontractID] [int] NULL,
	[CSISidvmodificationID] [int] NULL,
	[CSIStransactionID] [int] NULL,
	[CSISidvpiidID] [int] NULL
) ON [PRIMARY]
GO