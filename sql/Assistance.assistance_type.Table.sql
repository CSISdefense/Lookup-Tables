SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[assistance_type](
	[Unseperated] [varchar](255) NULL,
	[assistance_type] [varchar](2) NOT NULL,
	[assistance_type_text] [varchar](23) NULL,
 CONSTRAINT [assistance_type_key] PRIMARY KEY CLUSTERED 
(
	[assistance_type] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
