SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GrantLoanAssistance].[CSISawardIDmod](
	[federal_award_id] [varchar](16) NULL,
	[federal_award_mod] [varchar](4) NULL,
	[CSISawardIDmod] [bigint] IDENTITY(1,1) NOT NULL,
	[CSISawardID] [bigint] NULL,
 CONSTRAINT [PK_CSISawardIDmod] PRIMARY KEY CLUSTERED 
(
	[CSISawardIDmod] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
