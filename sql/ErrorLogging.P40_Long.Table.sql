SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[P40_Long](
	[PByear] [smallint] NULL,
	[AccountDSI] [varchar](5) NULL,
	[MainAccountCode] [smallint] NULL,
	[MainAccountName] [varchar](36) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[DefenseOrganizationName] [varchar](50) NULL,
	[BudgetActivity] [smallint] NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[BudgetSubActivity] [smallint] NULL,
	[BudgetSubActivityTitle] [varchar](75) NULL,
	[LineItem] [varchar](13) NULL,
	[LineItemTitle] [varchar](301) NULL,
	[CostType] [varchar](1) NULL,
	[CostTypeTitle] [varchar](30) NULL,
	[Description] [varchar](max) NULL,
	[ProgramElementsforCodeBItems] [varchar](68) NULL,
	[OtherRelatedProgramElements] [varchar](148) NULL,
	[IsContinuing] [bit] NULL,
	[Exhibits] [varchar](13) NULL,
	[IDcode] [varchar](1) NULL,
	[MDAP] [varchar](4) NULL,
	[Type] [varchar](4) NULL,
	[header1] [varchar](50) NULL,
	[Book] [varchar](100) NULL,
	[IsRevisedJBook] [bit] NULL,
	[LineNumber] [smallint] NULL,
	[FiscalYear] [smallint] NULL,
	[BaseOther] [varchar](5) NULL,
	[ProjectionType] [varchar](11) NULL,
	[BaseOtherSum] [varchar](5) NULL,
	[BaseOtherInclude] [bit] NULL,
	[Quantity] [int] NULL,
	[Value] [decimal](28, 0) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
