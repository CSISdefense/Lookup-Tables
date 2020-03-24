USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductOrServiceCodes](
	[ProductOrServiceCode] [varchar](255) NULL,
	[ProductOrServiceCodeText] [varchar](255) NULL,
	[ServicesCategory] [varchar](255) NULL,
	[ProductOrServiceCode1L] [varchar](255) NULL,
	[ProductOrServiceCode2L] [varchar](255) NULL,
	[ProductOrServiceCode2R] [varchar](255) NULL,
	[ProductOrServiceCode1L1R] [varchar](255) NULL,
	[Simple] [varchar](255) NULL,
	[HostNation3Category] [varchar](255) NULL,
	[Unseperated] [varchar](255) NULL,
	[IsService] [varchar](255) NULL,
	[IsCatchAllCode] [varchar](255) NULL,
	[DoDportfolioGroup] [varchar](255) NULL,
	[DoDportfolio] [varchar](255) NULL,
	[DoDportfolioCategory] [varchar](255) NULL,
	[DoDportfolioSubCategory] [varchar](255) NULL,
	[PlatformPortfolio] [varchar](255) NULL,
	[ProductsCategory] [varchar](255) NULL,
	[ProductOrServiceArea] [varchar](255) NULL,
	[isRnD1to5] [varchar](255) NULL,
	[PBLscore] [varchar](255) NULL,
	[IsPossibleReclassification] [varchar](255) NULL,
	[IsPossibleSoftwareEngineering] [varchar](255) NULL,
	[RnD_BudgetActivity] [varchar](255) NULL,
	[ProductServiceOrRnDarea] [varchar](255) NULL,
	[CanadaSector] [varchar](255) NULL,
	[OCOcrisisScore] [varchar](255) NULL,
	[VAPortfolio] [varchar](255) NULL,
	[NewPlatformPortfolio] [varchar](255) NULL,
	[OCOcrisisPercent] [varchar](255) NULL,
	[CrisisPercent] [varchar](255) NULL,
	[CrisisProductOrServiceArea] [varchar](255) NULL
)

GO
SET ANSI_PADDING OFF
GO
