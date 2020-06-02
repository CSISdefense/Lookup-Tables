SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[AccountDSI](
	[AccountDSI] [varchar](5) NOT NULL,
	[TreasuryAgencyCode] [smallint] NULL,
	[MainAccountCode] [smallint] NULL,
	[DefenseServiceIdentifier] [varchar](3) NULL,
	[DefenseOrganization] [varchar](5) NULL,
	[MainAccountName] [varchar](45) NULL,
 CONSTRAINT [pk_AccountDSI] PRIMARY KEY CLUSTERED 
(
	[AccountDSI] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[AccountDSI]  WITH NOCHECK ADD  CONSTRAINT [FK__AccountDS__Defen__42639768] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [budget].[AccountDSI] CHECK CONSTRAINT [FK__AccountDS__Defen__42639768]
GO
ALTER TABLE [budget].[AccountDSI]  WITH NOCHECK ADD  CONSTRAINT [fk_AccountDSI_DefenseServiceIdentifier] FOREIGN KEY([DefenseServiceIdentifier])
REFERENCES [agency].[DefenseServiceIdentifier] ([DefenseServiceIdentifier])
GO
ALTER TABLE [budget].[AccountDSI] CHECK CONSTRAINT [fk_AccountDSI_DefenseServiceIdentifier]
GO
ALTER TABLE [budget].[AccountDSI]  WITH NOCHECK ADD  CONSTRAINT [fk_AccountDSI_MainAccountCode] FOREIGN KEY([TreasuryAgencyCode], [MainAccountCode])
REFERENCES [budget].[MainAccountCode] ([TreasuryAgencyCode], [MainAccountCode])
GO
ALTER TABLE [budget].[AccountDSI] CHECK CONSTRAINT [fk_AccountDSI_MainAccountCode]
GO
ALTER TABLE [budget].[AccountDSI]  WITH NOCHECK ADD  CONSTRAINT [fk_AccountDSI_TreasuryAgencyCode] FOREIGN KEY([TreasuryAgencyCode])
REFERENCES [agency].[TreasuryAgencyCode] ([TreasuryAgencyCode])
GO
ALTER TABLE [budget].[AccountDSI] CHECK CONSTRAINT [fk_AccountDSI_TreasuryAgencyCode]
GO
