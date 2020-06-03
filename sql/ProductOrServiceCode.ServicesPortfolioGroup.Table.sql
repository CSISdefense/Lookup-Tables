SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[ServicesPortfolioGroup](
	[PSC Code] [nvarchar](255) NULL,
	[PSC Description] [nvarchar](255) NULL,
	[PSC Group] [nvarchar](255) NULL,
	[4#  Category Sub-Category] [nvarchar](255) NULL,
	[3#  Portfolio Category] [nvarchar](255) NULL,
	[2#  Portfolio] [nvarchar](255) NULL,
	[1#  Portfolio Group] [nvarchar](255) NULL
) ON [PRIMARY]
GO
