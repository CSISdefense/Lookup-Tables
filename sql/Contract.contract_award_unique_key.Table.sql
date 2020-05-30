USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[contract_award_unique_key](
	[contract_award_unique_key] [varchar](66) NOT NULL,
	[AgencyID] [varchar](4) NULL,
	[awarding_agency_code] [smallint] NULL,
	[award_id_piid] [varchar](50) NOT NULL,
	[parent_award_id_piid] [varchar](50) NULL,
	[parent_award_agency_id] [varchar](4) NULL,
	[award_or_idv_flag] [varchar](5) NULL,
	[CSIScontractID] [int] NULL,
	[CSISidvpiidID] [int] NULL,
	[parent_contract_award_unique_key] [varchar](66) NULL,
	[IsDerived] [bit] NULL,
 CONSTRAINT [pk_contract_award_unique_key] PRIMARY KEY CLUSTERED 
(
	[contract_award_unique_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[contract_award_unique_key] ADD  DEFAULT ((0)) FOR [IsDerived]
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([CSISidvpiidID])
REFERENCES [Contract].[CSISidvpiidID] ([CSISidvpiidID])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD FOREIGN KEY([parent_contract_award_unique_key])
REFERENCES [Contract].[contract_award_unique_key] ([contract_award_unique_key])
GO
ALTER TABLE [Contract].[contract_award_unique_key]  WITH CHECK ADD  CONSTRAINT [fk_contract_award_unique_key_CSIScontractID] FOREIGN KEY([CSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [Contract].[contract_award_unique_key] CHECK CONSTRAINT [fk_contract_award_unique_key_CSIScontractID]
GO
