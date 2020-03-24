USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [budget].[progsource](
	[progsourceagency] [varchar](2) NULL,
	[progsourceaccount] [varchar](4) NULL,
	[progsourcesubacct] [varchar](3) NULL,
	[treasuryagencycode] [smallint] NULL,
	[mainaccountcode] [smallint] NULL,
	[subaccountcode] [smallint] NULL,
	[AccountTitle] [varchar](255) NULL,
	[topAccountTitleAmount] [decimal](19, 4) NULL,
	[totalFPDSandFAADSamount] [decimal](19, 4) NULL,
	[CSISmodifiedby] [varchar](255) NOT NULL,
	[CSISmodifieddate] [datetime2](7) NOT NULL,
	[IsManualOverride] [bit] NULL,
 CONSTRAINT [UQ_progsourceagency_account_subacct] UNIQUE NONCLUSTERED 
(
	[progsourceagency] ASC,
	[progsourceaccount] ASC,
	[progsourcesubacct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [budget].[progsource] ADD  CONSTRAINT [DF__progsourc__CSISm__3AB788A8]  DEFAULT (suser_sname()) FOR [CSISmodifiedby]
GO
ALTER TABLE [budget].[progsource] ADD  CONSTRAINT [DF__progsourc__CSISm__3BABACE1]  DEFAULT (getdate()) FOR [CSISmodifieddate]
GO
ALTER TABLE [budget].[progsource]  WITH NOCHECK ADD  CONSTRAINT [fk_budget_progsource_mainaccountcode_treasuryagencycode] FOREIGN KEY([treasuryagencycode], [mainaccountcode])
REFERENCES [budget].[MainAccountCode] ([TreasuryAgencyCode], [MainAccountCode])
GO
ALTER TABLE [budget].[progsource] CHECK CONSTRAINT [fk_budget_progsource_mainaccountcode_treasuryagencycode]
GO
ALTER TABLE [budget].[progsource]  WITH NOCHECK ADD  CONSTRAINT [fk_budget_progsource_subaccountcode_mainaccountcode_treasuryagencycode] FOREIGN KEY([treasuryagencycode], [mainaccountcode], [subaccountcode])
REFERENCES [budget].[SubAccountCode] ([TreasuryAgencyCode], [MainAccountCode], [SubAccountCode])
GO
ALTER TABLE [budget].[progsource] CHECK CONSTRAINT [fk_budget_progsource_subaccountcode_mainaccountcode_treasuryagencycode]
GO
ALTER TABLE [budget].[progsource]  WITH NOCHECK ADD  CONSTRAINT [fk_budget_progsource_treasuryagencycode] FOREIGN KEY([treasuryagencycode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[progsource] CHECK CONSTRAINT [fk_budget_progsource_treasuryagencycode]
GO
