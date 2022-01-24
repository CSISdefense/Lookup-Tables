SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProcID](
	[ProcID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](31) NULL,
	[TopTreasuryAgencyCode] [smallint] NOT NULL,
	[TopMainAccountCode] [smallint] NOT NULL,
	[TopBudgetActivity] [smallint] NOT NULL,
	[TopBSA] [smallint] NOT NULL,
	[TopLineItem] [varchar](10) NOT NULL,
	[TopLineItemTitle] [varchar](45) NULL,
	[DefenseServiceIdentifier] [varchar](3) NULL,
	[Classified] [varchar](20) NULL,
	[CSISmodifiedBy] [varchar](128) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[ProcurementCategory] [varchar](31) NULL,
	[IsHarrisonID] [bit] NOT NULL,
	[TopAccountDSI] [varchar](5) NULL,
	[PlatformPortfolio] [varchar](255) NULL,
 CONSTRAINT [PK__ProcID__07C21CFE26E83BA2] PRIMARY KEY CLUSTERED 
(
	[ProcID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[ProcID] ADD  CONSTRAINT [DF__ProcID__CSISmodi__25C758BA]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[ProcID] ADD  CONSTRAINT [DF__ProcID__CSISmodi__26BB7CF3]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[ProcID] ADD  CONSTRAINT [DF__ProcID__IsHarris__5FBEF025]  DEFAULT ((0)) FOR [IsHarrisonID]
GO
ALTER TABLE [Project].[ProcID]  WITH NOCHECK ADD  CONSTRAINT [FK__ProcID__Category__149CCCB8] FOREIGN KEY([Category])
REFERENCES [Project].[DBAcategory] ([DBAcategory])
GO
ALTER TABLE [Project].[ProcID] CHECK CONSTRAINT [FK__ProcID__Category__149CCCB8]
GO
ALTER TABLE [Project].[ProcID]  WITH NOCHECK ADD  CONSTRAINT [FK__ProcID__Procurem__1A209BE4] FOREIGN KEY([ProcurementCategory])
REFERENCES [Project].[DBAcategory] ([DBAcategory])
GO
ALTER TABLE [Project].[ProcID] CHECK CONSTRAINT [FK__ProcID__Procurem__1A209BE4]
GO
ALTER TABLE [Project].[ProcID]  WITH NOCHECK ADD  CONSTRAINT [FK__ProcID__TopAccou__71DDA060] FOREIGN KEY([TopAccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [Project].[ProcID] CHECK CONSTRAINT [FK__ProcID__TopAccou__71DDA060]
GO
