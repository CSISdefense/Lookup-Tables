SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[manufacturingorganizationtype](
	[Unseperated] [varchar](255) NULL,
	[manufacturingorganizationtype] [varchar](1) NOT NULL,
	[ManufacturingOrganizationText] [nvarchar](255) NULL,
	[ManufacturingOrganizationText_sum] [varchar](60) NULL,
	[IsForeignOrganization] [bit] NULL,
	[IsBusinessOrganization] [bit] NULL,
 CONSTRAINT [PK_manufacturingorganizationtype NO PK] PRIMARY KEY CLUSTERED 
(
	[manufacturingorganizationtype] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
