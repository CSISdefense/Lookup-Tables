SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[DefenseServiceIdentifier](
	[DefenseServiceIdentifier] [varchar](3) NOT NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[SimpleDefenseServiceIdentifier] [varchar](3) NULL,
 CONSTRAINT [pk_DefenseServiceIdentifier] PRIMARY KEY CLUSTERED 
(
	[DefenseServiceIdentifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[DefenseServiceIdentifier]  WITH NOCHECK ADD  CONSTRAINT [FK__DefenseSe__Simpl__08F60FE2] FOREIGN KEY([SimpleDefenseServiceIdentifier])
REFERENCES [agency].[DefenseServiceIdentifier] ([DefenseServiceIdentifier])
GO
ALTER TABLE [agency].[DefenseServiceIdentifier] CHECK CONSTRAINT [FK__DefenseSe__Simpl__08F60FE2]
GO
ALTER TABLE [agency].[DefenseServiceIdentifier]  WITH NOCHECK ADD  CONSTRAINT [FK__DefenseSe__Treas__0A895299] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [agency].[DefenseServiceIdentifier] CHECK CONSTRAINT [FK__DefenseSe__Treas__0A895299]
GO
ALTER TABLE [agency].[DefenseServiceIdentifier]  WITH NOCHECK ADD  CONSTRAINT [fk_DefenseServiceIdentifier_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [agency].[DefenseServiceIdentifier] CHECK CONSTRAINT [fk_DefenseServiceIdentifier_DefenseOrganization]
GO
