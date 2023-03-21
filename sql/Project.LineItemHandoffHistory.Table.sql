SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[LineItemHandoffHistory](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[BudgetSubActivity] [smallint] NOT NULL,
	[LineItem] [varchar](13) NOT NULL,
	[IsActualMaxOfFiscalYear] [int] NULL,
	[IsEnactedMaxOfFiscalYear] [int] NULL,
	[IsHandoff] [int] NOT NULL,
	[CSISmodifiedBy] [varchar](128) NULL,
	[CSISmodifiedDate] [datetime] NULL,
 CONSTRAINT [pk_LineItemHandoffHistory] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[DefenseOrganization] ASC,
	[BudgetActivity] ASC,
	[BudgetSubActivity] ASC,
	[LineItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[LineItemHandoffHistory] ADD  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[LineItemHandoffHistory] ADD  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
