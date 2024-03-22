SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[PSCAtransition](
	[productorservicecode] [varchar](4) NOT NULL,
	[fiscal_year_gt_2020] [bit] NOT NULL,
	[product_or_service_code_description] [varchar](255) NULL,
	[minofsignedyear] [int] NULL,
	[maxofsignedyear] [int] NULL,
	[minoflast_modified_year] [int] NULL,
	[maxoflast_modified_year] [int] NULL,
	[PlatformPortfolio] [varchar](30) NULL,
	[ProductServiceOrRnDarea] [varchar](49) NULL,
	[RnD_budgetActivity] [varchar](49) NULL,
 CONSTRAINT [pk_PSCAtransition] PRIMARY KEY CLUSTERED 
(
	[productorservicecode] ASC,
	[fiscal_year_gt_2020] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
