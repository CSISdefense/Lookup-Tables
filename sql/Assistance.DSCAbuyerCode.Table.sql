SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[DSCAbuyerCode](
	[DSCAbuyerCode] [varchar](2) NOT NULL,
	[DSCAbuyerText] [nvarchar](50) NULL,
	[GeographicISOalpha3] [nvarchar](3) NULL,
 CONSTRAINT [pk_Assistance_DSCAbuyerCode] PRIMARY KEY CLUSTERED 
(
	[DSCAbuyerCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Assistance].[DSCAbuyerCode]  WITH CHECK ADD FOREIGN KEY([GeographicISOalpha3])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
