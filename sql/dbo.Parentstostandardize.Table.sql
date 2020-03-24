USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parentstostandardize](
	[ID] [int] NOT NULL,
	[vendorname] [nvarchar](255) NULL,
	[StandardizedVendorName] [nvarchar](255) NULL,
	[parentid] [nvarchar](255) NULL
)

GO
