SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[useofepadesignatedproducts](
	[Unseperated] [varchar](255) NULL,
	[useofepadesignatedproducts] [varchar](1) NOT NULL,
	[useofepadesignatedproductsText] [nvarchar](255) NULL,
 CONSTRAINT [useofepadesignatedproducts_key] PRIMARY KEY CLUSTERED 
(
	[useofepadesignatedproducts] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
