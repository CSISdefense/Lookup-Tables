SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[ProductOrServiceCode](
	[ProductOrServiceCode] [varchar](4) NOT NULL,
	[ProductOrServiceCodeText] [varchar](100) NULL,
	[ServicesCategory] [varchar](28) NULL,
	[ProductOrServiceCode1L] [varchar](1) NULL,
	[ProductOrServiceCode2L] [varchar](2) NULL,
	[ProductOrServiceCode2R] [varchar](2) NULL,
	[ProductOrServiceCode1L1R] [varchar](2) NULL,
	[Simple] [varchar](8) NULL,
	[HostNation3Category] [varchar](100) NULL,
	[Unseperated] [nchar](10) NULL,
	[IsService] [bit] NULL,
	[IsCatchAllCode] [bit] NULL,
	[DoDportfolioGroup] [varchar](100) NULL,
	[DoDportfolio] [varchar](100) NULL,
	[DoDportfolioCategory] [varchar](100) NULL,
	[DoDportfolioSubCategory] [varchar](100) NULL,
	[PlatformPortfolio] [varchar](30) NULL,
	[ProductsCategory] [varchar](28) NULL,
	[ProductOrServiceArea] [varchar](28) NULL,
	[isRnD1to5] [bit] NULL,
	[PBLscore] [smallint] NULL,
	[IsPossibleReclassification] [bit] NULL,
	[IsPossibleSoftwareEngineering] [varchar](255) NULL,
	[RnD_BudgetActivity] [varchar](100) NULL,
	[ProductServiceOrRnDarea] [varchar](49) NULL,
	[CanadaSector] [nvarchar](75) NULL,
	[OCOcrisisScore] [smallint] NULL,
	[VAPortfolio] [varchar](255) NULL,
	[OCOcrisisPercent] [decimal](19, 4) NULL,
	[CrisisPercent] [decimal](19, 4) NULL,
	[CrisisProductOrServiceArea] [varchar](28) NULL,
	[IsRnDdefenseSystem] [bit] NULL,
	[Level1_Code] [decimal](4, 0) NULL,
	[Level1_Category] [varchar](75) NULL,
	[Level2_Code] [decimal](4, 2) NULL,
	[Level2_Category] [varchar](75) NULL,
	[GreenEnergy] [varchar](20) NULL,
	[BioRelated] [varchar](25) NULL,
	[IsPossibleC2] [bit] NULL,
	[IsRemotelyOperated] [bit] NULL,
	[AsAServiceLaborProduct] [varchar](15) NULL,
 CONSTRAINT [PK_ProductOrServiceCode] PRIMARY KEY CLUSTERED 
(
	[ProductOrServiceCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH NOCHECK ADD  CONSTRAINT [FK__ProductOr__Canad__7FC1AB63] FOREIGN KEY([CanadaSector])
REFERENCES [ProductOrServiceCode].[CanadaSector] ([CanadaSector])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode] CHECK CONSTRAINT [FK__ProductOr__Canad__7FC1AB63]
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH CHECK ADD FOREIGN KEY([CrisisProductOrServiceArea])
REFERENCES [ProductOrServiceCode].[CrisisProductOrServiceArea] ([CrisisProductOrServiceArea])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH CHECK ADD FOREIGN KEY([HostNation3Category])
REFERENCES [ProductOrServiceCode].[HostNation3Category] ([HostNation3Category])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH NOCHECK ADD  CONSTRAINT [FK__ProductOr__Produ__03C74671] FOREIGN KEY([ProductServiceOrRnDarea])
REFERENCES [ProductOrServiceCode].[ProductServiceOrRnDarea] ([ProductServiceOrRnDarea])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode] CHECK CONSTRAINT [FK__ProductOr__Produ__03C74671]
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH CHECK ADD FOREIGN KEY([ProductsCategory])
REFERENCES [ProductOrServiceCode].[ProductsCategory] ([ProductsCategory])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH CHECK ADD FOREIGN KEY([Simple])
REFERENCES [ProductOrServiceCode].[Simple] ([Simple])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDSTypeTable_ProductOrServiceCode_PlatformPortfolio] FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode] CHECK CONSTRAINT [fk_FPDSTypeTable_ProductOrServiceCode_PlatformPortfolio]
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH NOCHECK ADD  CONSTRAINT [fk_ProductOrServiceCode_ProductOrServiceArea] FOREIGN KEY([ProductOrServiceArea])
REFERENCES [ProductOrServiceCode].[ProductOrServiceArea] ([ProductOrServiceArea])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode] CHECK CONSTRAINT [fk_ProductOrServiceCode_ProductOrServiceArea]
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode]  WITH NOCHECK ADD  CONSTRAINT [fk_ProductOrServiceCode_ServicesCategory] FOREIGN KEY([ServicesCategory])
REFERENCES [ProductOrServiceCode].[ServicesCategory] ([ServicesCategory])
GO
ALTER TABLE [FPDSTypeTable].[ProductOrServiceCode] CHECK CONSTRAINT [fk_ProductOrServiceCode_ServicesCategory]
GO
