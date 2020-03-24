USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ProductOrServiceCode].[S&EPortfolioGroup](
	[PSC Code] [float] NULL,
	[PSC Description] [nvarchar](255) NULL,
	[PSC Group] [float] NULL,
	[PSC Group Name] [nvarchar](255) NULL,
	[4#  Portfolio Sub-Category] [nvarchar](255) NULL,
	[3#  Portfolio Category] [nvarchar](255) NULL,
	[2#  Portfolio] [nvarchar](255) NULL,
	[1#  Portfolio Group] [nvarchar](255) NULL,
	[PSCcode] [varchar](4) NULL
)

GO
SET ANSI_PADDING OFF
GO
