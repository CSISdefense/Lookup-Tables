USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[useofepadesignatedproducts](
	[Unseperated] [varchar](255) NULL,
	[useofepadesignatedproducts] [varchar](1) NOT NULL,
	[useofepadesignatedproductsText] [nvarchar](255) NULL,
 CONSTRAINT [useofepadesignatedproducts_key] PRIMARY KEY CLUSTERED 
(
	[useofepadesignatedproducts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
