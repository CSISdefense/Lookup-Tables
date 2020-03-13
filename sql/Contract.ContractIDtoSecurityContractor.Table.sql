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
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[ContractIDtoSecurityContractor] ADD  CONSTRAINT [DF__Security __CBO t__3A4CA8FD]  DEFAULT ((0)) FOR [CBO touched security]
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'9/22/2009 1:10:01 PM' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'9/22/2009 1:52:01 PM' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Security PIID investigation' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'112' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor'
GO
