SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[R2staging](
	[PByear] [smallint] NULL,
	[AccountDSI] [varchar](5) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[DefenseOrganizationName] [varchar](50) NULL,
	[BudgetActivity] [smallint] NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[ProgramElement] [varchar](10) NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[Description] [varchar](max) NULL,
	[LineNumber] [smallint] NULL,
	[Type] [varchar](4) NULL,
	[header1] [varchar](50) NULL,
	[Book] [varchar](100) NULL,
	[IsRevisedJBook] [bit] NULL,
	[FiscalYear] [smallint] NULL,
	[BaseOther] [varchar](5) NULL,
	[ProjectionType] [varchar](11) NULL,
	[BaseOtherSum] [varchar](5) NULL,
	[BaseOtherInclude] [bit] NULL,
	[Value] [decimal](19, 4) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
