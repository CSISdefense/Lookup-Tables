SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[CSISserviceCensusID](
	[CSISserviceCensusID] [int] IDENTITY(1,1) NOT NULL,
	[idvpiid] [varchar](50) NULL,
	[piid] [varchar](50) NULL,
	[dunsnumber] [varchar](13) NOT NULL,
	[contractingofficeagencyid] [varchar](4) NOT NULL,
	[fiscal_year] [smallint] NOT NULL,
	[CSIStieBreaker] [int] NOT NULL,
	[CSIScontractID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CSISserviceCensusID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[CSISserviceCensusID]  WITH CHECK ADD FOREIGN KEY([CSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [Contract].[CSISserviceCensusID]  WITH CHECK ADD  CONSTRAINT [fk_contract_CSISserviceCensusID_contractingofficeagencyid] FOREIGN KEY([contractingofficeagencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Contract].[CSISserviceCensusID] CHECK CONSTRAINT [fk_contract_CSISserviceCensusID_contractingofficeagencyid]
GO
ALTER TABLE [Contract].[CSISserviceCensusID]  WITH CHECK ADD  CONSTRAINT [fk_contract_CSISserviceCensusID_dunsnumber] FOREIGN KEY([dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contract].[CSISserviceCensusID] CHECK CONSTRAINT [fk_contract_CSISserviceCensusID_dunsnumber]
GO
