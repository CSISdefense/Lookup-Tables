USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProjectID](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](35) NULL,
	[ProjectPrettyName] [nvarchar](255) NULL,
	[ProjectAbbreviation] [varchar](4) NULL,
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
	[TopParentIDObligatedAmount] [decimal](19, 4) NULL,
	[Notes] [varchar](255) NULL,
	[IsUnknown] [bit] NULL,
	[WasUncategorizedMissilesOrSpaceSystem] [bit] NULL,
	[IsUninvestigated] [bit] NOT NULL,
	[IsRemotelyOperated] [bit] NULL,
	[RANDID] [varchar](50) NULL,
	[IsParentProjectID] [bit] NULL,
	[ParentProjectID] [int] NULL,
	[IDAID] [int] NULL,
	[IsUnidentified] [bit] NULL,
 CONSTRAINT [PK__ProjectI__761ABED0B116866B] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[ProjectID] ADD  CONSTRAINT [DF__ProjectID__CSISm__1DF12CC8]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[ProjectID] ADD  CONSTRAINT [DF__ProjectID__CSISm__1EE55101]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[ProjectID] ADD  CONSTRAINT [DF__ProjectID__IsUni__20B88ADA]  DEFAULT ((1)) FOR [IsUninvestigated]
GO
ALTER TABLE [Project].[ProjectID]  WITH CHECK ADD FOREIGN KEY([IDAID])
REFERENCES [Project].[IDAID] ([IDAID])
GO
ALTER TABLE [Project].[ProjectID]  WITH NOCHECK ADD  CONSTRAINT [FK__ProjectID__Platf__63AF7C9A] FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [Project].[ProjectID] CHECK CONSTRAINT [FK__ProjectID__Platf__63AF7C9A]
GO
ALTER TABLE [Project].[ProjectID]  WITH CHECK ADD FOREIGN KEY([RANDID])
REFERENCES [Project].[RANDID] ([RANDID])
GO
ALTER TABLE [Project].[ProjectID]  WITH NOCHECK ADD  CONSTRAINT [FK__ProjectID__TopPa__696855F0] FOREIGN KEY([TopParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Project].[ProjectID] CHECK CONSTRAINT [FK__ProjectID__TopPa__696855F0]
GO
ALTER TABLE [Project].[ProjectID]  WITH NOCHECK ADD  CONSTRAINT [FK__ProjectID__TopPl__67800D7E] FOREIGN KEY([TopPlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [Project].[ProjectID] CHECK CONSTRAINT [FK__ProjectID__TopPl__67800D7E]
GO