SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[CTID_FPDS10m_descrip_plat](
	[PlatformPortfolioRemote] [nvarchar](50) NOT NULL,
	[obligatedamount] [float] NOT NULL,
	[descrip_plat_row_number] [nvarchar](50) NOT NULL,
	[Remotely_Crewed] [nvarchar](25) NULL,
	[UAS] [nvarchar](5) NULL,
	[CUAS] [nvarchar](5) NULL,
	[Maritime] [nvarchar](5) NULL,
	[mq] [nvarchar](5) NULL,
	[rq] [nvarchar](5) NULL,
	[any_uas] [nvarchar](5) NULL,
	[descriptionofcontractrequirement] [nvarchar](4000) NOT NULL,
	[CSIStransactionID] [int] NULL,
	[clid] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Project].[CTID_FPDS10m_descrip_plat]  WITH CHECK ADD FOREIGN KEY([clid])
REFERENCES [Contract].[ContractLabelID] ([ContractLabelID])
GO
