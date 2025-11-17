SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[DuplicateCTID](
	[KeptCTID] [int] NULL,
	[DroppedCtid] [int] NULL,
	[piid] [varchar](50) NULL,
	[agencyid] [varchar](4) NULL,
	[idvpiid] [varchar](50) NULL,
	[idvagencyid] [varchar](4) NULL,
	[modnumber] [varchar](25) NOT NULL,
	[transactionnumber] [bigint] NULL
) ON [PRIMARY]
GO
