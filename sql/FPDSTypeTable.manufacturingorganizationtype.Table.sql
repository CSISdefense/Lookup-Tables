USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[manufacturingorganizationtype](
	[Unseperated] [varchar](255) NULL,
	[manufacturingorganizationtype] [varchar](1) NOT NULL,
	[manufacturingorganizationtypeText] [nvarchar](255) NULL,
 CONSTRAINT [PK_manufacturingorganizationtype NO PK] PRIMARY KEY CLUSTERED 
(
	[manufacturingorganizationtype] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
