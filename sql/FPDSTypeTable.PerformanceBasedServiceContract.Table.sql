SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[PerformanceBasedServiceContract](
	[performancebasedservicecontract] [varchar](38) NOT NULL,
	[performancebasedservicecontractText] [nvarchar](255) NULL,
	[isperformancebasedservicecontract] [bit] NULL,
	[isperformancebasedcontract] [bit] NULL,
 CONSTRAINT [pk_PerformanceBasedServiceContract] PRIMARY KEY CLUSTERED 
(
	[performancebasedservicecontract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
