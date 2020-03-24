USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[CSISfaadsTransactionID](
	[CSISfaadsTransactionID] [bigint] NOT NULL,
	[unique_transaction_id] [varchar](32) NULL,
	[federal_award_mod] [varchar](4) NULL,
	[csisawardid] [bigint] NULL
) ON [PRIMARY]
GO
