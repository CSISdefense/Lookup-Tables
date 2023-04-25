SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[extentcompeted](
	[Unseperated] [varchar](255) NULL,
	[extentcompeted] [varchar](3) NOT NULL,
	[extentcompetedText] [nvarchar](255) NULL,
	[extentcompeted5Category] [nvarchar](50) NULL,
	[extentcompeted3Category] [nvarchar](50) NULL,
	[FullAndOpen] [binary](1) NULL,
	[IsSomeCompetition] [bit] NULL,
	[IsFullAndOpen] [bit] NULL,
	[IsFollowOnToCompetedAction] [bit] NULL,
	[IsOnlyOneSource] [bit] NULL,
 CONSTRAINT [extentcompeted_key] PRIMARY KEY CLUSTERED 
(
	[extentcompeted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
