SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[OverseasLoanOrGrantFundingAccount](
	[RawYear] [nvarchar](255) NULL,
	[Program or account] [varchar](150) NULL,
	[ObligatedAmount] [decimal](19, 4) NULL
) ON [PRIMARY]
GO
