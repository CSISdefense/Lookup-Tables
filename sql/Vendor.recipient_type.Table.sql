SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[recipient_type](
	[Unseperated] [varchar](255) NULL,
	[recipient_type] [smallint] NOT NULL,
	[recipient_type_text] [varchar](50) NULL,
 CONSTRAINT [PK_recipient_type] PRIMARY KEY CLUSTERED 
(
	[recipient_type] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
