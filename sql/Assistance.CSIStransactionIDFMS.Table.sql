SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[CSIStransactionIDFMS](
	[csistransactionid] [bigint] NULL,
	[fms] [bit] NULL,
	[CSISmodifiedData] [date] NULL,
	[CSISmodifiedBy] [varchar](30) NULL
) ON [PRIMARY]
GO
