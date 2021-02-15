SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[statutoryexceptiontofairopportunity](
	[statutoryexceptiontofairopportunity] [varchar](4) NOT NULL,
	[statutoryexceptiontofairopportunityText] [nvarchar](255) NULL,
	[isfollowontocompetedaction] [bit] NULL,
	[isonlyonesource] [bit] NULL,
	[IsSomeCompetition] [bit] NULL,
	[IsUrgency] [bit] NULL,
 CONSTRAINT [statutoryexceptiontofairopportunity_key] PRIMARY KEY CLUSTERED 
(
	[statutoryexceptiontofairopportunity] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
