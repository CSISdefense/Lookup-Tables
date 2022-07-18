SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[officeidblankagendyid](
	[DepartmentID] [varchar](4) NULL,
	[AgencyID] [varchar](4) NOT NULL,
	[OfficeID] [varchar](6) NOT NULL,
	[OfficeName] [nvarchar](255) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[AddressLine3] [nvarchar](255) NULL,
	[AddressCity] [nvarchar](255) NULL,
	[AddressState] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](255) NULL,
	[CountryCode] [nvarchar](255) NULL,
	[Depot] [bit] NULL,
	[FISC] [bit] NULL,
	[TFBSOrelated] [bit] NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifieddDate] [datetime2](7) NOT NULL,
	[OCOcrisisScore] [smallint] NULL,
	[OCOcrisisPercent] [decimal](19, 4) NULL,
	[CrisisPercent] [decimal](19, 4) NULL,
	[PlaceIntlPercent] [decimal](19, 4) NULL
) ON [PRIMARY]
GO
