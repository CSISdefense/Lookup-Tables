SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[GWAagencyName](
	[GWAagencyName] [varchar](69) NOT NULL,
	[Customer] [nvarchar](50) NULL,
	[SubCustomer] [nvarchar](50) NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[ImplementingAgencyID] [varchar](4) NULL,
	[AgencyCode] [varchar](3) NULL,
	[BureauCode] [varchar](2) NULL,
	[TreasuryAgencyCode] [int] NULL,
	[a] [varchar](1) NULL,
	[Acct_Type] [varchar](5) NULL,
	[Admin_Bureau] [smallint] NULL,
	[MinOfBPOA] [smallint] NULL,
	[MaxOfEPOA] [smallint] NULL,
	[Fund_Type] [varchar](4) NULL,
	[SP] [smallint] NULL,
	[ATA] [smallint] NULL,
	[USAIDgreenbookImplementingAgencyID] [int] NULL,
	[USAIDgreenbookImplementingSubagencyID] [int] NULL,
	[USAIDgreenbookFundingAgencyID] [int] NULL,
	[implementing_partner_type] [smallint] NULL,
	[assistance_category_id] [smallint] NULL,
	[IsDividedBetweenMultipleAgencies] [bit] NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[totalFPDSandFAADSamount] [decimal](19, 4) NULL,
	[topimplementingagencyidamount] [decimal](19, 4) NULL,
	[ismanualoverride] [bit] NOT NULL,
 CONSTRAINT [PK_GWAagencyName] PRIMARY KEY CLUSTERED 
(
	[GWAagencyName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[GWAagencyName] ADD  CONSTRAINT [DF__GWAagency__CSISc__1F44785D]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[GWAagencyName] ADD  CONSTRAINT [DF__GWAagency__CSISm__20389C96]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [agency].[GWAagencyName] ADD  CONSTRAINT [DF__GWAagency__CSISm__212CC0CF]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [agency].[GWAagencyName] ADD  CONSTRAINT [DF__GWAagency__isman__0FCD2AA3]  DEFAULT ((0)) FOR [ismanualoverride]
GO
ALTER TABLE [agency].[GWAagencyName]  WITH NOCHECK ADD  CONSTRAINT [FK_Agency_GWAagencyName_Customer] FOREIGN KEY([Customer])
REFERENCES [agency].[Customer] ([Customer])
GO
ALTER TABLE [agency].[GWAagencyName] CHECK CONSTRAINT [FK_Agency_GWAagencyName_Customer]
GO
ALTER TABLE [agency].[GWAagencyName]  WITH NOCHECK ADD  CONSTRAINT [FK_Agency_GWAagencyName_Customer_Subcustomer] FOREIGN KEY([Customer], [SubCustomer])
REFERENCES [agency].[SubCustomer] ([Customer], [SubCustomer])
GO
ALTER TABLE [agency].[GWAagencyName] CHECK CONSTRAINT [FK_Agency_GWAagencyName_Customer_Subcustomer]
GO
