USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Contract].[SolicitationID](
	[SolicitationID] [varchar](69) NULL,
	[CSISsolicitationID] [int] IDENTITY(1,1) NOT NULL,
	[CSISminOfSolicitationID] [int] NULL,
	[IsMinOfSolicitationID] [bit] NULL,
	[IsInFPDS] [bit] NULL,
	[IsLPTA] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
