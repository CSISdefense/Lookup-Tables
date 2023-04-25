SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[walshhealyact](
	[Unseperated] [varchar](255) NULL,
	[walshhealyact] [varchar](1) NOT NULL,
	[walshhealyactText] [nvarchar](255) NULL,
 CONSTRAINT [PK_walshhealyact NO PK] PRIMARY KEY CLUSTERED 
(
	[walshhealyact] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
