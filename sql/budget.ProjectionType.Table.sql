SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[ProjectionType](
	[ProjectionType] [varchar](10) NOT NULL,
 CONSTRAINT [pk_Budget_ProjectType] PRIMARY KEY CLUSTERED 
(
	[ProjectionType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[ProjectionType]  WITH CHECK ADD  CONSTRAINT [chk_Budget_ProjectionType] CHECK  (([ProjectionType]<>''))
GO
ALTER TABLE [budget].[ProjectionType] CHECK CONSTRAINT [chk_Budget_ProjectionType]
GO
