SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[UEIhistory](
	[UEI] [varchar](12) NOT NULL,
	[Fiscal_Year] [smallint] NOT NULL,
	[ParentID] [nvarchar](255) NULL,
	[StandardizedTopContractor] [nvarchar](150) NULL,
	[TopVendorNameTotalAmount] [decimal](19, 4) NULL,
	[Parent_UEI] [varchar](12) NULL,
	[Parent_UEIFirstDate] [date] NULL,
	[Dunsnumber] [varchar](13) NULL,
	[ParentDUNSnumber] [varchar](13) NULL,
	[HeadquarterCode] [varchar](13) NULL,
	[Cage] [varchar](5) NULL,
	[ObligatedAmount] [decimal](19, 4) NULL,
	[fed_funding_amount] [decimal](19, 4) NULL,
	[topISO3countrycode] [varchar](3) NULL,
	[topISO3countrytotalamount] [decimal](19, 4) NULL,
	[MaxOfCAUobligatedAmount] [decimal](19, 4) NULL,
	[AnyIsSmall] [bit] NULL,
	[AlwaysIsSmall] [bit] NULL,
	[ObligatedAmountIsSmall] [decimal](19, 4) NULL,
	[IsOnePercentPlusSmall] [bit] NULL,
	[EntitySizeCode] [varchar](1) NULL,
	[IsEntityAbove1990constantMTAthreshold] [bit] NULL,
	[IsEntityAbove2016constantMTAthreshold] [bit] NULL,
	[IsEntityAbove2018constantMTAthreshold] [bit] NULL,
	[IsEntityAbove2016constantArbitrary1000k] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[ChildCount] [int] NULL,
	[IsPresent] [bit] NULL,
	[CSISmodifiedDate] [datetime] NULL,
	[CSIScreateddate] [datetime] NULL,
	[CSISmodifiedBy] [nvarchar](128) NULL,
	[TopDunsnumber] [varchar](13) NULL,
	[TopDunsnumberAmount] [decimal](19, 4) NULL,
	[TotalAmount] [decimal](19, 4) NULL,
	[TopDunsnumberCount] [int] NULL,
	[TotalCount] [int] NULL,
	[IsEntityAbove2018constantSimplifedAcquisition250kThreshold] [bit] NULL,
	[IsEntityAbove2018constantCommercialItem7500k] [bit] NULL,
	[IsEntityAbove2018constantCostAccounting2000kThreshold] [bit] NULL,
	[AnyDefense] [bit] NULL,
	[DefenseObligated] [decimal](19, 4) NULL,
	[AlwaysCAUisCASexemptOrWaived] [bit] NULL,
	[AnyCASclause] [bit] NULL,
	[IsEntityTraditional] [bit] NULL,
	[manufacturingorganizationtype] [varchar](1) NULL,
	[TopParent_UEI] [varchar](12) NULL,
	[TopParent_UEIAmount] [decimal](19, 4) NULL,
	[TopParent_UEIcount] [int] NULL,
 CONSTRAINT [pk_vendor_recipient_ueitoParentIDhistory] PRIMARY KEY CLUSTERED 
(
	[UEI] ASC,
	[Fiscal_Year] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([Dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([HeadquarterCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([ParentDUNSnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([StandardizedTopContractor])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([TopDunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([manufacturingorganizationtype])
REFERENCES [Location].[manufacturingorganizationtype] ([manufacturingorganizationtype])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([Parent_UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([Parent_UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([ParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([TopParent_UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[UEIhistory]  WITH CHECK ADD FOREIGN KEY([UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
