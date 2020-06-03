SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[multipleorsingleawardidc](
	[Unseperated] [varchar](255) NULL,
	[multipleorsingleawardidc] [varchar](1) NOT NULL,
	[multipleorsingleawardidcText] [nvarchar](255) NULL,
	[IsMultipleAward] [bit] NULL,
 CONSTRAINT [multipleorsingleawardidc_key] PRIMARY KEY CLUSTERED 
(
	[multipleorsingleawardidc] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
