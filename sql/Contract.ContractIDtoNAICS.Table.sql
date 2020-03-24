USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[ContractIDtoNAICS](
	[key-i-p-m-t] [nvarchar](255) NULL,
	[idvpiid] [nvarchar](255) NULL,
	[piid] [nvarchar](255) NULL,
	[transactionnumber] [nvarchar](255) NULL,
	[modnumber] [nvarchar](255) NULL,
	[principalnaicscode] [varchar](6) NULL,
	[fiscal_year] [int] NULL,
	[agencyid] [varchar](4) NULL,
	[extended_piin] [nvarchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[ContractIDtoNAICS]  WITH NOCHECK ADD  CONSTRAINT [FK_ContractIDtoNAICS_agencyid] FOREIGN KEY([agencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[ContractIDtoNAICS] CHECK CONSTRAINT [FK_ContractIDtoNAICS_agencyid]
GO
ALTER TABLE [Contract].[ContractIDtoNAICS]  WITH NOCHECK ADD  CONSTRAINT [FK_ContractIDtoNAICS_principalnaicscode] FOREIGN KEY([principalnaicscode])
REFERENCES [FPDSTypeTable].[PrincipalNaicsCode] ([principalnaicscode])
GO
ALTER TABLE [Contract].[ContractIDtoNAICS] CHECK CONSTRAINT [FK_ContractIDtoNAICS_principalnaicscode]
GO
