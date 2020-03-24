USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[FPDSgovManuallyAdjusted](
	[ContractingOfficeAgencyID] [nvarchar](255) NULL,
	[ContractingOfficeID] [nvarchar](255) NULL,
	[PIID] [nvarchar](255) NULL,
	[ModNumber] [nvarchar](255) NULL,
	[TransactionNumber] [float] NULL,
	[IDVPIID] [nvarchar](255) NULL,
	[SignedDate] [datetime] NULL,
	[EffectiveDate] [datetime] NULL,
	[ProductOrServiceCode] [nvarchar](255) NULL,
	[descriptionofcontractrequirement] [nvarchar](255) NULL,
	[InherentlyGovernmentalFunction] [nvarchar](255) NULL,
	[NAICScode] [nvarchar](255) NULL,
	[TreasuryAccountSymbolInitiative] [nvarchar](255) NULL,
	[progsourceagency] [nvarchar](255) NULL,
	[progsourceaccount] [nvarchar](255) NULL,
	[progsourcesubacct] [nvarchar](255) NULL,
	[NumberofActions] [float] NULL,
	[originalobligatedamount] [money] NULL,
	[BaseAndExercisedOptionsValue] [money] NULL,
	[BaseAndAllOptionsValue] [money] NULL,
	[Fiscal_Year] [int] NULL,
	[AgencyID] [varchar](4) NULL,
	[CSIStransactionID] [int] NOT NULL,
	[idvmodificationnumber] [varchar](50) NULL,
	[AdjustedObligatedAmount] [money] NULL
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdjusted]  WITH NOCHECK ADD  CONSTRAINT [FK__FPDSgovMa__CSISt__2E279491] FOREIGN KEY([CSIStransactionID])
REFERENCES [Contract].[CSIStransactionID] ([CSIStransactionID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdjusted] CHECK CONSTRAINT [FK__FPDSgovMa__CSISt__2E279491]
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdjusted]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogging_FPDSgovManuallyAdjusted] FOREIGN KEY([CSIStransactionID])
REFERENCES [Contract].[CSIStransactionID] ([CSIStransactionID])
GO
ALTER TABLE [ErrorLogging].[FPDSgovManuallyAdjusted] CHECK CONSTRAINT [fk_ErrorLogging_FPDSgovManuallyAdjusted]
GO
