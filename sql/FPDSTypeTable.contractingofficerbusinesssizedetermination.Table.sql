SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[contractingofficerbusinesssizedetermination](
	[Unseperated] [varchar](255) NULL,
	[contractingofficerbusinesssizedetermination] [varchar](1) NOT NULL,
	[ContractingOfficerBusinessSizeDeterminationText] [nvarchar](255) NULL,
 CONSTRAINT [contractingofficerbusinesssizedetermination_key] PRIMARY KEY CLUSTERED 
(
	[contractingofficerbusinesssizedetermination] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
