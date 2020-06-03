SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[R2_Long](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NULL,
	[MainAccountCode] [smallint] NULL,
	[MainAccountName] [varchar](45) NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[DefenseOrganizationName] [varchar](50) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[Description] [varchar](max) NULL,
	[LineNumber] [smallint] NULL,
	[Type] [varchar](4) NULL,
	[header1] [varchar](50) NULL,
	[Book] [varchar](100) NULL,
	[IsRevisedJBook] [bit] NULL,
	[FiscalYear] [smallint] NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[ProjectionType] [varchar](10) NOT NULL,
	[BaseOtherSum] [varchar](7) NULL,
	[BaseOtherInclude] [bit] NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_PByear_DefenseOrganization_BudgetActivity_ProgramElement_BaseOther_ProjectionType] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC,
	[BaseOther] ASC,
	[ProjectionType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
