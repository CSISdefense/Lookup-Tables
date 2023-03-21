SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[NationalInterestActionCode](
	[NationalInterestActionCode] [varchar](4) NOT NULL,
	[national_interest_action_name] [nvarchar](255) NULL,
	[IsHurricane] [bit] NULL,
	[CrisisFunding] [varchar](10) NULL,
	[IsDisease] [bit] NULL,
 CONSTRAINT [PK_nationalinterestactioncode NO PK] PRIMARY KEY CLUSTERED 
(
	[NationalInterestActionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
