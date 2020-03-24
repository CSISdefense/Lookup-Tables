USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[CommercialItemAcquisitionProcedures](
	[Unseperated] [varchar](255) NULL,
	[CommercialItemAcquisitionProcedures] [varchar](1) NOT NULL,
	[CommercialItemAcquisitionProceduresText] [nvarchar](255) NULL,
	[IsCommercial] [bit] NULL,
 CONSTRAINT [PK_commercialitemacquisitionprocedures No PK] PRIMARY KEY CLUSTERED 
(
	[CommercialItemAcquisitionProcedures] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
