SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProgramElementHandoffHistory](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[IsActualMaxOfFiscalYear] [int] NULL,
	[IsEnactedMaxOfFiscalYear] [int] NULL,
	[IsHandoff] [int] NOT NULL,
	[CSISmodifiedBy] [varchar](128) NULL,
	[CSISmodifiedDate] [datetime] NULL,
 CONSTRAINT [pk_ProgramElementHandoffHistory] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[ProgramElementHandoffHistory] ADD  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[ProgramElementHandoffHistory] ADD  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
