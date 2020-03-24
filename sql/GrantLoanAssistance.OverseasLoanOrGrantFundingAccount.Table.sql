USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [GrantLoanAssistance].[OverseasLoanOrGrantFundingAccount](
	[Fiscal_Year] [int] NOT NULL,
	[YearType] [varchar](50) NOT NULL,
	[ProgramOrAccount] [varchar](150) NULL,
	[ObligatedAmount] [decimal](19, 4) NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[AccountCode] [smallint] NULL,
	[subheader] [bit] NULL,
	[header] [bit] NULL,
	[SubHeaderName] [varchar](150) NULL,
	[HeaderName] [varchar](150) NULL,
	[AssistanceType] [varchar](150) NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [GrantLoanAssistance].[OverseasLoanOrGrantFundingAccount]  WITH NOCHECK ADD  CONSTRAINT [fk_OverseasLoanOrGrantFundingAccount_AccountCode] FOREIGN KEY([TreasuryAgencyCode], [AccountCode])
REFERENCES [budget].[MainAccountCode] ([TreasuryAgencyCode], [MainAccountCode])
GO
ALTER TABLE [GrantLoanAssistance].[OverseasLoanOrGrantFundingAccount] CHECK CONSTRAINT [fk_OverseasLoanOrGrantFundingAccount_AccountCode]
GO
