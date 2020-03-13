USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[contractfinancing](
	[Unseperated] [varchar](255) NULL,
	[contractfinancing] [varchar](1) NOT NULL,
	[contractfinancingText] [nvarchar](255) NULL,
 CONSTRAINT [PK_contractfinancing] PRIMARY KEY CLUSTERED 
(
	[contractfinancing] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
