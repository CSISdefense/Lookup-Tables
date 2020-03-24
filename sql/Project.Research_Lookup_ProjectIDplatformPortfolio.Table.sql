USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[Research_Lookup_ProjectIDplatformPortfolio](
	[Proj+A1 H8ectID] [varchar](50) NULL,
	[ProjectName] [varchar](50) NULL,
	[ProjectPrettyName] [varchar](50) NULL,
	[ProjectAbbreviation] [varchar](50) NULL,
	[IsJointDevelopmentCaseStudy] [varchar](50) NULL,
	[CSISmodifiedDate] [varchar](50) NULL,
	[CSISmodifiedBy] [varchar](50) NULL,
	[IsPerformanceBasedLogistics] [varchar](50) NULL,
	[PlatformPortfolio] [varchar](50) NULL,
	[ObligatedAmount] [varchar](50) NULL,
	[MinOfFiscalYear] [varchar](50) NULL,
	[MaxOfFiscalYear] [varchar](50) NULL,
	[TopPlatformPortfolio] [varchar](50) NULL,
	[TopPlatformPortfolioObligatedAmount] [varchar](50) NULL,
	[TopParentID] [varchar](50) NULL,
	[TopParentIDObligatedAmount] [varchar](50) NULL,
	[Investigate] [varchar](50) NULL,
	[Wrong] [varchar](50) NULL,
	[Replacement] [varchar](50) NULL,
	[Notes] [varchar](50) NULL,
	[Column 20] [varchar](50) NULL
) ON [PRIMARY]
GO
