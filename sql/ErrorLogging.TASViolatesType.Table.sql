USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[TASViolatesType](
	[ErrorDescription] [varchar](255) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL,
	[SP] [varchar](255) NULL,
	[ATA] [varchar](255) NULL,
	[AID] [varchar](255) NULL,
	[BPOA] [varchar](255) NULL,
	[EPOA] [varchar](255) NULL,
	[A] [varchar](255) NULL,
	[MAIN] [varchar](255) NULL,
	[SUB] [varchar](255) NULL,
	[Admin_Bureau] [varchar](255) NULL,
	[GWA_TAS] [varchar](255) NULL,
	[GWA_TAS_Name] [varchar](255) NULL,
	[Agency_Name] [varchar](255) NULL,
	[BETC] [varchar](255) NULL,
	[BETC_Name] [varchar](255) NULL,
	[Effective_Date] [varchar](255) NULL,
	[Suspend_Date] [varchar](255) NULL,
	[IsCredit] [varchar](255) NULL,
	[Adj_BETC] [varchar](255) NULL,
	[STAR_TAS] [varchar](255) NULL,
	[STAR_Dept_Reg] [varchar](255) NULL,
	[STAR_Dept_Xfer] [varchar](255) NULL,
	[STAR_Main_Acct] [varchar](255) NULL,
	[Txn_Type] [varchar](255) NULL,
	[Acct_Type] [varchar](255) NULL,
	[Acct_Type_Description] [varchar](255) NULL,
	[Fund_Type] [varchar](255) NULL,
	[Fund_Type_Description] [varchar](255) NULL
) ON [PRIMARY]
GO
