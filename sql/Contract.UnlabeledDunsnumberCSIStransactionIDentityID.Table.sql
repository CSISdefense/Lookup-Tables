SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[UnlabeledDunsnumberCSIStransactionIDentityID](
	[fiscal_year] [smallint] NULL,
	[vendorname] [nvarchar](150) NULL,
	[vendorlegalorganizationname] [nvarchar](150) NULL,
	[vendordoingasbusinessname] [nvarchar](150) NULL,
	[vendoralternatename] [varchar](150) NULL,
	[divisionname] [nvarchar](150) NULL,
	[dunsnumber] [varchar](13) NULL,
	[StandardizedVendorName] [nvarchar](150) NULL,
	[CSIStransactionID] [int] NOT NULL,
 CONSTRAINT [pk_Contract_UnlabeledDunsnumberCSIStransactionIDentityIDhistory] PRIMARY KEY CLUSTERED 
(
	[CSIStransactionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[UnlabeledDunsnumberCSIStransactionIDentityID]  WITH CHECK ADD FOREIGN KEY([CSIStransactionID])
REFERENCES [Contract].[CSIStransactionID] ([CSIStransactionID])
GO
