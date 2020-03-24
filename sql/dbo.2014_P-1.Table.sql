USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2014_P-1](
	[Account] [nvarchar](255) NULL,
	[Account Title] [nvarchar](255) NULL,
	[Organization] [nvarchar](255) NULL,
	[Budget_Activity] [nvarchar](255) NULL,
	[Budget Activity Title] [nvarchar](255) NULL,
	[Line_Number] [nvarchar](255) NULL,
	[BSA] [nvarchar](255) NULL,
	[BSA Title] [nvarchar](255) NULL,
	[Line Item] [nvarchar](255) NULL,
	[Line Item Title] [nvarchar](255) NULL,
	[Cost_Type] [nvarchar](255) NULL,
	[Cost Type Title] [nvarchar](255) NULL,
	[Add/_Non-Add] [nvarchar](255) NULL,
	[FY 2012_(Base & OCO)_Quantity] [float] NULL,
	[FY 2012_(Base & OCO)_Amount] [float] NULL,
	[FY 2013_Base Request_with CR Adj*_Quantity] [float] NULL,
	[FY 2013_Base Request_with CR Adj*_Amount] [float] NULL,
	[FY 2013_OCO Request_with CR Adj*_Quantity] [float] NULL,
	[FY 2013_OCO Request_with CR Adj*_Amount] [float] NULL,
	[FY 2013_Total Request_with CR Adj*_Quantity] [float] NULL,
	[FY 2013_Total Request_with CR Adj*_Amount] [float] NULL,
	[FY 2014_Base_Quantity] [float] NULL,
	[FY 2014_Base_Amount] [float] NULL,
	[FY 2014_OCO_Quantity] [float] NULL,
	[FY 2014_OCO_Amount] [float] NULL,
	[FY 2014_Total_Quantity] [float] NULL,
	[FY 2014_Total_Amount] [float] NULL,
	[Classification] [nvarchar](255) NULL
)

GO
