SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[SourceSubcategory](
	[SourceCategoryCode] [smallint] NOT NULL,
	[SourceCategoryName] [varchar](50) NULL,
	[SourceSubcategory] [smallint] NOT NULL,
	[SourceSubcategoryName] [varchar](50) NULL,
 CONSTRAINT [pk_SourceSubcategory] PRIMARY KEY CLUSTERED 
(
	[SourceCategoryCode] ASC,
	[SourceSubcategory] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
