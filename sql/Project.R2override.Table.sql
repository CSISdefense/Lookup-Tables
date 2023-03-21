SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[R2override](
	[PByear] [smallint] NOT NULL,
	[AccountDSI] [varchar](5) NOT NULL,
	[BudgetActivity] [smallint] NOT NULL,
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[IsDuplicateActual] [int] NOT NULL,
	[ActualBeforeRemoval] [decimal](38, 4) NULL,
 CONSTRAINT [pk_project_R2override] PRIMARY KEY CLUSTERED 
(
	[PByear] ASC,
	[AccountDSI] ASC,
	[BudgetActivity] ASC,
	[ProgramElement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
