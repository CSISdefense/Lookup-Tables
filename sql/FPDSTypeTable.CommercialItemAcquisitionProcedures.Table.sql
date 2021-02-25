SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[CommercialItemAcquisitionProcedures](
	[Unseperated] [varchar](255) NULL,
	[CommercialItemAcquisitionProcedures] [varchar](1) NOT NULL,
	[CommercialItemAcquisitionProceduresText] [nvarchar](255) NULL,
	[IsCommercial] [bit] NULL,
 CONSTRAINT [PK_commercialitemacquisitionprocedures No PK] PRIMARY KEY CLUSTERED 
(
	[CommercialItemAcquisitionProcedures] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
