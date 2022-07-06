SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[AgencyIDOfficeCodeOfficeName](
	[AgencyID] [varchar](4) NULL,
	[OfficeCode] [varchar](6) NULL,
	[OfficeName] [varchar](255) NULL,
	[MinOfSignedDate] [datetime2](7) NULL,
	[MaxOfSignedDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
