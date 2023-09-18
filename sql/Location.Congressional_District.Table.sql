SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[Congressional_District](
	[congressional_district] [varchar](22) NOT NULL,
 CONSTRAINT [pk_location_congressional_district] PRIMARY KEY CLUSTERED 
(
	[congressional_district] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
