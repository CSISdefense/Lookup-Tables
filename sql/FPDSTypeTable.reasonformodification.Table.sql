SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[reasonformodification](
	[Unseperated] [varchar](255) NULL,
	[reasonformodification] [varchar](1) NOT NULL,
	[reasonformodificationText] [nvarchar](255) NULL,
	[ismodified] [bit] NULL,
	[isClosed] [bit] NULL,
	[isTerminated] [bit] NULL,
	[isChangeOrder] [bit] NULL,
	[isNewWork] [bit] NULL,
	[isSteadyScope] [bit] NULL,
	[isDefaultOrCause] [bit] NULL,
	[isOther] [bit] NULL,
	[isAdmin] [bit] NULL,
	[IsDefinitize] [bit] NOT NULL,
 CONSTRAINT [reasonformodification_key] PRIMARY KEY CLUSTERED 
(
	[reasonformodification] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[reasonformodification] ADD  CONSTRAINT [DF__reasonfor__isClo__7C5041DB]  DEFAULT ((0)) FOR [isClosed]
GO
ALTER TABLE [FPDSTypeTable].[reasonformodification] ADD  CONSTRAINT [DF__reasonfor__isTer__7D446614]  DEFAULT ((0)) FOR [isTerminated]
GO
ALTER TABLE [FPDSTypeTable].[reasonformodification] ADD  CONSTRAINT [DF__reasonfor__isCha__7E388A4D]  DEFAULT ((0)) FOR [isChangeOrder]
GO
ALTER TABLE [FPDSTypeTable].[reasonformodification] ADD  CONSTRAINT [DF__reasonfor__isNew__7F2CAE86]  DEFAULT ((0)) FOR [isNewWork]
GO
ALTER TABLE [FPDSTypeTable].[reasonformodification] ADD  DEFAULT ((0)) FOR [isDefaultOrCause]
GO
ALTER TABLE [FPDSTypeTable].[reasonformodification] ADD  DEFAULT ((0)) FOR [IsDefinitize]
GO
