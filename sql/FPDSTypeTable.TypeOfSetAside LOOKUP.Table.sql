USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[TypeOfSetAside LOOKUP](
	[ID] [int] NOT NULL,
	[typeofsetaside] [nvarchar](255) NULL,
	[Text] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Cat2] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
