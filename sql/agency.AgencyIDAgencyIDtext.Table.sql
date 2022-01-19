SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[AgencyIDAgencyIDtext](
	[AgencyID] [varchar](4) NULL,
	[AgencyIDtext] [varchar](255) NULL,
	[MinOfSignedDate] [datetime2](7) NULL,
	[MaxOfSignedDate] [datetime2](7) NULL
) ON [PRIMARY]
GO
