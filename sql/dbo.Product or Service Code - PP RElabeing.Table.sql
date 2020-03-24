USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product or Service Code - PP RElabeing](
	[ProductOrServiceCode] [varchar](4) NULL,
	[ProductOrServiceCodeText] [varchar](100) NULL,
	[ServicesCategory] [varchar](74) NULL,
	[ProductOrServiceCode1L] [varchar](56) NULL,
	[ProductOrServiceCode2L] [varchar](35) NULL,
	[ProductOrServiceCode2R] [varchar](26) NULL,
	[ProductOrServiceCode1L1R] [varchar](8) NULL,
	[Simple] [varchar](8) NULL,
	[HostNation3Category] [varchar](12) NULL,
	[Unseperated] [varchar](12) NULL,
	[IsService] [varchar](9) NULL,
	[IsCatchAllCode] [varchar](9) NULL,
	[DoDportfolioGroup] [varchar](40) NULL,
	[DoDportfolio] [varchar](44) NULL,
	[DoDportfolioCategory] [varchar](52) NULL,
	[DoDportfolioSubCategory] [varchar](53) NULL,
	[New Platform Portfolio] [varchar](48) NULL,
	[OldPlatformPortfolio] [varchar](48) NULL,
	[ProductsCategory] [varchar](43) NULL,
	[ProductOrServiceArea] [varchar](37) NULL,
	[isRnD1to5] [varchar](35) NULL,
	[PBLscore] [varchar](35) NULL,
	[IsPossibleReclassification] [varchar](30) NULL,
	[IsPossibleSoftwareEngineering] [varchar](30) NULL,
	[RnD_BudgetActivity] [varchar](49) NULL,
	[ProductServiceOrRnDarea] [varchar](49) NULL,
	[CanadaSector] [varchar](49) NULL,
	[OCOcrisisScore] [varchar](49) NULL,
	[VAPortfolio] [varchar](29) NULL
)

GO
SET ANSI_PADDING OFF
GO
