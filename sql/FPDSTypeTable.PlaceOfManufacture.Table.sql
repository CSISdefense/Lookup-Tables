USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[PlaceOfManufacture](
	[Unseperated] [varchar](255) NULL,
	[PlaceOfManufacture] [varchar](1) NOT NULL,
	[PlaceOfManufactureText] [nvarchar](255) NULL,
	[IsManufacturedInUS] [bit] NULL,
	[BAAcategory] [varchar](25) NULL,
 CONSTRAINT [PK_placeofmanufacture No PK] PRIMARY KEY CLUSTERED 
(
	[PlaceOfManufacture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
