SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budget_R2_Long](
	[BudgetActivity] [smallint] NULL,
	[FiscalYear] [smallint] NULL,
	[LineNumber] [smallint] NULL,
	[ProgramElement] [varchar](10) NULL,
	[ProgramElementTitle] [varchar](100) NULL,
	[PByear] [smallint] NULL,
	[BaseOther] [varchar](5) NULL,
	[ProjectionType] [varchar](7) NULL,
	[Value] [int] NULL,
	[BaseOtherSum] [varchar](5) NULL,
	[BaseOtherInclude] [bit] NULL,
	[Organization_Code] [varchar](5) NULL,
	[Organization_Name] [varchar](50) NULL,
	[Type] [varchar](2) NULL,
	[header1] [varchar](50) NULL,
	[Book] [varchar](75) NULL,
	[IsRevisedJBook] [bit] NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[Classified] [varchar](1) NULL,
	[IncludeInTOA] [varchar](1) NULL,
	[AccountDSI] [varchar](5) NULL,
	[MainAccountCode] [smallint] NULL,
	[MainAccountName] [varchar](44) NULL
) ON [PRIMARY]
GO
