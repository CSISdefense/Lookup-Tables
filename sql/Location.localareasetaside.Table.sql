SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[localareasetaside](
	[localareasetaside] [varchar](4) NOT NULL,
	[local_area_set_aside_name] [varchar](255) NULL,
 CONSTRAINT [pk_Location_localareasetaside] PRIMARY KEY CLUSTERED 
(
	[localareasetaside] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
