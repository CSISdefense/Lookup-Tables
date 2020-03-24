USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipientCategories](
	[RecipientName] [varchar](255) NULL,
	[RecipientCategory] [varchar](255) NULL,
	[parentid] [varchar](255) NULL
) ON [PRIMARY]
GO
