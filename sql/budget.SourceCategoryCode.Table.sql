USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [budget].[SourceCategoryCode](
	[SourceCategoryCode] [smallint] NOT NULL,
	[SourceCategoryName] [varchar](50) NULL,
 CONSTRAINT [pk_SourceCategoryCode] PRIMARY KEY CLUSTERED 
(
	[SourceCategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [budget].[SourceCategoryCode]  WITH NOCHECK ADD  CONSTRAINT [fk_SourceSubcategory_SourceCategoryCode] FOREIGN KEY([SourceCategoryCode])
REFERENCES [budget].[SourceCategoryCode] ([SourceCategoryCode])
GO
ALTER TABLE [budget].[SourceCategoryCode] CHECK CONSTRAINT [fk_SourceSubcategory_SourceCategoryCode]
GO
