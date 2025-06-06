SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[GSAprimeOriginal](
	[PSC Code] [varchar](255) NULL,
	[PSC Description] [varchar](255) NULL,
	[Contracting Agency ID] [varchar](255) NULL,
	[Contracting Department ID] [varchar](255) NULL,
	[Funding Agency ID] [varchar](255) NULL,
	[Place of Performance City] [varchar](255) NULL,
	[Place of Performance State] [varchar](255) NULL,
	[Place of Performance County] [varchar](255) NULL,
	[Date Signed] [varchar](255) NULL,
	[Extent Competed] [varchar](255) NULL,
	[Fair Opportunity Limited Sources] [varchar](255) NULL,
	[Type of Contract] [varchar](255) NULL,
	[Description of Requirement] [varchar](8000) NULL,
	[Vendor Name] [varchar](255) NULL,
	[PIID] [varchar](255) NULL,
	[Referenced IDV PIID] [varchar](255) NULL,
	[Vendor DUNS] [varchar](255) NULL,
	[Action Obligation] [varchar](255) NULL,
	[Contracting Department Name] [varchar](255) NULL,
	[Contracting Agency Name] [varchar](255) NULL,
	[Funding Department ID] [varchar](255) NULL,
	[Funding Department Name] [varchar](255) NULL,
	[Funding Agency Name] [varchar](255) NULL,
	[Place of Performance Zip Code] [varchar](255) NULL,
	[Place of Performance Country] [varchar](255) NULL,
	[Total Contract Value] [varchar](255) NULL,
	[Base and All Options Value] [varchar](255) NULL,
	[Total Dollar Amount Invoiced] [varchar](255) NULL,
	[Number of Contractor Hours Invoiced] [varchar](255) NULL,
	[Number of Contractor Full Time Equivalent Employees  FTEs] [varchar](255) NULL,
	[Fiscal Year] [varchar](255) NULL,
	[Total Action Obligation] [varchar](255) NULL,
	[Total Base and All Options Value] [varchar](255) NULL,
	[Prime Contractor Hours Invoiced] [varchar](255) NULL,
	[Prime Contractor Full Time Equivalent Employees  FTEs] [varchar](255) NULL,
	[CSIStieBreaker] [varchar](255) NULL
) ON [PRIMARY]
GO
