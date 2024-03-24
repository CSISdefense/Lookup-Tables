SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[VendorNameImport](
	[VendorName] [varchar](255) NULL,
	[StandardizedVendorName] [varchar](255) NULL,
	[blank_check] [varchar](255) NULL
) ON [PRIMARY]
GO
