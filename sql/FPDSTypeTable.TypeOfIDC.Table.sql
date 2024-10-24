SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[TypeOfIDC](
	[typeofIDC] [varchar](41) NOT NULL,
	[typeOfIDCdescription] [varchar](50) NULL,
 CONSTRAINT [pk_typeofidc] PRIMARY KEY CLUSTERED 
(
	[typeofIDC] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
