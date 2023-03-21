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
	[IsEntityAbove1990constantReportingThreshold] [bit] NULL,
	[IsEntityAbove2016constantReportingThreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[IsEntityAbove2016constantOneMillionThreshold] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[EntitySizeCode] [varchar](1) NULL,
	[IsEntityAbove2018constant10ThousandThreshold] [bit] NULL,
 CONSTRAINT [StandardizedVendorName_Fiscal_Year] UNIQUE NONCLUSTERED 
(
	[StandardizedVendorName] ASC,
	[Fiscal_Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
