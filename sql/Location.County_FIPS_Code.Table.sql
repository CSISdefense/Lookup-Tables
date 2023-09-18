SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[County_FIPS_Code](
	[state_fips_code] [tinyint] NOT NULL,
	[county_fips_code] [int] NOT NULL,
 CONSTRAINT [pk_location_county_fips_code] PRIMARY KEY CLUSTERED 
(
	[county_fips_code] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Location].[County_FIPS_Code]  WITH CHECK ADD  CONSTRAINT [fk_location_county_fips_code_state_fips_code] FOREIGN KEY([state_fips_code])
REFERENCES [Location].[State_FIPS_Code] ([state_fips_code])
GO
ALTER TABLE [Location].[County_FIPS_Code] CHECK CONSTRAINT [fk_location_county_fips_code_state_fips_code]
GO
