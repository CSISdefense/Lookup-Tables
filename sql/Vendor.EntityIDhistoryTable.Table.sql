SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[EntityIDhistoryTable](
	[EntityID] [int] NULL,
	[fiscal_year] [smallint] NULL,
	[EntityText] [nvarchar](255) NULL,
	[EntityCategory] [varchar](8) NULL,
	[EntitySizeCode] [varchar](1) NULL,
	[IsEntityAbove2016constantOneMillionThreshold] [bit] NULL,
	[IsEntityAbove2018constant10ThousandThreshold] [bit] NULL,
	[IsEntityAbove2016constantReportingThreshold] [bit] NULL,
	[IsEntityAbove1990constantReportingThreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[ObligatedAmount] [decimal](38, 4) NULL,
	[ObligatedAmountIsSmall] [decimal](38, 4) NULL,
	[NumberOfActions] [bigint] NULL,
	[Top100Federal] [bit] NULL,
	[Top6] [bit] NULL,
	[UnknownCompany] [bit] NULL
) ON [PRIMARY]
GO
