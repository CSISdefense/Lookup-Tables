SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[AgencyIDtoTop20Lists](
	[ID] [int] NOT NULL,
	[Customer] [nvarchar](255) NULL,
	[Gets_top_20] [bit] NOT NULL
) ON [PRIMARY]
GO
