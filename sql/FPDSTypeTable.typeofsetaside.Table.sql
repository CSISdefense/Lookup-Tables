USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[typeofsetaside](
	[Unseperated] [varchar](255) NULL,
	[typeofsetaside] [varchar](10) NOT NULL,
	[typeofsetasideText] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[typeofsetaside2category] [nvarchar](255) NULL,
 CONSTRAINT [PK_typeofsetaside NO PK] PRIMARY KEY CLUSTERED 
(
	[typeofsetaside] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
