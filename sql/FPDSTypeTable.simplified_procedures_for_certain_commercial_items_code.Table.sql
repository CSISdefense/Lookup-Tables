SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[simplified_procedures_for_certain_commercial_items_code](
	[simplified_procedures_for_certain_commercial_items_code] [varchar](1) NOT NULL,
	[simplified_procedures_for_certain_commercial_items] [varchar](75) NULL,
	[IsCommercial] [bit] NULL,
 CONSTRAINT [pk_simplified_procedures_for_certain_commercial_items_code] PRIMARY KEY CLUSTERED 
(
	[simplified_procedures_for_certain_commercial_items_code] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
