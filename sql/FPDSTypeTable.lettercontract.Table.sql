SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[lettercontract](
	[Unseperated] [varchar](255) NULL,
	[IsLetterContract] [bit] NULL,
	[IsUndefinitizedAction] [bit] NULL,
	[UndefinitizedActionText] [varchar](30) NULL,
	[LetterContract] [varchar](1) NOT NULL,
 CONSTRAINT [pk_LetterContract] PRIMARY KEY CLUSTERED 
(
	[LetterContract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
