SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[recoveredmaterialclauses](
	[Unseperated] [varchar](255) NULL,
	[recoveredmaterialclauses] [varchar](1) NOT NULL,
	[recoveredmaterialclausesText] [nvarchar](255) NULL,
 CONSTRAINT [recoveredmaterialclauses_key] PRIMARY KEY CLUSTERED 
(
	[recoveredmaterialclauses] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
