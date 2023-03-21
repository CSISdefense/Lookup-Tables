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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
