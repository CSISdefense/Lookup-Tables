SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[solicitationprocedures](
	[Unseperated] [varchar](255) NULL,
	[solicitationprocedures] [varchar](5) NOT NULL,
	[solicitationproceduresText] [nvarchar](255) NULL,
 CONSTRAINT [solicitationprocedures_key] PRIMARY KEY CLUSTERED 
(
	[solicitationprocedures] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
