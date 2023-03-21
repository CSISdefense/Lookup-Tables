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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
