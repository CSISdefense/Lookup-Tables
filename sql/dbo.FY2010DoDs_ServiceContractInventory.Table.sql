USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FY2010DoDs_ServiceContractInventory](
	[Contract Record ID] [varchar](255) NULL,
	[Contracted Function  (PSC Code)] [varchar](255) NULL,
	[Function Description  (PSC Description)] [varchar](255) NULL,
	[Mission  Taxonomy "Portfolio Group"] [varchar](255) NULL,
	[Mission  Taxonomy "Portfolio"] [varchar](255) NULL,
	[Description of Requirement] [varchar](4000) NULL,
	[Contract Pricing Type] [varchar](255) NULL,
	[Date Signed (FY in Inventory)] [varchar](255) NULL,
	[Extent Competed] [varchar](255) NULL,
	[# of Offers Received] [varchar](255) NULL,
	[CO Bus Size Determination] [varchar](255) NULL,
	[CCR SBA Cert SDB] [varchar](255) NULL,
	[CCR Women Owned] [varchar](255) NULL,
	[Contracting Agency Name] [varchar](255) NULL,
	[Echelon II Buyer] [varchar](255) NULL,
	[Contracting Office Name] [varchar](255) NULL,
	[Funding Agency Name] [varchar](255) NULL,
	[Funding Office Name] [varchar](255) NULL,
	[Appropriation (TAS #)] [varchar](255) NULL,
	[Personal Service] [varchar](255) NULL,
	[Obligation Amount] [varchar](255) NULL,
	[Contractor FTEs] [varchar](255) NULL,
	[Agency  ODA  Comments] [varchar](4000) NULL
) ON [PRIMARY]
GO
