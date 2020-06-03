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
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CBO touched security' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CBO touched security' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Security PIID investigation' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'CBO touched security'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'SumOfOBLAMOUNT' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'SumOfOBLAMOUNT' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Security PIID investigation' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'SumOfOBLAMOUNT'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'piid' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'piid' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Security PIID investigation' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'piid'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IDVPIID' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IDVPIID' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Security PIID investigation' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'IDVPIID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PSC Category' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PSC Category' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'Security PIID investigation' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'Contract', @level1type=N'TABLE',@level1name=N'ContractIDtoSecurityContractor', @level2type=N'COLUMN',@level2name=N'PSC Category'
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
