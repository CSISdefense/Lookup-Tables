SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[subcontractplan](
	[Unseperated] [varchar](255) NULL,
	[subcontractplan] [varchar](1) NOT NULL,
	[subcontractplanText] [nvarchar](255) NULL,
 CONSTRAINT [subcontractplan_key] PRIMARY KEY CLUSTERED 
(
	[subcontractplan] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
