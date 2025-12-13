SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[R1staging](
	[PByear] [varchar](255) NULL,
	[AccountDSI] [varchar](255) NULL,
	[MainAccountName] [varchar](255) NULL,
	[DefenseOrganization] [varchar](255) NULL,
	[DefenseOrganizationName] [varchar](255) NULL,
	[BudgetActivity] [varchar](255) NULL,
	[BudgetActivityTitle] [varchar](255) NULL,
	[ProgramElement] [varchar](255) NULL,
	[ProgramElementTitle] [varchar](255) NULL,
	[IncludeInTOA] [varchar](255) NULL,
	[Classified] [varchar](255) NULL,
	[LineNumber] [varchar](255) NULL,
	[FiscalYear] [varchar](255) NULL,
	[BaseOther] [varchar](255) NULL,
	[ProjectionType] [varchar](11) NULL,
	[BaseOtherSum] [varchar](255) NULL,
	[BaseOtherInclude] [varchar](255) NULL,
	[Value] [decimal](19, 4) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]
GO
