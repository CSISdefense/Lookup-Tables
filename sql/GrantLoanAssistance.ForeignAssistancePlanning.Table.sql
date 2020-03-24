USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GrantLoanAssistance].[ForeignAssistancePlanning](
	[Fiscal Year] [float] NULL,
	[Fiscal Year Type] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[Agency Name] [nvarchar](255) NULL,
	[Operating Unit] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Sector] [nvarchar](255) NULL,
	[Amount] [float] NULL
)

GO
