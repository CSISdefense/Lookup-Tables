USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[ContractIDtoSecurityContractor](
	[CBO touched security] [bit] NOT NULL,
	[SumOfOBLAMOUNT] [float] NULL,
	[piid] [nvarchar](255) NULL,
	[IDVPIID] [nvarchar](255) NULL,
	[PSC Category] [nvarchar](255) NULL
)

GO
ALTER TABLE [Contract].[ContractIDtoSecurityContractor] ADD  CONSTRAINT [DF__Security __CBO t__3A4CA8FD]  DEFAULT ((0)) FOR [CBO touched security]
GO
