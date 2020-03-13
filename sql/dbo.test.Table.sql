USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](30) NULL,
	[ProjectPrettyName] [nvarchar](255) NULL,
	[ProjectAbbreviation] [varchar](4) NOT NULL,
	[IsJointDevelopmentCaseStudy] [bit] NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [varchar](150) NOT NULL,
	[IsPerformanceBasedLogistics] [bit] NULL,
	[PlatformPortfolio] [varchar](30) NULL,
	[ObligatedAmount] [decimal](19, 4) NULL,
	[MinOfFiscalYear] [smallint] NULL,
	[MaxOfFiscalYear] [smallint] NULL,
	[TopPlatformPortfolio] [varchar](30) NULL,
	[TopPlatformPortfolioObligatedAmount] [decimal](19, 4) NULL,
	[TopParentID] [nvarchar](255) NULL,
	[TopParentIDObligatedAmount] [decimal](19, 4) NULL
) ON [PRIMARY]
GO
