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
	[IsEntityAbove2016constantArbitrary1000k] [bit] NULL,
	[IsEntityAbove2018constant10ThousandThreshold] [bit] NULL,
	[IsEntityAbove2016constantMTAthreshold] [bit] NULL,
	[IsEntityAbove1990constantMTAthreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[ObligatedAmount] [decimal](38, 4) NULL,
	[ObligatedAmountIsSmall] [decimal](38, 4) NULL,
	[NumberOfActions] [bigint] NULL,
	[Top100Federal] [bit] NULL,
	[Top6] [bit] NULL,
	[UnknownCompany] [bit] NULL,
	[IsEntityAbove2018constantSimplifedAcquisition250kThreshold] [bit] NULL,
	[IsEntityAbove2018constantCommercialItem7500k] [bit] NULL,
	[IsEntityAbove2018constantCostAccounting2000kThreshold] [bit] NULL
) ON [PRIMARY]
GO
