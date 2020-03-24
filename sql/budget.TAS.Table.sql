USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [budget].[TAS](
	[SP] [smallint] NULL,
	[ATA] [smallint] NULL,
	[AID] [smallint] NOT NULL,
	[BPOA] [smallint] NULL,
	[EPOA] [smallint] NULL,
	[A] [varchar](1) NULL,
	[MAIN] [smallint] NOT NULL,
	[SUB] [smallint] NOT NULL,
	[Admin_Bureau] [smallint] NULL,
	[GWA_TAS] [varchar](17) NULL,
	[GWA_TAS_Name] [varchar](200) NULL,
	[Agency_Name] [varchar](69) NULL,
	[BETC] [varchar](8) NULL,
	[BETC_Name] [varchar](96) NULL,
	[Effective_Date] [datetime] NULL,
	[Suspend_Date] [datetime] NULL,
	[IsCredit] [smallint] NULL,
	[Adj_BETC] [varchar](8) NULL,
	[STAR_TAS] [varchar](17) NULL,
	[STAR_Dept_Reg] [smallint] NULL,
	[STAR_Dept_Xfer] [smallint] NULL,
	[STAR_Main_Acct] [smallint] NULL,
	[Txn_Type] [varchar](33) NULL,
	[Acct_Type] [varchar](5) NULL,
	[Acct_Type_Description] [varchar](22) NULL,
	[Fund_Type] [varchar](4) NULL,
	[Fund_Type_Description] [varchar](35) NULL
)

GO
SET ANSI_PADDING OFF
GO
