USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[DefenseOrganization](
	[DefenseOrganization] [varchar](5) NOT NULL,
	[TreasuryAgencyCode] [smallint] NULL,
 CONSTRAINT [pk_DefenseOrganization] PRIMARY KEY CLUSTERED 
(
	[DefenseOrganization] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[DefenseOrganization]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseOrganization_TreasuryAgencyCode] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [agency].[DefenseOrganization] CHECK CONSTRAINT [fk_DefenseOrganization_TreasuryAgencyCode]
GO