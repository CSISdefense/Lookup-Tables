USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[Zipcode](
	[zipcode] [varchar](28) NULL,
	[Zip5] [int] NULL,
	[Zip9] [int] NULL,
	[IsSoCal] [bit] NULL
) ON [PRIMARY]
GO
