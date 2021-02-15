SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[costorpricingdata](
	[Unseperated] [varchar](255) NULL,
	[costorpricingdata] [varchar](1) NOT NULL,
	[costorpricingdataText] [nvarchar](255) NULL,
 CONSTRAINT [costorpricingdata_key] PRIMARY KEY CLUSTERED 
(
	[costorpricingdata] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
