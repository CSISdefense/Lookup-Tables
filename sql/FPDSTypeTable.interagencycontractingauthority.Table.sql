USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[interagencycontractingauthority](
	[Unseperated] [varchar](255) NULL,
	[interagencycontractingauthority] [varchar](3) NOT NULL,
	[interagencycontractingauthorityText] [nvarchar](255) NULL,
 CONSTRAINT [PK_interagencycontractingauthority] PRIMARY KEY CLUSTERED 
(
	[interagencycontractingauthority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO