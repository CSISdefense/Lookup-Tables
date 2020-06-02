SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[reasonnotcompeted](
	[Unseperated] [varchar](255) NULL,
	[reasonnotcompeted] [varchar](3) NOT NULL,
	[reasonnotcompetedText] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Details] [nvarchar](255) NULL,
	[ReasonCompetedDD350] [nvarchar](255) NULL,
	[ReasonNotCompeted4Category] [nvarchar](50) NULL,
	[isfollowontocompetedaction] [bit] NULL,
	[is6_302_1exception] [bit] NULL,
	[IsUrgency] [bit] NULL,
 CONSTRAINT [reasonnotcompeted_key] PRIMARY KEY CLUSTERED 
(
	[reasonnotcompeted] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
