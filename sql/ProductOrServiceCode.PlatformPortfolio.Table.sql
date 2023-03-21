SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[PlatformPortfolio](
	[PlatformPortfolio] [varchar](30) NOT NULL,
	[IsLikelyInterlinked] [bit] NULL,
	[ProductOrServiceArea] [varchar](28) NULL,
	[IsPlatform] [bit] NULL,
	[NewPlatformPortfolio] [varchar](30) NULL,
	[IsPlatformWeaponOrSystem] [bit] NOT NULL,
 CONSTRAINT [PK_PlayformPortfolio] PRIMARY KEY CLUSTERED 
(
	[PlatformPortfolio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ProductOrServiceCode].[PlatformPortfolio] ADD  CONSTRAINT [DF__PlatformP__IsWea__21ACAF13]  DEFAULT ((0)) FOR [IsPlatformWeaponOrSystem]
GO
ALTER TABLE [ProductOrServiceCode].[PlatformPortfolio]  WITH NOCHECK ADD  CONSTRAINT [FK__PlatformP__NewPl__7E6372D6] FOREIGN KEY([NewPlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [ProductOrServiceCode].[PlatformPortfolio] CHECK CONSTRAINT [FK__PlatformP__NewPl__7E6372D6]
GO
