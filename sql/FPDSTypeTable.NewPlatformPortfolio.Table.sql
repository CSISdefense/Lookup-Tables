USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[NewPlatformPortfolio](
	[ProductOrServiceCode] [varchar](50) NULL,
	[ProductOrServiceCodeText] [varchar](50) NULL,
	[ServicesCategory] [varchar](50) NULL,
	[ProductOrServiceCode1L] [varchar](50) NULL,
	[ProductOrServiceCode2L] [varchar](50) NULL,
	[ProductOrServiceCode2R] [varchar](50) NULL,
	[ProductOrServiceCode1L1R] [varchar](50) NULL,
	[Simple] [varchar](50) NULL,
	[HostNation3Category] [varchar](50) NULL,
	[Unseperated] [varchar](50) NULL,
	[IsService] [varchar](50) NULL,
	[IsCatchAllCode] [varchar](50) NULL,
	[DoDportfolioGroup] [varchar](50) NULL,
	[DoDportfolio] [varchar](50) NULL,
	[DoDportfolioCategory] [varchar](50) NULL,
	[DoDportfolioSubCategory] [varchar](50) NULL,
	[New Platform Portfolio] [varchar](50) NULL,
	[OldPlatformPortfolio] [varchar](50) NULL,
	[ProductsCategory] [varchar](50) NULL,
	[ProductOrServiceArea] [varchar](50) NULL,
	[isRnD1to5] [varchar](50) NULL,
	[PBLscore] [varchar](50) NULL,
	[IsPossibleReclassification] [varchar](50) NULL,
	[IsPossibleSoftwareEngineering] [varchar](50) NULL,
	[RnD_BudgetActivity] [varchar](50) NULL,
	[ProductServiceOrRnDarea] [varchar](50) NULL,
	[CanadaSector] [varchar](50) NULL,
	[OCOcrisisScore] [varchar](50) NULL,
	[VAPortfolio] [varchar](50) NULL
) ON [PRIMARY]
GO
