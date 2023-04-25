SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GrantLoanAssistance].[CSISawardID](
	[federal_award_id] [varchar](16) NULL,
	[CSISawardID] [bigint] IDENTITY(1,1) NOT NULL,
	[HyphenatedAwardID] [varchar](50) NULL,
	[topISO3countrycode] [varchar](3) NULL,
	[topusaidregion] [varchar](50) NULL,
 CONSTRAINT [PK_CSISawardID] PRIMARY KEY CLUSTERED 
(
	[CSISawardID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
