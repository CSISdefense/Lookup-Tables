USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[multipleorsingleawardidc](
	[Unseperated] [varchar](255) NULL,
	[multipleorsingleawardidc] [varchar](1) NOT NULL,
	[multipleorsingleawardidcText] [nvarchar](255) NULL,
	[IsMultipleAward] [bit] NULL,
 CONSTRAINT [multipleorsingleawardidc_key] PRIMARY KEY CLUSTERED 
(
	[multipleorsingleawardidc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
