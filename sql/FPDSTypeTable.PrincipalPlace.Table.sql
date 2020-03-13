USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[PrincipalPlace](
	[principal_place_code] [varchar](7) NULL,
	[principal_place_state] [varchar](50) NULL,
	[principal_place_cc] [varchar](50) NULL,
	[principal_place_zip] [bigint] NULL,
	[principal_place_cd] [varchar](4) NULL,
	[International] [varchar](1) NULL
) ON [PRIMARY]
GO
