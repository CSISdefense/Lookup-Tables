SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[informationtechnologycommercialitemcategory](
	[Unseperated] [varchar](255) NULL,
	[informationtechnologycommercialitemcategory] [varchar](30) NOT NULL,
	[informationtechnologycommercialitemcategoryText] [nvarchar](255) NULL,
	[IsCommercial] [bit] NULL,
	[IsNonDevelopmental] [bit] NULL,
 CONSTRAINT [informationtechnologycommercialitemcategory_key] PRIMARY KEY CLUSTERED 
(
	[informationtechnologycommercialitemcategory] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
