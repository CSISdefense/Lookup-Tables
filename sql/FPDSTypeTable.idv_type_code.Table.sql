SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[idv_type_code](
	[idv_type_code] [varchar](1) NOT NULL,
	[idv_type_name] [varchar](255) NULL,
	[idv_type_abbreviation] [varchar](4) NULL,
	[contractactiontype] [varchar](8) NULL,
	[IsDeliveryOrder] [bit] NULL,
	[UseFairOpportunity] [bit] NULL,
 CONSTRAINT [pk_idv_type_code] PRIMARY KEY CLUSTERED 
(
	[idv_type_code] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
