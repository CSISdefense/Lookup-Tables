SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ETL].[detached_award_proc_unique_csis](
	[detached_award_proc_unique] [varchar](154) NOT NULL,
	[detached_award_procurement_id] [int] NULL,
	[unique_award_key] [varchar](120) NOT NULL,
	[agency_id] [varchar](4) NOT NULL,
	[piid] [varchar](50) NULL,
	[award_modification_amendme] [varchar](25) NULL,
	[referenced_idv_agency_iden] [varchar](25) NULL,
	[parent_award_id] [varchar](50) NULL,
	[referenced_idv_modificatio] [varchar](25) NULL,
	[transaction_number] [bigint] NULL,
	[award_or_idv_flag] [varchar](5) NULL,
	[action_date] [datetime2](7) NULL,
	[last_modified] [datetime2](7) NULL,
	[ultimate_parent_uei] [varchar](12) NULL,
	[awardee_or_recipient_uei] [varchar](12) NULL,
	[entity_data_source] [varchar](50) NULL,
	[CSIStransactionid] [int] NULL,
	[Fiscal_Year] [smallint] NULL,
 CONSTRAINT [pk_ErrorLogging_detached_award_proc_unique] PRIMARY KEY CLUSTERED 
(
	[detached_award_proc_unique] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
