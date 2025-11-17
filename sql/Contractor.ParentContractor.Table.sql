SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contractor].[ParentContractor](
	[ParentID] [nvarchar](255) NOT NULL,
	[Ticker] [nvarchar](255) NULL,
	[ShortName] [nvarchar](255) NULL,
	[BloombergID] [nvarchar](255) NULL,
	[DIIGIndex] [bit] NOT NULL,
	[LargeGreaterThan1B] [bit] NULL,
	[LargeGreaterThan3B] [bit] NULL,
	[PMC] [bit] NULL,
	[HRFprivatemilitary] [bit] NULL,
	[SIGIRprivemilitary] [bit] NULL,
	[SIGIRDuns] [bit] NULL,
	[Subsidiary] [bit] NOT NULL,
	[MergerYear] [int] NULL,
	[RevenueInMillions] [decimal](19, 4) NULL,
	[RevenueYear] [int] NULL,
	[RevenueSourceLink] [nvarchar](255) NULL,
	[Replace] [nvarchar](255) NULL,
	[JointVenture] [bit] NOT NULL,
	[LastYear] [int] NULL,
	[FirstYear] [int] NULL,
	[SizeGuess] [bit] NOT NULL,
	[NumberOfYears] [int] NULL,
	[DACIM] [bit] NOT NULL,
	[UnknownCompany] [bit] NOT NULL,
	[FPDSannualRevenue] [int] NULL,
	[Top100Federal] [bit] NOT NULL,
	[AlwaysDisplay] [bit] NOT NULL,
	[MergerDate] [datetime] NULL,
	[MergerURL] [nvarchar](255) NULL,
	[FirstDate] [datetime] NULL,
	[FirstURL] [nvarchar](255) NULL,
	[SpunOffFrom] [nvarchar](255) NULL,
	[Big5] [bit] NOT NULL,
	[HooverID] [varchar](255) NULL,
	[LexisNexisID] [varchar](255) NULL,
	[TopStandardizedVendor] [varchar](255) NULL,
	[CSIScreatedDate] [datetime] NULL,
	[CSISmodifiedDate] [datetime] NULL,
	[CSISmodifiedBy] [nvarchar](128) NULL,
	[overrideparentdunsnumber] [bit] NULL,
	[parentheadquarterscountrycode] [nvarchar](3) NULL,
	[IsForeign] [bit] NULL,
	[isinternationalNGO] [bit] NULL,
	[isenterprise] [bit] NULL,
	[ismultilateral] [bit] NULL,
	[isngo] [bit] NULL,
	[isgovernment] [bit] NULL,
	[multilateraltype] [varchar](50) NULL,
	[isfaithbased] [bit] NULL,
	[isnetwork] [bit] NULL,
	[ispublicprivatepartnership] [bit] NULL,
	[isUniversityorResearchInstitute] [bit] NULL,
	[topISO3countrycode] [varchar](3) NULL,
	[totalamount] [decimal](19, 4) NULL,
	[topISO3countrytotalamount] [decimal](19, 4) NULL,
	[isInNeedOfInvestigation] [bit] NULL,
	[isoverrideISO3countrycode] [bit] NULL,
	[isnonprofit] [bit] NULL,
	[IsPreBig5] [bit] NULL,
	[IsSiliconValley] [bit] NULL,
	[EntityID] [int] NULL,
	[Abbreviation] [varchar](5) NULL,
	[PlatformPortfolio] [varchar](30) NULL,
	[Top100SIPRI] [bit] NULL,
 CONSTRAINT [PK_ParentContractor] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [u_contractor_parentcontractor_abbreviation] ON [Contractor].[ParentContractor]
(
	[Abbreviation] ASC
)
WHERE ([Abbreviation] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_DIIGindex]  DEFAULT ((0)) FOR [DIIGIndex]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_subsidiary]  DEFAULT ((0)) FOR [Subsidiary]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_jointventure]  DEFAULT ((0)) FOR [JointVenture]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_sizeguess]  DEFAULT ((0)) FOR [SizeGuess]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_dacim]  DEFAULT ((0)) FOR [DACIM]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_unknowncompany]  DEFAULT ((0)) FOR [UnknownCompany]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_top100federal]  DEFAULT ((0)) FOR [Top100Federal]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_alwaysdisplay]  DEFAULT ((0)) FOR [AlwaysDisplay]
GO
ALTER TABLE [Contractor].[ParentContractor] ADD  CONSTRAINT [DF_contractor_parentcontractor_top6]  DEFAULT ((0)) FOR [Big5]
GO
ALTER TABLE [Contractor].[ParentContractor]  WITH NOCHECK ADD  CONSTRAINT [FK__ParentCon__Entit__48FB865E] FOREIGN KEY([EntityID])
REFERENCES [Vendor].[EntityID] ([EntityID])
GO
ALTER TABLE [Contractor].[ParentContractor] CHECK CONSTRAINT [FK__ParentCon__Entit__48FB865E]
GO
ALTER TABLE [Contractor].[ParentContractor]  WITH CHECK ADD FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [Contractor].[ParentContractor]  WITH NOCHECK ADD  CONSTRAINT [FK_parentcontractor_parentheadquarterscountrycode] FOREIGN KEY([parentheadquarterscountrycode])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
ALTER TABLE [Contractor].[ParentContractor] CHECK CONSTRAINT [FK_parentcontractor_parentheadquarterscountrycode]
GO
