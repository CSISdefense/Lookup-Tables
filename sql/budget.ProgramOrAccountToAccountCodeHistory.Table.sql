SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[ProgramOrAccountToAccountCodeHistory](
	[ProgramOrAccount] [nvarchar](255) NULL,
	[TreasuryAgencyCode] [varchar](2) NULL,
	[AccountCode] [varchar](6) NULL,
	[StartYear] [int] NULL,
	[EndYear] [int] NULL,
	[CSISmodifieddate] [datetime2](7) NULL,
	[CSISmodifiedby] [varchar](255) NULL
) ON [PRIMARY]
GO
