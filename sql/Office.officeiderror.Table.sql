SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[officeiderror](
	[AgencyID] [varchar](4) NULL,
	[OfficeID] [varchar](6) NULL,
	[OfficeName] [varchar](255) NULL,
	[MinOfSignedDate] [date] NULL,
	[MaxOfSignedDate] [date] NULL
) ON [PRIMARY]
GO
