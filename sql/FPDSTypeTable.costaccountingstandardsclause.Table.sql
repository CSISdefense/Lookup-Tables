SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[CostAccountingStandardsClause](
	[CostAccountingStandardsClause] [varchar](1) NOT NULL,
	[cost_accounting_standards_clause_name] [varchar](255) NULL,
 CONSTRAINT [pk_FPDStypetable_CostAccountingStandardsClause] PRIMARY KEY CLUSTERED 
(
	[CostAccountingStandardsClause] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
