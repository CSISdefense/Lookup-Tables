SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[gwa_tas](
	[gwa_tas] [varchar](17) NOT NULL,
	[GWA_TAS_Name] [varchar](200) NULL,
	[aid] [smallint] NOT NULL,
	[Agency_Name] [varchar](69) NULL,
	[a] [varchar](1) NULL,
	[main] [smallint] NOT NULL,
	[sub] [smallint] NOT NULL,
	[Acct_Type] [varchar](5) NULL,
	[Acct_Type_Description] [varchar](22) NULL,
	[Admin_Bureau] [smallint] NULL,
	[ATA] [smallint] NULL,
	[BPOA] [smallint] NULL,
	[EPOA] [smallint] NULL,
	[Fund_Type] [varchar](4) NULL,
	[Fund_Type_Description] [varchar](35) NULL,
	[SP] [smallint] NULL,
	[STAR_Dept_Reg] [smallint] NULL,
	[STAR_Dept_Xfer] [smallint] NULL,
	[STAR_Main_Acct] [smallint] NULL,
 CONSTRAINT [pk_gwa_tas] PRIMARY KEY CLUSTERED 
(
	[gwa_tas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[gwa_tas]  WITH NOCHECK ADD  CONSTRAINT [FK_budget_gwa_tas_treasuryagencycode_mainaccountcode_subaccountcode] FOREIGN KEY([aid], [main], [sub])
REFERENCES [budget].[SubAccountCode] ([TreasuryAgencyCode], [MainAccountCode], [SubAccountCode])
GO
ALTER TABLE [budget].[gwa_tas] CHECK CONSTRAINT [FK_budget_gwa_tas_treasuryagencycode_mainaccountcode_subaccountcode]
GO
ALTER TABLE [budget].[gwa_tas]  WITH NOCHECK ADD  CONSTRAINT [FK_budget_gwa_treasuryagencycode_mainaccountcode_subaccountcode] FOREIGN KEY([aid], [main], [sub])
REFERENCES [budget].[SubAccountCode] ([TreasuryAgencyCode], [MainAccountCode], [SubAccountCode])
GO
ALTER TABLE [budget].[gwa_tas] CHECK CONSTRAINT [FK_budget_gwa_treasuryagencycode_mainaccountcode_subaccountcode]
GO
