USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[EntitySizeCode](
	[EntitySizeCode] [varchar](1) NOT NULL,
	[EntitySizeText] [varchar](25) NULL,
 CONSTRAINT [PK__EntitySi__2095FBF7C88AE86E] PRIMARY KEY CLUSTERED 
(
	[EntitySizeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO