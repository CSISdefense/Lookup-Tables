SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[FlatFileErrors](
	[Flat File Source Error Output Column] [text] NULL,
	[FileErrorCode] [int] NULL,
	[FileErrorColumn] [int] NULL,
	[FileErrorDescription] [varchar](255) NULL,
	[FileCSISCreatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
