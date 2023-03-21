SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[typeofcontractpricing](
	[Unseperated] [varchar](255) NULL,
	[TypeOfContractPricing] [varchar](2) NOT NULL,
	[TypeOfContractPricingText] [nvarchar](255) NULL,
	[TypeOfContractPricing3Category] [nvarchar](50) NULL,
	[TypeOfContractPricing5Category] [nvarchar](50) NULL,
	[IsCostBased] [bit] NULL,
	[IsFixedPrice] [bit] NULL,
	[IsCombination] [bit] NULL,
	[IsLabeled] [bit] NULL,
	[IsFFPorNoFee] [bit] NULL,
	[IsFixedFee] [nchar](10) NULL,
	[IsAwardFee] [bit] NULL,
	[IsIncentive] [bit] NULL,
	[IsOtherFee] [bit] NULL,
	[FeeType] [varchar](25) NULL,
	[PricingFee] [varchar](20) NULL,
 CONSTRAINT [typeofcontractpricing_key] PRIMARY KEY CLUSTERED 
(
	[TypeOfContractPricing] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[typeofcontractpricing] ADD  CONSTRAINT [DF__typeofcon__IsAwa__7D6461A5]  DEFAULT ((0)) FOR [IsAwardFee]
GO
