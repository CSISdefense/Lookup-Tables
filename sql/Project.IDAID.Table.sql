SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[IDAID](
	[IDAID] [int] NOT NULL,
	[ProgramName] [varchar](150) NULL,
	[project_analysis_name] [varchar](150) NULL,
	[project_full_name] [varchar](150) NULL,
	[Service] [varchar](50) NULL,
	[NS_VMR] [varchar](50) NULL,
	[Entered_at_MS_BC_or_MS_C] [varchar](50) NULL,
	[Passed_MS_IIB_at_Service_Level] [varchar](50) NULL,
	[MSIIB_or_First_SAR] [varchar](50) NULL,
	[First_SAR] [varchar](50) NULL,
	[Last_SAR] [varchar](50) NULL,
	[Program_End_Date] [varchar](50) NULL,
	[MS_IIIAC_Date] [varchar](50) NULL,
	[MS_IIIAC_Fiscal_Year] [varchar](50) NULL,
	[Termination_Date] [varchar](50) NULL,
	[RDTE_Cost_Growth] [varchar](50) NULL,
	[APUC_Growth] [varchar](50) NULL,
	[PAUC_Growth] [varchar](50) NULL,
	[MS_IIB_Q] [varchar](50) NULL,
	[MS_IIB_Q_RDTE] [varchar](50) NULL,
	[MS_IIB_Q_Proc] [varchar](50) NULL,
	[Final_Q] [varchar](50) NULL,
	[Final_Q_RDTE] [varchar](50) NULL,
	[Final_Q_Procurement] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[Source_2] [varchar](50) NULL,
	[Source_3] [varchar](50) NULL,
	[MSIIB_or_First_SAR_year] [varchar](50) NULL,
	[ProjectID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
