USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[awarding_agency_code](
	[awarding_agency_code] [smallint] NOT NULL,
	[awarding_agency_name] [varchar](100) NULL,
	[AgencyID] [varchar](4) NULL,
 CONSTRAINT [pk_awarding_agency_code] PRIMARY KEY CLUSTERED 
(
	[awarding_agency_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[awarding_agency_code]  WITH CHECK ADD FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO