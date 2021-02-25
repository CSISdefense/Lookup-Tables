SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[davisbaconact](
	[Unseperated] [varchar](255) NULL,
	[davisbaconact] [varchar](1) NOT NULL,
	[davisbaconactText] [nvarchar](255) NULL,
 CONSTRAINT [PK_davisbaconact] PRIMARY KEY CLUSTERED 
(
	[davisbaconact] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
