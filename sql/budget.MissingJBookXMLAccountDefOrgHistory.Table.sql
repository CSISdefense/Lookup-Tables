SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[MissingJBookXMLAccountDefOrgHistory](
	[Path] [varchar](204) NULL,
	[PByear] [smallint] NOT NULL,
	[DefenseOrganization] [varchar](4) NULL,
	[AccountDSI] [varchar](5) NULL,
	[Comments] [varchar](100) NULL,
	[IsMissingJBook] [bit] NULL
) ON [PRIMARY]
GO
