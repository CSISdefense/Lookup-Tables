USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[CombatantCommand](
	[CombatantCommand] [varchar](50) NULL,
	[CountryName] [varchar](100) NULL,
	[CountryCode2letter] [varchar](2) NULL
) ON [PRIMARY]
GO
