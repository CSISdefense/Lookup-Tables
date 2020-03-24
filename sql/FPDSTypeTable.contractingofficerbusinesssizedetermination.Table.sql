USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[contractingofficerbusinesssizedetermination](
	[Unseperated] [varchar](255) NULL,
	[contractingofficerbusinesssizedetermination] [varchar](1) NOT NULL,
	[contractingofficerbusinesssizedeterminationText] [nvarchar](255) NULL,
 CONSTRAINT [contractingofficerbusinesssizedetermination_key] PRIMARY KEY CLUSTERED 
(
	[contractingofficerbusinesssizedetermination] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
