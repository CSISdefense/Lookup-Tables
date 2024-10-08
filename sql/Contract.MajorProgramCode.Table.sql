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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
