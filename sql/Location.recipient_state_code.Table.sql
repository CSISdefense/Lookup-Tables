SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[recipient_state_code](
	[recipient_state_code] [varchar](35) NOT NULL,
	[recipient_state_name] [varchar](255) NULL,
 CONSTRAINT [pk_location_recipient_state_code] PRIMARY KEY CLUSTERED 
(
	[recipient_state_code] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
