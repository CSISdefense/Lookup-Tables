SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[GSAsubStage2](
	[Subcontractor] [varchar](16) NULL,
	[Contract_Number] [varchar](50) NULL,
	[DUNS_Number] [varchar](9) NULL,
	[Name] [varchar](255) NULL,
	[Number_of_Full_Time_Equivalent_Employees_FTEs] [decimal](11, 2) NULL,
	[Number_of_Hours_Invoiced] [decimal](11, 9) NULL,
	[CSIStieBreaker] [int] NULL,
	[CSISCreatedDate] [datetime] NOT NULL,
	[CSISModifiedDate] [datetime] NOT NULL,
	[IsDuplicateUTI] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [ETL].[GSAsubStage2] ADD  CONSTRAINT [DF_GSAsubcontract_CSISCreatedDate_stage2]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [ETL].[GSAsubStage2] ADD  CONSTRAINT [DF_GSAsubcontract_CSISModifiedDate_staeg2]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO
ALTER TABLE [ETL].[GSAsubStage2] ADD  DEFAULT ((0)) FOR [IsDuplicateUTI]
GO
