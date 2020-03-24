USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[ISOCountryCodes](
	[Country Code] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[isnonUSAIDrecipient] [bit] NULL
) ON [PRIMARY]
GO
