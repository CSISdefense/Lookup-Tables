SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[ContingencyHumanitarianPeacekeepingOperation](
	[Unseperated] [varchar](255) NULL,
	[ContingencyHumanitarianPeacekeepingOperation] [varchar](1) NOT NULL,
	[contingencyhumanitarianpeacekeepingoperationText] [nvarchar](255) NULL,
	[IsOCOcrisisFunding] [bit] NULL,
 CONSTRAINT [contingencyhumanitarianpeacekeepingoperation_key] PRIMARY KEY CLUSTERED 
(
	[ContingencyHumanitarianPeacekeepingOperation] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
