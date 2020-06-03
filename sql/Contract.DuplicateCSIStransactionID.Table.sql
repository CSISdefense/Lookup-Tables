SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[DuplicateCSIStransactionID](
	[CSIScontractID] [int] NOT NULL,
	[idvmodificationnumber] [varchar](50) NULL,
	[modnumber] [varchar](25) NULL,
	[transactionnumber] [bigint] NULL,
	[CSIStransactionID] [int] NOT NULL,
	[ContractLabelID] [int] NULL,
	[CSISidvmodificationID] [int] NULL,
	[isIDV] [bit] NULL,
	[CSISsourceIDVmodificationID] [int] NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
