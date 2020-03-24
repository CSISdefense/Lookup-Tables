USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Assistance].[assistance_type](
	[Unseperated] [varchar](255) NULL,
	[assistance_type] [varchar](2) NOT NULL,
	[assistance_type_text] [varchar](23) NULL,
 CONSTRAINT [assistance_type_key] PRIMARY KEY CLUSTERED 
(
	[assistance_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
