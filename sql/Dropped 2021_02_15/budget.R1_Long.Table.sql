SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[R1_Long](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[MainAccountCode] [smallint] NULL,
	[MainAccountName] [varchar](45) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[DefenseOrganizationName] [varchar](50) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetActivityTitle] [varchar](50) NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[IncludeInTOA] [varchar](1) NULL,
	[Classified] [varchar](1) NULL,
	[LineNumber] [smallint] NULL,
	[FiscalYear] [smallint] NOT NULL,
	[BaseOther] [varchar](14) NOT NULL,
	[ProjectionType] [varchar](10) NOT NULL,
	[BaseOtherInclude] [bit] NULL,
	[BaseOtherSum] [varchar](7) NULL,
	[Value] [decimal](19, 4) NULL,
 CONSTRAINT [pk_PByear_AccountDSI_BudgetActivity_ProgramElement_BaseOther_ProjectionType] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC,
	[BaseOther] ASC,
	[ProjectionType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
