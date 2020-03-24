USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Assistance].[CSISfaadsTransactionID](
	[CSISfaadsTransactionID] [bigint] NOT NULL,
	[unique_transaction_id] [varchar](32) NULL,
	[federal_award_mod] [varchar](4) NULL,
	[csisawardid] [bigint] NULL
)

GO
SET ANSI_PADDING OFF
GO
