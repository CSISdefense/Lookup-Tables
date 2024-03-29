SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[seatransportation](
	[Unseperated] [varchar](255) NULL,
	[seatransportation] [varchar](1) NOT NULL,
	[seatransportationText] [nvarchar](255) NULL,
 CONSTRAINT [seatransportation_key] PRIMARY KEY CLUSTERED 
(
	[seatransportation] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
