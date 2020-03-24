USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
 CONSTRAINT [reasonformodification_key] PRIMARY KEY CLUSTERED 
(
	[reasonformodification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
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
