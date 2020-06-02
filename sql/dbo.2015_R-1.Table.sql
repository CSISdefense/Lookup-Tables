SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2015_R-1](
	[Account] [nvarchar](255) NULL,
	[Account Title] [nvarchar](255) NULL,
	[Organization] [nvarchar](255) NULL,
	[Budget_Activity] [nvarchar](255) NULL,
	[Budget Activity Title] [nvarchar](255) NULL,
	[Line_Number] [nvarchar](255) NULL,
	[PE] [nvarchar](255) NULL,
	[Program Element Title] [nvarchar](255) NULL,
	[Include_in_TOA] [nvarchar](255) NULL,
	[FY 2013_(Base & OCO)] [float] NULL,
	[FY 2014_Base Enacted] [float] NULL,
	[FY 2014_OCO Enacted] [float] NULL,
	[FY 2014_Total Enacted] [float] NULL,
	[FY 2015_Base] [float] NULL,
	[FY 2015_OCO] [float] NULL,
	[FY 2015_Total] [float] NULL,
	[Classification] [nvarchar](255) NULL
) ON [PRIMARY]
GO
