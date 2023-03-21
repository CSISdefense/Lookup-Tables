SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[servicecontractact](
	[Unseperated] [varchar](255) NULL,
	[servicecontractact] [varchar](1) NOT NULL,
	[servicecontractactText] [nvarchar](255) NULL,
 CONSTRAINT [servicecontractact_key] PRIMARY KEY CLUSTERED 
(
	[servicecontractact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
