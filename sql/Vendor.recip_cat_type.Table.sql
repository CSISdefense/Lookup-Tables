SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[recip_cat_type](
	[Unseperated] [varchar](255) NULL,
	[recip_cat_type] [varchar](1) NOT NULL,
	[recip_cat_type_text] [varchar](25) NULL,
 CONSTRAINT [PK__recip_ca__2ED3C2A7B97F6777] PRIMARY KEY CLUSTERED 
(
	[recip_cat_type] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
