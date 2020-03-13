USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[CategoryManagement](
	[PSC Code (Description)] [varchar](255) NULL,
	[4-Digit PSC] [varchar](4) NULL,
	[Level 1] [varchar](50) NULL,
	[Level 1 Category] [varchar](50) NULL,
	[Level 2] [varchar](50) NULL,
	[Level 2 Category] [varchar](50) NULL
) ON [PRIMARY]
GO
