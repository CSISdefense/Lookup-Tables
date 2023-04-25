SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[consolidatedcontract](
	[consolidatedcontract] [varchar](1) NOT NULL,
	[consolidated_contract_name] [varchar](255) NULL,
 CONSTRAINT [pk_contract_consolidatedcontract] PRIMARY KEY CLUSTERED 
(
	[consolidatedcontract] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
