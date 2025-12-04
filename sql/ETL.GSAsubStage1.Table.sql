SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[GSAsubStage1](
	[Subcontractor] [varchar](255) NULL,
	[Contract_Number] [varchar](255) NULL,
	[DUNS_Number] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Number_of_Full_Time_Equivalent_Employees_FTEs] [varchar](255) NULL,
	[Number_of_Hours_Invoiced] [varchar](255) NULL,
	[CSIStieBreaker] [varchar](255) NULL,
	[CSISCreatedDate] [datetime] NOT NULL,
	[CSISModifiedDate] [datetime] NOT NULL,
	[IsDuplicateUTI] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [ETL].[GSAsubStage1] ADD  CONSTRAINT [DF_GSAsubcontract_CSISCreatedDate]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [ETL].[GSAsubStage1] ADD  CONSTRAINT [DF_GSAsubcontract_CSISModifiedDate]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO
ALTER TABLE [ETL].[GSAsubStage1] ADD  DEFAULT ((0)) FOR [IsDuplicateUTI]
GO
