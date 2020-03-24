USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Location].[CountryName](
	[CountryName] [nvarchar](50) NOT NULL,
	[Country3LetterCode] [varchar](3) NULL,
	[ISOalpha3] [nvarchar](3) NULL,
 CONSTRAINT [pk_Location_CountryName] PRIMARY KEY CLUSTERED 
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Location].[CountryName]  WITH CHECK ADD FOREIGN KEY([ISOalpha3])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
ALTER TABLE [Location].[CountryName]  WITH CHECK ADD  CONSTRAINT [fk_location_countryname_country3lettercode] FOREIGN KEY([Country3LetterCode])
REFERENCES [FPDSTypeTable].[Country3LetterCode] ([Country3LetterCode])
GO
ALTER TABLE [Location].[CountryName] CHECK CONSTRAINT [fk_location_countryname_country3lettercode]
GO
