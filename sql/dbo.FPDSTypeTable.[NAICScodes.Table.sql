USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FPDSTypeTable.[NAICScodes](
	[NAICS_Code] [float] NULL,
	[Industry_TEXT] [nvarchar](255) NULL,
	[Industry_Cat_TEXT] [nvarchar](255) NULL,
	[Industry_SubCat_TEXT] [nvarchar](255) NULL,
	[Industry_SubSubCat_TEXT] [nvarchar](255) NULL
) ON [PRIMARY]
GO
