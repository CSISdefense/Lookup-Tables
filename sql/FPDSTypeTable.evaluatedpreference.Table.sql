SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[evaluatedpreference](
	[Unseperated] [varchar](255) NULL,
	[evaluatedpreference] [varchar](6) NOT NULL,
	[evaluatedpreferenceText] [varchar](255) NULL,
 CONSTRAINT [PK_evaluatedpreference] PRIMARY KEY CLUSTERED 
(
	[evaluatedpreference] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
