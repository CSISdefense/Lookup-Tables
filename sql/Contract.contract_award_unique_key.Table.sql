USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contract].[contract_award_unique_key](
	[contract_award_unique_key] [varchar](75) NOT NULL,
	[AgencyID] [varchar](4) NULL,
	[awarding_agency_code] [varchar](255) NULL,
	[award_id_piid] [varchar](255) NULL,
	[parent_award_id_piid] [varchar](255) NULL,
	[parent_award_agency_id] [varchar](255) NULL,
	[award_or_idv_flag] [varchar](255) NULL,
 CONSTRAINT [pk_contract_award_unique_key] PRIMARY KEY CLUSTERED 
(
	[contract_award_unique_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
