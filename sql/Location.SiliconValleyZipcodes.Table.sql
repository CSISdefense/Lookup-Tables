USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Location].[SiliconValleyZipcodes](
	[County] [varchar](11) NULL,
	[City] [varchar](16) NULL,
	[Zipcode] [int] NULL,
	[IsTraditionalSiliconValley] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
