SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[VendorNameImport](
	[VendorName] [nvarchar](150) NOT NULL,
	[StandardizedVendorName] [nvarchar](150) NOT NULL
) ON [PRIMARY]
GO
