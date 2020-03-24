USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[CSISidvpiidID](
	[idvpiid] [varchar](50) NULL,
	[multipleorsingleawardidc] [varchar](1) NULL,
	[typeofidc] [varchar](41) NULL,
	[contractactiontype] [varchar](41) NULL,
	[MinOfFiscal_Year] [smallint] NULL,
	[MaxOfFiscal_Year] [smallint] NULL,
	[CSISidvpiidID] [int] IDENTITY(1,1) NOT NULL,
	[IsPerformanceBasedLogistics] [bit] NULL,
	[ContractLabelID] [int] NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[idv_type_code] [varchar](1) NULL,
	[ParentCSIScontractID] [int] NULL,
 CONSTRAINT [pk_CSISidvpiidID] PRIMARY KEY CLUSTERED 
(
	[CSISidvpiidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[CSISidvpiidID] ADD  CONSTRAINT [DF__CSISidvpi__CSISm__5185DF67]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Contract].[CSISidvpiidID] ADD  CONSTRAINT [DF__CSISidvpi__CSISm__527A03A0]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Contract].[CSISidvpiidID]  WITH NOCHECK ADD  CONSTRAINT [contract_CSISidvpiidID_ContractLabelID] FOREIGN KEY([ContractLabelID])
REFERENCES [Contract].[ContractLabelID] ([ContractLabelID])
GO
ALTER TABLE [Contract].[CSISidvpiidID] CHECK CONSTRAINT [contract_CSISidvpiidID_ContractLabelID]
GO
ALTER TABLE [Contract].[CSISidvpiidID]  WITH CHECK ADD FOREIGN KEY([idv_type_code])
REFERENCES [FPDSTypeTable].[idv_type_code] ([idv_type_code])
GO
ALTER TABLE [Contract].[CSISidvpiidID]  WITH CHECK ADD FOREIGN KEY([ParentCSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
