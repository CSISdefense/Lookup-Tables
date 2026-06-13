SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[typeofsetaside](
	[Unseperated] [varchar](255) NULL,
	[typeofsetaside] [varchar](10) NOT NULL,
	[typeofsetasideText] [nvarchar](255) NULL,
	[TypeOfSetAsideDescription] [varchar](4000) NULL,
	[IsSetAsideMentionsSmallBusiness] [bit] NULL,
	[IsSoleSourceSetAside] [bit] NULL,
	[IsSetAside] [bit] NULL,
 CONSTRAINT [PK_typeofsetaside NO PK] PRIMARY KEY CLUSTERED 
(
	[typeofsetaside] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
