SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[SourceCategoryCode](
	[SourceCategoryCode] [smallint] NOT NULL,
	[SourceCategoryName] [varchar](50) NULL,
 CONSTRAINT [pk_SourceCategoryCode] PRIMARY KEY CLUSTERED 
(
	[SourceCategoryCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[SourceCategoryCode]  WITH NOCHECK ADD  CONSTRAINT [fk_SourceSubcategory_SourceCategoryCode] FOREIGN KEY([SourceCategoryCode])
REFERENCES [budget].[SourceCategoryCode] ([SourceCategoryCode])
GO
ALTER TABLE [budget].[SourceCategoryCode] CHECK CONSTRAINT [fk_SourceSubcategory_SourceCategoryCode]
GO
