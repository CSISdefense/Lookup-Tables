SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GrantLoanAssistance].[ForeignAssistanceActual](
	[FiscalYear] [float] NULL,
	[AgencyName] [nvarchar](255) NULL,
	[OperatingUnit] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Sector] [nvarchar](255) NULL,
	[ObligationAmount] [float] NULL,
	[SpentAmount] [float] NULL,
	[AgencyID] [varchar](50) NULL
) ON [PRIMARY]
GO
