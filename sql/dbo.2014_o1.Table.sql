SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2014_o1](
	[Account] [nvarchar](255) NULL,
	[Account Title] [nvarchar](255) NULL,
	[Organization] [nvarchar](255) NULL,
	[Budget_Activity] [nvarchar](255) NULL,
	[Budget Activity Title] [nvarchar](255) NULL,
	[AG Title] [nvarchar](255) NULL,
	[Line_Number] [nvarchar](255) NULL,
	[SAG] [nvarchar](255) NULL,
	[SAG Title] [nvarchar](255) NULL,
	[Include_in_TOA] [nvarchar](255) NULL,
	[FY 2012_(Base & OCO)] [float] NULL,
	[FY 2013_Base Request_with CR Adj*] [float] NULL,
	[FY 2013_OCO Request_with CR Adj*] [float] NULL,
	[FY 2013_Total Request_with CR Adj*] [float] NULL,
	[FY 2014_Base] [float] NULL,
	[FY 2014_OCO] [float] NULL,
	[FY 2014_Total] [float] NULL,
	[Classification] [nvarchar](255) NULL
) ON [PRIMARY]
GO
