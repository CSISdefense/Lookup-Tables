SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[AccountDSIocoBreakdown](
	[AccountDSIlong] [varchar](50) NULL,
	[AccountTitle] [varchar](100) NULL,
	[Organization] [varchar](50) NULL,
	[SourceFiscalYear] [smallint] NULL,
	[FiscalYear] [smallint] NULL,
	[Base] [decimal](19, 4) NULL,
	[OCO] [decimal](19, 4) NULL,
	[OMBbureau] [varchar](50) NULL,
	[pOCO] [float] NULL,
	[AccountDSI] [varchar](5) NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[MainAccountCode] [smallint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [budget].[AccountDSIocoBreakdown]  WITH NOCHECK ADD  CONSTRAINT [FK__AccountDS__Accou__5DF6A344] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [budget].[AccountDSIocoBreakdown] CHECK CONSTRAINT [FK__AccountDS__Accou__5DF6A344]
GO
ALTER TABLE [budget].[AccountDSIocoBreakdown]  WITH NOCHECK ADD  CONSTRAINT [fk_budget_AccountDSIocoBreakdown_MainAccountCode] FOREIGN KEY([TreasuryAgencyCode], [MainAccountCode])
REFERENCES [budget].[MainAccountCode] ([TreasuryAgencyCode], [MainAccountCode])
GO
ALTER TABLE [budget].[AccountDSIocoBreakdown] CHECK CONSTRAINT [fk_budget_AccountDSIocoBreakdown_MainAccountCode]
GO
