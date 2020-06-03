SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[GSAprimeStage1](
	[PSC_Code] [varchar](255) NULL,
	[PSC_Description] [varchar](255) NULL,
	[Contracting_Agency_ID] [varchar](255) NULL,
	[DepartmentID] [varchar](255) NULL,
	[Funding_Agency_ID] [varchar](255) NULL,
	[Place_of_Performance_City] [varchar](255) NULL,
	[Place_of_Performance_State] [varchar](255) NULL,
	[Place_of_Performance_County] [varchar](255) NULL,
	[Date_Signed] [varchar](255) NULL,
	[Extent_Competed] [varchar](255) NULL,
	[Fair_Opportunity_Limited_Sources] [varchar](255) NULL,
	[Pricing_Mechanism_Code] [varchar](255) NULL,
	[Description_of_Requirement] [varchar](8000) NULL,
	[Vendor_Name] [varchar](255) NULL,
	[PIID] [varchar](255) NULL,
	[Referenced_IDV_PIID] [varchar](255) NULL,
	[Vendor_DUNS] [varchar](255) NULL,
	[Action_Obligation] [varchar](255) NULL,
	[DepartmentIDtext] [varchar](255) NULL,
	[AgencyIDtext] [varchar](255) NULL,
	[Funding_Department_ID] [varchar](255) NULL,
	[Funding_Department_Name] [varchar](255) NULL,
	[Funding_Agency_Name] [varchar](255) NULL,
	[Place_of_Performance_Zip_Code] [varchar](255) NULL,
	[Place_of_Performance_Country] [varchar](255) NULL,
	[Total_Contract_Value] [varchar](255) NULL,
	[Base_and_All_Options_Value] [varchar](255) NULL,
	[Total_Dollar_Amount_Invoiced] [varchar](255) NULL,
	[Number_of_Contractor_Hours_Invoiced] [varchar](255) NULL,
	[Number_of_Contractor_Full_Time_Equivalent_Employees_FTEs] [varchar](255) NULL,
	[Fiscal_Year] [varchar](255) NULL,
	[Total_Action_Obligation] [varchar](255) NULL,
	[Total_Base_and_All_Options_Value] [varchar](255) NULL,
	[Prime_Contractor_Hours_Invoiced] [varchar](255) NULL,
	[Prime_Contractor_Full_Time_Equivalent_Employees_FTEs] [varchar](255) NULL,
	[CSIStieBreaker] [varchar](255) NULL,
	[CSISCreatedDate] [datetime] NOT NULL,
	[CSISModifiedDate] [datetime] NOT NULL,
	[IsDuplicateUTI] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[GSAprimeStage1] ADD  CONSTRAINT [DF_GSAprimecontract_CSISCreatedDate]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [ErrorLogging].[GSAprimeStage1] ADD  CONSTRAINT [DF_GSAprimecontract_CSISModifiedDate]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO
ALTER TABLE [ErrorLogging].[GSAprimeStage1] ADD  DEFAULT ((0)) FOR [IsDuplicateUTI]
GO
