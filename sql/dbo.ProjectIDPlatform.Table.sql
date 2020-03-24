USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectIDPlatform](
	[ProjectID] [varchar](50) NULL,
	[ProjectName] [varchar](50) NULL,
	[ProjectPrettyName] [varchar](50) NULL,
	[ProjectAbbreviation] [varchar](50) NULL,
	[IsJointDevelopmentCaseStudy] [varchar](50) NULL,
	[IsPerformanceBasedLogistics] [varchar](50) NULL,
	[ObligatedAmount] [varchar](50) NULL,
	[MinOfFiscalYear] [varchar](50) NULL,
	[MaxOfFiscalYear] [varchar](50) NULL,
	[PlatformPortfolio] [varchar](50) NULL,
	[TopPlatformPortfolio] [varchar](50) NULL,
	[TopPlatformPortfolioObligatedAmount] [varchar](50) NULL,
	[TopParentID] [varchar](50) NULL,
	[TopParentIDObligatedAmount] [varchar](50) NULL,
	[CSISmodifiedDate] [varchar](50) NULL,
	[CSISmodifiedBy] [varchar](255) NULL
) ON [PRIMARY]
GO
