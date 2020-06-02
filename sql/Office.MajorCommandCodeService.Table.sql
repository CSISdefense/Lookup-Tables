SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[MajorCommandCodeService](
	[CODE] [varchar](2) NULL,
	[SERVICE] [varchar](50) NULL,
	[MajorCommandCode] [varchar](24) NOT NULL,
	[DESCRIPTION] [varchar](100) NULL
) ON [PRIMARY]
GO
