SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[FundingAccountOld](
	[AccountName] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL,
	[FY2001] [float] NULL,
	[FY2002] [float] NULL,
	[FY2003] [float] NULL,
	[FY2004] [float] NULL,
	[FY2005] [float] NULL,
	[FY2006] [float] NULL,
	[FY2007] [float] NULL,
	[FY2008] [float] NULL,
	[FY2009] [float] NULL,
	[FY2010] [float] NULL,
	[FY2011] [float] NULL,
	[TreasuryAgencyCode] [varchar](2) NULL,
	[AccountCode] [varchar](6) NULL,
	[header] [bit] NOT NULL,
	[subheader] [bit] NOT NULL,
	[AssistanceType] [varchar](50) NULL,
	[HeaderName] [varchar](50) NULL,
	[SubHeaderName] [varchar](50) NULL,
	[CSISmodifieddate] [datetime2](7) NULL,
	[CSISmodifiedby] [varchar](255) NULL
) ON [PRIMARY]
GO
