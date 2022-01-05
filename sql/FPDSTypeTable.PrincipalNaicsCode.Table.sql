SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[PrincipalNaicsCode](
	[Unseperated] [varchar](255) NULL,
	[principalnaicscode] [varchar](6) NOT NULL,
	[principalnaicscodeText] [nvarchar](255) NULL,
	[principalNAICS2DigitCode] [varchar](6) NULL,
	[principalNAICS3DigitCode] [varchar](6) NULL,
	[PDTcategory] [nvarchar](255) NULL,
	[PDTSsplit2DigitCode] [bit] NULL,
	[PDTSsplit3DigitCode] [bit] NULL,
	[principalNAICS4DigitCode] [varchar](6) NULL,
	[principalNAICS5DigitCode] [varchar](6) NULL,
	[NAICS_ShortHand] [varchar](55) NULL,
	[NASbioEconomy] [varchar](50) NULL,
	[NASbioEconomyPT] [bit] NULL,
 CONSTRAINT [PK_principalnaicscode] PRIMARY KEY CLUSTERED 
(
	[principalnaicscode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
