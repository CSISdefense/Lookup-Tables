USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[NewPP](
	[ProductOrServiceCode] [varchar](max) NULL,
	[New Platform Portfolio] [varchar](50) NULL,
	[OldPlatformPortfolio] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
