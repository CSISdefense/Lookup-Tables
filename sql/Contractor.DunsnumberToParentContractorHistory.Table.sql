USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contractor].[DunsnumberToParentContractorHistory](
	[DUNSnumber] [varchar](13) NOT NULL,
	[CEC] [varchar](13) NULL,
	[FiscalYear] [smallint] NOT NULL,
	[ParentID] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[TooHard] [bit] NOT NULL,
	[ObligatedAmount] [decimal](19, 4) NULL,
	[TopVendorNameTotalAmount] [decimal](19, 4) NULL,
	[NotableSubdivision] [bit] NOT NULL,
	[SubdivisionName] [nvarchar](50) NULL,
	[StandardizedTopContractor] [nvarchar](150) NULL,
	[Parentdunsnumber] [varchar](13) NULL,
	[CSISmodifiedDate] [datetime] NULL,
	[CSIScreateddate] [datetime] NULL,
	[CSISmodifiedBy] [nvarchar](128) NULL,
	[fed_funding_amount] [decimal](19, 4) NULL,
	[TotalAmount] [decimal](19, 4) NULL,
	[topISO3countrycode] [varchar](3) NULL,
	[topISO3countrytotalamount] [decimal](19, 4) NULL,
	[MaxOfCSIScontractIDObligatedAmount] [decimal](19, 4) NULL,
	[CAGE] [varchar](5) NULL,
	[HeadquarterCode] [varchar](13) NULL,
	[AnyIsSmall] [bit] NULL,
	[AlwaysIsSmall] [bit] NULL,
	[ObligatedAmountIsSmall] [decimal](19, 4) NULL,
	[IsOnePercentPlusSmall] [bit] NULL,
	[EntitySizeCode] [varchar](1) NULL,
	[IsEntityAbove1990constantReportingThreshold] [bit] NULL,
	[IsEntityAbove2016constantReportingThreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[IsEntityAbove2016constantOneMillionThreshold] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[ChildCount] [int] NULL,
	[IsPresent] [bit] NULL,
 CONSTRAINT [pk_DunsnumberToParentContractorHistory_DunsNumber_FiscalYear] PRIMARY KEY CLUSTERED 
(
	[DUNSnumber] ASC,
	[FiscalYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] ADD  CONSTRAINT [DF_DunsnumberToParentContractorHistory_TooHard]  DEFAULT ((0)) FOR [TooHard]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] ADD  CONSTRAINT [DF_DunsnumberToParentContractorHistory_NotableSubdivision]  DEFAULT ((0)) FOR [NotableSubdivision]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory]  WITH NOCHECK ADD  CONSTRAINT [FK__Dunsnumbe__Entit__4EB45FB4] FOREIGN KEY([EntitySizeCode])
REFERENCES [Vendor].[EntitySizeCode] ([EntitySizeCode])
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] CHECK CONSTRAINT [FK__Dunsnumbe__Entit__4EB45FB4]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory]  WITH NOCHECK ADD  CONSTRAINT [FK__Dunsnumbe__Headq__7AF2094E] FOREIGN KEY([HeadquarterCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] CHECK CONSTRAINT [FK__Dunsnumbe__Headq__7AF2094E]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_DunsnumberToParentContractor_Dunsnumber] FOREIGN KEY([DUNSnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] CHECK CONSTRAINT [FK_DunsnumberToParentContractor_Dunsnumber]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_DunsnumberToParentContractor_ParentDunsnumber] FOREIGN KEY([Parentdunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] CHECK CONSTRAINT [FK_DunsnumberToParentContractor_ParentDunsnumber]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_DunsnumberToParentContractor_parentid] FOREIGN KEY([ParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] CHECK CONSTRAINT [FK_DunsnumberToParentContractor_parentid]
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_DunsnumberToParentContractorHistory_StandardizedTopContractor] FOREIGN KEY([StandardizedTopContractor])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contractor].[DunsnumberToParentContractorHistory] CHECK CONSTRAINT [fk_DunsnumberToParentContractorHistory_StandardizedTopContractor]
GO
