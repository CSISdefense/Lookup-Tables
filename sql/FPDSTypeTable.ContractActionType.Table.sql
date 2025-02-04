SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[ContractActionType](
	[contractactiontype] [varchar](41) NOT NULL,
	[contractactiontypeText] [nvarchar](255) NULL,
	[addmultipleorsingawardidc] [bit] NULL,
	[ForAwardUseExtentCompeted] [bit] NULL,
	[ForIDVUseFairOpportunity] [bit] NULL,
	[award_type_code] [varchar](1) NULL,
	[idv_type_code] [varchar](1) NULL,
 CONSTRAINT [pk_contractactiontype] PRIMARY KEY CLUSTERED 
(
	[contractactiontype] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[ContractActionType]  WITH CHECK ADD FOREIGN KEY([award_type_code])
REFERENCES [FPDSTypeTable].[award_type_code] ([award_type_code])
GO
ALTER TABLE [FPDSTypeTable].[ContractActionType]  WITH CHECK ADD  CONSTRAINT [fk_fpdstypetable_contractactiontype_idv_type_code] FOREIGN KEY([idv_type_code])
REFERENCES [FPDSTypeTable].[idv_type_code] ([idv_type_code])
GO
ALTER TABLE [FPDSTypeTable].[ContractActionType] CHECK CONSTRAINT [fk_fpdstypetable_contractactiontype_idv_type_code]
GO
