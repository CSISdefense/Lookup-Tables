USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryManagement](
	[PSC_Code_Description] [varchar](125) NULL,
	[PSC] [varchar](4) NULL,
	[Level1_Code] [decimal](4, 2) NULL,
	[Level1_Category] [varchar](75) NULL,
	[Level2_Code] [decimal](4, 2) NULL,
	[Level2_Category] [varchar](75) NULL
) ON [PRIMARY]
GO
