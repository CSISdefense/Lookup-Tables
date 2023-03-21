SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[AccountOrgHandoffHistory](
	[AccountDSI] [varchar](5) NOT NULL,
	[DefenseOrganization] [varchar](5) NOT NULL,
	[PByear] [smallint] NOT NULL,
	[IsHandoff] [bit] NOT NULL,
 CONSTRAINT [pk_AccountOrgHandoffHistory] PRIMARY KEY CLUSTERED 
(
	[AccountDSI] ASC,
	[DefenseOrganization] ASC,
	[PByear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[AccountOrgHandoffHistory] ADD  DEFAULT ((1)) FOR [IsHandoff]
GO
ALTER TABLE [budget].[AccountOrgHandoffHistory]  WITH CHECK ADD  CONSTRAINT [fk_Budget_AccountOrgHandoffHistory_AccountDSI] FOREIGN KEY([AccountDSI])
REFERENCES [budget].[AccountDSI] ([AccountDSI])
GO
ALTER TABLE [budget].[AccountOrgHandoffHistory] CHECK CONSTRAINT [fk_Budget_AccountOrgHandoffHistory_AccountDSI]
GO
ALTER TABLE [budget].[AccountOrgHandoffHistory]  WITH CHECK ADD  CONSTRAINT [fk_Budget_AccountOrgHandoffHistory_DefenseOrganization] FOREIGN KEY([DefenseOrganization])
REFERENCES [agency].[DefenseOrganization] ([DefenseOrganization])
GO
ALTER TABLE [budget].[AccountOrgHandoffHistory] CHECK CONSTRAINT [fk_Budget_AccountOrgHandoffHistory_DefenseOrganization]
GO
