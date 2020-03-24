USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[evaluatedpreference](
	[Unseperated] [varchar](255) NULL,
	[evaluatedpreference] [varchar](6) NOT NULL,
	[evaluatedpreferenceText] [varchar](255) NULL,
 CONSTRAINT [PK_evaluatedpreference] PRIMARY KEY CLUSTERED 
(
	[evaluatedpreference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
