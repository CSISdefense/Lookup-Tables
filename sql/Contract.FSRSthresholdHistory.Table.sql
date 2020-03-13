USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[FSRSthresholdHistory](
	[StartSignedDate] [date] NOT NULL,
	[EndSignedDate] [date] NOT NULL,
	[Threshold] [decimal](19, 4) NULL
) ON [PRIMARY]
GO
