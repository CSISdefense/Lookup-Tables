SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[ProjectionType](
	[ProjectionType] [varchar](10) NOT NULL,
 CONSTRAINT [pk_Budget_ProjectType] PRIMARY KEY CLUSTERED 
(
	[ProjectionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[ProjectionType]  WITH CHECK ADD  CONSTRAINT [chk_Budget_ProjectionType] CHECK  (([ProjectionType]<>''))
GO
ALTER TABLE [budget].[ProjectionType] CHECK CONSTRAINT [chk_Budget_ProjectionType]
GO
