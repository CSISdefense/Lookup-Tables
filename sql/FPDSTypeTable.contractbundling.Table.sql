USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[contractbundling](
	[Unseperated] [varchar](255) NULL,
	[contractbundling] [varchar](1) NOT NULL,
	[contractbundlingText] [nvarchar](255) NULL,
 CONSTRAINT [contractbundling_key] PRIMARY KEY CLUSTERED 
(
	[contractbundling] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
