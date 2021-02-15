SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[FundedByForeignEntity](
	[fundedbyforeignentity] [varchar](1) NOT NULL,
	[foreign_funding_description] [varchar](50) NULL,
	[IsFMS] [bit] NULL,
 CONSTRAINT [pk_FundedByForeignEntity] PRIMARY KEY CLUSTERED 
(
	[fundedbyforeignentity] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
