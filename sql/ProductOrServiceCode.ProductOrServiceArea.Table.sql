USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ProductOrServiceCode].[ProductOrServiceArea](
	[ProductOrServiceArea] [varchar](28) NOT NULL,
	[SimpleBucket] [varchar](8) NULL,
	[IsService] [bit] NULL,
	[PlatformPortfolio] [varchar](30) NULL,
	[ProductsCategory] [varchar](28) NULL,
	[ServicesCategory] [varchar](28) NULL,
 CONSTRAINT [PK__ProductO__A027931C831F5CF0] PRIMARY KEY CLUSTERED 
(
	[ProductOrServiceArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [ProductOrServiceCode].[ProductOrServiceArea]  WITH NOCHECK ADD  CONSTRAINT [FK__ProductOr__Platf__7C703D6C] FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [ProductOrServiceCode].[ProductOrServiceArea] CHECK CONSTRAINT [FK__ProductOr__Platf__7C703D6C]
GO
ALTER TABLE [ProductOrServiceCode].[ProductOrServiceArea]  WITH CHECK ADD FOREIGN KEY([ProductsCategory])
REFERENCES [ProductOrServiceCode].[ProductsCategory] ([ProductsCategory])
GO
ALTER TABLE [ProductOrServiceCode].[ProductOrServiceArea]  WITH CHECK ADD FOREIGN KEY([ServicesCategory])
REFERENCES [ProductOrServiceCode].[ServicesCategory] ([ServicesCategory])
GO
ALTER TABLE [ProductOrServiceCode].[ProductOrServiceArea]  WITH CHECK ADD  CONSTRAINT [fk_ProductOrServiceCode_ProductOrServiceArea_SimpleBucket] FOREIGN KEY([SimpleBucket])
REFERENCES [ProductOrServiceCode].[Simple] ([Simple])
GO
ALTER TABLE [ProductOrServiceCode].[ProductOrServiceArea] CHECK CONSTRAINT [fk_ProductOrServiceCode_ProductOrServiceArea_SimpleBucket]
GO
