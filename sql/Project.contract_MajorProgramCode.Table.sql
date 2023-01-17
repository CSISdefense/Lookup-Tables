SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[contract_MajorProgramCode](
	[majorprogramcode] [nvarchar](255) NULL,
	[MajorProgramText] [nvarchar](255) NULL,
	[Remotely_Crewed] [nvarchar](25) NULL,
	[MajorProgramCode_row_number] [int] NOT NULL,
	[UAS] [nvarchar](5) NULL,
	[CUAS] [nvarchar](5) NULL,
	[Maritime] [nvarchar](5) NULL,
	[mq] [nvarchar](5) NULL,
	[rq] [nvarchar](5) NULL,
	[any_uas] [nvarchar](5) NULL
) ON [PRIMARY]
GO
