USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contract].[ReferencedIDVFPDSgov](
	[ReferencedIDVAgencyID] [varchar](4) NULL,
	[ReferencedIDVPIID] [varchar](50) NULL,
	[ReferencedIDVModNumber] [varchar](50) NULL,
	[IDVtype] [varchar](41) NULL,
	[IDVtypeOfIDC] [varchar](50) NULL,
	[IDVtypeOfIDCdescription] [varchar](50) NULL,
	[IDVmultipleOrSingleAwardIDV] [varchar](50) NULL,
	[IDVpart8orPart13] [varchar](50) NULL,
	[NumberOfRecords] [numeric](38, 0) NULL,
	[CSISidvmodificationID] [int] NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Contract].[ReferencedIDVFPDSgov]  WITH CHECK ADD  CONSTRAINT [fk_Contract_ReferencedIDVFPDSgov_IDVtype] FOREIGN KEY([IDVtype])
REFERENCES [FPDSTypeTable].[ContractActionType] ([contractactiontype])
GO
ALTER TABLE [Contract].[ReferencedIDVFPDSgov] CHECK CONSTRAINT [fk_Contract_ReferencedIDVFPDSgov_IDVtype]
GO
ALTER TABLE [Contract].[ReferencedIDVFPDSgov]  WITH NOCHECK ADD  CONSTRAINT [fk_ReferencedIDVFPDSgov_CSISidvmodificationID] FOREIGN KEY([CSISidvmodificationID])
REFERENCES [Contract].[CSISidvmodificationID] ([CSISidvmodificationID])
GO
ALTER TABLE [Contract].[ReferencedIDVFPDSgov] CHECK CONSTRAINT [fk_ReferencedIDVFPDSgov_CSISidvmodificationID]
GO
