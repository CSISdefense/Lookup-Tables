SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[MajorProgramCode](
	[majorprogramcode] [varchar](104) NOT NULL,
	[MajorProgramText] [varchar](104) NULL,
	[MajorProgramCode_row_number] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [pk_majorprogramcode] PRIMARY KEY CLUSTERED 
(
	[majorprogramcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
