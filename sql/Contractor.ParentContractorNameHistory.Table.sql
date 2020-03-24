USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contractor].[ParentContractorNameHistory](
	[ParentID] [nvarchar](255) NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[CSISname] [nvarchar](255) NULL,
	[LongName] [nvarchar](255) NULL,
	[SourceURL] [nvarchar](255) NULL,
	[TopStandardizedVendorName] [nvarchar](150) NULL,
	[MaxOfTopVendorNameTotalAmount] [decimal](19, 4) NULL,
	[SumOfTotalAmount] [decimal](19, 4) NULL,
	[CSISmodifiedDate] [datetime] NULL,
	[CSIScreateddate] [datetime] NULL,
	[CSISmodifiedBy] [nvarchar](128) NULL,
 CONSTRAINT [pk_ParentName] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC,
	[FiscalYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
ALTER TABLE [Contractor].[ParentContractorNameHistory]  WITH NOCHECK ADD  CONSTRAINT [fk_Contractor_ParentContractorNameHistory_ParentID] FOREIGN KEY([ParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Contractor].[ParentContractorNameHistory] CHECK CONSTRAINT [fk_Contractor_ParentContractorNameHistory_ParentID]
GO
ALTER TABLE [Contractor].[ParentContractorNameHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_ParentContractorNameHistory_standardizedvendorname] FOREIGN KEY([TopStandardizedVendorName])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Contractor].[ParentContractorNameHistory] CHECK CONSTRAINT [FK_ParentContractorNameHistory_standardizedvendorname]
GO
