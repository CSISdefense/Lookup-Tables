SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[uei_crosswalk](
	[id] [int] NOT NULL,
	[awardee_or_recipient_uniqu] [text] NULL,
	[uei] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
