USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[NationalInterestActionCode](
	[nationalinterestactioncode] [varchar](4) NOT NULL,
	[nationalinterestactioncodeText] [nvarchar](255) NULL,
	[IsHurricane] [bit] NULL,
	[CrisisFunding] [varchar](10) NULL,
 CONSTRAINT [PK_nationalinterestactioncode NO PK] PRIMARY KEY CLUSTERED 
(
	[nationalinterestactioncode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
