SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[simplified_procedures_for_certain_commercial_items](
	[CommercialItemTestProgram] [varchar](1) NOT NULL,
	[CommercialItemTestProgramText] [varchar](75) NULL,
	[IsCommercial] [bit] NULL,
 CONSTRAINT [pk_CommercialItemTestProgram] PRIMARY KEY CLUSTERED 
(
	[CommercialItemTestProgram] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
