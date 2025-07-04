SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[StandardizedVendorNameHistory](
	[StandardizedVendorName] [nvarchar](150) NULL,
	[Fiscal_Year] [int] NULL,
	[parentid] [nvarchar](255) NULL,
	[isUSAforwardLocalOrganization] [bit] NULL,
	[isunknownvendorname] [bit] NULL,
	[AnyIsSmall] [bit] NULL,
	[AlwaysIsSmall] [bit] NULL,
	[MaxOfCSIScontractIDObligatedAmount] [decimal](19, 4) NULL,
	[CSIScreateddate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[IsEntityAbove1990constantMTAthreshold] [bit] NULL,
	[IsEntityAbove2016constantMTAthreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[IsEntityAbove2016constantArbitrary1000k] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[EntitySizeCode] [varchar](1) NULL,
	[IsEntityAbove2018constantMTAthreshold] [bit] NULL,
	[IsEntityAbove2018constantSimplifedAcquisition250kThreshold] [bit] NULL,
	[IsEntityAbove2018constantCommercialItem7500k] [bit] NULL,
	[IsEntityAbove2018constantCostAccounting2000kThreshold] [bit] NULL,
 CONSTRAINT [StandardizedVendorName_Fiscal_Year] UNIQUE NONCLUSTERED 
(
	[StandardizedVendorName] ASC,
	[Fiscal_Year] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[StandardizedVendorNameHistory] ADD  CONSTRAINT [DF__Standardi__CSISc__3E530F62]  DEFAULT (getdate()) FOR [CSIScreateddate]
GO
ALTER TABLE [Vendor].[StandardizedVendorNameHistory] ADD  CONSTRAINT [DF__Standardi__CSISm__3F47339B]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Vendor].[StandardizedVendorNameHistory] ADD  CONSTRAINT [DF__Standardi__CSISm__403B57D4]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Vendor].[StandardizedVendorNameHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_StandardizedVendorNameHistory_StandardizedVendorName] FOREIGN KEY([StandardizedVendorName])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Vendor].[StandardizedVendorNameHistory] CHECK CONSTRAINT [fk_StandardizedVendorNameHistory_StandardizedVendorName]
GO
ALTER TABLE [Vendor].[StandardizedVendorNameHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_Vendor_StandardizedVendorNameHistory_EntitySizeCode] FOREIGN KEY([EntitySizeCode])
REFERENCES [Vendor].[EntitySizeCode] ([EntitySizeCode])
GO
ALTER TABLE [Vendor].[StandardizedVendorNameHistory] CHECK CONSTRAINT [fk_Vendor_StandardizedVendorNameHistory_EntitySizeCode]
GO
