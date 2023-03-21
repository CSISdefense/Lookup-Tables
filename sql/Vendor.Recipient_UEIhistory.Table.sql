SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[Recipient_UEIhistory](
	[recipient_uei] [varchar](12) NOT NULL,
	[Fiscal_Year] [smallint] NOT NULL,
	[ParentID] [nvarchar](255) NULL,
	[StandardizedTopContractor] [nvarchar](150) NULL,
	[TopVendorNameTotalAmount] [decimal](19, 4) NULL,
	[Recipient_Parent_UEI] [varchar](12) NULL,
	[Recipient_Parent_UEIFirstDate] [date] NULL,
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
	[IsEntityAbove1990constantReportingThreshold] [bit] NULL,
	[IsEntityAbove2016constantReportingThreshold] [bit] NULL,
	[IsEntityAbove2018constant10ThousandThreshold] [bit] NULL,
	[IsEntityAbove2016constantOneMillionThreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[ChildCount] [int] NULL,
	[IsPresent] [bit] NULL,
	[CSISmodifiedDate] [datetime] NULL,
	[CSIScreateddate] [datetime] NULL,
	[CSISmodifiedBy] [nvarchar](128) NULL,
 CONSTRAINT [pk_vendor_recipient_ueitoParentIDhistory] PRIMARY KEY CLUSTERED 
(
	[recipient_uei] ASC,
	[Fiscal_Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[Recipient_UEIhistory]  WITH CHECK ADD FOREIGN KEY([Dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[Recipient_UEIhistory]  WITH CHECK ADD FOREIGN KEY([HeadquarterCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[Recipient_UEIhistory]  WITH CHECK ADD FOREIGN KEY([ParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[Recipient_UEIhistory]  WITH CHECK ADD FOREIGN KEY([ParentDUNSnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[Recipient_UEIhistory]  WITH CHECK ADD FOREIGN KEY([recipient_uei])
REFERENCES [Vendor].[recipient_uei] ([recipient_uei])
GO
ALTER TABLE [Vendor].[Recipient_UEIhistory]  WITH CHECK ADD FOREIGN KEY([Recipient_Parent_UEI])
REFERENCES [Vendor].[recipient_uei] ([recipient_uei])
GO
ALTER TABLE [Vendor].[Recipient_UEIhistory]  WITH CHECK ADD FOREIGN KEY([StandardizedTopContractor])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
