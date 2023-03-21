SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[ContractLabelID](
	[ContractLabelText] [varchar](50) NOT NULL,
	[ContractLabelID] [int] IDENTITY(1,1) NOT NULL,
	[TFBSOoriginated] [bit] NULL,
	[TFBSOmentioned] [bit] NULL,
	[IsPerformanceBasedLogistics] [bit] NULL,
	[IsOrganicPBL] [bit] NULL,
	[IsOfficialPBL] [bit] NULL,
	[PrimaryProjectID] [int] NULL,
	[CrisisFunding] [varchar](10) NULL,
	[IsFPDSerror] [bit] NOT NULL,
 CONSTRAINT [pk_ContractLabelID] PRIMARY KEY CLUSTERED 
(
	[ContractLabelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[ContractLabelID] ADD  CONSTRAINT [DF__ContractL__IsPer__0E6EF216]  DEFAULT ((0)) FOR [IsPerformanceBasedLogistics]
GO
ALTER TABLE [Contract].[ContractLabelID] ADD  DEFAULT ((0)) FOR [IsFPDSerror]
GO
ALTER TABLE [Contract].[ContractLabelID]  WITH NOCHECK ADD  CONSTRAINT [FK__ContractL__Prima__664BF223] FOREIGN KEY([PrimaryProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Contract].[ContractLabelID] CHECK CONSTRAINT [FK__ContractL__Prima__664BF223]
GO
