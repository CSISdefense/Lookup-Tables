USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ErrorLogging].[GEC](
	[Entity] [varchar](50) NULL,
	[GEC] [varchar](50) NULL,
	[ISOalpha2] [varchar](50) NULL,
	[ISOalpha3] [varchar](50) NULL,
	[ISOnumerical] [varchar](50) NULL,
	[Stanag] [varchar](50) NULL,
	[Internet] [varchar](50) NULL,
	[Comment] [varchar](600) NULL
) ON [PRIMARY]
GO
