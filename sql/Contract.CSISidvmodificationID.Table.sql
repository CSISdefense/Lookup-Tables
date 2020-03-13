USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[CSISidvmodificationID](
	[idvagencyid] [varchar](4) NULL,
	[idvpiid] [varchar](50) NOT NULL,
	[idvmodificationnumber] [varchar](25) NOT NULL,
	[multipleorsingleawardidc] [varchar](1) NULL,
	[typeofidc] [varchar](41) NULL,
	[contractactiontype] [varchar](41) NULL,
	[MinOfFiscal_Year] [smallint] NULL,
	[MaxOfFiscal_Year] [smallint] NULL,
	[CSISidvmodificationID] [int] IDENTITY(1,1) NOT NULL,
	[CSISidvpiidID] [int] NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[idv_type_code] [varchar](1) NULL,
 CONSTRAINT [pk_CSISidvmodificationID] PRIMARY KEY CLUSTERED 
(
	[CSISidvmodificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[CSISidvmodificationID] ADD  CONSTRAINT [DF__CSISidvmo__CSISm__4F9D96F5]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Contract].[CSISidvmodificationID] ADD  CONSTRAINT [DF__CSISidvmo__CSISm__5091BB2E]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Contract].[CSISidvmodificationID]  WITH CHECK ADD FOREIGN KEY([idv_type_code])
REFERENCES [FPDSTypeTable].[idv_type_code] ([idv_type_code])
GO
ALTER TABLE [Contract].[CSISidvmodificationID]  WITH NOCHECK ADD  CONSTRAINT [fk_contract_CSISidvmodificationID_CSISidvpiidID] FOREIGN KEY([CSISidvpiidID])
REFERENCES [Contract].[CSISidvpiidID] ([CSISidvpiidID])
GO
ALTER TABLE [Contract].[CSISidvmodificationID] CHECK CONSTRAINT [fk_contract_CSISidvmodificationID_CSISidvpiidID]
GO
ALTER TABLE [Contract].[CSISidvmodificationID]  WITH CHECK ADD  CONSTRAINT [fk_Contract_CSISidvmodificationID_idvagencyid] FOREIGN KEY([idvagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[CSISidvmodificationID] CHECK CONSTRAINT [fk_Contract_CSISidvmodificationID_idvagencyid]
GO
ALTER TABLE [Contract].[CSISidvmodificationID]  WITH CHECK ADD  CONSTRAINT [chk_contract_CSISidvmodificationID_CSISidvmodificationID_IDVPIID_consistency] CHECK  (([IDVPIID]='' AND [idvmodificationnumber]='' OR [IDVPIID]<>'' AND [idvmodificationnumber]<>''))
GO
ALTER TABLE [Contract].[CSISidvmodificationID] CHECK CONSTRAINT [chk_contract_CSISidvmodificationID_CSISidvmodificationID_IDVPIID_consistency]
GO
