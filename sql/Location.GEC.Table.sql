SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[GEC](
	[GEC] [varchar](2) NOT NULL,
	[Entity] [varchar](50) NULL,
	[CountryText] [varchar](2) NULL,
	[ISOalpha2] [varchar](2) NULL,
	[ISOalpha3] [nvarchar](3) NULL,
	[ISOnumerical] [int] NULL,
	[Region] [nvarchar](255) NULL,
	[War] [nvarchar](255) NULL,
 CONSTRAINT [pk_GEC] PRIMARY KEY CLUSTERED 
(
	[GEC] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Location].[GEC]  WITH NOCHECK ADD  CONSTRAINT [fk_location_GEC_ISOalpha3] FOREIGN KEY([ISOalpha3])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
ALTER TABLE [Location].[GEC] CHECK CONSTRAINT [fk_location_GEC_ISOalpha3]
GO
