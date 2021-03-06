SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[statecode](
	[Unseperated] [varchar](255) NULL,
	[statecode] [varchar](2) NOT NULL,
	[statecodeText] [nvarchar](255) NULL,
	[USA] [bit] NULL,
	[COCOM] [varchar](8) NULL,
 CONSTRAINT [statecode_key] PRIMARY KEY CLUSTERED 
(
	[statecode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
