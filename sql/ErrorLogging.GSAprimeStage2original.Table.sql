SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[GSAprimeStage2original](
	[PSC_Code] [varchar](4) NULL,
	[PSC_Description] [varchar](255) NULL,
	[Contracting_Agency_ID] [varchar](4) NULL,
	[DepartmentID] [varchar](4) NULL,
	[Funding_Agency_ID] [varchar](4) NULL,
	[Place_of_Performance_City] [varchar](50) NULL,
	[Place_of_Performance_State] [varchar](2) NULL,
	[Place_of_Performance_County] [varchar](50) NULL,
	[Date_Signed] [datetime2](7) NULL,
	[Extent_Competed] [varchar](255) NULL,
	[Fair_Opportunity_Limited_Sources] [varchar](255) NULL,
	[Pricing_Mechanism_Code] [varchar](255) NULL,
	[Description_of_Requirement] [varchar](4000) NULL,
	[Vendor_Name] [nvarchar](150) NULL,
	[PIID] [varchar](50) NULL,
	[Referenced_IDV_PIID] [varchar](50) NULL,
	[Vendor_DUNS] [varchar](9) NULL,
	[Action_Obligation] [decimal](19, 4) NULL,
	[DepartmentIDtext] [varchar](255) NULL,
	[AgencyIDtext] [varchar](255) NULL,
	[Funding_Department_ID] [varchar](4) NULL,
	[Funding_Department_Name] [varchar](255) NULL,
	[Funding_Agency_Name] [varchar](255) NULL,
	[Place_of_Performance_Zip_Code] [varchar](10) NULL,
	[Place_of_Performance_Country] [varchar](3) NULL,
	[Total_Contract_Value] [decimal](19, 4) NULL,
	[Base_and_All_Options_Value] [decimal](19, 4) NULL,
	[Total_Dollar_Amount_Invoiced] [decimal](19, 4) NULL,
	[Number_of_Contractor_Hours_Invoiced] [decimal](11, 2) NULL,
	[Number_of_Contractor_Full_Time_Equivalent_Employees_FTEs] [decimal](11, 9) NULL,
	[Fiscal_Year] [smallint] NULL,
	[Total_Action_Obligation] [decimal](19, 4) NULL,
	[Total_Base_and_All_Options_Value] [decimal](19, 4) NULL,
	[Prime_Contractor_Hours_Invoiced] [decimal](10, 2) NULL,
	[Prime_Contractor_Full_Time_Equivalent_Employees_FTEs] [decimal](10, 2) NULL,
	[CSISCreatedDate] [datetime] NOT NULL,
	[CSISModifiedDate] [datetime] NOT NULL,
	[IsDuplicateUTI] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [ErrorLogging].[GSAprimeStage2original] ADD  CONSTRAINT [DF_GSAprimecontract_CSISCreatedDate_staeg2]  DEFAULT (getdate()) FOR [CSISCreatedDate]
GO
ALTER TABLE [ErrorLogging].[GSAprimeStage2original] ADD  CONSTRAINT [DF_GSAprimecontract_CSISModifiedDate_stage2]  DEFAULT (getdate()) FOR [CSISModifiedDate]
GO
ALTER TABLE [ErrorLogging].[GSAprimeStage2original] ADD  DEFAULT ((0)) FOR [IsDuplicateUTI]
GO
