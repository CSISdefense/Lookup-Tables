SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[action_type](
	[Unseperated] [varchar](255) NULL,
	[action_type] [varchar](8) NOT NULL,
	[action_type_text] [varchar](255) NULL,
 CONSTRAINT [PK__action_t__EEB18A86D6404476] PRIMARY KEY CLUSTERED 
(
	[action_type] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
