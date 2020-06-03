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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
